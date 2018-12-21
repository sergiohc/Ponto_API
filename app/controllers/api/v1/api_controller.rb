module Api::V1
  class ApiController < ApplicationController
    #Se recupera de not found
    rescue_from(ActiveRecord::RecordNotFound) do ||
      render(json: {message: 'Not Found'}, status: :not_found)
    end
    #Retorna o parametro que está faltando
    rescue_from(ActionController::ParameterMissing) do |parameter_missing_exception|
       render(json: {message: "Required parameter missing: #{parameter_missing_exception.param}"}, status: :bad_request)
    end
  end
 end