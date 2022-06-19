# frozen_string_literal: true

describe 'V1::Condominiums', type: :request do
  let!(:user) { create(:user) }
  let!(:token) { user_login(user) }
  let!(:headers) { { Authorization: "Bearer #{token}" } }

  describe 'POST' do
    context 'with valid params' do
      let!(:params) do
        {
          condominium: {
            name: 'condominio ABC',
            units_quantity: 4,
            has_leisure_area: false
          }
        }
      end

      before do
        post v1_condominiums_path, params: params, headers: headers
      end

      it 'returns condominium object' do
        expect(response_json).to include(
          name: params[:condominium][:name],
          units_quantity: params[:condominium][:units_quantity],
          has_leisure_area: params[:condominium][:has_leisure_area]
        )
      end

      it 'creates units based in units_quantity' do
        expect(Unit.all.length).to eq(params[:condominium][:units_quantity])
      end
    end
  end
end
