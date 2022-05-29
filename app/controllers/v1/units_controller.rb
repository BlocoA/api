# frozen_string_literal: true

module V1
  class UnitsController < ApplicationController
    before_action :set_unit, only: %i[show update destroy]

    def index
      units = Unit.joins(condominium: [:condominium_users]).where(
        condominium_users: { user_id: current_user.id }
      )

      render json: units
    end

    def show
      render json: @unit
    end

    def create
      unit = Unit.new(unit_params)

      if unit.save
        render json: unit, status: :created
      else
        errors = unit.errors.full_messages.join(', ')
        render json: { errors: errors }, status: :bad_request
      end
    end

    def update
      if @unit.update(unit_params)
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

    def unit_params
      params.require(:unit).permit(:identifier, :condominium_id)
    end
  end
end
