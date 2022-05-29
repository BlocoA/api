# frozen_string_literal: true

module V1
  class UnitsController < ApplicationController
    before_action :set_unit, only: %i[show update destroy]

    def index
      return render_missing_param_error_for('condominium_id') unless params[:condominium_id]

      units = Unit.where(condominium_id: params[:condominium_id])

      render json: units
    end

    def show
      render json: @unit
    end

    def create
      unit = Unit.new(unit_create_params)

      if unit.save
        render json: unit, status: :created
      else
        errors = unit.errors.full_messages.join(', ')
        render json: { errors: errors }, status: :bad_request
      end
    end

    def update
      if @unit.update(unit_update_params)
        render json: @unit
      else
        errors = @unit.errors.full_messages.join(', ')
        render json: { errors: errors }, status: :bad_request
      end
    end

    def destroy
      if @unit.destroy
        render json: {}, status: :no_content
      else
        errors = @unit.errors.full_messages.join(', ')
        render json: { errors: errors }, status: :bad_request
      end
    end

    private

    def set_unit
      @unit = Unit.find(params[:id])
    end

    def unit_create_params
      params.require(:unit).permit(:identifier, :condominium_id)
    end

    def unit_update_params
      params.require(:unit).permit(:identifier)
    end

    def render_missing_param_error_for(param_name)
      render(json: { errors: "Missing #{param_name} param" }, status: :bad_request)
    end
  end
end
