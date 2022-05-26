# frozen_string_literal: true

class CondominiumUser < ApplicationRecord
  belongs_to :condominium
  belongs_to :user

  enum user_role: { manager: 0, resident: 1 }
end
