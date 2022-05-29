# frozen_string_literal: true

module V1
  class ResidentsController < ApplicationController
    before_action :set_resident, only: %i[show update destroy]

    def index
      return render_missing_param_error_for('condominium_id') unless params[:condominium_id]

      residents = Resident.joins(:unit).where(
        units: { condominium_id: params[:condominium_id] }
      )

      render json: residents
    end

    def show
      render json: @resident
    end

    def create
      resident = Resident.new(resident_create_params)

      if resident.save
        render json: resident, status: :created
      else
        errors = resident.errors.full_messages.join(', ')
        render json: { errors: errors }, status: :bad_request
      end
    end

    def update
      if @resident.update(resident_update_params)
        render json: @resident
      else
        errors = @resident.errors.full_messages.join(', ')
        render json: { errors: errors }, status: :bad_request
      end
    end

    def destroy
      if @resident.destroy
        render json: {}, status: :no_content
      else
        errors = @resident.errors.full_messages.join(', ')
        render json: { errors: errors }, status: :bad_request
      end
    end

    private

    def set_resident
      @resident = Resident.find(params[:id])
    end

    def resident_create_params
      params.require(:resident).permit(:name, :email, :phone, :unit_id, :user_id)
    end

    def resident_update_params
      params.require(:resident).permit(:name, :email, :phone)
    end

    def render_missing_param_error_for(param_name)
      render(json: { errors: "Missing #{param_name} param" }, status: :bad_request)
    end
  end
end
