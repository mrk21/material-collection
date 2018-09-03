# frozen_string_literal: true

class GraphqlController < ApplicationController
  def execute
    result = case
             when batch_query.present? then execute_batch_query
             else execute_one_query
             end
    render json: result
  rescue StandardError => e
    raise e unless Rails.env.development?
    handle_error_in_development e
  end

  private

  def batch_query
    params['_json']
  end

  def execute_batch_query
    MaterialCollectionSchema.multiplex(
      batch_query.to_a.map(&method(:schema_params))
    )
  end

  def execute_one_query
    values = schema_params(params)
    query = values.delete(:query)
    MaterialCollectionSchema.execute(query, values)
  end

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
      session: method(:session),
      current_user: current_user
    }
    { query: query, variables: variables, context: context, operation_name: operation_name }
  end

  def handle_error_in_development(e)
    logger.error e.message
    logger.error e.backtrace.join("\n")

    render json: { error: { message: e.message, backtrace: e.backtrace }, data: {} }, status: 500
  end
end
