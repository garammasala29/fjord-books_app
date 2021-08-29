# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :user
  belong_to :commentable, polymorphic: true
end
