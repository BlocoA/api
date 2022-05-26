# frozen_string_literal: true

describe CondominiumUser, type: :model do
  it { is_expected.to belong_to(:condominium) }
  it { is_expected.to belong_to(:user) }

  it { is_expected.to define_enum_for(:user_role) }
end
