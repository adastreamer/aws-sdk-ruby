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
    class Route

      extend Aws::Deprecations

      # @overload def initialize(route_table_id, destination_cidr_block, options = {})
      #   @param [String] route_table_id
      #   @param [String] destination_cidr_block
      #   @option options [Client] :client
      # @overload def initialize(options = {})
      #   @option options [required, String] :route_table_id
      #   @option options [required, String] :destination_cidr_block
      #   @option options [Client] :client
      def initialize(*args)
        options = Hash === args.last ? args.pop.dup : {}
        @route_table_id = extract_route_table_id(args, options)
        @destination_cidr_block = extract_destination_cidr_block(args, options)
        @data = options.delete(:data)
        @client = options.delete(:client) || Client.new(options)
      end

      # @!group Read-Only Attributes

      # @return [String]
      def route_table_id
        @route_table_id
      end

      # @return [String]
      def destination_cidr_block
        @destination_cidr_block
      end

      # The prefix of the AWS service.
      # @return [String]
      def destination_prefix_list_id
        data.destination_prefix_list_id
      end

      # The ID of a gateway attached to your VPC.
      # @return [String]
      def gateway_id
        data.gateway_id
      end

      # The ID of a NAT instance in your VPC.
      # @return [String]
      def instance_id
        data.instance_id
      end

      # The AWS account ID of the owner of the instance.
      # @return [String]
      def instance_owner_id
        data.instance_owner_id
      end

      # The ID of the network interface.
      # @return [String]
      def network_interface_id
        data.network_interface_id
      end

      # The ID of the VPC peering connection.
      # @return [String]
      def vpc_peering_connection_id
        data.vpc_peering_connection_id
      end

      # The ID of a NAT gateway.
      # @return [String]
      def nat_gateway_id
        data.nat_gateway_id
      end

      # The state of the route. The `blackhole` state indicates that the
      # route\'s target isn\'t available (for example, the specified gateway
      # isn\'t attached to the VPC, or the specified NAT instance has been
      # terminated).
      # @return [String]
      def state
        data.state
      end

      # Describes how the route was created.
      #
      # * `CreateRouteTable` - The route was automatically created when the
      #   route table was created.
      #
      # * `CreateRoute` - The route was manually added to the route table.
      #
      # * `EnableVgwRoutePropagation` - The route was propagated by route
      #   propagation.
      # @return [String]
      def origin
        data.origin
      end

      # @!endgroup

      # @return [Client]
      def client
        @client
      end

      # @raise [Errors::ResourceNotLoadable]
      # @api private
      def load
        msg = "#load is not implemented, data only available via enumeration"
        raise Errors::ResourceNotLoadable, msg
      end
      alias :reload :load

      # @raise [Errors::ResourceNotLoadableError] Raises when {#data_loaded?} is `false`.
      # @return [Types::Route]
      #   Returns the data for this {Route}.
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
      # @return [EmptyStructure]
      def delete(options = {})
        options = options.merge(
          route_table_id: @route_table_id,
          destination_cidr_block: @destination_cidr_block
        )
        resp = @client.delete_route(options)
        resp.data
      end

      # @param [Hash] options ({})
      # @option options [Boolean] :dry_run
      #   Checks whether you have the required permissions for the action,
      #   without actually making the request, and provides an error response.
      #   If you have the required permissions, the error response is
      #   `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
      # @option options [String] :gateway_id
      #   The ID of an Internet gateway or virtual private gateway.
      # @option options [String] :instance_id
      #   The ID of a NAT instance in your VPC.
      # @option options [String] :network_interface_id
      #   The ID of a network interface.
      # @option options [String] :vpc_peering_connection_id
      #   The ID of a VPC peering connection.
      # @option options [String] :nat_gateway_id
      #   The ID of a NAT gateway.
      # @return [EmptyStructure]
      def replace(options = {})
        options = options.merge(
          route_table_id: @route_table_id,
          destination_cidr_block: @destination_cidr_block
        )
        resp = @client.replace_route(options)
        resp.data
      end

      # @!group Associations

      # @return [RouteTable]
      def route_table
        RouteTable.new(
          id: @route_table_id,
          client: @client
        )
      end

      # @deprecated
      # @api private
      def identifiers
        {
          route_table_id: @route_table_id,
          destination_cidr_block: @destination_cidr_block
        }
      end
      deprecated(:identifiers)

      private

      def extract_route_table_id(args, options)
        value = args[0] || options.delete(:route_table_id)
        case value
        when String then value
        when nil then raise ArgumentError, "missing required option :route_table_id"
        else
          msg = "expected :route_table_id to be a String, got #{value.class}"
          raise ArgumentError, msg
        end
      end

      def extract_destination_cidr_block(args, options)
        value = args[1] || options.delete(:destination_cidr_block)
        case value
        when String then value
        when nil then raise ArgumentError, "missing required option :destination_cidr_block"
        else
          msg = "expected :destination_cidr_block to be a String, got #{value.class}"
          raise ArgumentError, msg
        end
      end

      class Collection

        include Aws::Resources::Collection

        # @return [Enumerator<Route>]
        def each(&block)
          enum = super
          enum.each(&block) if block
          enum
        end

      end
    end
  end
end
