# frozen_string_literal: true

module V1
  class DocumentsController < ApplicationController
    before_action :set_document, only: %i[show destroy]

    # TODO: Add file_url to GET requests
    def index
      return render_missing_param_error_for('condominium_id') unless params[:condominium_id]

      documents = Document.where(condominium_id: params[:condominium_id])

      render json: documents
    end

    def show
      render json: @document
    end

    def create
      document = Document.new(document_params)

      if document.save
        render json: document, status: :created
      else
        errors = document.errors.full_messages.join(', ')
        render json: { errors: errors }, status: :bad_request
      end
    end

    def destroy
      if @document.destroy
        render json: {}, status: :no_content
      else
        errors = @document.errors.full_messages.join(', ')
        render json: { errors: errors }, status: :bad_request
      end
    end

    private

    def set_document
      @document = Document.find(params[:id])
    end

    def document_params
      params.permit(:name, :month, :year, :file, :condominium_id, :user_id)
    end

    def render_missing_param_error_for(param_name)
      render(json: { errors: "Missing #{param_name} param" }, status: :bad_request)
    end
  end
end
