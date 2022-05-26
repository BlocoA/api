# frozen_string_literal: true

describe Invite, type: :model do
  it { is_expected.to belong_to(:condominium) }
  it { is_expected.to belong_to(:user) }

  it { is_expected.to define_enum_for(:status) }

  describe '#expired_token?' do
    subject(:invite) do
      create(:invite) do |i|
        i.update(expires_at: expires_at, status: status)
      end
    end

    let(:status) { :pending }
    let(:expires_at) { 2.days.from_now }

    context 'when the time is not expired' do
      it { expect(invite).not_to be_expired_token }
    end

    context 'when the time is expired and the status is pending' do
      let(:status) { :pending }
      let(:expires_at) { 1.hour.ago }

      it do
        expect(invite).to be_expired_token
        expect(invite.status).to eq('expired')
      end
    end

    context 'when the status is expired' do
      let(:status) { :expired }
      let(:expires_at) { 12.hours.ago }

      it { expect(invite).to be_expired_token }
    end

    context 'when the status is accepted' do
      let(:status) { :accepted }
      let(:expires_at) { 20.hours.ago }

      it { expect(invite).to be_expired_token }
    end
  end
end
