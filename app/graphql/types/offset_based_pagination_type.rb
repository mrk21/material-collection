# frozen_string_literal: true

# For kaminari based pagination
# @examples
#   ActiveRecord::Base.all.page(1).per(20)
#   Kaminari.paginate_array(array).page(1).per(20)
module Types::OffsetBasedPaginationType
  class PageArgumentType < Types::BaseInputObject
    graphql_name 'OffsetBasedPageArgument'

    argument :page, Integer, required: true
    argument :per, Integer, required: true
  end

  class PageInfoType < Types::BaseObject
    graphql_name 'OffsetBasedPageInfo'

    field :total_count, Integer, null: false
    field :total_pages, Integer, null: false
    field :next_page, Integer, null: true
    field :previous_page, Integer, null: true
    field :has_next_page, Boolean, null: false
    field :has_previous_page, Boolean, null: false
    field :is_out_of_range, Boolean, null: false

    def next_page
      object.next_page unless object.out_of_range?
    end

    def previous_page
      object.prev_page unless object.out_of_range?
    end

    def has_next_page
      !object.out_of_range? && !object.last_page?
    end

    def has_previous_page
      !object.out_of_range? && !object.first_page?
    end

    def is_out_of_range
      object.out_of_range?
    end
  end

  @@classes = {}

  # @param node_type [Types::BaseObject]
  def self.[](node_type)
    @@classes[node_type] ||= Class.new Types::BaseObject do
      graphql_name "#{node_type.graphql_name}OffsetBasedPagination"

      field :page_info, PageInfoType, null: false
      field :nodes, [node_type], null: false

      def page_info
        object
      end

      def nodes
        object
      end
    end
  end
end