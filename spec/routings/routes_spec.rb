# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SessionsController, type: :routing do
  describe '[GET|POST] /api/graphql(/:opinfo)' do
    [:get, :post].each do |method|
      context "when http method was #{method.to_s.upcase}" do
        context 'without `:opinfo` param' do
          it 'matches' do
            expect(method => '/api/graphql').to route_to(
              controller: 'graphql',
              action: 'execute'
            )
          end
        end

        context 'with `:opinfo` param that includes opname only' do
          it 'matches' do
            expect(method => '/api/graphql/getProject').to route_to(
              controller: 'graphql',
              action: 'execute',
              opinfo: 'getProject'
            )
          end
        end

        context 'with `:opinfo` param that includes opname and batch counts' do
          it 'matches' do
            expect(method => '/api/graphql/getProject/batches/5').to route_to(
              controller: 'graphql',
              action: 'execute',
              opinfo: 'getProject/batches/5'
            )
          end
        end
      end
    end
  end
end