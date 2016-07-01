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
  module S3
    class ObjectAcl

      extend Aws::Deprecations

      # @overload def initialize(bucket_name, object_key, options = {})
      #   @param [String] bucket_name
      #   @param [String] object_key
      #   @option options [Client] :client
      # @overload def initialize(options = {})
      #   @option options [required, String] :bucket_name
      #   @option options [required, String] :object_key
      #   @option options [Client] :client
      def initialize(*args)
        options = Hash === args.last ? args.pop.dup : {}
        @bucket_name = extract_bucket_name(args, options)
        @object_key = extract_object_key(args, options)
        @data = options.delete(:data)
        @client = options.delete(:client) || Client.new(options)
      end

      # @!group Read-Only Attributes

      # @return [String]
      def bucket_name
        @bucket_name
      end

      # @return [String]
      def object_key
        @object_key
      end

      # @return [Types::Owner]
      def owner
        data.owner
      end

      # A list of grants.
      # @return [Array<Types::Grant>]
      def grants
        data.grants
      end

      # If present, indicates that the requester was successfully charged for
      # the request.
      # @return [String]
      def request_charged
        data.request_charged
      end

      # @!endgroup

      # @return [Client]
      def client
        @client
      end

      # Loads, or reloads {#data} for the current {ObjectAcl}.
      # Returns `self` making it possible to chain methods.
      #
      #     object_acl.reload.data
      #
      # @return [self]
      def load
        resp = @client.get_object_acl(
          bucket: @bucket_name,
          key: @object_key
        )
        @data = resp.data
        self
      end
      alias :reload :load

      # @return [Types::GetObjectAclOutput]
      #   Returns the data for this {ObjectAcl}. Calls
      #   {Client#get_object_acl} if {#data_loaded?} is `false`.
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
      # @option options [String] :acl
      #   The canned ACL to apply to the object.
      # @option options [Types::AccessControlPolicy] :access_control_policy
      # @option options [String] :content_md5
      # @option options [String] :grant_full_control
      #   Allows grantee the read, write, read ACP, and write ACP permissions on
      #   the bucket.
      # @option options [String] :grant_read
      #   Allows grantee to list the objects in the bucket.
      # @option options [String] :grant_read_acp
      #   Allows grantee to read the bucket ACL.
      # @option options [String] :grant_write
      #   Allows grantee to create, overwrite, and delete any object in the
      #   bucket.
      # @option options [String] :grant_write_acp
      #   Allows grantee to write the ACL for the applicable bucket.
      # @option options [String] :request_payer
      #   Confirms that the requester knows that she or he will be charged for
      #   the request. Bucket owners need not specify this parameter in their
      #   requests. Documentation on downloading objects from requester pays
      #   buckets can be found at
      #   http://docs.aws.amazon.com/AmazonS3/latest/dev/ObjectsinRequesterPaysBuckets.html
      # @option options [String] :version_id
      #   VersionId used to reference a specific version of the object.
      # @return [Types::PutObjectAclOutput]
      def put(options = {})
        options = options.merge(
          bucket: @bucket_name,
          key: @object_key
        )
        resp = @client.put_object_acl(options)
        resp.data
      end

      # @!group Associations

      # @return [Object]
      def object
        Object.new(
          bucket_name: @bucket_name,
          key: @object_key,
          client: @client
        )
      end

      # @deprecated
      # @api private
      def identifiers
        {
          bucket_name: @bucket_name,
          object_key: @object_key
        }
      end
      deprecated(:identifiers)

      private

      def extract_bucket_name(args, options)
        value = args[0] || options.delete(:bucket_name)
        case value
        when String then value
        when nil then raise ArgumentError, "missing required option :bucket_name"
        else
          msg = "expected :bucket_name to be a String, got #{value.class}"
          raise ArgumentError, msg
        end
      end

      def extract_object_key(args, options)
        value = args[1] || options.delete(:object_key)
        case value
        when String then value
        when nil then raise ArgumentError, "missing required option :object_key"
        else
          msg = "expected :object_key to be a String, got #{value.class}"
          raise ArgumentError, msg
        end
      end

      class Collection

        include Aws::Resources::Collection

        # @return [Enumerator<ObjectAcl>]
        def each(&block)
          enum = super
          enum.each(&block) if block
          enum
        end

      end
    end
  end
end
