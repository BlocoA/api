# frozen_string_literal: true

require 'rails_helper'

describe Condominium, type: :model do
  describe '#name' do
    it { is_expected.to validate_presence_of(:name) }
  end
end
