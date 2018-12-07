class Api::V1::BooksController < Api::V1::ApiController
  before_action :set_book, only: %i[show update destroy]

  def index
    @books = Book.all
    render json: @books, status: :ok
  end

  def show
    render json: @book, status: :ok
  end

  def create
    @book = Book.create(book_params)

    if @book.save
      render json: @book, status: :created
    else
      render json: @book.errors, status: :unprocessable_entity
    end
  end

  def update
    if @book.update(book_params)
      render json: @book, status: :ok
    else
      render json: @book.errors, status: :unoprocessable_entity
    end
  end

  def destroy
    @book.destroy
  end

  private

  def set_book
    @book = Book.find(params[:id])
  end

  def book_params
    params
      .require(:book)
      .permit(:name, :isbn, :publishedDate, :category_id, :author_id)
  end
end
