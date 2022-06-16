# frozen_string_literal: true

module V1
  class ExpensesController < ApplicationController
    include CondominiumScope

    validate_condominium_id(only_at: :index)
    before_action :set_expense, only: %i[show update destroy]

    def index
      expenses = Expense.where(condominium_id: params[:condominium_id])

      render json: expenses
    end

    def show
      render json: @expense
    end

    def create
      expense = Expense.new(expense_params)

      if expense.save
        render json: expense, status: :created
      else
        errors = expense.errors.full_messages.join(', ')
        render json: { errors: errors }, status: :bad_request
      end
    end

    def update
      if @expense.update(expense_params)
        render json: @expense
      else
        errors = @expense.errors.full_messages.join(', ')
        render json: { errors: errors }, status: :bad_request
      end
    end

    def destroy
      if @expense.destroy
        render json: {}, status: :no_content
      else
        errors = @expense.errors.full_messages.join(', ')
        render json: { errors: errors }, status: :bad_request
      end
    end

    private

    def set_expense
      @expense = Expense.find(params[:id])
    end

    def expense_params
      params.require(:expense).permit(:contractee, :amount, :spent_at, :description, :condominium_id)
    end
  end
end
