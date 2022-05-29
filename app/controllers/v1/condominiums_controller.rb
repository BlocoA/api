# frozen_string_literal: true

module V1
  class CondominiumsController < ApplicationController
    before_action :set_condominium, only: %i[show update destroy]

    def show
      render json: @condominium
    end

    def create
      condominium = Condominium.new(condominium_params)
      condominium.assign_manager(current_user)

      if condominium.save
        render json: condominium, status: :created
      else
        errors = condominium.errors.full_messages.join(', ')
        render json: { errors: errors }, status: :bad_request
      end
    end

    def update
      if @condominium.update(condominium_params)
        render json: @condominium
      else
        errors = @condominium.errors.full_messages.join(', ')
        render json: { errors: errors }, status: :bad_request
      end
    end

    def destroy
      if @condominium.destroy
        render json: {}, status: :no_content
      else
        errors = @condominium.errors.full_messages.join(', ')
        render json: { errors: errors }, status: :bad_request
      end
    end

    private

    def set_condominium
      @condominium = Condominium.find(params[:id])
    end

    def condominium_params
      params.require(:condominium).permit(:name, :units_quantity, :has_leisure_area)
    end
  end
end
