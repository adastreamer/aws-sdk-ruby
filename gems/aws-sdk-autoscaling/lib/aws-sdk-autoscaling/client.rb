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
  module AutoScaling
    class Client < Seahorse::Client::Base

      include Aws::ClientStubs
      include Aws::ClientWaiters

      @identifier = :autoscaling

      set_api(ClientApi::API)

      add_plugin(Seahorse::Client::Plugins::ContentLength)
      add_plugin(Aws::Plugins::Logging)
      add_plugin(Aws::Plugins::ParamConverter)
      add_plugin(Aws::Plugins::ParamValidator)
      add_plugin(Aws::Plugins::UserAgent)
      add_plugin(Aws::Plugins::RetryErrors)
      add_plugin(Aws::Plugins::GlobalConfiguration)
      add_plugin(Aws::Plugins::RegionalEndpoint)
      add_plugin(Aws::Plugins::RequestSigner)
      add_plugin(Aws::Plugins::ResponsePaging)
      add_plugin(Aws::Plugins::StubResponses)
      add_plugin(Aws::Plugins::Protocols::Query)

      # @!group API Operations

      # Attaches one or more EC2 instances to the specified Auto Scaling
      # group.
      #
      # When you attach instances, Auto Scaling increases the desired capacity
      # of the group by the number of instances being attached. If the number
      # of instances being attached plus the desired capacity of the group
      # exceeds the maximum size of the group, the operation fails.
      #
      # For more information, see [Attach EC2 Instances to Your Auto Scaling
      # Group][1] in the *Auto Scaling Developer Guide*.
      #
      #
      #
      # [1]: http://docs.aws.amazon.com/AutoScaling/latest/DeveloperGuide/attach-instance-asg.html
      # @option params [Array<String>] :instance_ids
      #   One or more instance IDs.
      # @option params [required, String] :auto_scaling_group_name
      #   The name of the group.
      # @return [Struct] Returns an empty {Seahorse::Client::Response response}.
      #
      # @example Request syntax with placeholder values
      #   resp = client.attach_instances({
      #     instance_ids: ["XmlStringMaxLen19"],
      #     auto_scaling_group_name: "ResourceName", # required
      #   })
      # @param [Hash] params ({})
      # @param [Hash] options ({})
      def attach_instances(params = {}, options = {})
        req = build_request(:attach_instances, params)
        req.send_request(options)
      end

      # Attaches one or more load balancers to the specified Auto Scaling
      # group.
      #
      # To describe the load balancers for an Auto Scaling group, use
      # DescribeLoadBalancers. To detach the load balancer from the Auto
      # Scaling group, use DetachLoadBalancers.
      #
      # For more information, see [Attach a Load Balancer to Your Auto Scaling
      # Group][1] in the *Auto Scaling Developer Guide*.
      #
      #
      #
      # [1]: http://docs.aws.amazon.com/AutoScaling/latest/DeveloperGuide/attach-load-balancer-asg.html
      # @option params [String] :auto_scaling_group_name
      #   The name of the group.
      # @option params [Array<String>] :load_balancer_names
      #   One or more load balancer names.
      # @return [Struct] Returns an empty {Seahorse::Client::Response response}.
      #
      # @example Request syntax with placeholder values
      #   resp = client.attach_load_balancers({
      #     auto_scaling_group_name: "ResourceName",
      #     load_balancer_names: ["XmlStringMaxLen255"],
      #   })
      # @param [Hash] params ({})
      # @param [Hash] options ({})
      def attach_load_balancers(params = {}, options = {})
        req = build_request(:attach_load_balancers, params)
        req.send_request(options)
      end

      # Completes the lifecycle action for the specified token or instance
      # with the specified result.
      #
      # This step is a part of the procedure for adding a lifecycle hook to an
      # Auto Scaling group:
      #
      # 1.  (Optional) Create a Lambda function and a rule that allows
      #     CloudWatch Events to invoke your Lambda function when Auto Scaling
      #     launches or terminates instances.
      # 2.  (Optional) Create a notification target and an IAM role. The
      #     target can be either an Amazon SQS queue or an Amazon SNS topic.
      #     The role allows Auto Scaling to publish lifecycle notifications to
      #     the target.
      # 3.  Create the lifecycle hook. Specify whether the hook is used when
      #     the instances launch or terminate.
      # 4.  If you need more time, record the lifecycle action heartbeat to
      #     keep the instance in a pending state.
      # 5.  **If you finish before the timeout period ends, complete the
      #     lifecycle action.**
      #
      # For more information, see [Auto Scaling Lifecycle][1] in the *Auto
      # Scaling Developer Guide*.
      #
      #
      #
      # [1]: http://docs.aws.amazon.com/AutoScaling/latest/DeveloperGuide/AutoScalingGroupLifecycle.html
      # @option params [required, String] :lifecycle_hook_name
      #   The name of the lifecycle hook.
      # @option params [required, String] :auto_scaling_group_name
      #   The name of the group for the lifecycle hook.
      # @option params [String] :lifecycle_action_token
      #   A universally unique identifier (UUID) that identifies a specific
      #   lifecycle action associated with an instance. Auto Scaling sends this
      #   token to the notification target you specified when you created the
      #   lifecycle hook.
      # @option params [required, String] :lifecycle_action_result
      #   The action for the group to take. This parameter can be either
      #   `CONTINUE` or `ABANDON`.
      # @option params [String] :instance_id
      #   The ID of the instance.
      # @return [Struct] Returns an empty {Seahorse::Client::Response response}.
      #
      # @example Request syntax with placeholder values
      #   resp = client.complete_lifecycle_action({
      #     lifecycle_hook_name: "AsciiStringMaxLen255", # required
      #     auto_scaling_group_name: "ResourceName", # required
      #     lifecycle_action_token: "LifecycleActionToken",
      #     lifecycle_action_result: "LifecycleActionResult", # required
      #     instance_id: "XmlStringMaxLen19",
      #   })
      # @param [Hash] params ({})
      # @param [Hash] options ({})
      def complete_lifecycle_action(params = {}, options = {})
        req = build_request(:complete_lifecycle_action, params)
        req.send_request(options)
      end

      # Creates an Auto Scaling group with the specified name and attributes.
      #
      # If you exceed your maximum limit of Auto Scaling groups, which by
      # default is 20 per region, the call fails. For information about
      # viewing and updating this limit, see DescribeAccountLimits.
      #
      # For more information, see [Auto Scaling Groups][1] in the *Auto
      # Scaling Developer Guide*.
      #
      #
      #
      # [1]: http://docs.aws.amazon.com/AutoScaling/latest/DeveloperGuide/AutoScalingGroup.html
      # @option params [required, String] :auto_scaling_group_name
      #   The name of the group. This name must be unique within the scope of
      #   your AWS account.
      # @option params [String] :launch_configuration_name
      #   The name of the launch configuration. Alternatively, specify an EC2
      #   instance instead of a launch configuration.
      # @option params [String] :instance_id
      #   The ID of the instance used to create a launch configuration for the
      #   group. Alternatively, specify a launch configuration instead of an EC2
      #   instance.
      #
      #   When you specify an ID of an instance, Auto Scaling creates a new
      #   launch configuration and associates it with the group. This launch
      #   configuration derives its attributes from the specified instance, with
      #   the exception of the block device mapping.
      #
      #   For more information, see [Create an Auto Scaling Group Using an EC2
      #   Instance][1] in the *Auto Scaling Developer Guide*.
      #
      #
      #
      #   [1]: http://docs.aws.amazon.com/AutoScaling/latest/DeveloperGuide/create-asg-from-instance.html
      # @option params [required, Integer] :min_size
      #   The minimum size of the group.
      # @option params [required, Integer] :max_size
      #   The maximum size of the group.
      # @option params [Integer] :desired_capacity
      #   The number of EC2 instances that should be running in the group. This
      #   number must be greater than or equal to the minimum size of the group
      #   and less than or equal to the maximum size of the group.
      # @option params [Integer] :default_cooldown
      #   The amount of time, in seconds, after a scaling activity completes
      #   before another scaling activity can start. The default is 300.
      #
      #   For more information, see [Auto Scaling Cooldowns][1] in the *Auto
      #   Scaling Developer Guide*.
      #
      #
      #
      #   [1]: http://docs.aws.amazon.com/AutoScaling/latest/DeveloperGuide/Cooldown.html
      # @option params [Array<String>] :availability_zones
      #   One or more Availability Zones for the group. This parameter is
      #   optional if you specify one or more subnets.
      # @option params [Array<String>] :load_balancer_names
      #   One or more load balancers.
      #
      #   For more information, see [Using a Load Balancer With an Auto Scaling
      #   Group][1] in the *Auto Scaling Developer Guide*.
      #
      #
      #
      #   [1]: http://docs.aws.amazon.com/AutoScaling/latest/DeveloperGuide/US_SetUpASLBApp.html
      # @option params [String] :health_check_type
      #   The service to use for the health checks. The valid values are `EC2`
      #   and `ELB`.
      #
      #   By default, health checks use Amazon EC2 instance status checks to
      #   determine the health of an instance. For more information, see [Health
      #   Checks][1] in the *Auto Scaling Developer Guide*.
      #
      #
      #
      #   [1]: http://docs.aws.amazon.com/AutoScaling/latest/DeveloperGuide/healthcheck.html
      # @option params [Integer] :health_check_grace_period
      #   The amount of time, in seconds, that Auto Scaling waits before
      #   checking the health status of an EC2 instance that has come into
      #   service. During this time, any health check failures for the instance
      #   are ignored. The default is 300.
      #
      #   This parameter is required if you are adding an `ELB` health check.
      #
      #   For more information, see [Health Checks][1] in the *Auto Scaling
      #   Developer Guide*.
      #
      #
      #
      #   [1]: http://docs.aws.amazon.com/AutoScaling/latest/DeveloperGuide/healthcheck.html
      # @option params [String] :placement_group
      #   The name of the placement group into which you\'ll launch your
      #   instances, if any. For more information, see [Placement Groups][1] in
      #   the *Amazon Elastic Compute Cloud User Guide*.
      #
      #
      #
      #   [1]: http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/placement-groups.html
      # @option params [String] :vpc_zone_identifier
      #   A comma-separated list of subnet identifiers for your virtual private
      #   cloud (VPC).
      #
      #   If you specify subnets and Availability Zones with this call, ensure
      #   that the subnets\' Availability Zones match the Availability Zones
      #   specified.
      #
      #   For more information, see [Launching Auto Scaling Instances in a
      #   VPC][1] in the *Auto Scaling Developer Guide*.
      #
      #
      #
      #   [1]: http://docs.aws.amazon.com/AutoScaling/latest/DeveloperGuide/asg-in-vpc.html
      # @option params [Array<String>] :termination_policies
      #   One or more termination policies used to select the instance to
      #   terminate. These policies are executed in the order that they are
      #   listed.
      #
      #   For more information, see [Controlling Which Instances Auto Scaling
      #   Terminates During Scale In][1] in the *Auto Scaling Developer Guide*.
      #
      #
      #
      #   [1]: http://docs.aws.amazon.com/AutoScaling/latest/DeveloperGuide/AutoScalingBehavior.InstanceTermination.html
      # @option params [Boolean] :new_instances_protected_from_scale_in
      #   Indicates whether newly launched instances are protected from
      #   termination by Auto Scaling when scaling in.
      # @option params [Array<Types::Tag>] :tags
      #   One or more tags.
      #
      #   For more information, see [Tagging Auto Scaling Groups and
      #   Instances][1] in the *Auto Scaling Developer Guide*.
      #
      #
      #
      #   [1]: http://docs.aws.amazon.com/AutoScaling/latest/DeveloperGuide/ASTagging.html
      # @return [Struct] Returns an empty {Seahorse::Client::Response response}.
      #
      # @example Request syntax with placeholder values
      #   resp = client.create_auto_scaling_group({
      #     auto_scaling_group_name: "XmlStringMaxLen255", # required
      #     launch_configuration_name: "ResourceName",
      #     instance_id: "XmlStringMaxLen19",
      #     min_size: 1, # required
      #     max_size: 1, # required
      #     desired_capacity: 1,
      #     default_cooldown: 1,
      #     availability_zones: ["XmlStringMaxLen255"],
      #     load_balancer_names: ["XmlStringMaxLen255"],
      #     health_check_type: "XmlStringMaxLen32",
      #     health_check_grace_period: 1,
      #     placement_group: "XmlStringMaxLen255",
      #     vpc_zone_identifier: "XmlStringMaxLen255",
      #     termination_policies: ["XmlStringMaxLen1600"],
      #     new_instances_protected_from_scale_in: false,
      #     tags: [
      #       {
      #         resource_id: "XmlString",
      #         resource_type: "XmlString",
      #         key: "TagKey", # required
      #         value: "TagValue",
      #         propagate_at_launch: false,
      #       },
      #     ],
      #   })
      # @param [Hash] params ({})
      # @param [Hash] options ({})
      def create_auto_scaling_group(params = {}, options = {})
        req = build_request(:create_auto_scaling_group, params)
        req.send_request(options)
      end

      # Creates a launch configuration.
      #
      # If you exceed your maximum limit of launch configurations, which by
      # default is 100 per region, the call fails. For information about
      # viewing and updating this limit, see DescribeAccountLimits.
      #
      # For more information, see [Launch Configurations][1] in the *Auto
      # Scaling Developer Guide*.
      #
      #
      #
      # [1]: http://docs.aws.amazon.com/AutoScaling/latest/DeveloperGuide/LaunchConfiguration.html
      # @option params [required, String] :launch_configuration_name
      #   The name of the launch configuration. This name must be unique within
      #   the scope of your AWS account.
      # @option params [String] :image_id
      #   The ID of the Amazon Machine Image (AMI) to use to launch your EC2
      #   instances. For more information, see [Finding an AMI][1] in the
      #   *Amazon Elastic Compute Cloud User Guide*.
      #
      #
      #
      #   [1]: http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/finding-an-ami.html
      # @option params [String] :key_name
      #   The name of the key pair. For more information, see [Amazon EC2 Key
      #   Pairs][1] in the *Amazon Elastic Compute Cloud User Guide*.
      #
      #
      #
      #   [1]: http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-key-pairs.html
      # @option params [Array<String>] :security_groups
      #   One or more security groups with which to associate the instances.
      #
      #   If your instances are launched in EC2-Classic, you can either specify
      #   security group names or the security group IDs. For more information
      #   about security groups for EC2-Classic, see [Amazon EC2 Security
      #   Groups][1] in the *Amazon Elastic Compute Cloud User Guide*.
      #
      #   If your instances are launched into a VPC, specify security group IDs.
      #   For more information, see [Security Groups for Your VPC][2] in the
      #   *Amazon Virtual Private Cloud User Guide*.
      #
      #
      #
      #   [1]: http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-network-security.html
      #   [2]: http://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/VPC_SecurityGroups.html
      # @option params [String] :classic_link_vpc_id
      #   The ID of a ClassicLink-enabled VPC to link your EC2-Classic instances
      #   to. This parameter is supported only if you are launching EC2-Classic
      #   instances. For more information, see [ClassicLink][1] in the *Amazon
      #   Elastic Compute Cloud User Guide*.
      #
      #
      #
      #   [1]: http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/vpc-classiclink.html
      # @option params [Array<String>] :classic_link_vpc_security_groups
      #   The IDs of one or more security groups for the specified
      #   ClassicLink-enabled VPC. This parameter is required if you specify a
      #   ClassicLink-enabled VPC, and is not supported otherwise. For more
      #   information, see [ClassicLink][1] in the *Amazon Elastic Compute Cloud
      #   User Guide*.
      #
      #
      #
      #   [1]: http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/vpc-classiclink.html
      # @option params [String] :user_data
      #   The user data to make available to the launched EC2 instances. For
      #   more information, see [Instance Metadata and User Data][1] in the
      #   *Amazon Elastic Compute Cloud User Guide*.
      #
      #
      #
      #   [1]: http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-instance-metadata.html
      # @option params [String] :instance_id
      #   The ID of the instance to use to create the launch configuration.
      #
      #   The new launch configuration derives attributes from the instance,
      #   with the exception of the block device mapping.
      #
      #   To create a launch configuration with a block device mapping or
      #   override any other instance attributes, specify them as part of the
      #   same request.
      #
      #   For more information, see [Create a Launch Configuration Using an EC2
      #   Instance][1] in the *Auto Scaling Developer Guide*.
      #
      #
      #
      #   [1]: http://docs.aws.amazon.com/AutoScaling/latest/DeveloperGuide/create-lc-with-instanceID.html
      # @option params [String] :instance_type
      #   The instance type of the EC2 instance. For information about available
      #   instance types, see [ Available Instance Types][1] in the *Amazon
      #   Elastic Compute Cloud User Guide.*
      #
      #
      #
      #   [1]: http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/instance-types.html#AvailableInstanceTypes
      # @option params [String] :kernel_id
      #   The ID of the kernel associated with the AMI.
      # @option params [String] :ramdisk_id
      #   The ID of the RAM disk associated with the AMI.
      # @option params [Array<Types::BlockDeviceMapping>] :block_device_mappings
      #   One or more mappings that specify how block devices are exposed to the
      #   instance. For more information, see [Block Device Mapping][1] in the
      #   *Amazon Elastic Compute Cloud User Guide*.
      #
      #
      #
      #   [1]: http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/block-device-mapping-concepts.html
      # @option params [Types::InstanceMonitoring] :instance_monitoring
      #   Enables detailed monitoring if it is disabled. Detailed monitoring is
      #   enabled by default.
      #
      #   When detailed monitoring is enabled, Amazon CloudWatch generates
      #   metrics every minute and your account is charged a fee. When you
      #   disable detailed monitoring, by specifying `False`, CloudWatch
      #   generates metrics every 5 minutes. For more information, see
      #   [Monitoring Your Auto Scaling Instances and Groups][1] in the *Auto
      #   Scaling Developer Guide*.
      #
      #
      #
      #   [1]: http://docs.aws.amazon.com/AutoScaling/latest/DeveloperGuide/as-instance-monitoring.html
      # @option params [String] :spot_price
      #   The maximum hourly price to be paid for any Spot Instance launched to
      #   fulfill the request. Spot Instances are launched when the price you
      #   specify exceeds the current Spot market price. For more information,
      #   see [Launching Spot Instances in Your Auto Scaling Group][1] in the
      #   *Auto Scaling Developer Guide*.
      #
      #
      #
      #   [1]: http://docs.aws.amazon.com/AutoScaling/latest/DeveloperGuide/US-SpotInstances.html
      # @option params [String] :iam_instance_profile
      #   The name or the Amazon Resource Name (ARN) of the instance profile
      #   associated with the IAM role for the instance.
      #
      #   EC2 instances launched with an IAM role will automatically have AWS
      #   security credentials available. You can use IAM roles with Auto
      #   Scaling to automatically enable applications running on your EC2
      #   instances to securely access other AWS resources. For more
      #   information, see [Launch Auto Scaling Instances with an IAM Role][1]
      #   in the *Auto Scaling Developer Guide*.
      #
      #
      #
      #   [1]: http://docs.aws.amazon.com/AutoScaling/latest/DeveloperGuide/us-iam-role.html
      # @option params [Boolean] :ebs_optimized
      #   Indicates whether the instance is optimized for Amazon EBS I/O. By
      #   default, the instance is not optimized for EBS I/O. The optimization
      #   provides dedicated throughput to Amazon EBS and an optimized
      #   configuration stack to provide optimal I/O performance. This
      #   optimization is not available with all instance types. Additional
      #   usage charges apply. For more information, see [Amazon EBS-Optimized
      #   Instances][1] in the *Amazon Elastic Compute Cloud User Guide*.
      #
      #
      #
      #   [1]: http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EBSOptimized.html
      # @option params [Boolean] :associate_public_ip_address
      #   Used for groups that launch instances into a virtual private cloud
      #   (VPC). Specifies whether to assign a public IP address to each
      #   instance. For more information, see [Launching Auto Scaling Instances
      #   in a VPC][1] in the *Auto Scaling Developer Guide*.
      #
      #   If you specify this parameter, be sure to specify at least one subnet
      #   when you create your group.
      #
      #   Default: If the instance is launched into a default subnet, the
      #   default is `true`. If the instance is launched into a nondefault
      #   subnet, the default is `false`. For more information, see [Supported
      #   Platforms][2] in the *Amazon Elastic Compute Cloud User Guide*.
      #
      #
      #
      #   [1]: http://docs.aws.amazon.com/AutoScaling/latest/DeveloperGuide/asg-in-vpc.html
      #   [2]: http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-supported-platforms.html
      # @option params [String] :placement_tenancy
      #   The tenancy of the instance. An instance with a tenancy of `dedicated`
      #   runs on single-tenant hardware and can only be launched into a VPC.
      #
      #   You must set the value of this parameter to `dedicated` if want to
      #   launch Dedicated Instances into a shared tenancy VPC (VPC with
      #   instance placement tenancy attribute set to `default`).
      #
      #   If you specify this parameter, be sure to specify at least one subnet
      #   when you create your group.
      #
      #   For more information, see [Launching Auto Scaling Instances in a
      #   VPC][1] in the *Auto Scaling Developer Guide*.
      #
      #   Valid values: `default` \| `dedicated`
      #
      #
      #
      #   [1]: http://docs.aws.amazon.com/AutoScaling/latest/DeveloperGuide/asg-in-vpc.html
      # @return [Struct] Returns an empty {Seahorse::Client::Response response}.
      #
      # @example Request syntax with placeholder values
      #   resp = client.create_launch_configuration({
      #     launch_configuration_name: "XmlStringMaxLen255", # required
      #     image_id: "XmlStringMaxLen255",
      #     key_name: "XmlStringMaxLen255",
      #     security_groups: ["XmlString"],
      #     classic_link_vpc_id: "XmlStringMaxLen255",
      #     classic_link_vpc_security_groups: ["XmlStringMaxLen255"],
      #     user_data: "XmlStringUserData",
      #     instance_id: "XmlStringMaxLen19",
      #     instance_type: "XmlStringMaxLen255",
      #     kernel_id: "XmlStringMaxLen255",
      #     ramdisk_id: "XmlStringMaxLen255",
      #     block_device_mappings: [
      #       {
      #         virtual_name: "XmlStringMaxLen255",
      #         device_name: "XmlStringMaxLen255", # required
      #         ebs: {
      #           snapshot_id: "XmlStringMaxLen255",
      #           volume_size: 1,
      #           volume_type: "BlockDeviceEbsVolumeType",
      #           delete_on_termination: false,
      #           iops: 1,
      #           encrypted: false,
      #         },
      #         no_device: false,
      #       },
      #     ],
      #     instance_monitoring: {
      #       enabled: false,
      #     },
      #     spot_price: "SpotPrice",
      #     iam_instance_profile: "XmlStringMaxLen1600",
      #     ebs_optimized: false,
      #     associate_public_ip_address: false,
      #     placement_tenancy: "XmlStringMaxLen64",
      #   })
      # @param [Hash] params ({})
      # @param [Hash] options ({})
      def create_launch_configuration(params = {}, options = {})
        req = build_request(:create_launch_configuration, params)
        req.send_request(options)
      end

      # Creates or updates tags for the specified Auto Scaling group.
      #
      # When you specify a tag with a key that already exists, the operation
      # overwrites the previous tag definition, and you do not get an error
      # message.
      #
      # For more information, see [Tagging Auto Scaling Groups and
      # Instances][1] in the *Auto Scaling Developer Guide*.
      #
      #
      #
      # [1]: http://docs.aws.amazon.com/AutoScaling/latest/DeveloperGuide/ASTagging.html
      # @option params [required, Array<Types::Tag>] :tags
      #   One or more tags.
      # @return [Struct] Returns an empty {Seahorse::Client::Response response}.
      #
      # @example Request syntax with placeholder values
      #   resp = client.create_or_update_tags({
      #     tags: [ # required
      #       {
      #         resource_id: "XmlString",
      #         resource_type: "XmlString",
      #         key: "TagKey", # required
      #         value: "TagValue",
      #         propagate_at_launch: false,
      #       },
      #     ],
      #   })
      # @param [Hash] params ({})
      # @param [Hash] options ({})
      def create_or_update_tags(params = {}, options = {})
        req = build_request(:create_or_update_tags, params)
        req.send_request(options)
      end

      # Deletes the specified Auto Scaling group.
      #
      # If the group has instances or scaling activities in progress, you must
      # specify the option to force the deletion in order for it to succeed.
      #
      # If the group has policies, deleting the group deletes the policies,
      # the underlying alarm actions, and any alarm that no longer has an
      # associated action.
      #
      # To remove instances from the Auto Scaling group before deleting it,
      # call DetachInstances with the list of instances and the option to
      # decrement the desired capacity so that Auto Scaling does not launch
      # replacement instances.
      #
      # To terminate all instances before deleting the Auto Scaling group,
      # call UpdateAutoScalingGroup and set the minimum size and desired
      # capacity of the Auto Scaling group to zero.
      # @option params [required, String] :auto_scaling_group_name
      #   The name of the group to delete.
      # @option params [Boolean] :force_delete
      #   Specifies that the group will be deleted along with all instances
      #   associated with the group, without waiting for all instances to be
      #   terminated. This parameter also deletes any lifecycle actions
      #   associated with the group.
      # @return [Struct] Returns an empty {Seahorse::Client::Response response}.
      #
      # @example Request syntax with placeholder values
      #   resp = client.delete_auto_scaling_group({
      #     auto_scaling_group_name: "ResourceName", # required
      #     force_delete: false,
      #   })
      # @param [Hash] params ({})
      # @param [Hash] options ({})
      def delete_auto_scaling_group(params = {}, options = {})
        req = build_request(:delete_auto_scaling_group, params)
        req.send_request(options)
      end

      # Deletes the specified launch configuration.
      #
      # The launch configuration must not be attached to an Auto Scaling
      # group. When this call completes, the launch configuration is no longer
      # available for use.
      # @option params [required, String] :launch_configuration_name
      #   The name of the launch configuration.
      # @return [Struct] Returns an empty {Seahorse::Client::Response response}.
      #
      # @example Request syntax with placeholder values
      #   resp = client.delete_launch_configuration({
      #     launch_configuration_name: "ResourceName", # required
      #   })
      # @param [Hash] params ({})
      # @param [Hash] options ({})
      def delete_launch_configuration(params = {}, options = {})
        req = build_request(:delete_launch_configuration, params)
        req.send_request(options)
      end

      # Deletes the specified lifecycle hook.
      #
      # If there are any outstanding lifecycle actions, they are completed
      # first (`ABANDON` for launching instances, `CONTINUE` for terminating
      # instances).
      # @option params [required, String] :lifecycle_hook_name
      #   The name of the lifecycle hook.
      # @option params [required, String] :auto_scaling_group_name
      #   The name of the Auto Scaling group for the lifecycle hook.
      # @return [Struct] Returns an empty {Seahorse::Client::Response response}.
      #
      # @example Request syntax with placeholder values
      #   resp = client.delete_lifecycle_hook({
      #     lifecycle_hook_name: "AsciiStringMaxLen255", # required
      #     auto_scaling_group_name: "ResourceName", # required
      #   })
      # @param [Hash] params ({})
      # @param [Hash] options ({})
      def delete_lifecycle_hook(params = {}, options = {})
        req = build_request(:delete_lifecycle_hook, params)
        req.send_request(options)
      end

      # Deletes the specified notification.
      # @option params [required, String] :auto_scaling_group_name
      #   The name of the Auto Scaling group.
      # @option params [required, String] :topic_arn
      #   The Amazon Resource Name (ARN) of the Amazon Simple Notification
      #   Service (SNS) topic.
      # @return [Struct] Returns an empty {Seahorse::Client::Response response}.
      #
      # @example Request syntax with placeholder values
      #   resp = client.delete_notification_configuration({
      #     auto_scaling_group_name: "ResourceName", # required
      #     topic_arn: "ResourceName", # required
      #   })
      # @param [Hash] params ({})
      # @param [Hash] options ({})
      def delete_notification_configuration(params = {}, options = {})
        req = build_request(:delete_notification_configuration, params)
        req.send_request(options)
      end

      # Deletes the specified Auto Scaling policy.
      #
      # Deleting a policy deletes the underlying alarm action, but does not
      # delete the alarm, even if it no longer has an associated action.
      # @option params [String] :auto_scaling_group_name
      #   The name of the Auto Scaling group.
      # @option params [required, String] :policy_name
      #   The name or Amazon Resource Name (ARN) of the policy.
      # @return [Struct] Returns an empty {Seahorse::Client::Response response}.
      #
      # @example Request syntax with placeholder values
      #   resp = client.delete_policy({
      #     auto_scaling_group_name: "ResourceName",
      #     policy_name: "ResourceName", # required
      #   })
      # @param [Hash] params ({})
      # @param [Hash] options ({})
      def delete_policy(params = {}, options = {})
        req = build_request(:delete_policy, params)
        req.send_request(options)
      end

      # Deletes the specified scheduled action.
      # @option params [String] :auto_scaling_group_name
      #   The name of the Auto Scaling group.
      # @option params [required, String] :scheduled_action_name
      #   The name of the action to delete.
      # @return [Struct] Returns an empty {Seahorse::Client::Response response}.
      #
      # @example Request syntax with placeholder values
      #   resp = client.delete_scheduled_action({
      #     auto_scaling_group_name: "ResourceName",
      #     scheduled_action_name: "ResourceName", # required
      #   })
      # @param [Hash] params ({})
      # @param [Hash] options ({})
      def delete_scheduled_action(params = {}, options = {})
        req = build_request(:delete_scheduled_action, params)
        req.send_request(options)
      end

      # Deletes the specified tags.
      # @option params [required, Array<Types::Tag>] :tags
      #   One or more tags.
      # @return [Struct] Returns an empty {Seahorse::Client::Response response}.
      #
      # @example Request syntax with placeholder values
      #   resp = client.delete_tags({
      #     tags: [ # required
      #       {
      #         resource_id: "XmlString",
      #         resource_type: "XmlString",
      #         key: "TagKey", # required
      #         value: "TagValue",
      #         propagate_at_launch: false,
      #       },
      #     ],
      #   })
      # @param [Hash] params ({})
      # @param [Hash] options ({})
      def delete_tags(params = {}, options = {})
        req = build_request(:delete_tags, params)
        req.send_request(options)
      end

      # Describes the current Auto Scaling resource limits for your AWS
      # account.
      #
      # For information about requesting an increase in these limits, see [AWS
      # Service Limits][1] in the *Amazon Web Services General Reference*.
      #
      #
      #
      # [1]: http://docs.aws.amazon.com/general/latest/gr/aws_service_limits.html
      # @return [Types::DescribeAccountLimitsAnswer] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
      #
      #   * {Types::DescribeAccountLimitsAnswer#max_number_of_auto_scaling_groups #MaxNumberOfAutoScalingGroups} => Integer
      #   * {Types::DescribeAccountLimitsAnswer#max_number_of_launch_configurations #MaxNumberOfLaunchConfigurations} => Integer
      #   * {Types::DescribeAccountLimitsAnswer#number_of_auto_scaling_groups #NumberOfAutoScalingGroups} => Integer
      #   * {Types::DescribeAccountLimitsAnswer#number_of_launch_configurations #NumberOfLaunchConfigurations} => Integer
      #
      # @example Response structure
      #   resp.max_number_of_auto_scaling_groups #=> Integer
      #   resp.max_number_of_launch_configurations #=> Integer
      #   resp.number_of_auto_scaling_groups #=> Integer
      #   resp.number_of_launch_configurations #=> Integer
      # @param [Hash] params ({})
      # @param [Hash] options ({})
      def describe_account_limits(params = {}, options = {})
        req = build_request(:describe_account_limits, params)
        req.send_request(options)
      end

      # Describes the policy adjustment types for use with PutScalingPolicy.
      # @return [Types::DescribeAdjustmentTypesAnswer] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
      #
      #   * {Types::DescribeAdjustmentTypesAnswer#adjustment_types #AdjustmentTypes} => Array&lt;Types::AdjustmentType&gt;
      #
      # @example Response structure
      #   resp.adjustment_types #=> Array
      #   resp.adjustment_types[0].adjustment_type #=> String
      # @param [Hash] params ({})
      # @param [Hash] options ({})
      def describe_adjustment_types(params = {}, options = {})
        req = build_request(:describe_adjustment_types, params)
        req.send_request(options)
      end

      # Describes one or more Auto Scaling groups. If a list of names is not
      # provided, the call describes all Auto Scaling groups.
      # @option params [Array<String>] :auto_scaling_group_names
      #   The group names.
      # @option params [String] :next_token
      #   The token for the next set of items to return. (You received this
      #   token from a previous call.)
      # @option params [Integer] :max_records
      #   The maximum number of items to return with this call.
      # @return [Types::AutoScalingGroupsType] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
      #
      #   * {Types::AutoScalingGroupsType#auto_scaling_groups #AutoScalingGroups} => Array&lt;Types::AutoScalingGroup&gt;
      #   * {Types::AutoScalingGroupsType#next_token #NextToken} => String
      #
      # @example Request syntax with placeholder values
      #   resp = client.describe_auto_scaling_groups({
      #     auto_scaling_group_names: ["ResourceName"],
      #     next_token: "XmlString",
      #     max_records: 1,
      #   })
      #
      # @example Response structure
      #   resp.auto_scaling_groups #=> Array
      #   resp.auto_scaling_groups[0].auto_scaling_group_name #=> String
      #   resp.auto_scaling_groups[0].auto_scaling_group_arn #=> String
      #   resp.auto_scaling_groups[0].launch_configuration_name #=> String
      #   resp.auto_scaling_groups[0].min_size #=> Integer
      #   resp.auto_scaling_groups[0].max_size #=> Integer
      #   resp.auto_scaling_groups[0].desired_capacity #=> Integer
      #   resp.auto_scaling_groups[0].default_cooldown #=> Integer
      #   resp.auto_scaling_groups[0].availability_zones #=> Array
      #   resp.auto_scaling_groups[0].availability_zones[0] #=> String
      #   resp.auto_scaling_groups[0].load_balancer_names #=> Array
      #   resp.auto_scaling_groups[0].load_balancer_names[0] #=> String
      #   resp.auto_scaling_groups[0].health_check_type #=> String
      #   resp.auto_scaling_groups[0].health_check_grace_period #=> Integer
      #   resp.auto_scaling_groups[0].instances #=> Array
      #   resp.auto_scaling_groups[0].instances[0].instance_id #=> String
      #   resp.auto_scaling_groups[0].instances[0].availability_zone #=> String
      #   resp.auto_scaling_groups[0].instances[0].lifecycle_state #=> String, one of "Pending", "Pending:Wait", "Pending:Proceed", "Quarantined", "InService", "Terminating", "Terminating:Wait", "Terminating:Proceed", "Terminated", "Detaching", "Detached", "EnteringStandby", "Standby"
      #   resp.auto_scaling_groups[0].instances[0].health_status #=> String
      #   resp.auto_scaling_groups[0].instances[0].launch_configuration_name #=> String
      #   resp.auto_scaling_groups[0].instances[0].protected_from_scale_in #=> Boolean
      #   resp.auto_scaling_groups[0].created_time #=> Time
      #   resp.auto_scaling_groups[0].suspended_processes #=> Array
      #   resp.auto_scaling_groups[0].suspended_processes[0].process_name #=> String
      #   resp.auto_scaling_groups[0].suspended_processes[0].suspension_reason #=> String
      #   resp.auto_scaling_groups[0].placement_group #=> String
      #   resp.auto_scaling_groups[0].vpc_zone_identifier #=> String
      #   resp.auto_scaling_groups[0].enabled_metrics #=> Array
      #   resp.auto_scaling_groups[0].enabled_metrics[0].metric #=> String
      #   resp.auto_scaling_groups[0].enabled_metrics[0].granularity #=> String
      #   resp.auto_scaling_groups[0].status #=> String
      #   resp.auto_scaling_groups[0].tags #=> Array
      #   resp.auto_scaling_groups[0].tags[0].resource_id #=> String
      #   resp.auto_scaling_groups[0].tags[0].resource_type #=> String
      #   resp.auto_scaling_groups[0].tags[0].key #=> String
      #   resp.auto_scaling_groups[0].tags[0].value #=> String
      #   resp.auto_scaling_groups[0].tags[0].propagate_at_launch #=> Boolean
      #   resp.auto_scaling_groups[0].termination_policies #=> Array
      #   resp.auto_scaling_groups[0].termination_policies[0] #=> String
      #   resp.auto_scaling_groups[0].new_instances_protected_from_scale_in #=> Boolean
      #   resp.next_token #=> String
      # @param [Hash] params ({})
      # @param [Hash] options ({})
      def describe_auto_scaling_groups(params = {}, options = {})
        req = build_request(:describe_auto_scaling_groups, params)
        req.send_request(options)
      end

      # Describes one or more Auto Scaling instances. If a list is not
      # provided, the call describes all instances.
      # @option params [Array<String>] :instance_ids
      #   The instances to describe; up to 50 instance IDs. If you omit this
      #   parameter, all Auto Scaling instances are described. If you specify an
      #   ID that does not exist, it is ignored with no error.
      # @option params [Integer] :max_records
      #   The maximum number of items to return with this call.
      # @option params [String] :next_token
      #   The token for the next set of items to return. (You received this
      #   token from a previous call.)
      # @return [Types::AutoScalingInstancesType] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
      #
      #   * {Types::AutoScalingInstancesType#auto_scaling_instances #AutoScalingInstances} => Array&lt;Types::AutoScalingInstanceDetails&gt;
      #   * {Types::AutoScalingInstancesType#next_token #NextToken} => String
      #
      # @example Request syntax with placeholder values
      #   resp = client.describe_auto_scaling_instances({
      #     instance_ids: ["XmlStringMaxLen19"],
      #     max_records: 1,
      #     next_token: "XmlString",
      #   })
      #
      # @example Response structure
      #   resp.auto_scaling_instances #=> Array
      #   resp.auto_scaling_instances[0].instance_id #=> String
      #   resp.auto_scaling_instances[0].auto_scaling_group_name #=> String
      #   resp.auto_scaling_instances[0].availability_zone #=> String
      #   resp.auto_scaling_instances[0].lifecycle_state #=> String
      #   resp.auto_scaling_instances[0].health_status #=> String
      #   resp.auto_scaling_instances[0].launch_configuration_name #=> String
      #   resp.auto_scaling_instances[0].protected_from_scale_in #=> Boolean
      #   resp.next_token #=> String
      # @param [Hash] params ({})
      # @param [Hash] options ({})
      def describe_auto_scaling_instances(params = {}, options = {})
        req = build_request(:describe_auto_scaling_instances, params)
        req.send_request(options)
      end

      # Describes the notification types that are supported by Auto Scaling.
      # @return [Types::DescribeAutoScalingNotificationTypesAnswer] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
      #
      #   * {Types::DescribeAutoScalingNotificationTypesAnswer#auto_scaling_notification_types #AutoScalingNotificationTypes} => Array&lt;String&gt;
      #
      # @example Response structure
      #   resp.auto_scaling_notification_types #=> Array
      #   resp.auto_scaling_notification_types[0] #=> String
      # @param [Hash] params ({})
      # @param [Hash] options ({})
      def describe_auto_scaling_notification_types(params = {}, options = {})
        req = build_request(:describe_auto_scaling_notification_types, params)
        req.send_request(options)
      end

      # Describes one or more launch configurations. If you omit the list of
      # names, then the call describes all launch configurations.
      # @option params [Array<String>] :launch_configuration_names
      #   The launch configuration names.
      # @option params [String] :next_token
      #   The token for the next set of items to return. (You received this
      #   token from a previous call.)
      # @option params [Integer] :max_records
      #   The maximum number of items to return with this call. The default is
      #   100.
      # @return [Types::LaunchConfigurationsType] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
      #
      #   * {Types::LaunchConfigurationsType#launch_configurations #LaunchConfigurations} => Array&lt;Types::LaunchConfiguration&gt;
      #   * {Types::LaunchConfigurationsType#next_token #NextToken} => String
      #
      # @example Request syntax with placeholder values
      #   resp = client.describe_launch_configurations({
      #     launch_configuration_names: ["ResourceName"],
      #     next_token: "XmlString",
      #     max_records: 1,
      #   })
      #
      # @example Response structure
      #   resp.launch_configurations #=> Array
      #   resp.launch_configurations[0].launch_configuration_name #=> String
      #   resp.launch_configurations[0].launch_configuration_arn #=> String
      #   resp.launch_configurations[0].image_id #=> String
      #   resp.launch_configurations[0].key_name #=> String
      #   resp.launch_configurations[0].security_groups #=> Array
      #   resp.launch_configurations[0].security_groups[0] #=> String
      #   resp.launch_configurations[0].classic_link_vpc_id #=> String
      #   resp.launch_configurations[0].classic_link_vpc_security_groups #=> Array
      #   resp.launch_configurations[0].classic_link_vpc_security_groups[0] #=> String
      #   resp.launch_configurations[0].user_data #=> String
      #   resp.launch_configurations[0].instance_type #=> String
      #   resp.launch_configurations[0].kernel_id #=> String
      #   resp.launch_configurations[0].ramdisk_id #=> String
      #   resp.launch_configurations[0].block_device_mappings #=> Array
      #   resp.launch_configurations[0].block_device_mappings[0].virtual_name #=> String
      #   resp.launch_configurations[0].block_device_mappings[0].device_name #=> String
      #   resp.launch_configurations[0].block_device_mappings[0].ebs.snapshot_id #=> String
      #   resp.launch_configurations[0].block_device_mappings[0].ebs.volume_size #=> Integer
      #   resp.launch_configurations[0].block_device_mappings[0].ebs.volume_type #=> String
      #   resp.launch_configurations[0].block_device_mappings[0].ebs.delete_on_termination #=> Boolean
      #   resp.launch_configurations[0].block_device_mappings[0].ebs.iops #=> Integer
      #   resp.launch_configurations[0].block_device_mappings[0].ebs.encrypted #=> Boolean
      #   resp.launch_configurations[0].block_device_mappings[0].no_device #=> Boolean
      #   resp.launch_configurations[0].instance_monitoring.enabled #=> Boolean
      #   resp.launch_configurations[0].spot_price #=> String
      #   resp.launch_configurations[0].iam_instance_profile #=> String
      #   resp.launch_configurations[0].created_time #=> Time
      #   resp.launch_configurations[0].ebs_optimized #=> Boolean
      #   resp.launch_configurations[0].associate_public_ip_address #=> Boolean
      #   resp.launch_configurations[0].placement_tenancy #=> String
      #   resp.next_token #=> String
      # @param [Hash] params ({})
      # @param [Hash] options ({})
      def describe_launch_configurations(params = {}, options = {})
        req = build_request(:describe_launch_configurations, params)
        req.send_request(options)
      end

      # Describes the available types of lifecycle hooks.
      # @return [Types::DescribeLifecycleHookTypesAnswer] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
      #
      #   * {Types::DescribeLifecycleHookTypesAnswer#lifecycle_hook_types #LifecycleHookTypes} => Array&lt;String&gt;
      #
      # @example Response structure
      #   resp.lifecycle_hook_types #=> Array
      #   resp.lifecycle_hook_types[0] #=> String
      # @param [Hash] params ({})
      # @param [Hash] options ({})
      def describe_lifecycle_hook_types(params = {}, options = {})
        req = build_request(:describe_lifecycle_hook_types, params)
        req.send_request(options)
      end

      # Describes the lifecycle hooks for the specified Auto Scaling group.
      # @option params [required, String] :auto_scaling_group_name
      #   The name of the group.
      # @option params [Array<String>] :lifecycle_hook_names
      #   The names of one or more lifecycle hooks.
      # @return [Types::DescribeLifecycleHooksAnswer] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
      #
      #   * {Types::DescribeLifecycleHooksAnswer#lifecycle_hooks #LifecycleHooks} => Array&lt;Types::LifecycleHook&gt;
      #
      # @example Request syntax with placeholder values
      #   resp = client.describe_lifecycle_hooks({
      #     auto_scaling_group_name: "ResourceName", # required
      #     lifecycle_hook_names: ["AsciiStringMaxLen255"],
      #   })
      #
      # @example Response structure
      #   resp.lifecycle_hooks #=> Array
      #   resp.lifecycle_hooks[0].lifecycle_hook_name #=> String
      #   resp.lifecycle_hooks[0].auto_scaling_group_name #=> String
      #   resp.lifecycle_hooks[0].lifecycle_transition #=> String
      #   resp.lifecycle_hooks[0].notification_target_arn #=> String
      #   resp.lifecycle_hooks[0].role_arn #=> String
      #   resp.lifecycle_hooks[0].notification_metadata #=> String
      #   resp.lifecycle_hooks[0].heartbeat_timeout #=> Integer
      #   resp.lifecycle_hooks[0].global_timeout #=> Integer
      #   resp.lifecycle_hooks[0].default_result #=> String
      # @param [Hash] params ({})
      # @param [Hash] options ({})
      def describe_lifecycle_hooks(params = {}, options = {})
        req = build_request(:describe_lifecycle_hooks, params)
        req.send_request(options)
      end

      # Describes the load balancers for the specified Auto Scaling group.
      # @option params [required, String] :auto_scaling_group_name
      #   The name of the group.
      # @option params [String] :next_token
      #   The token for the next set of items to return. (You received this
      #   token from a previous call.)
      # @option params [Integer] :max_records
      #   The maximum number of items to return with this call.
      # @return [Types::DescribeLoadBalancersResponse] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
      #
      #   * {Types::DescribeLoadBalancersResponse#load_balancers #LoadBalancers} => Array&lt;Types::LoadBalancerState&gt;
      #   * {Types::DescribeLoadBalancersResponse#next_token #NextToken} => String
      #
      # @example Request syntax with placeholder values
      #   resp = client.describe_load_balancers({
      #     auto_scaling_group_name: "ResourceName", # required
      #     next_token: "XmlString",
      #     max_records: 1,
      #   })
      #
      # @example Response structure
      #   resp.load_balancers #=> Array
      #   resp.load_balancers[0].load_balancer_name #=> String
      #   resp.load_balancers[0].state #=> String
      #   resp.next_token #=> String
      # @param [Hash] params ({})
      # @param [Hash] options ({})
      def describe_load_balancers(params = {}, options = {})
        req = build_request(:describe_load_balancers, params)
        req.send_request(options)
      end

      # Describes the available CloudWatch metrics for Auto Scaling.
      #
      # Note that the `GroupStandbyInstances` metric is not returned by
      # default. You must explicitly request this metric when calling
      # EnableMetricsCollection.
      # @return [Types::DescribeMetricCollectionTypesAnswer] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
      #
      #   * {Types::DescribeMetricCollectionTypesAnswer#metrics #Metrics} => Array&lt;Types::MetricCollectionType&gt;
      #   * {Types::DescribeMetricCollectionTypesAnswer#granularities #Granularities} => Array&lt;Types::MetricGranularityType&gt;
      #
      # @example Response structure
      #   resp.metrics #=> Array
      #   resp.metrics[0].metric #=> String
      #   resp.granularities #=> Array
      #   resp.granularities[0].granularity #=> String
      # @param [Hash] params ({})
      # @param [Hash] options ({})
      def describe_metric_collection_types(params = {}, options = {})
        req = build_request(:describe_metric_collection_types, params)
        req.send_request(options)
      end

      # Describes the notification actions associated with the specified Auto
      # Scaling group.
      # @option params [Array<String>] :auto_scaling_group_names
      #   The name of the group.
      # @option params [String] :next_token
      #   The token for the next set of items to return. (You received this
      #   token from a previous call.)
      # @option params [Integer] :max_records
      #   The maximum number of items to return with this call.
      # @return [Types::DescribeNotificationConfigurationsAnswer] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
      #
      #   * {Types::DescribeNotificationConfigurationsAnswer#notification_configurations #NotificationConfigurations} => Array&lt;Types::NotificationConfiguration&gt;
      #   * {Types::DescribeNotificationConfigurationsAnswer#next_token #NextToken} => String
      #
      # @example Request syntax with placeholder values
      #   resp = client.describe_notification_configurations({
      #     auto_scaling_group_names: ["ResourceName"],
      #     next_token: "XmlString",
      #     max_records: 1,
      #   })
      #
      # @example Response structure
      #   resp.notification_configurations #=> Array
      #   resp.notification_configurations[0].auto_scaling_group_name #=> String
      #   resp.notification_configurations[0].topic_arn #=> String
      #   resp.notification_configurations[0].notification_type #=> String
      #   resp.next_token #=> String
      # @param [Hash] params ({})
      # @param [Hash] options ({})
      def describe_notification_configurations(params = {}, options = {})
        req = build_request(:describe_notification_configurations, params)
        req.send_request(options)
      end

      # Describes the policies for the specified Auto Scaling group.
      # @option params [String] :auto_scaling_group_name
      #   The name of the group.
      # @option params [Array<String>] :policy_names
      #   One or more policy names or policy ARNs to be described. If you omit
      #   this list, all policy names are described. If an group name is
      #   provided, the results are limited to that group. This list is limited
      #   to 50 items. If you specify an unknown policy name, it is ignored with
      #   no error.
      # @option params [Array<String>] :policy_types
      #   One or more policy types. Valid values are `SimpleScaling` and
      #   `StepScaling`.
      # @option params [String] :next_token
      #   The token for the next set of items to return. (You received this
      #   token from a previous call.)
      # @option params [Integer] :max_records
      #   The maximum number of items to be returned with each call.
      # @return [Types::PoliciesType] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
      #
      #   * {Types::PoliciesType#scaling_policies #ScalingPolicies} => Array&lt;Types::ScalingPolicy&gt;
      #   * {Types::PoliciesType#next_token #NextToken} => String
      #
      # @example Request syntax with placeholder values
      #   resp = client.describe_policies({
      #     auto_scaling_group_name: "ResourceName",
      #     policy_names: ["ResourceName"],
      #     policy_types: ["XmlStringMaxLen64"],
      #     next_token: "XmlString",
      #     max_records: 1,
      #   })
      #
      # @example Response structure
      #   resp.scaling_policies #=> Array
      #   resp.scaling_policies[0].auto_scaling_group_name #=> String
      #   resp.scaling_policies[0].policy_name #=> String
      #   resp.scaling_policies[0].policy_arn #=> String
      #   resp.scaling_policies[0].policy_type #=> String
      #   resp.scaling_policies[0].adjustment_type #=> String
      #   resp.scaling_policies[0].min_adjustment_step #=> Integer
      #   resp.scaling_policies[0].min_adjustment_magnitude #=> Integer
      #   resp.scaling_policies[0].scaling_adjustment #=> Integer
      #   resp.scaling_policies[0].cooldown #=> Integer
      #   resp.scaling_policies[0].step_adjustments #=> Array
      #   resp.scaling_policies[0].step_adjustments[0].metric_interval_lower_bound #=> Float
      #   resp.scaling_policies[0].step_adjustments[0].metric_interval_upper_bound #=> Float
      #   resp.scaling_policies[0].step_adjustments[0].scaling_adjustment #=> Integer
      #   resp.scaling_policies[0].metric_aggregation_type #=> String
      #   resp.scaling_policies[0].estimated_instance_warmup #=> Integer
      #   resp.scaling_policies[0].alarms #=> Array
      #   resp.scaling_policies[0].alarms[0].alarm_name #=> String
      #   resp.scaling_policies[0].alarms[0].alarm_arn #=> String
      #   resp.next_token #=> String
      # @param [Hash] params ({})
      # @param [Hash] options ({})
      def describe_policies(params = {}, options = {})
        req = build_request(:describe_policies, params)
        req.send_request(options)
      end

      # Describes one or more scaling activities for the specified Auto
      # Scaling group. If you omit the `ActivityIds`, the call returns all
      # activities from the past six weeks. Activities are sorted by the start
      # time. Activities still in progress appear first on the list.
      # @option params [Array<String>] :activity_ids
      #   The activity IDs of the desired scaling activities. If this list is
      #   omitted, all activities are described. If you specify an Auto Scaling
      #   group, the results are limited to that group. The list of requested
      #   activities cannot contain more than 50 items. If unknown activities
      #   are requested, they are ignored with no error.
      # @option params [String] :auto_scaling_group_name
      #   The name of the group.
      # @option params [Integer] :max_records
      #   The maximum number of items to return with this call.
      # @option params [String] :next_token
      #   The token for the next set of items to return. (You received this
      #   token from a previous call.)
      # @return [Types::ActivitiesType] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
      #
      #   * {Types::ActivitiesType#activities #Activities} => Array&lt;Types::Activity&gt;
      #   * {Types::ActivitiesType#next_token #NextToken} => String
      #
      # @example Request syntax with placeholder values
      #   resp = client.describe_scaling_activities({
      #     activity_ids: ["XmlString"],
      #     auto_scaling_group_name: "ResourceName",
      #     max_records: 1,
      #     next_token: "XmlString",
      #   })
      #
      # @example Response structure
      #   resp.activities #=> Array
      #   resp.activities[0].activity_id #=> String
      #   resp.activities[0].auto_scaling_group_name #=> String
      #   resp.activities[0].description #=> String
      #   resp.activities[0].cause #=> String
      #   resp.activities[0].start_time #=> Time
      #   resp.activities[0].end_time #=> Time
      #   resp.activities[0].status_code #=> String, one of "PendingSpotBidPlacement", "WaitingForSpotInstanceRequestId", "WaitingForSpotInstanceId", "WaitingForInstanceId", "PreInService", "InProgress", "WaitingForELBConnectionDraining", "MidLifecycleAction", "WaitingForInstanceWarmup", "Successful", "Failed", "Cancelled"
      #   resp.activities[0].status_message #=> String
      #   resp.activities[0].progress #=> Integer
      #   resp.activities[0].details #=> String
      #   resp.next_token #=> String
      # @param [Hash] params ({})
      # @param [Hash] options ({})
      def describe_scaling_activities(params = {}, options = {})
        req = build_request(:describe_scaling_activities, params)
        req.send_request(options)
      end

      # Describes the scaling process types for use with ResumeProcesses and
      # SuspendProcesses.
      # @return [Types::ProcessesType] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
      #
      #   * {Types::ProcessesType#processes #Processes} => Array&lt;Types::ProcessType&gt;
      #
      # @example Response structure
      #   resp.processes #=> Array
      #   resp.processes[0].process_name #=> String
      # @param [Hash] params ({})
      # @param [Hash] options ({})
      def describe_scaling_process_types(params = {}, options = {})
        req = build_request(:describe_scaling_process_types, params)
        req.send_request(options)
      end

      # Describes the actions scheduled for your Auto Scaling group that
      # haven\'t run. To describe the actions that have already run, use
      # DescribeScalingActivities.
      # @option params [String] :auto_scaling_group_name
      #   The name of the group.
      # @option params [Array<String>] :scheduled_action_names
      #   Describes one or more scheduled actions. If you omit this list, the
      #   call describes all scheduled actions. If you specify an unknown
      #   scheduled action it is ignored with no error.
      #
      #   You can describe up to a maximum of 50 instances with a single call.
      #   If there are more items to return, the call returns a token. To get
      #   the next set of items, repeat the call with the returned token.
      # @option params [Time,DateTime,Date,Integer,String] :start_time
      #   The earliest scheduled start time to return. If scheduled action names
      #   are provided, this parameter is ignored.
      # @option params [Time,DateTime,Date,Integer,String] :end_time
      #   The latest scheduled start time to return. If scheduled action names
      #   are provided, this parameter is ignored.
      # @option params [String] :next_token
      #   The token for the next set of items to return. (You received this
      #   token from a previous call.)
      # @option params [Integer] :max_records
      #   The maximum number of items to return with this call.
      # @return [Types::ScheduledActionsType] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
      #
      #   * {Types::ScheduledActionsType#scheduled_update_group_actions #ScheduledUpdateGroupActions} => Array&lt;Types::ScheduledUpdateGroupAction&gt;
      #   * {Types::ScheduledActionsType#next_token #NextToken} => String
      #
      # @example Request syntax with placeholder values
      #   resp = client.describe_scheduled_actions({
      #     auto_scaling_group_name: "ResourceName",
      #     scheduled_action_names: ["ResourceName"],
      #     start_time: Time.now,
      #     end_time: Time.now,
      #     next_token: "XmlString",
      #     max_records: 1,
      #   })
      #
      # @example Response structure
      #   resp.scheduled_update_group_actions #=> Array
      #   resp.scheduled_update_group_actions[0].auto_scaling_group_name #=> String
      #   resp.scheduled_update_group_actions[0].scheduled_action_name #=> String
      #   resp.scheduled_update_group_actions[0].scheduled_action_arn #=> String
      #   resp.scheduled_update_group_actions[0].time #=> Time
      #   resp.scheduled_update_group_actions[0].start_time #=> Time
      #   resp.scheduled_update_group_actions[0].end_time #=> Time
      #   resp.scheduled_update_group_actions[0].recurrence #=> String
      #   resp.scheduled_update_group_actions[0].min_size #=> Integer
      #   resp.scheduled_update_group_actions[0].max_size #=> Integer
      #   resp.scheduled_update_group_actions[0].desired_capacity #=> Integer
      #   resp.next_token #=> String
      # @param [Hash] params ({})
      # @param [Hash] options ({})
      def describe_scheduled_actions(params = {}, options = {})
        req = build_request(:describe_scheduled_actions, params)
        req.send_request(options)
      end

      # Describes the specified tags.
      #
      # You can use filters to limit the results. For example, you can query
      # for the tags for a specific Auto Scaling group. You can specify
      # multiple values for a filter. A tag must match at least one of the
      # specified values for it to be included in the results.
      #
      # You can also specify multiple filters. The result includes information
      # for a particular tag only if it matches all the filters. If there\'s
      # no match, no special message is returned.
      # @option params [Array<Types::Filter>] :filters
      #   A filter used to scope the tags to return.
      # @option params [String] :next_token
      #   The token for the next set of items to return. (You received this
      #   token from a previous call.)
      # @option params [Integer] :max_records
      #   The maximum number of items to return with this call.
      # @return [Types::TagsType] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
      #
      #   * {Types::TagsType#tags #Tags} => Array&lt;Types::TagDescription&gt;
      #   * {Types::TagsType#next_token #NextToken} => String
      #
      # @example Request syntax with placeholder values
      #   resp = client.describe_tags({
      #     filters: [
      #       {
      #         name: "XmlString",
      #         values: ["XmlString"],
      #       },
      #     ],
      #     next_token: "XmlString",
      #     max_records: 1,
      #   })
      #
      # @example Response structure
      #   resp.tags #=> Array
      #   resp.tags[0].resource_id #=> String
      #   resp.tags[0].resource_type #=> String
      #   resp.tags[0].key #=> String
      #   resp.tags[0].value #=> String
      #   resp.tags[0].propagate_at_launch #=> Boolean
      #   resp.next_token #=> String
      # @param [Hash] params ({})
      # @param [Hash] options ({})
      def describe_tags(params = {}, options = {})
        req = build_request(:describe_tags, params)
        req.send_request(options)
      end

      # Describes the termination policies supported by Auto Scaling.
      # @return [Types::DescribeTerminationPolicyTypesAnswer] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
      #
      #   * {Types::DescribeTerminationPolicyTypesAnswer#termination_policy_types #TerminationPolicyTypes} => Array&lt;String&gt;
      #
      # @example Response structure
      #   resp.termination_policy_types #=> Array
      #   resp.termination_policy_types[0] #=> String
      # @param [Hash] params ({})
      # @param [Hash] options ({})
      def describe_termination_policy_types(params = {}, options = {})
        req = build_request(:describe_termination_policy_types, params)
        req.send_request(options)
      end

      # Removes one or more instances from the specified Auto Scaling group.
      #
      # After the instances are detached, you can manage them independently
      # from the rest of the Auto Scaling group.
      #
      # If you do not specify the option to decrement the desired capacity,
      # Auto Scaling launches instances to replace the ones that are detached.
      #
      # For more information, see [Detach EC2 Instances from Your Auto Scaling
      # Group][1] in the *Auto Scaling Developer Guide*.
      #
      #
      #
      # [1]: http://docs.aws.amazon.com/AutoScaling/latest/DeveloperGuide/detach-instance-asg.html
      # @option params [Array<String>] :instance_ids
      #   One or more instance IDs.
      # @option params [required, String] :auto_scaling_group_name
      #   The name of the group.
      # @option params [required, Boolean] :should_decrement_desired_capacity
      #   If `True`, the Auto Scaling group decrements the desired capacity
      #   value by the number of instances detached.
      # @return [Types::DetachInstancesAnswer] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
      #
      #   * {Types::DetachInstancesAnswer#activities #Activities} => Array&lt;Types::Activity&gt;
      #
      # @example Request syntax with placeholder values
      #   resp = client.detach_instances({
      #     instance_ids: ["XmlStringMaxLen19"],
      #     auto_scaling_group_name: "ResourceName", # required
      #     should_decrement_desired_capacity: false, # required
      #   })
      #
      # @example Response structure
      #   resp.activities #=> Array
      #   resp.activities[0].activity_id #=> String
      #   resp.activities[0].auto_scaling_group_name #=> String
      #   resp.activities[0].description #=> String
      #   resp.activities[0].cause #=> String
      #   resp.activities[0].start_time #=> Time
      #   resp.activities[0].end_time #=> Time
      #   resp.activities[0].status_code #=> String, one of "PendingSpotBidPlacement", "WaitingForSpotInstanceRequestId", "WaitingForSpotInstanceId", "WaitingForInstanceId", "PreInService", "InProgress", "WaitingForELBConnectionDraining", "MidLifecycleAction", "WaitingForInstanceWarmup", "Successful", "Failed", "Cancelled"
      #   resp.activities[0].status_message #=> String
      #   resp.activities[0].progress #=> Integer
      #   resp.activities[0].details #=> String
      # @param [Hash] params ({})
      # @param [Hash] options ({})
      def detach_instances(params = {}, options = {})
        req = build_request(:detach_instances, params)
        req.send_request(options)
      end

      # Removes one or more load balancers from the specified Auto Scaling
      # group.
      #
      # When you detach a load balancer, it enters the `Removing` state while
      # deregistering the instances in the group. When all instances are
      # deregistered, then you can no longer describe the load balancer using
      # DescribeLoadBalancers. Note that the instances remain running.
      # @option params [String] :auto_scaling_group_name
      #   The name of the group.
      # @option params [Array<String>] :load_balancer_names
      #   One or more load balancer names.
      # @return [Struct] Returns an empty {Seahorse::Client::Response response}.
      #
      # @example Request syntax with placeholder values
      #   resp = client.detach_load_balancers({
      #     auto_scaling_group_name: "ResourceName",
      #     load_balancer_names: ["XmlStringMaxLen255"],
      #   })
      # @param [Hash] params ({})
      # @param [Hash] options ({})
      def detach_load_balancers(params = {}, options = {})
        req = build_request(:detach_load_balancers, params)
        req.send_request(options)
      end

      # Disables monitoring of the specified metrics for the specified Auto
      # Scaling group.
      # @option params [required, String] :auto_scaling_group_name
      #   The name or Amazon Resource Name (ARN) of the group.
      # @option params [Array<String>] :metrics
      #   One or more of the following metrics. If you omit this parameter, all
      #   metrics are disabled.
      #
      #   * `GroupMinSize`
      #
      #   * `GroupMaxSize`
      #
      #   * `GroupDesiredCapacity`
      #
      #   * `GroupInServiceInstances`
      #
      #   * `GroupPendingInstances`
      #
      #   * `GroupStandbyInstances`
      #
      #   * `GroupTerminatingInstances`
      #
      #   * `GroupTotalInstances`
      # @return [Struct] Returns an empty {Seahorse::Client::Response response}.
      #
      # @example Request syntax with placeholder values
      #   resp = client.disable_metrics_collection({
      #     auto_scaling_group_name: "ResourceName", # required
      #     metrics: ["XmlStringMaxLen255"],
      #   })
      # @param [Hash] params ({})
      # @param [Hash] options ({})
      def disable_metrics_collection(params = {}, options = {})
        req = build_request(:disable_metrics_collection, params)
        req.send_request(options)
      end

      # Enables monitoring of the specified metrics for the specified Auto
      # Scaling group.
      #
      # You can only enable metrics collection if `InstanceMonitoring` in the
      # launch configuration for the group is set to `True`.
      # @option params [required, String] :auto_scaling_group_name
      #   The name or ARN of the Auto Scaling group.
      # @option params [Array<String>] :metrics
      #   One or more of the following metrics. If you omit this parameter, all
      #   metrics are enabled.
      #
      #   * `GroupMinSize`
      #
      #   * `GroupMaxSize`
      #
      #   * `GroupDesiredCapacity`
      #
      #   * `GroupInServiceInstances`
      #
      #   * `GroupPendingInstances`
      #
      #   * `GroupStandbyInstances`
      #
      #   * `GroupTerminatingInstances`
      #
      #   * `GroupTotalInstances`
      #
      #   Note that the `GroupStandbyInstances` metric is not enabled by
      #   default. You must explicitly request this metric.
      # @option params [required, String] :granularity
      #   The granularity to associate with the metrics to collect. The only
      #   valid value is `1Minute`.
      # @return [Struct] Returns an empty {Seahorse::Client::Response response}.
      #
      # @example Request syntax with placeholder values
      #   resp = client.enable_metrics_collection({
      #     auto_scaling_group_name: "ResourceName", # required
      #     metrics: ["XmlStringMaxLen255"],
      #     granularity: "XmlStringMaxLen255", # required
      #   })
      # @param [Hash] params ({})
      # @param [Hash] options ({})
      def enable_metrics_collection(params = {}, options = {})
        req = build_request(:enable_metrics_collection, params)
        req.send_request(options)
      end

      # Moves the specified instances into `Standby` mode.
      #
      # For more information, see [Auto Scaling Lifecycle][1] in the *Auto
      # Scaling Developer Guide*.
      #
      #
      #
      # [1]: http://docs.aws.amazon.com/AutoScaling/latest/DeveloperGuide/AutoScalingGroupLifecycle.html
      # @option params [Array<String>] :instance_ids
      #   One or more instances to move into `Standby` mode. You must specify at
      #   least one instance ID.
      # @option params [required, String] :auto_scaling_group_name
      #   The name of the Auto Scaling group.
      # @option params [required, Boolean] :should_decrement_desired_capacity
      #   Specifies whether the instances moved to `Standby` mode count as part
      #   of the Auto Scaling group\'s desired capacity. If set, the desired
      #   capacity for the Auto Scaling group decrements by the number of
      #   instances moved to `Standby` mode.
      # @return [Types::EnterStandbyAnswer] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
      #
      #   * {Types::EnterStandbyAnswer#activities #Activities} => Array&lt;Types::Activity&gt;
      #
      # @example Request syntax with placeholder values
      #   resp = client.enter_standby({
      #     instance_ids: ["XmlStringMaxLen19"],
      #     auto_scaling_group_name: "ResourceName", # required
      #     should_decrement_desired_capacity: false, # required
      #   })
      #
      # @example Response structure
      #   resp.activities #=> Array
      #   resp.activities[0].activity_id #=> String
      #   resp.activities[0].auto_scaling_group_name #=> String
      #   resp.activities[0].description #=> String
      #   resp.activities[0].cause #=> String
      #   resp.activities[0].start_time #=> Time
      #   resp.activities[0].end_time #=> Time
      #   resp.activities[0].status_code #=> String, one of "PendingSpotBidPlacement", "WaitingForSpotInstanceRequestId", "WaitingForSpotInstanceId", "WaitingForInstanceId", "PreInService", "InProgress", "WaitingForELBConnectionDraining", "MidLifecycleAction", "WaitingForInstanceWarmup", "Successful", "Failed", "Cancelled"
      #   resp.activities[0].status_message #=> String
      #   resp.activities[0].progress #=> Integer
      #   resp.activities[0].details #=> String
      # @param [Hash] params ({})
      # @param [Hash] options ({})
      def enter_standby(params = {}, options = {})
        req = build_request(:enter_standby, params)
        req.send_request(options)
      end

      # Executes the specified policy.
      # @option params [String] :auto_scaling_group_name
      #   The name or Amazon Resource Name (ARN) of the Auto Scaling group.
      # @option params [required, String] :policy_name
      #   The name or ARN of the policy.
      # @option params [Boolean] :honor_cooldown
      #   If this parameter is true, Auto Scaling waits for the cooldown period
      #   to complete before executing the policy. Otherwise, Auto Scaling
      #   executes the policy without waiting for the cooldown period to
      #   complete.
      #
      #   This parameter is not supported if the policy type is `StepScaling`.
      #
      #   For more information, see [Auto Scaling Cooldowns][1] in the *Auto
      #   Scaling Developer Guide*.
      #
      #
      #
      #   [1]: http://docs.aws.amazon.com/AutoScaling/latest/DeveloperGuide/Cooldown.html
      # @option params [Float] :metric_value
      #   The metric value to compare to `BreachThreshold`. This enables you to
      #   execute a policy of type `StepScaling` and determine which step
      #   adjustment to use. For example, if the breach threshold is 50 and you
      #   want to use a step adjustment with a lower bound of 0 and an upper
      #   bound of 10, you can set the metric value to 59.
      #
      #   If you specify a metric value that doesn\'t correspond to a step
      #   adjustment for the policy, the call returns an error.
      #
      #   This parameter is required if the policy type is `StepScaling` and not
      #   supported otherwise.
      # @option params [Float] :breach_threshold
      #   The breach threshold for the alarm.
      #
      #   This parameter is required if the policy type is `StepScaling` and not
      #   supported otherwise.
      # @return [Struct] Returns an empty {Seahorse::Client::Response response}.
      #
      # @example Request syntax with placeholder values
      #   resp = client.execute_policy({
      #     auto_scaling_group_name: "ResourceName",
      #     policy_name: "ResourceName", # required
      #     honor_cooldown: false,
      #     metric_value: 1.0,
      #     breach_threshold: 1.0,
      #   })
      # @param [Hash] params ({})
      # @param [Hash] options ({})
      def execute_policy(params = {}, options = {})
        req = build_request(:execute_policy, params)
        req.send_request(options)
      end

      # Moves the specified instances out of `Standby` mode.
      #
      # For more information, see [Auto Scaling Lifecycle][1] in the *Auto
      # Scaling Developer Guide*.
      #
      #
      #
      # [1]: http://docs.aws.amazon.com/AutoScaling/latest/DeveloperGuide/AutoScalingGroupLifecycle.html
      # @option params [Array<String>] :instance_ids
      #   One or more instance IDs. You must specify at least one instance ID.
      # @option params [required, String] :auto_scaling_group_name
      #   The name of the Auto Scaling group.
      # @return [Types::ExitStandbyAnswer] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
      #
      #   * {Types::ExitStandbyAnswer#activities #Activities} => Array&lt;Types::Activity&gt;
      #
      # @example Request syntax with placeholder values
      #   resp = client.exit_standby({
      #     instance_ids: ["XmlStringMaxLen19"],
      #     auto_scaling_group_name: "ResourceName", # required
      #   })
      #
      # @example Response structure
      #   resp.activities #=> Array
      #   resp.activities[0].activity_id #=> String
      #   resp.activities[0].auto_scaling_group_name #=> String
      #   resp.activities[0].description #=> String
      #   resp.activities[0].cause #=> String
      #   resp.activities[0].start_time #=> Time
      #   resp.activities[0].end_time #=> Time
      #   resp.activities[0].status_code #=> String, one of "PendingSpotBidPlacement", "WaitingForSpotInstanceRequestId", "WaitingForSpotInstanceId", "WaitingForInstanceId", "PreInService", "InProgress", "WaitingForELBConnectionDraining", "MidLifecycleAction", "WaitingForInstanceWarmup", "Successful", "Failed", "Cancelled"
      #   resp.activities[0].status_message #=> String
      #   resp.activities[0].progress #=> Integer
      #   resp.activities[0].details #=> String
      # @param [Hash] params ({})
      # @param [Hash] options ({})
      def exit_standby(params = {}, options = {})
        req = build_request(:exit_standby, params)
        req.send_request(options)
      end

      # Creates or updates a lifecycle hook for the specified Auto Scaling
      # Group.
      #
      # A lifecycle hook tells Auto Scaling that you want to perform an action
      # on an instance that is not actively in service; for example, either
      # when the instance launches or before the instance terminates.
      #
      # This step is a part of the procedure for adding a lifecycle hook to an
      # Auto Scaling group:
      #
      # 1.  (Optional) Create a Lambda function and a rule that allows
      #     CloudWatch Events to invoke your Lambda function when Auto Scaling
      #     launches or terminates instances.
      # 2.  (Optional) Create a notification target and an IAM role. The
      #     target can be either an Amazon SQS queue or an Amazon SNS topic.
      #     The role allows Auto Scaling to publish lifecycle notifications to
      #     the target.
      # 3.  **Create the lifecycle hook. Specify whether the hook is used when
      #     the instances launch or terminate.**
      # 4.  If you need more time, record the lifecycle action heartbeat to
      #     keep the instance in a pending state.
      # 5.  If you finish before the timeout period ends, complete the
      #     lifecycle action.
      #
      # For more information, see [Auto Scaling Lifecycle][1] in the *Auto
      # Scaling Developer Guide*.
      #
      # If you exceed your maximum limit of lifecycle hooks, which by default
      # is 50 per region, the call fails. For information about updating this
      # limit, see [AWS Service Limits][2] in the *Amazon Web Services General
      # Reference*.
      #
      #
      #
      # [1]: http://docs.aws.amazon.com/AutoScaling/latest/DeveloperGuide/AutoScalingGroupLifecycle.html
      # [2]: http://docs.aws.amazon.com/general/latest/gr/aws_service_limits.html
      # @option params [required, String] :lifecycle_hook_name
      #   The name of the lifecycle hook.
      # @option params [required, String] :auto_scaling_group_name
      #   The name of the Auto Scaling group to which you want to assign the
      #   lifecycle hook.
      # @option params [String] :lifecycle_transition
      #   The instance state to which you want to attach the lifecycle hook. For
      #   a list of lifecycle hook types, see DescribeLifecycleHookTypes.
      #
      #   This parameter is required for new lifecycle hooks, but optional when
      #   updating existing hooks.
      # @option params [String] :role_arn
      #   The ARN of the IAM role that allows the Auto Scaling group to publish
      #   to the specified notification target.
      #
      #   This parameter is required for new lifecycle hooks, but optional when
      #   updating existing hooks.
      # @option params [String] :notification_target_arn
      #   The ARN of the notification target that Auto Scaling will use to
      #   notify you when an instance is in the transition state for the
      #   lifecycle hook. This target can be either an SQS queue or an SNS
      #   topic. If you specify an empty string, this overrides the current ARN.
      #
      #   The notification messages sent to the target include the following
      #   information:
      #
      #   * **AutoScalingGroupName**. The name of the Auto Scaling group.
      #   * **AccountId**. The AWS account ID.
      #   * **LifecycleTransition**. The lifecycle hook type.
      #   * **LifecycleActionToken**. The lifecycle action token.
      #   * **EC2InstanceId**. The EC2 instance ID.
      #   * **LifecycleHookName**. The name of the lifecycle hook.
      #   * **NotificationMetadata**. User-defined information.
      #
      #   This operation uses the JSON format when sending notifications to an
      #   Amazon SQS queue, and an email key/value pair format when sending
      #   notifications to an Amazon SNS topic.
      #
      #   When you specify a notification target, Auto Scaling sends it a test
      #   message. Test messages contains the following additional key/value
      #   pair: `"Event": "autoscaling:TEST_NOTIFICATION"`.
      # @option params [String] :notification_metadata
      #   Contains additional information that you want to include any time Auto
      #   Scaling sends a message to the notification target.
      # @option params [Integer] :heartbeat_timeout
      #   The amount of time, in seconds, that can elapse before the lifecycle
      #   hook times out. When the lifecycle hook times out, Auto Scaling
      #   performs the default action. You can prevent the lifecycle hook from
      #   timing out by calling RecordLifecycleActionHeartbeat. The default is
      #   3600 seconds (1 hour).
      # @option params [String] :default_result
      #   Defines the action the Auto Scaling group should take when the
      #   lifecycle hook timeout elapses or if an unexpected failure occurs.
      #   This parameter can be either `CONTINUE` or `ABANDON`. The default
      #   value is `ABANDON`.
      # @return [Struct] Returns an empty {Seahorse::Client::Response response}.
      #
      # @example Request syntax with placeholder values
      #   resp = client.put_lifecycle_hook({
      #     lifecycle_hook_name: "AsciiStringMaxLen255", # required
      #     auto_scaling_group_name: "ResourceName", # required
      #     lifecycle_transition: "LifecycleTransition",
      #     role_arn: "ResourceName",
      #     notification_target_arn: "NotificationTargetResourceName",
      #     notification_metadata: "XmlStringMaxLen1023",
      #     heartbeat_timeout: 1,
      #     default_result: "LifecycleActionResult",
      #   })
      # @param [Hash] params ({})
      # @param [Hash] options ({})
      def put_lifecycle_hook(params = {}, options = {})
        req = build_request(:put_lifecycle_hook, params)
        req.send_request(options)
      end

      # Configures an Auto Scaling group to send notifications when specified
      # events take place. Subscribers to this topic can have messages for
      # events delivered to an endpoint such as a web server or email address.
      #
      # For more information see [Getting Notifications When Your Auto Scaling
      # Group Changes][1] in the *Auto Scaling Developer Guide*.
      #
      # This configuration overwrites an existing configuration.
      #
      #
      #
      # [1]: http://docs.aws.amazon.com/AutoScaling/latest/DeveloperGuide/ASGettingNotifications.html
      # @option params [required, String] :auto_scaling_group_name
      #   The name of the Auto Scaling group.
      # @option params [required, String] :topic_arn
      #   The Amazon Resource Name (ARN) of the Amazon Simple Notification
      #   Service (SNS) topic.
      # @option params [required, Array<String>] :notification_types
      #   The type of event that will cause the notification to be sent. For
      #   details about notification types supported by Auto Scaling, see
      #   DescribeAutoScalingNotificationTypes.
      # @return [Struct] Returns an empty {Seahorse::Client::Response response}.
      #
      # @example Request syntax with placeholder values
      #   resp = client.put_notification_configuration({
      #     auto_scaling_group_name: "ResourceName", # required
      #     topic_arn: "ResourceName", # required
      #     notification_types: ["XmlStringMaxLen255"], # required
      #   })
      # @param [Hash] params ({})
      # @param [Hash] options ({})
      def put_notification_configuration(params = {}, options = {})
        req = build_request(:put_notification_configuration, params)
        req.send_request(options)
      end

      # Creates or updates a policy for an Auto Scaling group. To update an
      # existing policy, use the existing policy name and set the parameters
      # you want to change. Any existing parameter not changed in an update to
      # an existing policy is not changed in this update request.
      #
      # If you exceed your maximum limit of step adjustments, which by default
      # is 20 per region, the call fails. For information about updating this
      # limit, see [AWS Service Limits][1] in the *Amazon Web Services General
      # Reference*.
      #
      #
      #
      # [1]: http://docs.aws.amazon.com/general/latest/gr/aws_service_limits.html
      # @option params [required, String] :auto_scaling_group_name
      #   The name or ARN of the group.
      # @option params [required, String] :policy_name
      #   The name of the policy.
      # @option params [String] :policy_type
      #   The policy type. Valid values are `SimpleScaling` and `StepScaling`.
      #   If the policy type is null, the value is treated as `SimpleScaling`.
      # @option params [required, String] :adjustment_type
      #   The adjustment type. Valid values are `ChangeInCapacity`,
      #   `ExactCapacity`, and `PercentChangeInCapacity`.
      #
      #   For more information, see [Dynamic Scaling][1] in the *Auto Scaling
      #   Developer Guide*.
      #
      #
      #
      #   [1]: http://docs.aws.amazon.com/AutoScaling/latest/DeveloperGuide/as-scale-based-on-demand.html
      # @option params [Integer] :min_adjustment_step
      #   Available for backward compatibility. Use `MinAdjustmentMagnitude`
      #   instead.
      # @option params [Integer] :min_adjustment_magnitude
      #   The minimum number of instances to scale. If the value of
      #   `AdjustmentType` is `PercentChangeInCapacity`, the scaling policy
      #   changes the `DesiredCapacity` of the Auto Scaling group by at least
      #   this many instances. Otherwise, the error is `ValidationError`.
      # @option params [Integer] :scaling_adjustment
      #   The amount by which to scale, based on the specified adjustment type.
      #   A positive value adds to the current capacity while a negative number
      #   removes from the current capacity.
      #
      #   This parameter is required if the policy type is `SimpleScaling` and
      #   not supported otherwise.
      # @option params [Integer] :cooldown
      #   The amount of time, in seconds, after a scaling activity completes and
      #   before the next scaling activity can start. If this parameter is not
      #   specified, the default cooldown period for the group applies.
      #
      #   This parameter is not supported unless the policy type is
      #   `SimpleScaling`.
      #
      #   For more information, see [Auto Scaling Cooldowns][1] in the *Auto
      #   Scaling Developer Guide*.
      #
      #
      #
      #   [1]: http://docs.aws.amazon.com/AutoScaling/latest/DeveloperGuide/Cooldown.html
      # @option params [String] :metric_aggregation_type
      #   The aggregation type for the CloudWatch metrics. Valid values are
      #   `Minimum`, `Maximum`, and `Average`. If the aggregation type is null,
      #   the value is treated as `Average`.
      #
      #   This parameter is not supported if the policy type is `SimpleScaling`.
      # @option params [Array<Types::StepAdjustment>] :step_adjustments
      #   A set of adjustments that enable you to scale based on the size of the
      #   alarm breach.
      #
      #   This parameter is required if the policy type is `StepScaling` and not
      #   supported otherwise.
      # @option params [Integer] :estimated_instance_warmup
      #   The estimated time, in seconds, until a newly launched instance can
      #   contribute to the CloudWatch metrics. The default is to use the value
      #   specified for the default cooldown period for the group.
      #
      #   This parameter is not supported if the policy type is `SimpleScaling`.
      # @return [Types::PolicyARNType] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
      #
      #   * {Types::PolicyARNType#policy_arn #PolicyARN} => String
      #
      # @example Request syntax with placeholder values
      #   resp = client.put_scaling_policy({
      #     auto_scaling_group_name: "ResourceName", # required
      #     policy_name: "XmlStringMaxLen255", # required
      #     policy_type: "XmlStringMaxLen64",
      #     adjustment_type: "XmlStringMaxLen255", # required
      #     min_adjustment_step: 1,
      #     min_adjustment_magnitude: 1,
      #     scaling_adjustment: 1,
      #     cooldown: 1,
      #     metric_aggregation_type: "XmlStringMaxLen32",
      #     step_adjustments: [
      #       {
      #         metric_interval_lower_bound: 1.0,
      #         metric_interval_upper_bound: 1.0,
      #         scaling_adjustment: 1, # required
      #       },
      #     ],
      #     estimated_instance_warmup: 1,
      #   })
      #
      # @example Response structure
      #   resp.policy_arn #=> String
      # @param [Hash] params ({})
      # @param [Hash] options ({})
      def put_scaling_policy(params = {}, options = {})
        req = build_request(:put_scaling_policy, params)
        req.send_request(options)
      end

      # Creates or updates a scheduled scaling action for an Auto Scaling
      # group. When updating a scheduled scaling action, if you leave a
      # parameter unspecified, the corresponding value remains unchanged in
      # the affected Auto Scaling group.
      #
      # For more information, see [Scheduled Scaling][1] in the *Auto Scaling
      # Developer Guide*.
      #
      #
      #
      # [1]: http://docs.aws.amazon.com/AutoScaling/latest/DeveloperGuide/schedule_time.html
      # @option params [required, String] :auto_scaling_group_name
      #   The name or Amazon Resource Name (ARN) of the Auto Scaling group.
      # @option params [required, String] :scheduled_action_name
      #   The name of this scaling action.
      # @option params [Time,DateTime,Date,Integer,String] :time
      #   This parameter is deprecated.
      # @option params [Time,DateTime,Date,Integer,String] :start_time
      #   The time for this action to start, in \"YYYY-MM-DDThh:mm:ssZ\" format
      #   in UTC/GMT only (for example, `2014-06-01T00:00:00Z`).
      #
      #   If you try to schedule your action in the past, Auto Scaling returns
      #   an error message.
      #
      #   When `StartTime` and `EndTime` are specified with `Recurrence`, they
      #   form the boundaries of when the recurring action starts and stops.
      # @option params [Time,DateTime,Date,Integer,String] :end_time
      #   The time for this action to end.
      # @option params [String] :recurrence
      #   The time when recurring future actions will start. Start time is
      #   specified by the user following the Unix cron syntax format. For more
      #   information, see [Cron][1] in Wikipedia.
      #
      #   When `StartTime` and `EndTime` are specified with `Recurrence`, they
      #   form the boundaries of when the recurring action will start and stop.
      #
      #
      #
      #   [1]: http://en.wikipedia.org/wiki/Cron
      # @option params [Integer] :min_size
      #   The minimum size for the Auto Scaling group.
      # @option params [Integer] :max_size
      #   The maximum size for the Auto Scaling group.
      # @option params [Integer] :desired_capacity
      #   The number of EC2 instances that should be running in the group.
      # @return [Struct] Returns an empty {Seahorse::Client::Response response}.
      #
      # @example Request syntax with placeholder values
      #   resp = client.put_scheduled_update_group_action({
      #     auto_scaling_group_name: "ResourceName", # required
      #     scheduled_action_name: "XmlStringMaxLen255", # required
      #     time: Time.now,
      #     start_time: Time.now,
      #     end_time: Time.now,
      #     recurrence: "XmlStringMaxLen255",
      #     min_size: 1,
      #     max_size: 1,
      #     desired_capacity: 1,
      #   })
      # @param [Hash] params ({})
      # @param [Hash] options ({})
      def put_scheduled_update_group_action(params = {}, options = {})
        req = build_request(:put_scheduled_update_group_action, params)
        req.send_request(options)
      end

      # Records a heartbeat for the lifecycle action associated with the
      # specified token or instance. This extends the timeout by the length of
      # time defined using PutLifecycleHook.
      #
      # This step is a part of the procedure for adding a lifecycle hook to an
      # Auto Scaling group:
      #
      # 1.  (Optional) Create a Lambda function and a rule that allows
      #     CloudWatch Events to invoke your Lambda function when Auto Scaling
      #     launches or terminates instances.
      # 2.  (Optional) Create a notification target and an IAM role. The
      #     target can be either an Amazon SQS queue or an Amazon SNS topic.
      #     The role allows Auto Scaling to publish lifecycle notifications to
      #     the target.
      # 3.  Create the lifecycle hook. Specify whether the hook is used when
      #     the instances launch or terminate.
      # 4.  **If you need more time, record the lifecycle action heartbeat to
      #     keep the instance in a pending state.**
      # 5.  If you finish before the timeout period ends, complete the
      #     lifecycle action.
      #
      # For more information, see [Auto Scaling Lifecycle][1] in the *Auto
      # Scaling Developer Guide*.
      #
      #
      #
      # [1]: http://docs.aws.amazon.com/AutoScaling/latest/DeveloperGuide/AutoScalingGroupLifecycle.html
      # @option params [required, String] :lifecycle_hook_name
      #   The name of the lifecycle hook.
      # @option params [required, String] :auto_scaling_group_name
      #   The name of the Auto Scaling group for the hook.
      # @option params [String] :lifecycle_action_token
      #   A token that uniquely identifies a specific lifecycle action
      #   associated with an instance. Auto Scaling sends this token to the
      #   notification target you specified when you created the lifecycle hook.
      # @option params [String] :instance_id
      #   The ID of the instance.
      # @return [Struct] Returns an empty {Seahorse::Client::Response response}.
      #
      # @example Request syntax with placeholder values
      #   resp = client.record_lifecycle_action_heartbeat({
      #     lifecycle_hook_name: "AsciiStringMaxLen255", # required
      #     auto_scaling_group_name: "ResourceName", # required
      #     lifecycle_action_token: "LifecycleActionToken",
      #     instance_id: "XmlStringMaxLen19",
      #   })
      # @param [Hash] params ({})
      # @param [Hash] options ({})
      def record_lifecycle_action_heartbeat(params = {}, options = {})
        req = build_request(:record_lifecycle_action_heartbeat, params)
        req.send_request(options)
      end

      # Resumes the specified suspended Auto Scaling processes, or all
      # suspended process, for the specified Auto Scaling group.
      #
      # For more information, see [Suspending and Resuming Auto Scaling
      # Processes][1] in the *Auto Scaling Developer Guide*.
      #
      #
      #
      # [1]: http://docs.aws.amazon.com/AutoScaling/latest/DeveloperGuide/US_SuspendResume.html
      # @option params [required, String] :auto_scaling_group_name
      #   The name or Amazon Resource Name (ARN) of the Auto Scaling group.
      # @option params [Array<String>] :scaling_processes
      #   One or more of the following processes:
      #
      #   * `Launch`
      #
      #   * `Terminate`
      #
      #   * `HealthCheck`
      #
      #   * `ReplaceUnhealthy`
      #
      #   * `AZRebalance`
      #
      #   * `AlarmNotification`
      #
      #   * `ScheduledActions`
      #
      #   * `AddToLoadBalancer`
      # @return [Struct] Returns an empty {Seahorse::Client::Response response}.
      #
      # @example Request syntax with placeholder values
      #   resp = client.resume_processes({
      #     auto_scaling_group_name: "ResourceName", # required
      #     scaling_processes: ["XmlStringMaxLen255"],
      #   })
      # @param [Hash] params ({})
      # @param [Hash] options ({})
      def resume_processes(params = {}, options = {})
        req = build_request(:resume_processes, params)
        req.send_request(options)
      end

      # Sets the size of the specified Auto Scaling group.
      #
      # For more information about desired capacity, see [What Is Auto
      # Scaling?][1] in the *Auto Scaling Developer Guide*.
      #
      #
      #
      # [1]: http://docs.aws.amazon.com/AutoScaling/latest/DeveloperGuide/WhatIsAutoScaling.html
      # @option params [required, String] :auto_scaling_group_name
      #   The name of the Auto Scaling group.
      # @option params [required, Integer] :desired_capacity
      #   The number of EC2 instances that should be running in the Auto Scaling
      #   group.
      # @option params [Boolean] :honor_cooldown
      #   By default, `SetDesiredCapacity` overrides any cooldown period
      #   associated with the Auto Scaling group. Specify `True` to make Auto
      #   Scaling to wait for the cool-down period associated with the Auto
      #   Scaling group to complete before initiating a scaling activity to set
      #   your Auto Scaling group to its new capacity.
      # @return [Struct] Returns an empty {Seahorse::Client::Response response}.
      #
      # @example Request syntax with placeholder values
      #   resp = client.set_desired_capacity({
      #     auto_scaling_group_name: "ResourceName", # required
      #     desired_capacity: 1, # required
      #     honor_cooldown: false,
      #   })
      # @param [Hash] params ({})
      # @param [Hash] options ({})
      def set_desired_capacity(params = {}, options = {})
        req = build_request(:set_desired_capacity, params)
        req.send_request(options)
      end

      # Sets the health status of the specified instance.
      #
      # For more information, see [Health Checks][1] in the *Auto Scaling
      # Developer Guide*.
      #
      #
      #
      # [1]: http://docs.aws.amazon.com/AutoScaling/latest/DeveloperGuide/healthcheck.html
      # @option params [required, String] :instance_id
      #   The ID of the instance.
      # @option params [required, String] :health_status
      #   The health status of the instance. Set to `Healthy` if you want the
      #   instance to remain in service. Set to `Unhealthy` if you want the
      #   instance to be out of service. Auto Scaling will terminate and replace
      #   the unhealthy instance.
      # @option params [Boolean] :should_respect_grace_period
      #   If the Auto Scaling group of the specified instance has a
      #   `HealthCheckGracePeriod` specified for the group, by default, this
      #   call will respect the grace period. Set this to `False`, if you do not
      #   want the call to respect the grace period associated with the group.
      #
      #   For more information, see the description of the health check grace
      #   period for CreateAutoScalingGroup.
      # @return [Struct] Returns an empty {Seahorse::Client::Response response}.
      #
      # @example Request syntax with placeholder values
      #   resp = client.set_instance_health({
      #     instance_id: "XmlStringMaxLen19", # required
      #     health_status: "XmlStringMaxLen32", # required
      #     should_respect_grace_period: false,
      #   })
      # @param [Hash] params ({})
      # @param [Hash] options ({})
      def set_instance_health(params = {}, options = {})
        req = build_request(:set_instance_health, params)
        req.send_request(options)
      end

      # Updates the instance protection settings of the specified instances.
      #
      # For more information, see [Instance Protection][1] in the *Auto
      # Scaling Developer Guide*.
      #
      #
      #
      # [1]: http://docs.aws.amazon.com/AutoScaling/latest/DeveloperGuide/AutoScalingBehavior.InstanceTermination.html#instance-protection
      # @option params [required, Array<String>] :instance_ids
      #   One or more instance IDs.
      # @option params [required, String] :auto_scaling_group_name
      #   The name of the group.
      # @option params [required, Boolean] :protected_from_scale_in
      #   Indicates whether the instance is protected from termination by Auto
      #   Scaling when scaling in.
      # @return [Struct] Returns an empty {Seahorse::Client::Response response}.
      #
      # @example Request syntax with placeholder values
      #   resp = client.set_instance_protection({
      #     instance_ids: ["XmlStringMaxLen19"], # required
      #     auto_scaling_group_name: "ResourceName", # required
      #     protected_from_scale_in: false, # required
      #   })
      # @param [Hash] params ({})
      # @param [Hash] options ({})
      def set_instance_protection(params = {}, options = {})
        req = build_request(:set_instance_protection, params)
        req.send_request(options)
      end

      # Suspends the specified Auto Scaling processes, or all processes, for
      # the specified Auto Scaling group.
      #
      # Note that if you suspend either the `Launch` or `Terminate` process
      # types, it can prevent other process types from functioning properly.
      #
      # To resume processes that have been suspended, use ResumeProcesses.
      #
      # For more information, see [Suspending and Resuming Auto Scaling
      # Processes][1] in the *Auto Scaling Developer Guide*.
      #
      #
      #
      # [1]: http://docs.aws.amazon.com/AutoScaling/latest/DeveloperGuide/US_SuspendResume.html
      # @option params [required, String] :auto_scaling_group_name
      #   The name or Amazon Resource Name (ARN) of the Auto Scaling group.
      # @option params [Array<String>] :scaling_processes
      #   One or more of the following processes:
      #
      #   * `Launch`
      #
      #   * `Terminate`
      #
      #   * `HealthCheck`
      #
      #   * `ReplaceUnhealthy`
      #
      #   * `AZRebalance`
      #
      #   * `AlarmNotification`
      #
      #   * `ScheduledActions`
      #
      #   * `AddToLoadBalancer`
      # @return [Struct] Returns an empty {Seahorse::Client::Response response}.
      #
      # @example Request syntax with placeholder values
      #   resp = client.suspend_processes({
      #     auto_scaling_group_name: "ResourceName", # required
      #     scaling_processes: ["XmlStringMaxLen255"],
      #   })
      # @param [Hash] params ({})
      # @param [Hash] options ({})
      def suspend_processes(params = {}, options = {})
        req = build_request(:suspend_processes, params)
        req.send_request(options)
      end

      # Terminates the specified instance and optionally adjusts the desired
      # group size.
      #
      # This call simply makes a termination request. The instance is not
      # terminated immediately.
      # @option params [required, String] :instance_id
      #   The ID of the instance.
      # @option params [required, Boolean] :should_decrement_desired_capacity
      #   If `true`, terminating the instance also decrements the size of the
      #   Auto Scaling group.
      # @return [Types::ActivityType] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
      #
      #   * {Types::ActivityType#activity #Activity} => Types::Activity
      #
      # @example Request syntax with placeholder values
      #   resp = client.terminate_instance_in_auto_scaling_group({
      #     instance_id: "XmlStringMaxLen19", # required
      #     should_decrement_desired_capacity: false, # required
      #   })
      #
      # @example Response structure
      #   resp.activity.activity_id #=> String
      #   resp.activity.auto_scaling_group_name #=> String
      #   resp.activity.description #=> String
      #   resp.activity.cause #=> String
      #   resp.activity.start_time #=> Time
      #   resp.activity.end_time #=> Time
      #   resp.activity.status_code #=> String, one of "PendingSpotBidPlacement", "WaitingForSpotInstanceRequestId", "WaitingForSpotInstanceId", "WaitingForInstanceId", "PreInService", "InProgress", "WaitingForELBConnectionDraining", "MidLifecycleAction", "WaitingForInstanceWarmup", "Successful", "Failed", "Cancelled"
      #   resp.activity.status_message #=> String
      #   resp.activity.progress #=> Integer
      #   resp.activity.details #=> String
      # @param [Hash] params ({})
      # @param [Hash] options ({})
      def terminate_instance_in_auto_scaling_group(params = {}, options = {})
        req = build_request(:terminate_instance_in_auto_scaling_group, params)
        req.send_request(options)
      end

      # Updates the configuration for the specified Auto Scaling group.
      #
      # To update an Auto Scaling group with a launch configuration with
      # `InstanceMonitoring` set to `False`, you must first disable the
      # collection of group metrics. Otherwise, you will get an error. If you
      # have previously enabled the collection of group metrics, you can
      # disable it using DisableMetricsCollection.
      #
      # The new settings are registered upon the completion of this call. Any
      # launch configuration settings take effect on any triggers after this
      # call returns. Scaling activities that are currently in progress
      # aren\'t affected.
      #
      # Note the following:
      #
      # * If you specify a new value for `MinSize` without specifying a value
      #   for `DesiredCapacity`, and the new `MinSize` is larger than the
      #   current size of the group, we implicitly call SetDesiredCapacity to
      #   set the size of the group to the new value of `MinSize`.
      #
      # * If you specify a new value for `MaxSize` without specifying a value
      #   for `DesiredCapacity`, and the new `MaxSize` is smaller than the
      #   current size of the group, we implicitly call SetDesiredCapacity to
      #   set the size of the group to the new value of `MaxSize`.
      #
      # * All other optional parameters are left unchanged if not specified.
      # @option params [required, String] :auto_scaling_group_name
      #   The name of the Auto Scaling group.
      # @option params [String] :launch_configuration_name
      #   The name of the launch configuration.
      # @option params [Integer] :min_size
      #   The minimum size of the Auto Scaling group.
      # @option params [Integer] :max_size
      #   The maximum size of the Auto Scaling group.
      # @option params [Integer] :desired_capacity
      #   The number of EC2 instances that should be running in the Auto Scaling
      #   group. This number must be greater than or equal to the minimum size
      #   of the group and less than or equal to the maximum size of the group.
      # @option params [Integer] :default_cooldown
      #   The amount of time, in seconds, after a scaling activity completes
      #   before another scaling activity can start. The default is 300.
      #
      #   For more information, see [Auto Scaling Cooldowns][1] in the *Auto
      #   Scaling Developer Guide*.
      #
      #
      #
      #   [1]: http://docs.aws.amazon.com/AutoScaling/latest/DeveloperGuide/Cooldown.html
      # @option params [Array<String>] :availability_zones
      #   One or more Availability Zones for the group.
      # @option params [String] :health_check_type
      #   The service to use for the health checks. The valid values are `EC2`
      #   and `ELB`.
      # @option params [Integer] :health_check_grace_period
      #   The amount of time, in seconds, that Auto Scaling waits before
      #   checking the health status of an EC2 instance that has come into
      #   service. The default is 300.
      #
      #   For more information, see [Health Checks][1] in the *Auto Scaling
      #   Developer Guide*.
      #
      #
      #
      #   [1]: http://docs.aws.amazon.com/AutoScaling/latest/DeveloperGuide/healthcheck.html
      # @option params [String] :placement_group
      #   The name of the placement group into which you\'ll launch your
      #   instances, if any. For more information, see [Placement Groups][1] in
      #   the *Amazon Elastic Compute Cloud User Guide*.
      #
      #
      #
      #   [1]: http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/placement-groups.html
      # @option params [String] :vpc_zone_identifier
      #   The ID of the subnet, if you are launching into a VPC. You can specify
      #   several subnets in a comma-separated list.
      #
      #   When you specify `VPCZoneIdentifier` with `AvailabilityZones`, ensure
      #   that the subnets\' Availability Zones match the values you specify for
      #   `AvailabilityZones`.
      #
      #   For more information, see [Launching Auto Scaling Instances in a
      #   VPC][1] in the *Auto Scaling Developer Guide*.
      #
      #
      #
      #   [1]: http://docs.aws.amazon.com/AutoScaling/latest/DeveloperGuide/asg-in-vpc.html
      # @option params [Array<String>] :termination_policies
      #   A standalone termination policy or a list of termination policies used
      #   to select the instance to terminate. The policies are executed in the
      #   order that they are listed.
      #
      #   For more information, see [Controlling Which Instances Auto Scaling
      #   Terminates During Scale In][1] in the *Auto Scaling Developer Guide*.
      #
      #
      #
      #   [1]: http://docs.aws.amazon.com/AutoScaling/latest/DeveloperGuide/AutoScalingBehavior.InstanceTermination.html
      # @option params [Boolean] :new_instances_protected_from_scale_in
      #   Indicates whether newly launched instances are protected from
      #   termination by Auto Scaling when scaling in.
      # @return [Struct] Returns an empty {Seahorse::Client::Response response}.
      #
      # @example Request syntax with placeholder values
      #   resp = client.update_auto_scaling_group({
      #     auto_scaling_group_name: "ResourceName", # required
      #     launch_configuration_name: "ResourceName",
      #     min_size: 1,
      #     max_size: 1,
      #     desired_capacity: 1,
      #     default_cooldown: 1,
      #     availability_zones: ["XmlStringMaxLen255"],
      #     health_check_type: "XmlStringMaxLen32",
      #     health_check_grace_period: 1,
      #     placement_group: "XmlStringMaxLen255",
      #     vpc_zone_identifier: "XmlStringMaxLen255",
      #     termination_policies: ["XmlStringMaxLen1600"],
      #     new_instances_protected_from_scale_in: false,
      #   })
      # @param [Hash] params ({})
      # @param [Hash] options ({})
      def update_auto_scaling_group(params = {}, options = {})
        req = build_request(:update_auto_scaling_group, params)
        req.send_request(options)
      end

      # @!endgroup

      # @param [Symbol] waiter_name
      # @param [Hash] params ({})
      # @param [Hash] options ({})
      # @option options [Integer] :max_attempts
      # @option options [Integer] :delay
      # @option options [Proc] :before_attempt
      # @option options [Proc] :before_wait
      def wait_until(waiter_name, params = {}, options = {})
        w = waiter(waiter_name, options)
        yield(w.waiter) if block_given? # deprecated
        w.wait(params)
      end

      def waiter_names
        waiters.keys
      end

      private

      # @param [Symbol] waiter_name
      # @param [Hash] options ({})
      def waiter(waiter_name, options = {})
        waiter_class = waiters[waiter_name]
        if waiter_class
          waiter_class.new(options.merge(client: self))
        else
          raise Aws::Waiters::Errors::NoSuchWaiterError.new(waiter_name, waiters.keys)
        end
      end

      def waiters
        {
          group_exists: Waiters::GroupExists,
          group_in_service: Waiters::GroupInService,
          group_not_exists: Waiters::GroupNotExists
        }
      end

      # @api private
      class << self

        attr_reader :identifier

        def errors_module
          Errors
        end

      end
    end
  end
end
