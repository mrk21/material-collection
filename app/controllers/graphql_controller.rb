class GraphqlController < ApplicationController
  def execute
    result = case
    when params.has_key?('_json')
      MaterialCollectionSchema.multiplex(
        params['_json'].map(&method(:schema_params))
      )
    else
      values = schema_params(params)
      query = values.delete(:query)
      MaterialCollectionSchema.execute(query, values)
    end
    render json: result
  rescue => e
    raise e unless Rails.env.development?
    handle_error_in_development e
  end

  private

  # Handle form data, JSON body, or a blank value
  def ensure_hash(ambiguous_param)
    case ambiguous_param
    when String
      if ambiguous_param.present?
        ensure_hash(JSON.parse(ambiguous_param))
      else
        {}
      end
    when Hash, ActionController::Parameters
      ambiguous_param
    when nil
      {}
    else
      raise ArgumentError, "Unexpected parameter: #{ambiguous_param}"
    end
  end

  def schema_params(values)
    variables = ensure_hash(values[:variables])
    query = values[:query]
    operation_name = values[:operationName]
    context = {
      # Query context goes here, for example:
      # current_user: current_user,
    }
    { query: query, variables: variables, context: context, operation_name: operation_name }
  end

  def handle_error_in_development(e)
    logger.error e.message
    logger.error e.backtrace.join("\n")

    render json: { error: { message: e.message, backtrace: e.backtrace }, data: {} }, status: 500
  end
end
