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
    class NetworkInterfaceAssociation

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

      # The public IP address or Elastic IP address bound to the network
      # interface.
      # @return [String]
      def public_ip
        data.public_ip
      end

      # The public DNS name.
      # @return [String]
      def public_dns_name
        data.public_dns_name
      end

      # The ID of the owner of the Elastic IP address.
      # @return [String]
      def ip_owner_id
        data.ip_owner_id
      end

      # @!endgroup

      # @return [Client]
      def client
        @client
      end

      # Loads, or reloads {#data} for the current {NetworkInterfaceAssociation}.
      # Returns `self` making it possible to chain methods.
      #
      #     network_interface_association.reload.data
      #
      # @return [self]
      def load
        resp = @client.describe_network_interfaces(filters: [{
          name: "association.association-id",
          values: [@id]
        }])
        @data = resp.networkinterfaces[0].association
        self
      end
      alias :reload :load

      # @return [Types::InstanceNetworkInterfaceAssociation]
      #   Returns the data for this {NetworkInterfaceAssociation}. Calls
      #   {Client#describe_network_interfaces} if {#data_loaded?} is `false`.
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
      # @option options [String] :public_ip
      #   \[EC2-Classic\] The Elastic IP address. Required for EC2-Classic.
      # @return [EmptyStructure]
      def delete(options = {})
        options = options.merge(association_id: @id)
        resp = @client.disassociate_address(options)
        resp.data
      end

      # @!group Associations

      # @return [VpcAddress, nil]
      def address
        if data.allocation_id
          VpcAddress.new(
            allocation_id: data.allocation_id,
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

        # @return [Enumerator<NetworkInterfaceAssociation>]
        def each(&block)
          enum = super
          enum.each(&block) if block
          enum
        end

      end
    end
  end
end
