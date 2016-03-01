class ExercisesController < ApplicationController
  #load_and_authorize_resource
  before_action :set_exercise, only: [:show, :update, :destroy]
  load_and_authorize_resource

  # GET /exercises
  # GET /exercises.json
  def index
    @exercises = Exercise.all
    @exercises.each do |exercise|
      authorize! :read, exercise
    end
    render json: @exercises
  end

  # GET /exercises/1
  # GET /exercises/1.json
  def show
    render json: @exercise
  end

  # POST /exercises
  # POST /exercises.json
  def create
    @exercise = Exercise.new(exercise_params)
    authorize! :create, @exercise
    if @exercise.save
       render json: @exercise, status: :created
    else
       render json: @exercise.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /exercises/1
  # PATCH/PUT /exercises/1.json
  def update
    if @exercise.update(exercise_params)
      render json: @exercise, status: :ok
    else
      render json: @exercise.errors, status: :unprocessable_entity
    end
  end

  # DELETE /exercises/1
  # DELETE /exercises/1.json
  def destroy
    @exercise.destroy
    head :no_content
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_exercise
      @exercise = Exercise.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def exercise_params
      params.permit(:title, :text, :deadline, :file_upload)
    end
end
