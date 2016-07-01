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
  module MarketplaceCommerceAnalytics
    module Types

      # Container for the parameters to the GenerateDataSet operation.
      # @note When making an API call, pass GenerateDataSetRequest
      #   data as a hash:
      #
      #       {
      #         data_set_type: "customer_subscriber_hourly_monthly_subscriptions", # required, accepts customer_subscriber_hourly_monthly_subscriptions, customer_subscriber_annual_subscriptions, daily_business_usage_by_instance_type, daily_business_fees, daily_business_free_trial_conversions, daily_business_new_instances, daily_business_new_product_subscribers, daily_business_canceled_product_subscribers, monthly_revenue_billing_and_revenue_data, monthly_revenue_annual_subscriptions, disbursed_amount_by_product, disbursed_amount_by_product_with_uncollected_funds, disbursed_amount_by_customer_geo, disbursed_amount_by_age_of_uncollected_funds, disbursed_amount_by_age_of_disbursed_funds, customer_profile_by_industry, customer_profile_by_revenue, customer_profile_by_geography
      #         data_set_publication_date: Time.now, # required
      #         role_name_arn: "RoleNameArn", # required
      #         destination_s3_bucket_name: "DestinationS3BucketName", # required
      #         destination_s3_prefix: "DestinationS3Prefix",
      #         sns_topic_arn: "SnsTopicArn", # required
      #         customer_defined_values: {
      #           "OptionalKey" => "OptionalValue",
      #         },
      #       }
      class GenerateDataSetRequest < Aws::Structure.new(
        :data_set_type,
        :data_set_publication_date,
        :role_name_arn,
        :destination_s3_bucket_name,
        :destination_s3_prefix,
        :sns_topic_arn,
        :customer_defined_values)

        # @!attribute [rw] data_set_type
        #   The desired data set type.
        #
        #   * *customer\_subscriber\_hourly\_monthly\_subscriptions* - Available
        #     daily by 5:00 PM Pacific Time since 2014-07-21.
        #   * *customer\_subscriber\_annual\_subscriptions* - Available daily by
        #     5:00 PM Pacific Time since 2014-07-21.
        #   * *daily\_business\_usage\_by\_instance\_type* - Available daily by
        #     5:00 PM Pacific Time since 2015-01-26.
        #   * *daily\_business\_fees* - Available daily by 5:00 PM Pacific Time
        #     since 2015-01-26.
        #   * *daily\_business\_free\_trial\_conversions* - Available daily by
        #     5:00 PM Pacific Time since 2015-01-26.
        #   * *daily\_business\_new\_instances* - Available daily by 5:00 PM
        #     Pacific Time since 2015-01-26.
        #   * *daily\_business\_new\_product\_subscribers* - Available daily by
        #     5:00 PM Pacific Time since 2015-01-26.
        #   * *daily\_business\_canceled\_product\_subscribers* - Available
        #     daily by 5:00 PM Pacific Time since 2015-01-26.
        #   * *monthly\_revenue\_billing\_and\_revenue\_data* - Available
        #     monthly on the 4th day of the month by 5:00 PM Pacific Time since
        #     2015-02.
        #   * *monthly\_revenue\_annual\_subscriptions* - Available monthly on
        #     the 4th day of the month by 5:00 PM Pacific Time since 2015-02.
        #   * *disbursed\_amount\_by\_product* - Available every 30 days by 5:00
        #     PM Pacific Time since 2015-01-26.
        #   * *disbursed\_amount\_by\_product\_with\_uncollected\_funds* -This
        #     data set is only available from 2012-04-19 until 2015-01-25. After
        #     2015-01-25, this data set was split into three data sets:
        #     disbursed\_amount\_by\_product,
        #     disbursed\_amount\_by\_age\_of\_uncollected\_funds, and
        #     disbursed\_amount\_by\_age\_of\_disbursed\_funds.
        #   * *disbursed\_amount\_by\_customer\_geo* - Available every 30 days
        #     by 5:00 PM Pacific Time since 2012-04-19.
        #   * *disbursed\_amount\_by\_age\_of\_uncollected\_funds* - Available
        #     every 30 days by 5:00 PM Pacific Time since 2015-01-26.
        #   * *disbursed\_amount\_by\_age\_of\_disbursed\_funds* - Available
        #     every 30 days by 5:00 PM Pacific Time since 2015-01-26.
        #   * *customer\_profile\_by\_industry* - Available daily by 5:00 PM
        #     Pacific Time since 2015-10-01.
        #   * *customer\_profile\_by\_revenue* - Available daily by 5:00 PM
        #     Pacific Time since 2015-10-01.
        #   * *customer\_profile\_by\_geography* - Available daily by 5:00 PM
        #     Pacific Time since 2015-10-01.
        #   @return [String]

        # @!attribute [rw] data_set_publication_date
        #   The date a data set was published. For daily data sets, provide a
        #   date with day-level granularity for the desired day. For weekly data
        #   sets, provide a date with day-level granularity within the desired
        #   week (the day value will be ignored). For monthly data sets, provide
        #   a date with month-level granularity for the desired month (the day
        #   value will be ignored).
        #   @return [Time]

        # @!attribute [rw] role_name_arn
        #   The Amazon Resource Name (ARN) of the Role with an attached
        #   permissions policy to interact with the provided AWS services.
        #   @return [String]

        # @!attribute [rw] destination_s3_bucket_name
        #   The name (friendly name, not ARN) of the destination S3 bucket.
        #   @return [String]

        # @!attribute [rw] destination_s3_prefix
        #   (Optional) The desired S3 prefix for the published data set, similar
        #   to a directory path in standard file systems. For example, if given
        #   the bucket name \"mybucket\" and the prefix \"myprefix/mydatasets\",
        #   the output file \"outputfile\" would be published to
        #   \"s3://mybucket/myprefix/mydatasets/outputfile\". If the prefix
        #   directory structure does not exist, it will be created. If no prefix
        #   is provided, the data set will be published to the S3 bucket root.
        #   @return [String]

        # @!attribute [rw] sns_topic_arn
        #   Amazon Resource Name (ARN) for the SNS Topic that will be notified
        #   when the data set has been published or if an error has occurred.
        #   @return [String]

        # @!attribute [rw] customer_defined_values
        #   (Optional) Key-value pairs which will be returned, unmodified, in
        #   the Amazon SNS notification message and the data set metadata file.
        #   These key-value pairs can be used to correlated responses with
        #   tracking information from other systems.
        #   @return [Hash<String,String>]

      end

      # Container for the result of the GenerateDataSet operation.
      class GenerateDataSetResult < Aws::Structure.new(
        :data_set_request_id)

        # @!attribute [rw] data_set_request_id
        #   A unique identifier representing a specific request to the
        #   GenerateDataSet operation. This identifier can be used to correlate
        #   a request with notifications from the SNS topic.
        #   @return [String]

      end

    end
  end
end
