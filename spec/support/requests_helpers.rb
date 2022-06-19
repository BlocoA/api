# frozen_string_literal: true

module RequestsHelpers
  def user_login(user)
    JsonWebToken.encode(user_id: user.id, exp: 2.months.from_now.to_i)
  end

  def response_json
    JSON.parse(response.body, symbolize_names: true)
  end
end
