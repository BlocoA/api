# frozen_string_literal: true

describe 'V1::Residents', type: :request do
  let!(:condominium) { create(:condominium) }
  let!(:unit) { create(:unit, condominium_id: condominium.id) }
  let!(:token) { user_login(create(:user)) }
  let!(:headers) { { Authorization: "Bearer #{token}" } }

  describe 'POST' do
    context 'with valid params' do
      let!(:params) do
        {
          identifier: unit.identifier,
          condominium_id: condominium.id,
          resident: {
            name: 'Resident Test',
            email: 'resident@mail.com',
            phone: '+5582955558888'
          }
        }
      end

      before do
        post v1_residents_path, params: params, headers: headers
      end

      it 'returns resident object' do
        expect(response_json).to include(name: params[:resident][:name], email: params[:resident][:email],
                                         phone: params[:resident][:phone], unit_id: unit.id)
      end

      it 'create a user with resident params' do
        user = User.find(response_json[:user_id])

        expect(user).to be_truthy
        expect(user.name).to eq(params[:resident][:name])
        expect(user.email).to eq(params[:resident][:email])
      end

      it 'create a user associated with condominium' do
        condominium_user = CondominiumUser.find_by(user_id: response_json[:user_id], condominium_id: condominium.id)

        expect(condominium_user).to be_truthy
        expect(condominium_user).to be_resident
      end
    end
  end
end
