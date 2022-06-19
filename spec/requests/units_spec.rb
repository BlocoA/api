# frozen_string_literal: true

describe 'V1::Units', type: :request do
  let!(:user) { User.create!(name: 'Test User', email: 'test-email@mail.com', password: '12345678') }
  let!(:condominium) { create(:condominium) }
  let!(:token) { user_login(user) }
  let!(:headers) { { Authorization: "Bearer #{token}" } }

  describe 'GET /v1/units/with_resident_info' do
    context 'when condominium have two units and have residents' do
      let!(:params) do
        {
          condominium_id: condominium.id
        }
      end

      before do
        create(:resident, unit: create(:unit, condominium: condominium))
        create(:resident, unit: create(:unit, condominium: condominium))

        get v1_units_with_resident_info_path, params: params, headers: headers
      end

      it 'returns an array of units and resident info' do
        response_json.each do |unit|
          expect(unit[:have_resident]).to be_truthy
          expect(unit[:info]).to include(name: be_truthy, contact: be_truthy)
        end

        expect(response_json.length).to be == 2
      end
    end

    context "when condominium have two units and haven't residents" do
      let!(:params) do
        {
          condominium_id: condominium.id
        }
      end

      before do
        create(:unit, condominium: condominium)
        create(:unit, condominium: condominium)

        get v1_units_with_resident_info_path, params: params, headers: headers
      end

      it 'returns an array of units and resident name and phone are null' do
        response_json.each do |unit|
          expect(unit[:have_resident]).to be_falsey
          expect(unit[:info]).to include(name: be_falsey, contact: be_falsey)
        end

        expect(response_json.length).to be == 2
      end
    end
  end
end
