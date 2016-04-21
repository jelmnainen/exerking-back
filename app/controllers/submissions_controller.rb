class SubmissionsController < ApplicationController
  skip_before_action :authenticate_user_from_token!, only: [:file]
  before_action :set_submission, only: [:show, :update, :file]
  load_and_authorize_resource
  skip_authorize_resource only: :file

  def create
    @submission = Submission.new(submission_params)
    authorize! :create, @submission
    if @submission.save
      render json: @submission, status: :created
    else
      render json: @submission.errors, status: :unprocessable_entity
    end
  end

  def index
    if params[:exercise_id] and params[:user_id]
      @submissions = Submission.where(
        exercise_id: params[:exercise_id],
        user_id: params[:user_id]
      )
    elsif params[:user_id]
      @submissions = Submission.where user_id: params[:user_id]
    elsif params[:exercise_id]
      @submissions = Submission.where exercise_id: params[:exercise_id]
    else
      @submissions = Submission.all
    end
    @submissions.each do |submission|
      authorize! :read, submission
    end

    render json: @submissions, status: :ok
  end

  def show
    render json: @submission, status: :ok
  end

  def update
    if @submission.update(submission_params)
      render json: @submission, status: :ok
    else
      render json: @submission.errors, status: :unprocessable_entity
    end
  end

  def file
    if @submission.file_content.nil?
      return head status: :not_found
    end

    secret_token = params[:secret]

    if Devise.secure_compare(@submission.file_secret, secret_token)
        send_data @submission.file_content, type: @submission.file_type, disposition: 'inline'
    else
      render json: {error: 'forbidden'}, status: :forbidden
    end
  end

  private
  def submission_params
    params.permit(:user_id, :exercise_id, :done, :feedback, :feedback_asked, :file_content, :file_type)
  end

  def set_submission
    @submission = Submission.find(params[:id])
  end

end
