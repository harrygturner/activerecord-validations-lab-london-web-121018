require 'pry'

class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
  validates :clickbait, absence: { message: "Bare Clickbait"}


  # @clickbait = ["Won't Believe", "Secret", "Top"]

  def clickbait
    clickbait = ["Won't Believe", "Secret", "Top", "Guess"]
    clickbait.each do |word|
      if self.title
        return false if self.title.include?(word)
      end
      true
    end
  end

end
