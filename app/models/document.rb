# frozen_string_literal: true

class Document < ApplicationRecord
  belongs_to :condominium
  belongs_to :user
end
