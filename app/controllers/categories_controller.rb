class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :update, :destroy]
  load_and_authorize_resource

  # GET /category
  # GET /category.json
  def index
    @categories = Category.all
    @categories.each do |category|
      authorize! :read, category
    end
    render json: @categories
  end

  # GET /category/1
  # GET /category/1.json
  def show
    render json: @category
  end

  # POST /category
  # POST /category.json
  def create
    @category = Category.new(category_params)
    authorize! :create, @category
    if @category.save
      render json: @category, status: :created
    else
      render json: @category.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /category/1
  # PATCH/PUT /category/1.json
  def update
    if @category.update(category_params)
      render json: @category, status: :ok
    else
      render json: @category.errors, status: :unprocessable_entity
    end
  end

  # DELETE /category/1
  # DELETE /category/1.json
  def destroy
    @category.destroy
    render json: @category, status: :ok
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_category
    @category = Category.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def category_params
    params.permit(:title, :color)
  end
end
