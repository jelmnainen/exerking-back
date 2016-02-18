class SubmissionsController < ApplicationController
  before_action :set_submission, only: [:show, :update]

  def create
    @submission = Submission.new(submission_params)
    if @submission.save
      render json: @submission, status: :created
    else
      render json: @submission.errors, status: :unprocessable_entity
    end
  end

  def index
    #authorization for teacher IS MISSING
    @submissions = Submission.all
    render json: @submissions, status: :ok
  end

  def show
    #authorization missing
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