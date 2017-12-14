module ExceptionHandler
  extend ActiveSupport::Concern

  class AuthenticationError < StandardError; end
  class MissingSearchError < StandardError; end
  class MissingToken < StandardError; end
  class InvalidToken < StandardError; end

  included do
    rescue_from ExceptionHandler::MissingToken, with: :unauthorized
    rescue_from ExceptionHandler::InvalidToken, with: :unauthorized

    rescue_from ActiveRecord::RecordInvalid do |e|
      render json: { message: e.message }, status: :unprocessable_entity
    end

    rescue_from ExceptionHandler::MissingSearchError do |e|
      render json: { message: e.message }, status: :unprocessable_entity
    end

    rescue_from ActiveRecord::RecordNotFound do |e|
      render json: { message: e.message }, status: :not_found
    end

    def unauthorized(e)
      render json: { message: e.message }, status: :unauthorized
    end
  end
end
