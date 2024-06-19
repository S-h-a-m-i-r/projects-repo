class Post < ApplicationRecord
    after_create -> { puts "Congratulations!" }
  belongs_to :user
  has_many :comments

end
