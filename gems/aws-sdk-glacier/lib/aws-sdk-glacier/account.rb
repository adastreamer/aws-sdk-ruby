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
  module Glacier
    class Account

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
        @data = Aws::EmptyStructure.new
        @client = options.delete(:client) || Client.new(options)
      end

      # @!group Read-Only Attributes

      # @return [String]
      def id
        @id
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

      # @api private
      # @return [EmptyStructure]
      def data
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
      # @option options [required, String] :vault_name
      #   The name of the vault.
      # @return [Vault]
      def create_vault(options = {})
        options = options.merge(account_id: @id)
        resp = @client.create_vault(options)
        Vault.new(
          account_id: @id,
          name: options[:vault_name],
          client: @client
        )
      end

      # @!group Associations

      # @param [String] name
      # @return [Vault]
      def vault(name)
        Vault.new(
          account_id: @id,
          name: name,
          client: @client
        )
      end

      # @param [Hash] options ({})
      # @return [Vault::Collection]
      def vaults(options = {})
        batches = Enumerator.new do |y|
          options = options.merge(account_id: @id)
          resp = @client.list_vaults(options)
          resp.each_page do |page|
            batch = []
            page.data.vault_list.each do |v|
              batch << Vault.new(
                account_id: @id,
                name: v.vault_name,
                data: v,
                client: @client
              )
            end
            y.yield(batch)
          end
        end
        Vault::Collection.new(batches)
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

        # @return [Enumerator<Account>]
        def each(&block)
          enum = super
          enum.each(&block) if block
          enum
        end

      end
    end
  end
end
