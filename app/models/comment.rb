class Comment < ApplicationRecord
  belongs_to :listener
  belongs_to :post
end
