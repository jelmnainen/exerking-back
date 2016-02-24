class SubmissionsController < ApplicationController
  before_action :set_submission, only: [:show, :update]
  load_and_authorize_resource

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

  private
  def submission_params
    params.permit(:user_id, :exercise_id, :done, :feedback, :feedback_asked)
  end

  def set_submission
    @submission = Submission.find(params[:id])
  end

end
