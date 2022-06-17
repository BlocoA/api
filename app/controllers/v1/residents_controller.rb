# frozen_string_literal: true

module V1
  class ResidentsController < ApplicationController
    include CondominiumScope

    validate_condominium_id(only_at: :index)
    before_action :set_resident, only: %i[show update destroy]

    def index
      residents = Resident.joins(:unit).where(
        units: { condominium_id: params[:condominium_id] }
      )

      render json: residents
    end

    def show
      render json: @resident
    end

    def create
      user = User.create_user_associate_condominium(
        resident_create_params[:name],
        resident_create_params[:email],
        params[:condominium_id]
      )

      unit = Unit.find_by(identifier: params[:identifier], condominium_id: params[:condominium_id])

      resident = Resident.new(
        name: user.name,
        email: user.email,
        phone: resident_create_params[:phone],
        unit_id: unit.id,
        user_id: user.id
      )

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
      params.require(:resident).permit(:name, :email, :phone, :identifier, :condominium_id)
    end

    def resident_update_params
      params.require(:resident).permit(:name, :email, :phone)
    end
  end
end
