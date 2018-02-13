class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :blog


  validates :content,presence: true, length: {minium:5 ,maximum:100}
end
