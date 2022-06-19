# frozen_string_literal: true

class UnitService
  def get_units_with_residents_info(condominium_id)
    units = Unit.where(condominium_id: condominium_id)

    units.map do |unit|
      {
        identifier: unit.identifier,
        have_resident: unit.residents.length.positive?,
        info: { name: unit.residents.first&.name, contact: unit.residents.first&.phone }
      }
    end
  end
end
