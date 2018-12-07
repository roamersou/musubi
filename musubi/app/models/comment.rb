class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :give_me
end
