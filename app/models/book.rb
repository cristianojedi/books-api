# frozen_string_literal: true

class Book < ApplicationRecord
  belongs_to :category
  belongs_to :author

  validates :name, :isbn, :category, :author, presence: true

  def category_name
    category.name
  end

  def author_name
    author.name
  end

  def as_json(_options = {})
    super(
      # root: true,
      methods: %i[category_name author_name]
      # include: { category: { only: :name } }
    )
  end
end
