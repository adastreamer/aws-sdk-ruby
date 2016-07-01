# WARNING ABOUT GENERATED CODE
#
# The AWS SDK for Ruby is largely generated from JSON service definitions. Edits
# made against this file will be lost the next time the SDK updates.  To resolve
# an issue with generated code, a change is likely needed in the generator or
# in one of the service JSON definitions.
#
# * https://github.com/aws/aws-sdk-ruby/tree/master/gems/aws-sdk-code-generator
# * https://github.com/aws/aws-sdk-ruby/tree/master/apis
#
# Open a GitHub issue if you have questions before making changes.  Pull
# requests against this file will be automatically closed.
#
# WARNING ABOUT GENERATED CODE
module Aws
  module EC2
    class RouteTable

      extend Aws::Deprecations

      # @overload def initialize(id, options = {})
      #   @param [String] id
      #   @option options [Client] :client
      # @overload def initialize(options = {})
      #   @option options [required, String] :id
      #   @option options [Client] :client
      def initialize(*args)
        options = Hash === args.last ? args.pop.dup : {}
        @id = extract_id(args, options)
        @data = options.delete(:data)
        @client = options.delete(:client) || Client.new(options)
      end

      # @!group Read-Only Attributes

      # @return [String]
      def id
        @id
      end
      alias :route_table_id :id

      # The ID of the VPC.
      # @return [String]
      def vpc_id
        data.vpc_id
      end

      # Any tags assigned to the route table.
      # @return [Array<Types::Tag>]
      def tags
        data.tags
      end

      # Any virtual private gateway (VGW) propagating routes.
      # @return [Array<Types::PropagatingVgw>]
      def propagating_vgws
        data.propagating_vgws
      end

      # @!endgroup

      # @return [Client]
      def client
        @client
      end

      # Loads, or reloads {#data} for the current {RouteTable}.
      # Returns `self` making it possible to chain methods.
      #
      #     route_table.reload.data
      #
      # @return [self]
      def load
        resp = @client.describe_route_tables(route_table_ids: [@id])
        @data = resp.routetables[0]
        self
      end
      alias :reload :load

      # @return [Types::RouteTable]
      #   Returns the data for this {RouteTable}. Calls
      #   {Client#describe_route_tables} if {#data_loaded?} is `false`.
      def data
        load unless @data
        @data
      end

      # @return [Boolean]
      #   Returns `true` if this resource is loaded.  Accessing attributes or
      #   {#data} on an unloaded resource will trigger a call to {#load}.
      def data_loaded?
        !!@data
      end

      # @!group Actions

      # @param [Hash] options ({})
      # @option options [Boolean] :dry_run
      #   Checks whether you have the required permissions for the action,
      #   without actually making the request, and provides an error response.
      #   If you have the required permissions, the error response is
      #   `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
      # @option options [required, String] :subnet_id
      #   The ID of the subnet.
      # @return [RouteTableAssociation]
      def associate_with_subnet(options = {})
        options = options.merge(route_table_id: @id)
        resp = @client.associate_route_table(options)
        RouteTableAssociation.new(
          id: resp.data.association_id,
          client: @client
        )
      end

      # @param [Hash] options ({})
      # @option options [Boolean] :dry_run
      #   Checks whether you have the required permissions for the action,
      #   without actually making the request, and provides an error response.
      #   If you have the required permissions, the error response is
      #   `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
      # @option options [required, String] :destination_cidr_block
      #   The CIDR address block used for the destination match. Routing
      #   decisions are based on the most specific match.
      # @option options [String] :gateway_id
      #   The ID of an Internet gateway or virtual private gateway attached to
      #   your VPC.
      # @option options [String] :instance_id
      #   The ID of a NAT instance in your VPC. The operation fails if you
      #   specify an instance ID unless exactly one network interface is
      #   attached.
      # @option options [String] :network_interface_id
      #   The ID of a network interface.
      # @option options [String] :vpc_peering_connection_id
      #   The ID of a VPC peering connection.
      # @option options [String] :nat_gateway_id
      #   The ID of a NAT gateway.
      # @return [Route]
      def create_route(options = {})
        options = options.merge(route_table_id: @id)
        resp = @client.create_route(options)
        Route.new(
          route_table_id: @id,
          destination_cidr_block: options[:destination_cidr_block],
          client: @client
        )
      end

      # @param [Hash] options ({})
      # @option options [Boolean] :dry_run
      #   Checks whether you have the required permissions for the action,
      #   without actually making the request, and provides an error response.
      #   If you have the required permissions, the error response is
      #   `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
      # @option options [required, Array<Types::Tag>] :tags
      #   One or more tags. The `value` parameter is required, but if you don\'t
      #   want the tag to have a value, specify the parameter with no value, and
      #   we set the value to an empty string.
      # @return [Tag::Collection]
      def create_tags(options = {})
        batch = []
        options = Aws::Util.deep_merge(options, resources: [@id])
        resp = @client.create_tags(options)
        options[:tags].each do |t|
          batch << Tag.new(
            resource_id: @id,
            key: t[:key],
            value: t[:value],
            client: @client
          )
        end
        Tag::Collection.new([batch], size: batch.size)
      end

      # @param [Hash] options ({})
      # @option options [Boolean] :dry_run
      #   Checks whether you have the required permissions for the action,
      #   without actually making the request, and provides an error response.
      #   If you have the required permissions, the error response is
      #   `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
      # @return [EmptyStructure]
      def delete(options = {})
        options = options.merge(route_table_id: @id)
        resp = @client.delete_route_table(options)
        resp.data
      end

      # @!group Associations

      # @return [RouteTableAssociation::Collection]
      def associations
        batch = []
        data.associations.each do |a|
          batch << RouteTableAssociation.new(
            id: a.route_table_association_id,
            data: a,
            client: @client
          )
        end
        RouteTableAssociation::Collection.new([batch], size: batch.size)
      end

      # @return [Route::Collection]
      def routes
        batch = []
        data.routes.each do |r|
          batch << Route.new(
            route_table_id: @id,
            destination_cidr_block: r.destination_cidr_block,
            data: r,
            client: @client
          )
        end
        Route::Collection.new([batch], size: batch.size)
      end

      # @return [Vpc, nil]
      def vpc
        if data.vpc_id
          Vpc.new(
            id: data.vpc_id,
            client: @client
          )
        else
          nil
        end
      end

      # @deprecated
      # @api private
      def identifiers
        { id: @id }
      end
      deprecated(:identifiers)

      private

      def extract_id(args, options)
        value = args[0] || options.delete(:id)
        case value
        when String then value
        when nil then raise ArgumentError, "missing required option :id"
        else
          msg = "expected :id to be a String, got #{value.class}"
          raise ArgumentError, msg
        end
      end

      class Collection

        include Aws::Resources::Collection

        # @return [Enumerator<RouteTable>]
        def each(&block)
          enum = super
          enum.each(&block) if block
          enum
        end

      end
    end
  end
end
