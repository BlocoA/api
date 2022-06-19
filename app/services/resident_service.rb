# frozen_string_literal: true

class ResidentService
  def create_resident(resident_create_params)
    user = User.create_user_associate_condominium(
      resident_create_params[:name],
      resident_create_params[:email],
      resident_create_params[:condominium_id]
    )

    unit = Unit.find_by(identifier: resident_create_params[:identifier],
                        condominium_id: resident_create_params[:condominium_id])

    Resident.new(name: user.name, email: user.email, phone: resident_create_params[:phone], unit_id: unit.id,
                 user_id: user.id)
  end
end
