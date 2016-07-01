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
  module IAM
    class SigningCertificate

      extend Aws::Deprecations

      # @overload def initialize(user_name, id, options = {})
      #   @param [String] user_name
      #   @param [String] id
      #   @option options [Client] :client
      # @overload def initialize(options = {})
      #   @option options [required, String] :user_name
      #   @option options [required, String] :id
      #   @option options [Client] :client
      def initialize(*args)
        options = Hash === args.last ? args.pop.dup : {}
        @user_name = extract_user_name(args, options)
        @id = extract_id(args, options)
        @data = options.delete(:data)
        @client = options.delete(:client) || Client.new(options)
      end

      # @!group Read-Only Attributes

      # @return [String]
      def user_name
        @user_name
      end

      # @return [String]
      def id
        @id
      end
      alias :certificate_id :id

      # The contents of the signing certificate.
      # @return [String]
      def certificate_body
        data.certificate_body
      end

      # The status of the signing certificate. `Active` means the key is valid
      # for API calls, while `Inactive` means it is not.
      # @return [String]
      def status
        data.status
      end

      # The date when the signing certificate was uploaded.
      # @return [Time]
      def upload_date
        data.upload_date
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
      # @return [Types::SigningCertificate]
      #   Returns the data for this {SigningCertificate}.
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
      # @return [EmptyStructure]
      def activate(options = {})
        options = options.merge(
          user_name: @user_name,
          certificate_id: @id,
          status: "Active"
        )
        resp = @client.update_signing_certificate(options)
        resp.data
      end

      # @param [Hash] options ({})
      # @return [EmptyStructure]
      def deactivate(options = {})
        options = options.merge(
          user_name: @user_name,
          certificate_id: @id,
          status: "Inactive"
        )
        resp = @client.update_signing_certificate(options)
        resp.data
      end

      # @param [Hash] options ({})
      # @return [EmptyStructure]
      def delete(options = {})
        options = options.merge(
          user_name: @user_name,
          certificate_id: @id
        )
        resp = @client.delete_signing_certificate(options)
        resp.data
      end

      # @!group Associations

      # @return [User]
      def user
        User.new(
          name: @user_name,
          client: @client
        )
      end

      # @deprecated
      # @api private
      def identifiers
        {
          user_name: @user_name,
          id: @id
        }
      end
      deprecated(:identifiers)

      private

      def extract_user_name(args, options)
        value = args[0] || options.delete(:user_name)
        case value
        when String then value
        when nil then raise ArgumentError, "missing required option :user_name"
        else
          msg = "expected :user_name to be a String, got #{value.class}"
          raise ArgumentError, msg
        end
      end

      def extract_id(args, options)
        value = args[1] || options.delete(:id)
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

        # @return [Enumerator<SigningCertificate>]
        def each(&block)
          enum = super
          enum.each(&block) if block
          enum
        end

      end
    end
  end
end
