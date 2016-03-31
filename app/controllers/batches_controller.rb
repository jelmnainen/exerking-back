class BatchesController < ApplicationController
  before_action :set_batch, only: [:show, :update, :destroy]
  load_and_authorize_resource

  # GET /batch
  # GET /batch.json
  def index
    @batches = Batch.all
    @batches.each do |batch|
      authorize! :read, batch
    end
    render json: @batches
  end

  # GET /batch/1
  # GET /batch/1.json
  def show
    render json: @batch
  end

  # POST /batch
  # POST /batch.json
  def create
    @batch = Batch.new(batch_params)
    authorize! :create, @batch
    if @batch.save
      render json: @batch, status: :created
    else
      render json: @batch.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /batch/1
  # PATCH/PUT /batch/1.json
  def update
    if @batch.update(batch_params)
      render json: @batch, status: :ok
    else
      render json: @batch.errors, status: :unprocessable_entity
    end
  end

  # DELETE /batch/1
  # DELETE /batch/1.json
  def destroy
    @batch.destroy
    render json: @batch, status: :ok
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_batch
    @batch = Batch.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def batch_params
    params.permit(:title, :deadline)
  end
end
