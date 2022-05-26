# frozen_string_literal: true

class Document < ApplicationRecord
  has_one_attached :file

  belongs_to :condominium
  belongs_to :user
end
