# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  it { is_expected.to have_secure_password }

  describe '#name' do
    it { is_expected.to validate_presence_of(:name) }
  end

  describe '#email' do
    let(:invalid_emails) do
      [
        'plinaddress',
        '#@%^%#$@#$@#.co',
        '@domain.com',
        'Joe Smith <email@domain.com>',
        'email.domain.com',
        'email@domain@domain.com',
        '.email@domain.com',
        'email.@domain.com',
        'email..email@domain.com',
        '„ÅÇ„ÅÑ„ÅÜ„Åà„Åä@domain.com',
        'email@domain.com (Joe Smith)',
        'email@domain',
        'email@-domain.com',
        'email@domain.web',
        'email@111.222.333.44444',
        'email@domain..com'
      ]
    end

    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.not_to allow_values(invalid_emails).for(:email) }
  end
end
