class Api::V1::CategoriesController < Api::V1::ApiController
  before_action :set_category, only: %i[show update destroy]

  def index
    @categories = Category.all
    render json: @categories, status: :ok
  end

  def show
    render json: @category
  end

  def create
    @category = Category.new(category_params)

    # throw @category.inspect

    if @category.save
      render json: @category, status: :created
    else
      render json: @category.errors, status: :unprocessable_entity
    end
  end

  def update
    if @category.update(category_params)
      render json: @category, status: :ok
    else
      render json: @category.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @category.destroy
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.fetch(:category, {}).permit(:name)
  end
end
