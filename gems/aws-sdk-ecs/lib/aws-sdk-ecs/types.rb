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
  module ECS
    module Types

      # The attributes applicable to a container instance when it is
      # registered.
      # @note When making an API call, pass Attribute
      #   data as a hash:
      #
      #       {
      #         name: "String", # required
      #         value: "String",
      #       }
      class Attribute < Aws::Structure.new(
        :name,
        :value)

        # @!attribute [rw] name
        #   The name of the container instance attribute.
        #   @return [String]

        # @!attribute [rw] value
        #   The value of the container instance attribute (at this time, the
        #   value here is `Null`, but this could change in future revisions for
        #   expandability).
        #   @return [String]

      end

      # A regional grouping of one or more container instances on which you
      # can run task requests. Each account receives a default cluster the
      # first time you use the Amazon ECS service, but you may also create
      # other clusters. Clusters may contain more than one instance type
      # simultaneously.
      class Cluster < Aws::Structure.new(
        :cluster_arn,
        :cluster_name,
        :status,
        :registered_container_instances_count,
        :running_tasks_count,
        :pending_tasks_count,
        :active_services_count)

        # @!attribute [rw] cluster_arn
        #   The Amazon Resource Name (ARN) that identifies the cluster. The ARN
        #   contains the `arn:aws:ecs` namespace, followed by the region of the
        #   cluster, the AWS account ID of the cluster owner, the `cluster`
        #   namespace, and then the cluster name. For example,
        #   `arn:aws:ecs:region:012345678910:cluster/test `..
        #   @return [String]

        # @!attribute [rw] cluster_name
        #   A user-generated string that you use to identify your cluster.
        #   @return [String]

        # @!attribute [rw] status
        #   The status of the cluster. The valid values are `ACTIVE` or
        #   `INACTIVE`. `ACTIVE` indicates that you can register container
        #   instances with the cluster and the associated instances can accept
        #   tasks.
        #   @return [String]

        # @!attribute [rw] registered_container_instances_count
        #   The number of container instances registered into the cluster.
        #   @return [Integer]

        # @!attribute [rw] running_tasks_count
        #   The number of tasks in the cluster that are in the `RUNNING` state.
        #   @return [Integer]

        # @!attribute [rw] pending_tasks_count
        #   The number of tasks in the cluster that are in the `PENDING` state.
        #   @return [Integer]

        # @!attribute [rw] active_services_count
        #   The number of services that are running on the cluster in an
        #   `ACTIVE` state. You can view these services with ListServices.
        #   @return [Integer]

      end

      # A Docker container that is part of a task.
      class Container < Aws::Structure.new(
        :container_arn,
        :task_arn,
        :name,
        :last_status,
        :exit_code,
        :reason,
        :network_bindings)

        # @!attribute [rw] container_arn
        #   The Amazon Resource Name (ARN) of the container.
        #   @return [String]

        # @!attribute [rw] task_arn
        #   The Amazon Resource Name (ARN) of the task.
        #   @return [String]

        # @!attribute [rw] name
        #   The name of the container.
        #   @return [String]

        # @!attribute [rw] last_status
        #   The last known status of the container.
        #   @return [String]

        # @!attribute [rw] exit_code
        #   The exit code returned from the container.
        #   @return [Integer]

        # @!attribute [rw] reason
        #   A short (255 max characters) human-readable string to provide
        #   additional detail about a running or stopped container.
        #   @return [String]

        # @!attribute [rw] network_bindings
        #   The network bindings associated with the container.
        #   @return [Array<Types::NetworkBinding>]

      end

      # Container definitions are used in task definitions to describe the
      # different containers that are launched as part of a task.
      # @note When making an API call, pass ContainerDefinition
      #   data as a hash:
      #
      #       {
      #         name: "String",
      #         image: "String",
      #         cpu: 1,
      #         memory: 1,
      #         links: ["String"],
      #         port_mappings: [
      #           {
      #             container_port: 1,
      #             host_port: 1,
      #             protocol: "tcp", # accepts tcp, udp
      #           },
      #         ],
      #         essential: false,
      #         entry_point: ["String"],
      #         command: ["String"],
      #         environment: [
      #           {
      #             name: "String",
      #             value: "String",
      #           },
      #         ],
      #         mount_points: [
      #           {
      #             source_volume: "String",
      #             container_path: "String",
      #             read_only: false,
      #           },
      #         ],
      #         volumes_from: [
      #           {
      #             source_container: "String",
      #             read_only: false,
      #           },
      #         ],
      #         hostname: "String",
      #         user: "String",
      #         working_directory: "String",
      #         disable_networking: false,
      #         privileged: false,
      #         readonly_root_filesystem: false,
      #         dns_servers: ["String"],
      #         dns_search_domains: ["String"],
      #         extra_hosts: [
      #           {
      #             hostname: "String", # required
      #             ip_address: "String", # required
      #           },
      #         ],
      #         docker_security_options: ["String"],
      #         docker_labels: {
      #           "String" => "String",
      #         },
      #         ulimits: [
      #           {
      #             name: "core", # required, accepts core, cpu, data, fsize, locks, memlock, msgqueue, nice, nofile, nproc, rss, rtprio, rttime, sigpending, stack
      #             soft_limit: 1, # required
      #             hard_limit: 1, # required
      #           },
      #         ],
      #         log_configuration: {
      #           log_driver: "json-file", # required, accepts json-file, syslog, journald, gelf, fluentd, awslogs
      #           options: {
      #             "String" => "String",
      #           },
      #         },
      #       }
      class ContainerDefinition < Aws::Structure.new(
        :name,
        :image,
        :cpu,
        :memory,
        :links,
        :port_mappings,
        :essential,
        :entry_point,
        :command,
        :environment,
        :mount_points,
        :volumes_from,
        :hostname,
        :user,
        :working_directory,
        :disable_networking,
        :privileged,
        :readonly_root_filesystem,
        :dns_servers,
        :dns_search_domains,
        :extra_hosts,
        :docker_security_options,
        :docker_labels,
        :ulimits,
        :log_configuration)

        # @!attribute [rw] name
        #   The name of a container. If you are linking multiple containers
        #   together in a task definition, the `name` of one container can be
        #   entered in the `links` of another container to connect the
        #   containers. Up to 255 letters (uppercase and lowercase), numbers,
        #   hyphens, and underscores are allowed. This parameter maps to `name`
        #   in the [Create a container][1] section of the [Docker Remote API][2]
        #   and the `--name` option to [docker run][3].
        #
        #
        #
        #   [1]: https://docs.docker.com/reference/api/docker_remote_api_v1.19/#create-a-container
        #   [2]: https://docs.docker.com/reference/api/docker_remote_api_v1.19/
        #   [3]: https://docs.docker.com/reference/commandline/run/
        #   @return [String]

        # @!attribute [rw] image
        #   The image used to start a container. This string is passed directly
        #   to the Docker daemon. Images in the Docker Hub registry are
        #   available by default. Other repositories are specified with `
        #   repository-url/image:tag `. Up to 255 letters (uppercase and
        #   lowercase), numbers, hyphens, underscores, colons, periods, forward
        #   slashes, and number signs are allowed. This parameter maps to
        #   `Image` in the [Create a container][1] section of the [Docker Remote
        #   API][2] and the `IMAGE` parameter of [docker run][3].
        #
        #   * Images in official repositories on Docker Hub use a single name
        #     (for example, `ubuntu` or `mongo`).
        #
        #   * Images in other repositories on Docker Hub are qualified with an
        #     organization name (for example, `amazon/amazon-ecs-agent`).
        #
        #   * Images in other online repositories are qualified further by a
        #     domain name (for example, `quay.io/assemblyline/ubuntu`).
        #
        #
        #
        #   [1]: https://docs.docker.com/reference/api/docker_remote_api_v1.19/#create-a-container
        #   [2]: https://docs.docker.com/reference/api/docker_remote_api_v1.19/
        #   [3]: https://docs.docker.com/reference/commandline/run/
        #   @return [String]

        # @!attribute [rw] cpu
        #   The number of `cpu` units reserved for the container. A container
        #   instance has 1,024 `cpu` units for every CPU core. This parameter
        #   specifies the minimum amount of CPU to reserve for a container, and
        #   containers share unallocated CPU units with other containers on the
        #   instance with the same ratio as their allocated amount. This
        #   parameter maps to `CpuShares` in the [Create a container][1] section
        #   of the [Docker Remote API][2] and the `--cpu-shares` option to
        #   [docker run][3].
        #
        #   <note markdown="1"> You can determine the number of CPU units that are available per EC2
        #   instance type by multiplying the vCPUs listed for that instance type
        #   on the [Amazon EC2 Instances][4] detail page by 1,024.
        #
        #    </note>
        #
        #   For example, if you run a single-container task on a single-core
        #   instance type with 512 CPU units specified for that container, and
        #   that is the only task running on the container instance, that
        #   container could use the full 1,024 CPU unit share at any given time.
        #   However, if you launched another copy of the same task on that
        #   container instance, each task would be guaranteed a minimum of 512
        #   CPU units when needed, and each container could float to higher CPU
        #   usage if the other container was not using it, but if both tasks
        #   were 100% active all of the time, they would be limited to 512 CPU
        #   units.
        #
        #   The Docker daemon on the container instance uses the CPU value to
        #   calculate the relative CPU share ratios for running containers. For
        #   more information, see [CPU share constraint][5] in the Docker
        #   documentation. The minimum valid CPU share value that the Linux
        #   kernel allows is 2; however, the CPU parameter is not required, and
        #   you can use CPU values below 2 in your container definitions. For
        #   CPU values below 2 (including null), the behavior varies based on
        #   your Amazon ECS container agent version:
        #
        #   * **Agent versions less than or equal to 1.1.0:** Null and zero CPU
        #     values are passed to Docker as 0, which Docker then converts to
        #     1,024 CPU shares. CPU values of 1 are passed to Docker as 1, which
        #     the Linux kernel converts to 2 CPU shares.
        #
        #   * **Agent versions greater than or equal to 1.2.0:** Null, zero, and
        #     CPU values of 1 are passed to Docker as 2.
        #
        #
        #
        #   [1]: https://docs.docker.com/reference/api/docker_remote_api_v1.19/#create-a-container
        #   [2]: https://docs.docker.com/reference/api/docker_remote_api_v1.19/
        #   [3]: https://docs.docker.com/reference/commandline/run/
        #   [4]: http://aws.amazon.com/ec2/instance-types/
        #   [5]: https://docs.docker.com/reference/run/#cpu-share-constraint
        #   @return [Integer]

        # @!attribute [rw] memory
        #   The number of MiB of memory to reserve for the container. You must
        #   specify a non-zero integer for this parameter; the Docker daemon
        #   reserves a minimum of 4 MiB of memory for a container, so you should
        #   not specify fewer than 4 MiB of memory for your containers. If your
        #   container attempts to exceed the memory allocated here, the
        #   container is killed. This parameter maps to `Memory` in the [Create
        #   a container][1] section of the [Docker Remote API][2] and the
        #   `--memory` option to [docker run][3].
        #
        #
        #
        #   [1]: https://docs.docker.com/reference/api/docker_remote_api_v1.19/#create-a-container
        #   [2]: https://docs.docker.com/reference/api/docker_remote_api_v1.19/
        #   [3]: https://docs.docker.com/reference/commandline/run/
        #   @return [Integer]

        # @!attribute [rw] links
        #   The `link` parameter allows containers to communicate with each
        #   other without the need for port mappings, using the `name` parameter
        #   and optionally, an `alias` for the link. This construct is analogous
        #   to `name:alias` in Docker links. Up to 255 letters (uppercase and
        #   lowercase), numbers, hyphens, and underscores are allowed for each
        #   `name` and `alias`. For more information on linking Docker
        #   containers, see [https://docs.docker.com/userguide/dockerlinks/][1].
        #   This parameter maps to `Links` in the [Create a container][2]
        #   section of the [Docker Remote API][3] and the `--link` option to [
        #   `docker run` ][4].
        #
        #   <important markdown="1"> Containers that are collocated on a single container instance may be
        #   able to communicate with each other without requiring links or host
        #   port mappings. Network isolation is achieved on the container
        #   instance using security groups and VPC settings.
        #
        #    </important>
        #
        #
        #
        #   [1]: https://docs.docker.com/userguide/dockerlinks/
        #   [2]: https://docs.docker.com/reference/api/docker_remote_api_v1.19/#create-a-container
        #   [3]: https://docs.docker.com/reference/api/docker_remote_api_v1.19/
        #   [4]: https://docs.docker.com/reference/commandline/run/
        #   @return [Array<String>]

        # @!attribute [rw] port_mappings
        #   The list of port mappings for the container. Port mappings allow
        #   containers to access ports on the host container instance to send or
        #   receive traffic. This parameter maps to `PortBindings` in the
        #   [Create a container][1] section of the [Docker Remote API][2] and
        #   the `--publish` option to [docker run][3].
        #
        #   <note markdown="1"> After a task reaches the `RUNNING` status, manual and automatic host
        #   and container port assignments are visible in the **Network
        #   Bindings** section of a container description of a selected task in
        #   the Amazon ECS console, or the `networkBindings` section
        #   DescribeTasks responses.
        #
        #    </note>
        #
        #
        #
        #   [1]: https://docs.docker.com/reference/api/docker_remote_api_v1.19/#create-a-container
        #   [2]: https://docs.docker.com/reference/api/docker_remote_api_v1.19/
        #   [3]: https://docs.docker.com/reference/commandline/run/
        #   @return [Array<Types::PortMapping>]

        # @!attribute [rw] essential
        #   If the `essential` parameter of a container is marked as `true`, and
        #   that container fails or stops for any reason, all other containers
        #   that are part of the task are stopped. If the `essential` parameter
        #   of a container is marked as `false`, then its failure does not
        #   affect the rest of the containers in a task. If this parameter is
        #   omitted, a container is assumed to be essential.
        #
        #   All tasks must have at least one essential container. If you have an
        #   application that is composed of multiple containers, you should
        #   group containers that are used for a common purpose into components,
        #   and separate the different components into multiple task
        #   definitions. For more information, see [Application Architecture][1]
        #   in the *Amazon EC2 Container Service Developer Guide*.
        #
        #
        #
        #   [1]: http://docs.aws.amazon.com/AmazonECS/latest/developerguide/application_architecture.html
        #   @return [Boolean]

        # @!attribute [rw] entry_point
        #   <important markdown="1"> Early versions of the Amazon ECS container agent do not properly
        #   handle `entryPoint` parameters. If you have problems using
        #   `entryPoint`, update your container agent or enter your commands and
        #   arguments as `command` array items instead.
        #
        #    </important>
        #
        #   The entry point that is passed to the container. This parameter maps
        #   to `Entrypoint` in the [Create a container][1] section of the
        #   [Docker Remote API][2] and the `--entrypoint` option to [docker
        #   run][3]. For more information, see
        #   [https://docs.docker.com/reference/builder/#entrypoint][4].
        #
        #
        #
        #   [1]: https://docs.docker.com/reference/api/docker_remote_api_v1.19/#create-a-container
        #   [2]: https://docs.docker.com/reference/api/docker_remote_api_v1.19/
        #   [3]: https://docs.docker.com/reference/commandline/run/
        #   [4]: https://docs.docker.com/reference/builder/#entrypoint
        #   @return [Array<String>]

        # @!attribute [rw] command
        #   The command that is passed to the container. This parameter maps to
        #   `Cmd` in the [Create a container][1] section of the [Docker Remote
        #   API][2] and the `COMMAND` parameter to [docker run][3]. For more
        #   information, see
        #   [https://docs.docker.com/reference/builder/#cmd][4].
        #
        #
        #
        #   [1]: https://docs.docker.com/reference/api/docker_remote_api_v1.19/#create-a-container
        #   [2]: https://docs.docker.com/reference/api/docker_remote_api_v1.19/
        #   [3]: https://docs.docker.com/reference/commandline/run/
        #   [4]: https://docs.docker.com/reference/builder/#cmd
        #   @return [Array<String>]

        # @!attribute [rw] environment
        #   The environment variables to pass to a container. This parameter
        #   maps to `Env` in the [Create a container][1] section of the [Docker
        #   Remote API][2] and the `--env` option to [docker run][3].
        #
        #   <important markdown="1"> We do not recommend using plain text environment variables for
        #   sensitive information, such as credential data.
        #
        #    </important>
        #
        #
        #
        #   [1]: https://docs.docker.com/reference/api/docker_remote_api_v1.19/#create-a-container
        #   [2]: https://docs.docker.com/reference/api/docker_remote_api_v1.19/
        #   [3]: https://docs.docker.com/reference/commandline/run/
        #   @return [Array<Types::KeyValuePair>]

        # @!attribute [rw] mount_points
        #   The mount points for data volumes in your container. This parameter
        #   maps to `Volumes` in the [Create a container][1] section of the
        #   [Docker Remote API][2] and the `--volume` option to [docker run][3].
        #
        #
        #
        #   [1]: https://docs.docker.com/reference/api/docker_remote_api_v1.19/#create-a-container
        #   [2]: https://docs.docker.com/reference/api/docker_remote_api_v1.19/
        #   [3]: https://docs.docker.com/reference/commandline/run/
        #   @return [Array<Types::MountPoint>]

        # @!attribute [rw] volumes_from
        #   Data volumes to mount from another container. This parameter maps to
        #   `VolumesFrom` in the [Create a container][1] section of the [Docker
        #   Remote API][2] and the `--volumes-from` option to [docker run][3].
        #
        #
        #
        #   [1]: https://docs.docker.com/reference/api/docker_remote_api_v1.19/#create-a-container
        #   [2]: https://docs.docker.com/reference/api/docker_remote_api_v1.19/
        #   [3]: https://docs.docker.com/reference/commandline/run/
        #   @return [Array<Types::VolumeFrom>]

        # @!attribute [rw] hostname
        #   The hostname to use for your container. This parameter maps to
        #   `Hostname` in the [Create a container][1] section of the [Docker
        #   Remote API][2] and the `--hostname` option to [docker run][3].
        #
        #
        #
        #   [1]: https://docs.docker.com/reference/api/docker_remote_api_v1.19/#create-a-container
        #   [2]: https://docs.docker.com/reference/api/docker_remote_api_v1.19/
        #   [3]: https://docs.docker.com/reference/commandline/run/
        #   @return [String]

        # @!attribute [rw] user
        #   The user name to use inside the container. This parameter maps to
        #   `User` in the [Create a container][1] section of the [Docker Remote
        #   API][2] and the `--user` option to [docker run][3].
        #
        #
        #
        #   [1]: https://docs.docker.com/reference/api/docker_remote_api_v1.19/#create-a-container
        #   [2]: https://docs.docker.com/reference/api/docker_remote_api_v1.19/
        #   [3]: https://docs.docker.com/reference/commandline/run/
        #   @return [String]

        # @!attribute [rw] working_directory
        #   The working directory in which to run commands inside the container.
        #   This parameter maps to `WorkingDir` in the [Create a container][1]
        #   section of the [Docker Remote API][2] and the `--workdir` option to
        #   [docker run][3].
        #
        #
        #
        #   [1]: https://docs.docker.com/reference/api/docker_remote_api_v1.19/#create-a-container
        #   [2]: https://docs.docker.com/reference/api/docker_remote_api_v1.19/
        #   [3]: https://docs.docker.com/reference/commandline/run/
        #   @return [String]

        # @!attribute [rw] disable_networking
        #   When this parameter is true, networking is disabled within the
        #   container. This parameter maps to `NetworkDisabled` in the [Create a
        #   container][1] section of the [Docker Remote API][2].
        #
        #
        #
        #   [1]: https://docs.docker.com/reference/api/docker_remote_api_v1.19/#create-a-container
        #   [2]: https://docs.docker.com/reference/api/docker_remote_api_v1.19/
        #   @return [Boolean]

        # @!attribute [rw] privileged
        #   When this parameter is true, the container is given elevated
        #   privileges on the host container instance (similar to the `root`
        #   user). This parameter maps to `Privileged` in the [Create a
        #   container][1] section of the [Docker Remote API][2] and the
        #   `--privileged` option to [docker run][3].
        #
        #
        #
        #   [1]: https://docs.docker.com/reference/api/docker_remote_api_v1.19/#create-a-container
        #   [2]: https://docs.docker.com/reference/api/docker_remote_api_v1.19/
        #   [3]: https://docs.docker.com/reference/commandline/run/
        #   @return [Boolean]

        # @!attribute [rw] readonly_root_filesystem
        #   When this parameter is true, the container is given read-only access
        #   to its root file system. This parameter maps to `ReadonlyRootfs` in
        #   the [Create a container][1] section of the [Docker Remote API][2]
        #   and the `--read-only` option to `docker run`.
        #
        #
        #
        #   [1]: https://docs.docker.com/reference/api/docker_remote_api_v1.19/#create-a-container
        #   [2]: https://docs.docker.com/reference/api/docker_remote_api_v1.19/
        #   @return [Boolean]

        # @!attribute [rw] dns_servers
        #   A list of DNS servers that are presented to the container. This
        #   parameter maps to `Dns` in the [Create a container][1] section of
        #   the [Docker Remote API][2] and the `--dns` option to [docker
        #   run][3].
        #
        #
        #
        #   [1]: https://docs.docker.com/reference/api/docker_remote_api_v1.19/#create-a-container
        #   [2]: https://docs.docker.com/reference/api/docker_remote_api_v1.19/
        #   [3]: https://docs.docker.com/reference/commandline/run/
        #   @return [Array<String>]

        # @!attribute [rw] dns_search_domains
        #   A list of DNS search domains that are presented to the container.
        #   This parameter maps to `DnsSearch` in the [Create a container][1]
        #   section of the [Docker Remote API][2] and the `--dns-search` option
        #   to [docker run][3].
        #
        #
        #
        #   [1]: https://docs.docker.com/reference/api/docker_remote_api_v1.19/#create-a-container
        #   [2]: https://docs.docker.com/reference/api/docker_remote_api_v1.19/
        #   [3]: https://docs.docker.com/reference/commandline/run/
        #   @return [Array<String>]

        # @!attribute [rw] extra_hosts
        #   A list of hostnames and IP address mappings to append to the
        #   `/etc/hosts` file on the container. This parameter maps to
        #   `ExtraHosts` in the [Create a container][1] section of the [Docker
        #   Remote API][2] and the `--add-host` option to [docker run][3].
        #
        #
        #
        #   [1]: https://docs.docker.com/reference/api/docker_remote_api_v1.19/#create-a-container
        #   [2]: https://docs.docker.com/reference/api/docker_remote_api_v1.19/
        #   [3]: https://docs.docker.com/reference/commandline/run/
        #   @return [Array<Types::HostEntry>]

        # @!attribute [rw] docker_security_options
        #   A list of strings to provide custom labels for SELinux and AppArmor
        #   multi-level security systems. This parameter maps to `SecurityOpt`
        #   in the [Create a container][1] section of the [Docker Remote API][2]
        #   and the `--security-opt` option to [docker run][3].
        #
        #   <note markdown="1"> The Amazon ECS container agent running on a container instance must
        #   register with the `ECS_SELINUX_CAPABLE=true` or
        #   `ECS_APPARMOR_CAPABLE=true` environment variables before containers
        #   placed on that instance can use these security options. For more
        #   information, see [Amazon ECS Container Agent Configuration][4] in
        #   the *Amazon EC2 Container Service Developer Guide*.
        #
        #    </note>
        #
        #
        #
        #   [1]: https://docs.docker.com/reference/api/docker_remote_api_v1.19/#create-a-container
        #   [2]: https://docs.docker.com/reference/api/docker_remote_api_v1.19/
        #   [3]: https://docs.docker.com/reference/commandline/run/
        #   [4]: http://docs.aws.amazon.com/AmazonECS/latest/developerguide/ecs-agent-config.html
        #   @return [Array<String>]

        # @!attribute [rw] docker_labels
        #   A key/value map of labels to add to the container. This parameter
        #   maps to `Labels` in the [Create a container][1] section of the
        #   [Docker Remote API][2] and the `--label` option to [docker run][3].
        #   This parameter requires version 1.18 of the Docker Remote API or
        #   greater on your container instance. To check the Docker Remote API
        #   version on your container instance, log into your container instance
        #   and run the following command: `sudo docker version | grep "Server
        #   API version"`
        #
        #
        #
        #   [1]: https://docs.docker.com/reference/api/docker_remote_api_v1.19/#create-a-container
        #   [2]: https://docs.docker.com/reference/api/docker_remote_api_v1.19/
        #   [3]: https://docs.docker.com/reference/commandline/run/
        #   @return [Hash<String,String>]

        # @!attribute [rw] ulimits
        #   A list of `ulimits` to set in the container. This parameter maps to
        #   `Ulimits` in the [Create a container][1] section of the [Docker
        #   Remote API][2] and the `--ulimit` option to [docker run][3]. Valid
        #   naming values are displayed in the Ulimit data type. This parameter
        #   requires version 1.18 of the Docker Remote API or greater on your
        #   container instance. To check the Docker Remote API version on your
        #   container instance, log into your container instance and run the
        #   following command: `sudo docker version | grep "Server API version"`
        #
        #
        #
        #   [1]: https://docs.docker.com/reference/api/docker_remote_api_v1.19/#create-a-container
        #   [2]: https://docs.docker.com/reference/api/docker_remote_api_v1.19/
        #   [3]: https://docs.docker.com/reference/commandline/run/
        #   @return [Array<Types::Ulimit>]

        # @!attribute [rw] log_configuration
        #   The log configuration specification for the container. This
        #   parameter maps to `LogConfig` in the [Create a container][1] section
        #   of the [Docker Remote API][2] and the `--log-driver` option to
        #   [docker run][3]. By default, containers use the same logging driver
        #   that the Docker daemon uses; however the container may use a
        #   different logging driver than the Docker daemon by specifying a log
        #   driver with this parameter in the container definition. To use a
        #   different logging driver for a container, the log system must be
        #   configured properly on the container instance (or on a different log
        #   server for remote logging options). For more information on the
        #   options for different supported log drivers, see [Configure logging
        #   drivers][4] in the Docker documentation.
        #
        #   <note markdown="1"> Amazon ECS currently supports a subset of the logging drivers
        #   available to the Docker daemon (shown in the LogConfiguration data
        #   type). Currently unsupported log drivers may be available in future
        #   releases of the Amazon ECS container agent.
        #
        #    </note>
        #
        #   This parameter requires version 1.18 of the Docker Remote API or
        #   greater on your container instance. To check the Docker Remote API
        #   version on your container instance, log into your container instance
        #   and run the following command: `sudo docker version | grep "Server
        #   API version"`
        #
        #   <note markdown="1"> The Amazon ECS container agent running on a container instance must
        #   register the logging drivers available on that instance with the
        #   `ECS_AVAILABLE_LOGGING_DRIVERS` environment variable before
        #   containers placed on that instance can use these log configuration
        #   options. For more information, see [Amazon ECS Container Agent
        #   Configuration][5] in the *Amazon EC2 Container Service Developer
        #   Guide*.
        #
        #    </note>
        #
        #
        #
        #   [1]: https://docs.docker.com/reference/api/docker_remote_api_v1.19/#create-a-container
        #   [2]: https://docs.docker.com/reference/api/docker_remote_api_v1.19/
        #   [3]: https://docs.docker.com/reference/commandline/run/
        #   [4]: https://docs.docker.com/engine/admin/logging/overview/
        #   [5]: http://docs.aws.amazon.com/AmazonECS/latest/developerguide/ecs-agent-config.html
        #   @return [Types::LogConfiguration]

      end

      # An EC2 instance that is running the Amazon ECS agent and has been
      # registered with a cluster.
      class ContainerInstance < Aws::Structure.new(
        :container_instance_arn,
        :ec2_instance_id,
        :version_info,
        :remaining_resources,
        :registered_resources,
        :status,
        :agent_connected,
        :running_tasks_count,
        :pending_tasks_count,
        :agent_update_status,
        :attributes)

        # @!attribute [rw] container_instance_arn
        #   The Amazon Resource Name (ARN) of the container instance. The ARN
        #   contains the `arn:aws:ecs` namespace, followed by the region of the
        #   container instance, the AWS account ID of the container instance
        #   owner, the `container-instance` namespace, and then the container
        #   instance ID. For example,
        #   `arn:aws:ecs:region:aws_account_id:container-instance/container_instance_ID
        #   `.
        #   @return [String]

        # @!attribute [rw] ec2_instance_id
        #   The EC2 instance ID of the container instance.
        #   @return [String]

        # @!attribute [rw] version_info
        #   The version information for the Amazon ECS container agent and
        #   Docker daemon running on the container instance.
        #   @return [Types::VersionInfo]

        # @!attribute [rw] remaining_resources
        #   The remaining resources of the container instance that are available
        #   for new tasks.
        #   @return [Array<Types::Resource>]

        # @!attribute [rw] registered_resources
        #   The registered resources on the container instance that are in use
        #   by current tasks.
        #   @return [Array<Types::Resource>]

        # @!attribute [rw] status
        #   The status of the container instance. The valid values are `ACTIVE`
        #   or `INACTIVE`. `ACTIVE` indicates that the container instance can
        #   accept tasks.
        #   @return [String]

        # @!attribute [rw] agent_connected
        #   This parameter returns `true` if the agent is actually connected to
        #   Amazon ECS. Registered instances with an agent that may be unhealthy
        #   or stopped return `false`, and instances without a connected agent
        #   cannot accept placement requests.
        #   @return [Boolean]

        # @!attribute [rw] running_tasks_count
        #   The number of tasks on the container instance that are in the
        #   `RUNNING` status.
        #   @return [Integer]

        # @!attribute [rw] pending_tasks_count
        #   The number of tasks on the container instance that are in the
        #   `PENDING` status.
        #   @return [Integer]

        # @!attribute [rw] agent_update_status
        #   The status of the most recent agent update. If an update has never
        #   been requested, this value is `NULL`.
        #   @return [String]

        # @!attribute [rw] attributes
        #   The attributes set for the container instance by the Amazon ECS
        #   container agent at instance registration.
        #   @return [Array<Types::Attribute>]

      end

      # The overrides that should be sent to a container.
      # @note When making an API call, pass ContainerOverride
      #   data as a hash:
      #
      #       {
      #         name: "String",
      #         command: ["String"],
      #         environment: [
      #           {
      #             name: "String",
      #             value: "String",
      #           },
      #         ],
      #       }
      class ContainerOverride < Aws::Structure.new(
        :name,
        :command,
        :environment)

        # @!attribute [rw] name
        #   The name of the container that receives the override.
        #   @return [String]

        # @!attribute [rw] command
        #   The command to send to the container that overrides the default
        #   command from the Docker image or the task definition.
        #   @return [Array<String>]

        # @!attribute [rw] environment
        #   The environment variables to send to the container. You can add new
        #   environment variables, which are added to the container at launch,
        #   or you can override the existing environment variables from the
        #   Docker image or the task definition.
        #   @return [Array<Types::KeyValuePair>]

      end

      # @note When making an API call, pass CreateClusterRequest
      #   data as a hash:
      #
      #       {
      #         cluster_name: "String",
      #       }
      class CreateClusterRequest < Aws::Structure.new(
        :cluster_name)

        # @!attribute [rw] cluster_name
        #   The name of your cluster. If you do not specify a name for your
        #   cluster, you create a cluster named `default`. Up to 255 letters
        #   (uppercase and lowercase), numbers, hyphens, and underscores are
        #   allowed.
        #   @return [String]

      end

      class CreateClusterResponse < Aws::Structure.new(
        :cluster)

        # @!attribute [rw] cluster
        #   The full description of your new cluster.
        #   @return [Types::Cluster]

      end

      # @note When making an API call, pass CreateServiceRequest
      #   data as a hash:
      #
      #       {
      #         cluster: "String",
      #         service_name: "String", # required
      #         task_definition: "String", # required
      #         load_balancers: [
      #           {
      #             load_balancer_name: "String",
      #             container_name: "String",
      #             container_port: 1,
      #           },
      #         ],
      #         desired_count: 1, # required
      #         client_token: "String",
      #         role: "String",
      #         deployment_configuration: {
      #           maximum_percent: 1,
      #           minimum_healthy_percent: 1,
      #         },
      #       }
      class CreateServiceRequest < Aws::Structure.new(
        :cluster,
        :service_name,
        :task_definition,
        :load_balancers,
        :desired_count,
        :client_token,
        :role,
        :deployment_configuration)

        # @!attribute [rw] cluster
        #   The short name or full Amazon Resource Name (ARN) of the cluster on
        #   which to run your service. If you do not specify a cluster, the
        #   default cluster is assumed.
        #   @return [String]

        # @!attribute [rw] service_name
        #   The name of your service. Up to 255 letters (uppercase and
        #   lowercase), numbers, hyphens, and underscores are allowed. Service
        #   names must be unique within a cluster, but you can have similarly
        #   named services in multiple clusters within a region or across
        #   multiple regions.
        #   @return [String]

        # @!attribute [rw] task_definition
        #   The `family` and `revision` (`family:revision`) or full Amazon
        #   Resource Name (ARN) of the task definition to run in your service.
        #   If a `revision` is not specified, the latest `ACTIVE` revision is
        #   used.
        #   @return [String]

        # @!attribute [rw] load_balancers
        #   A list of load balancer objects, containing the load balancer name,
        #   the container name (as it appears in a container definition), and
        #   the container port to access from the load balancer.
        #   @return [Array<Types::LoadBalancer>]

        # @!attribute [rw] desired_count
        #   The number of instantiations of the specified task definition to
        #   place and keep running on your cluster.
        #   @return [Integer]

        # @!attribute [rw] client_token
        #   Unique, case-sensitive identifier you provide to ensure the
        #   idempotency of the request. Up to 32 ASCII characters are allowed.
        #   @return [String]

        # @!attribute [rw] role
        #   The name or full Amazon Resource Name (ARN) of the IAM role that
        #   allows Amazon ECS to make calls to your load balancer on your
        #   behalf. This parameter is required if you are using a load balancer
        #   with your service. If you specify the `role` parameter, you must
        #   also specify a load balancer object with the `loadBalancers`
        #   parameter.
        #
        #   If your specified role has a path other than `/`, then you must
        #   either specify the full role ARN (this is recommended) or prefix the
        #   role name with the path. For example, if a role with the name `bar`
        #   has a path of `/foo/` then you would specify `/foo/bar` as the role
        #   name. For more information, see [Friendly Names and Paths][1] in the
        #   *IAM User Guide*.
        #
        #
        #
        #   [1]: http://docs.aws.amazon.com/IAM/latest/UserGuide/reference_identifiers.html#identifiers-friendly-names
        #   @return [String]

        # @!attribute [rw] deployment_configuration
        #   Optional deployment parameters that control how many tasks run
        #   during the deployment and the ordering of stopping and starting
        #   tasks.
        #   @return [Types::DeploymentConfiguration]

      end

      class CreateServiceResponse < Aws::Structure.new(
        :service)

        # @!attribute [rw] service
        #   The full description of your service following the create call.
        #   @return [Types::Service]

      end

      # @note When making an API call, pass DeleteClusterRequest
      #   data as a hash:
      #
      #       {
      #         cluster: "String", # required
      #       }
      class DeleteClusterRequest < Aws::Structure.new(
        :cluster)

        # @!attribute [rw] cluster
        #   The short name or full Amazon Resource Name (ARN) of the cluster to
        #   delete.
        #   @return [String]

      end

      class DeleteClusterResponse < Aws::Structure.new(
        :cluster)

        # @!attribute [rw] cluster
        #   The full description of the deleted cluster.
        #   @return [Types::Cluster]

      end

      # @note When making an API call, pass DeleteServiceRequest
      #   data as a hash:
      #
      #       {
      #         cluster: "String",
      #         service: "String", # required
      #       }
      class DeleteServiceRequest < Aws::Structure.new(
        :cluster,
        :service)

        # @!attribute [rw] cluster
        #   The name of the cluster that hosts the service to delete. If you do
        #   not specify a cluster, the default cluster is assumed.
        #   @return [String]

        # @!attribute [rw] service
        #   The name of the service to delete.
        #   @return [String]

      end

      class DeleteServiceResponse < Aws::Structure.new(
        :service)

        # @!attribute [rw] service
        #   The full description of the deleted service.
        #   @return [Types::Service]

      end

      # The details of an Amazon ECS service deployment.
      class Deployment < Aws::Structure.new(
        :id,
        :status,
        :task_definition,
        :desired_count,
        :pending_count,
        :running_count,
        :created_at,
        :updated_at)

        # @!attribute [rw] id
        #   The ID of the deployment.
        #   @return [String]

        # @!attribute [rw] status
        #   The status of the deployment. Valid values are `PRIMARY` (for the
        #   most recent deployment), `ACTIVE` (for previous deployments that
        #   still have tasks running, but are being replaced with the `PRIMARY`
        #   deployment), and `INACTIVE` (for deployments that have been
        #   completely replaced).
        #   @return [String]

        # @!attribute [rw] task_definition
        #   The most recent task definition that was specified for the service
        #   to use.
        #   @return [String]

        # @!attribute [rw] desired_count
        #   The most recent desired count of tasks that was specified for the
        #   service to deploy or maintain.
        #   @return [Integer]

        # @!attribute [rw] pending_count
        #   The number of tasks in the deployment that are in the `PENDING`
        #   status.
        #   @return [Integer]

        # @!attribute [rw] running_count
        #   The number of tasks in the deployment that are in the `RUNNING`
        #   status.
        #   @return [Integer]

        # @!attribute [rw] created_at
        #   The Unix time in seconds and milliseconds when the service was
        #   created.
        #   @return [Time]

        # @!attribute [rw] updated_at
        #   The Unix time in seconds and milliseconds when the service was last
        #   updated.
        #   @return [Time]

      end

      # Optional deployment parameters that control how many tasks run during
      # the deployment and the ordering of stopping and starting tasks.
      # @note When making an API call, pass DeploymentConfiguration
      #   data as a hash:
      #
      #       {
      #         maximum_percent: 1,
      #         minimum_healthy_percent: 1,
      #       }
      class DeploymentConfiguration < Aws::Structure.new(
        :maximum_percent,
        :minimum_healthy_percent)

        # @!attribute [rw] maximum_percent
        #   The upper limit (as a percentage of the service\'s `desiredCount`)
        #   of the number of running tasks that can be running in a service
        #   during a deployment. The maximum number of tasks during a deployment
        #   is the `desiredCount` multiplied by the `maximumPercent`/100,
        #   rounded down to the nearest integer value.
        #   @return [Integer]

        # @!attribute [rw] minimum_healthy_percent
        #   The lower limit (as a percentage of the service\'s `desiredCount`)
        #   of the number of running tasks that must remain running and healthy
        #   in a service during a deployment. The minimum healthy tasks during a
        #   deployment is the `desiredCount` multiplied by the
        #   `minimumHealthyPercent`/100, rounded up to the nearest integer
        #   value.
        #   @return [Integer]

      end

      # @note When making an API call, pass DeregisterContainerInstanceRequest
      #   data as a hash:
      #
      #       {
      #         cluster: "String",
      #         container_instance: "String", # required
      #         force: false,
      #       }
      class DeregisterContainerInstanceRequest < Aws::Structure.new(
        :cluster,
        :container_instance,
        :force)

        # @!attribute [rw] cluster
        #   The short name or full Amazon Resource Name (ARN) of the cluster
        #   that hosts the container instance to deregister. If you do not
        #   specify a cluster, the default cluster is assumed.
        #   @return [String]

        # @!attribute [rw] container_instance
        #   The container instance ID or full Amazon Resource Name (ARN) of the
        #   container instance to deregister. The ARN contains the `arn:aws:ecs`
        #   namespace, followed by the region of the container instance, the AWS
        #   account ID of the container instance owner, the `container-instance`
        #   namespace, and then the container instance ID. For example,
        #   `arn:aws:ecs:region:aws_account_id:container-instance/container_instance_ID
        #   `.
        #   @return [String]

        # @!attribute [rw] force
        #   Forces the deregistration of the container instance. If you have
        #   tasks running on the container instance when you deregister it with
        #   the `force` option, these tasks remain running and they continue to
        #   pass Elastic Load Balancing load balancer health checks until you
        #   terminate the instance or the tasks stop through some other means,
        #   but they are orphaned (no longer monitored or accounted for by
        #   Amazon ECS). If an orphaned task on your container instance is part
        #   of an Amazon ECS service, then the service scheduler starts another
        #   copy of that task, on a different container instance if possible.
        #   @return [Boolean]

      end

      class DeregisterContainerInstanceResponse < Aws::Structure.new(
        :container_instance)

        # @!attribute [rw] container_instance
        #   An EC2 instance that is running the Amazon ECS agent and has been
        #   registered with a cluster.
        #   @return [Types::ContainerInstance]

      end

      # @note When making an API call, pass DeregisterTaskDefinitionRequest
      #   data as a hash:
      #
      #       {
      #         task_definition: "String", # required
      #       }
      class DeregisterTaskDefinitionRequest < Aws::Structure.new(
        :task_definition)

        # @!attribute [rw] task_definition
        #   The `family` and `revision` (`family:revision`) or full Amazon
        #   Resource Name (ARN) of the task definition to deregister. You must
        #   specify a `revision`.
        #   @return [String]

      end

      class DeregisterTaskDefinitionResponse < Aws::Structure.new(
        :task_definition)

        # @!attribute [rw] task_definition
        #   The full description of the deregistered task.
        #   @return [Types::TaskDefinition]

      end

      # @note When making an API call, pass DescribeClustersRequest
      #   data as a hash:
      #
      #       {
      #         clusters: ["String"],
      #       }
      class DescribeClustersRequest < Aws::Structure.new(
        :clusters)

        # @!attribute [rw] clusters
        #   A space-separated list of cluster names or full cluster Amazon
        #   Resource Name (ARN) entries. If you do not specify a cluster, the
        #   default cluster is assumed.
        #   @return [Array<String>]

      end

      class DescribeClustersResponse < Aws::Structure.new(
        :clusters,
        :failures)

        # @!attribute [rw] clusters
        #   The list of clusters.
        #   @return [Array<Types::Cluster>]

        # @!attribute [rw] failures
        #   Any failures associated with the call.
        #   @return [Array<Types::Failure>]

      end

      # @note When making an API call, pass DescribeContainerInstancesRequest
      #   data as a hash:
      #
      #       {
      #         cluster: "String",
      #         container_instances: ["String"], # required
      #       }
      class DescribeContainerInstancesRequest < Aws::Structure.new(
        :cluster,
        :container_instances)

        # @!attribute [rw] cluster
        #   The short name or full Amazon Resource Name (ARN) of the cluster
        #   that hosts the container instances to describe. If you do not
        #   specify a cluster, the default cluster is assumed.
        #   @return [String]

        # @!attribute [rw] container_instances
        #   A space-separated list of container instance IDs or full Amazon
        #   Resource Name (ARN) entries.
        #   @return [Array<String>]

      end

      class DescribeContainerInstancesResponse < Aws::Structure.new(
        :container_instances,
        :failures)

        # @!attribute [rw] container_instances
        #   The list of container instances.
        #   @return [Array<Types::ContainerInstance>]

        # @!attribute [rw] failures
        #   Any failures associated with the call.
        #   @return [Array<Types::Failure>]

      end

      # @note When making an API call, pass DescribeServicesRequest
      #   data as a hash:
      #
      #       {
      #         cluster: "String",
      #         services: ["String"], # required
      #       }
      class DescribeServicesRequest < Aws::Structure.new(
        :cluster,
        :services)

        # @!attribute [rw] cluster
        #   The name of the cluster that hosts the service to describe. If you
        #   do not specify a cluster, the default cluster is assumed.
        #   @return [String]

        # @!attribute [rw] services
        #   A list of services to describe.
        #   @return [Array<String>]

      end

      class DescribeServicesResponse < Aws::Structure.new(
        :services,
        :failures)

        # @!attribute [rw] services
        #   The list of services described.
        #   @return [Array<Types::Service>]

        # @!attribute [rw] failures
        #   Any failures associated with the call.
        #   @return [Array<Types::Failure>]

      end

      # @note When making an API call, pass DescribeTaskDefinitionRequest
      #   data as a hash:
      #
      #       {
      #         task_definition: "String", # required
      #       }
      class DescribeTaskDefinitionRequest < Aws::Structure.new(
        :task_definition)

        # @!attribute [rw] task_definition
        #   The `family` for the latest `ACTIVE` revision, `family` and
        #   `revision` (`family:revision`) for a specific revision in the
        #   family, or full Amazon Resource Name (ARN) of the task definition to
        #   describe.
        #   @return [String]

      end

      class DescribeTaskDefinitionResponse < Aws::Structure.new(
        :task_definition)

        # @!attribute [rw] task_definition
        #   The full task definition description.
        #   @return [Types::TaskDefinition]

      end

      # @note When making an API call, pass DescribeTasksRequest
      #   data as a hash:
      #
      #       {
      #         cluster: "String",
      #         tasks: ["String"], # required
      #       }
      class DescribeTasksRequest < Aws::Structure.new(
        :cluster,
        :tasks)

        # @!attribute [rw] cluster
        #   The short name or full Amazon Resource Name (ARN) of the cluster
        #   that hosts the task to describe. If you do not specify a cluster,
        #   the default cluster is assumed.
        #   @return [String]

        # @!attribute [rw] tasks
        #   A space-separated list of task IDs or full Amazon Resource Name
        #   (ARN) entries.
        #   @return [Array<String>]

      end

      class DescribeTasksResponse < Aws::Structure.new(
        :tasks,
        :failures)

        # @!attribute [rw] tasks
        #   The list of tasks.
        #   @return [Array<Types::Task>]

        # @!attribute [rw] failures
        #   Any failures associated with the call.
        #   @return [Array<Types::Failure>]

      end

      # @note When making an API call, pass DiscoverPollEndpointRequest
      #   data as a hash:
      #
      #       {
      #         container_instance: "String",
      #         cluster: "String",
      #       }
      class DiscoverPollEndpointRequest < Aws::Structure.new(
        :container_instance,
        :cluster)

        # @!attribute [rw] container_instance
        #   The container instance ID or full Amazon Resource Name (ARN) of the
        #   container instance. The ARN contains the `arn:aws:ecs` namespace,
        #   followed by the region of the container instance, the AWS account ID
        #   of the container instance owner, the `container-instance` namespace,
        #   and then the container instance ID. For example,
        #   `arn:aws:ecs:region:aws_account_id:container-instance/container_instance_ID
        #   `.
        #   @return [String]

        # @!attribute [rw] cluster
        #   The cluster that the container instance belongs to.
        #   @return [String]

      end

      class DiscoverPollEndpointResponse < Aws::Structure.new(
        :endpoint,
        :telemetry_endpoint)

        # @!attribute [rw] endpoint
        #   The endpoint for the Amazon ECS agent to poll.
        #   @return [String]

        # @!attribute [rw] telemetry_endpoint
        #   The telemetry endpoint for the Amazon ECS agent.
        #   @return [String]

      end

      # A failed resource.
      class Failure < Aws::Structure.new(
        :arn,
        :reason)

        # @!attribute [rw] arn
        #   The Amazon Resource Name (ARN) of the failed resource.
        #   @return [String]

        # @!attribute [rw] reason
        #   The reason for the failure.
        #   @return [String]

      end

      # Hostnames and IP address entries that are added to the `/etc/hosts`
      # file of a container via the `extraHosts` parameter of its
      # ContainerDefinition.
      # @note When making an API call, pass HostEntry
      #   data as a hash:
      #
      #       {
      #         hostname: "String", # required
      #         ip_address: "String", # required
      #       }
      class HostEntry < Aws::Structure.new(
        :hostname,
        :ip_address)

        # @!attribute [rw] hostname
        #   The hostname to use in the `/etc/hosts` entry.
        #   @return [String]

        # @!attribute [rw] ip_address
        #   The IP address to use in the `/etc/hosts` entry.
        #   @return [String]

      end

      # Details on a container instance host volume.
      # @note When making an API call, pass HostVolumeProperties
      #   data as a hash:
      #
      #       {
      #         source_path: "String",
      #       }
      class HostVolumeProperties < Aws::Structure.new(
        :source_path)

        # @!attribute [rw] source_path
        #   The path on the host container instance that is presented to the
        #   container. If this parameter is empty, then the Docker daemon has
        #   assigned a host path for you. If the `host` parameter contains a
        #   `sourcePath` file location, then the data volume persists at the
        #   specified location on the host container instance until you delete
        #   it manually. If the `sourcePath` value does not exist on the host
        #   container instance, the Docker daemon creates it. If the location
        #   does exist, the contents of the source path folder are exported.
        #   @return [String]

      end

      # A key and value pair object.
      # @note When making an API call, pass KeyValuePair
      #   data as a hash:
      #
      #       {
      #         name: "String",
      #         value: "String",
      #       }
      class KeyValuePair < Aws::Structure.new(
        :name,
        :value)

        # @!attribute [rw] name
        #   The name of the key value pair. For environment variables, this is
        #   the name of the environment variable.
        #   @return [String]

        # @!attribute [rw] value
        #   The value of the key value pair. For environment variables, this is
        #   the value of the environment variable.
        #   @return [String]

      end

      # @note When making an API call, pass ListClustersRequest
      #   data as a hash:
      #
      #       {
      #         next_token: "String",
      #         max_results: 1,
      #       }
      class ListClustersRequest < Aws::Structure.new(
        :next_token,
        :max_results)

        # @!attribute [rw] next_token
        #   The `nextToken` value returned from a previous paginated
        #   `ListClusters` request where `maxResults` was used and the results
        #   exceeded the value of that parameter. Pagination continues from the
        #   end of the previous results that returned the `nextToken` value.
        #   This value is `null` when there are no more results to return.
        #
        #   <note markdown="1"> This token should be treated as an opaque identifier that is only
        #   used to retrieve the next items in a list and not for other
        #   programmatic purposes.
        #
        #    </note>
        #   @return [String]

        # @!attribute [rw] max_results
        #   The maximum number of cluster results returned by `ListClusters` in
        #   paginated output. When this parameter is used, `ListClusters` only
        #   returns `maxResults` results in a single page along with a
        #   `nextToken` response element. The remaining results of the initial
        #   request can be seen by sending another `ListClusters` request with
        #   the returned `nextToken` value. This value can be between 1 and 100.
        #   If this parameter is not used, then `ListClusters` returns up to 100
        #   results and a `nextToken` value if applicable.
        #   @return [Integer]

      end

      class ListClustersResponse < Aws::Structure.new(
        :cluster_arns,
        :next_token)

        # @!attribute [rw] cluster_arns
        #   The list of full Amazon Resource Name (ARN) entries for each cluster
        #   associated with your account.
        #   @return [Array<String>]

        # @!attribute [rw] next_token
        #   The `nextToken` value to include in a future `ListClusters` request.
        #   When the results of a `ListClusters` request exceed `maxResults`,
        #   this value can be used to retrieve the next page of results. This
        #   value is `null` when there are no more results to return.
        #   @return [String]

      end

      # @note When making an API call, pass ListContainerInstancesRequest
      #   data as a hash:
      #
      #       {
      #         cluster: "String",
      #         next_token: "String",
      #         max_results: 1,
      #       }
      class ListContainerInstancesRequest < Aws::Structure.new(
        :cluster,
        :next_token,
        :max_results)

        # @!attribute [rw] cluster
        #   The short name or full Amazon Resource Name (ARN) of the cluster
        #   that hosts the container instances to list. If you do not specify a
        #   cluster, the default cluster is assumed..
        #   @return [String]

        # @!attribute [rw] next_token
        #   The `nextToken` value returned from a previous paginated
        #   `ListContainerInstances` request where `maxResults` was used and the
        #   results exceeded the value of that parameter. Pagination continues
        #   from the end of the previous results that returned the `nextToken`
        #   value. This value is `null` when there are no more results to
        #   return.
        #
        #   <note markdown="1"> This token should be treated as an opaque identifier that is only
        #   used to retrieve the next items in a list and not for other
        #   programmatic purposes.
        #
        #    </note>
        #   @return [String]

        # @!attribute [rw] max_results
        #   The maximum number of container instance results returned by
        #   `ListContainerInstances` in paginated output. When this parameter is
        #   used, `ListContainerInstances` only returns `maxResults` results in
        #   a single page along with a `nextToken` response element. The
        #   remaining results of the initial request can be seen by sending
        #   another `ListContainerInstances` request with the returned
        #   `nextToken` value. This value can be between 1 and 100. If this
        #   parameter is not used, then `ListContainerInstances` returns up to
        #   100 results and a `nextToken` value if applicable.
        #   @return [Integer]

      end

      class ListContainerInstancesResponse < Aws::Structure.new(
        :container_instance_arns,
        :next_token)

        # @!attribute [rw] container_instance_arns
        #   The list of container instances with full Amazon Resource Name (ARN)
        #   entries for each container instance associated with the specified
        #   cluster.
        #   @return [Array<String>]

        # @!attribute [rw] next_token
        #   The `nextToken` value to include in a future
        #   `ListContainerInstances` request. When the results of a
        #   `ListContainerInstances` request exceed `maxResults`, this value can
        #   be used to retrieve the next page of results. This value is `null`
        #   when there are no more results to return.
        #   @return [String]

      end

      # @note When making an API call, pass ListServicesRequest
      #   data as a hash:
      #
      #       {
      #         cluster: "String",
      #         next_token: "String",
      #         max_results: 1,
      #       }
      class ListServicesRequest < Aws::Structure.new(
        :cluster,
        :next_token,
        :max_results)

        # @!attribute [rw] cluster
        #   The short name or full Amazon Resource Name (ARN) of the cluster
        #   that hosts the services to list. If you do not specify a cluster,
        #   the default cluster is assumed..
        #   @return [String]

        # @!attribute [rw] next_token
        #   The `nextToken` value returned from a previous paginated
        #   `ListServices` request where `maxResults` was used and the results
        #   exceeded the value of that parameter. Pagination continues from the
        #   end of the previous results that returned the `nextToken` value.
        #   This value is `null` when there are no more results to return.
        #
        #   <note markdown="1"> This token should be treated as an opaque identifier that is only
        #   used to retrieve the next items in a list and not for other
        #   programmatic purposes.
        #
        #    </note>
        #   @return [String]

        # @!attribute [rw] max_results
        #   The maximum number of container instance results returned by
        #   `ListServices` in paginated output. When this parameter is used,
        #   `ListServices` only returns `maxResults` results in a single page
        #   along with a `nextToken` response element. The remaining results of
        #   the initial request can be seen by sending another `ListServices`
        #   request with the returned `nextToken` value. This value can be
        #   between 1 and 10. If this parameter is not used, then `ListServices`
        #   returns up to 10 results and a `nextToken` value if applicable.
        #   @return [Integer]

      end

      class ListServicesResponse < Aws::Structure.new(
        :service_arns,
        :next_token)

        # @!attribute [rw] service_arns
        #   The list of full Amazon Resource Name (ARN) entries for each service
        #   associated with the specified cluster.
        #   @return [Array<String>]

        # @!attribute [rw] next_token
        #   The `nextToken` value to include in a future `ListServices` request.
        #   When the results of a `ListServices` request exceed `maxResults`,
        #   this value can be used to retrieve the next page of results. This
        #   value is `null` when there are no more results to return.
        #   @return [String]

      end

      # @note When making an API call, pass ListTaskDefinitionFamiliesRequest
      #   data as a hash:
      #
      #       {
      #         family_prefix: "String",
      #         status: "ACTIVE", # accepts ACTIVE, INACTIVE, ALL
      #         next_token: "String",
      #         max_results: 1,
      #       }
      class ListTaskDefinitionFamiliesRequest < Aws::Structure.new(
        :family_prefix,
        :status,
        :next_token,
        :max_results)

        # @!attribute [rw] family_prefix
        #   The `familyPrefix` is a string that is used to filter the results of
        #   `ListTaskDefinitionFamilies`. If you specify a `familyPrefix`, only
        #   task definition family names that begin with the `familyPrefix`
        #   string are returned.
        #   @return [String]

        # @!attribute [rw] status
        #   The task definition family status with which to filter the
        #   `ListTaskDefinitionFamilies` results. By default, both `ACTIVE` and
        #   `INACTIVE` task definition families are listed. If this parameter is
        #   set to `ACTIVE`, only task definition families that have an `ACTIVE`
        #   task definition revision are returned. If this parameter is set to
        #   `INACTIVE`, only task definition families that do not have any
        #   `ACTIVE` task definition revisions are returned. If you paginate the
        #   resulting output, be sure to keep the `status` value constant in
        #   each subsequent request.
        #   @return [String]

        # @!attribute [rw] next_token
        #   The `nextToken` value returned from a previous paginated
        #   `ListTaskDefinitionFamilies` request where `maxResults` was used and
        #   the results exceeded the value of that parameter. Pagination
        #   continues from the end of the previous results that returned the
        #   `nextToken` value. This value is `null` when there are no more
        #   results to return.
        #
        #   <note markdown="1"> This token should be treated as an opaque identifier that is only
        #   used to retrieve the next items in a list and not for other
        #   programmatic purposes.
        #
        #    </note>
        #   @return [String]

        # @!attribute [rw] max_results
        #   The maximum number of task definition family results returned by
        #   `ListTaskDefinitionFamilies` in paginated output. When this
        #   parameter is used, `ListTaskDefinitions` only returns `maxResults`
        #   results in a single page along with a `nextToken` response element.
        #   The remaining results of the initial request can be seen by sending
        #   another `ListTaskDefinitionFamilies` request with the returned
        #   `nextToken` value. This value can be between 1 and 100. If this
        #   parameter is not used, then `ListTaskDefinitionFamilies` returns up
        #   to 100 results and a `nextToken` value if applicable.
        #   @return [Integer]

      end

      class ListTaskDefinitionFamiliesResponse < Aws::Structure.new(
        :families,
        :next_token)

        # @!attribute [rw] families
        #   The list of task definition family names that match the
        #   `ListTaskDefinitionFamilies` request.
        #   @return [Array<String>]

        # @!attribute [rw] next_token
        #   The `nextToken` value to include in a future
        #   `ListTaskDefinitionFamilies` request. When the results of a
        #   `ListTaskDefinitionFamilies` request exceed `maxResults`, this value
        #   can be used to retrieve the next page of results. This value is
        #   `null` when there are no more results to return.
        #   @return [String]

      end

      # @note When making an API call, pass ListTaskDefinitionsRequest
      #   data as a hash:
      #
      #       {
      #         family_prefix: "String",
      #         status: "ACTIVE", # accepts ACTIVE, INACTIVE
      #         sort: "ASC", # accepts ASC, DESC
      #         next_token: "String",
      #         max_results: 1,
      #       }
      class ListTaskDefinitionsRequest < Aws::Structure.new(
        :family_prefix,
        :status,
        :sort,
        :next_token,
        :max_results)

        # @!attribute [rw] family_prefix
        #   The full family name with which to filter the `ListTaskDefinitions`
        #   results. Specifying a `familyPrefix` limits the listed task
        #   definitions to task definition revisions that belong to that family.
        #   @return [String]

        # @!attribute [rw] status
        #   The task definition status with which to filter the
        #   `ListTaskDefinitions` results. By default, only `ACTIVE` task
        #   definitions are listed. By setting this parameter to `INACTIVE`, you
        #   can view task definitions that are `INACTIVE` as long as an active
        #   task or service still references them. If you paginate the resulting
        #   output, be sure to keep the `status` value constant in each
        #   subsequent request.
        #   @return [String]

        # @!attribute [rw] sort
        #   The order in which to sort the results. Valid values are `ASC` and
        #   `DESC`. By default (`ASC`), task definitions are listed
        #   lexicographically by family name and in ascending numerical order by
        #   revision so that the newest task definitions in a family are listed
        #   last. Setting this parameter to `DESC` reverses the sort order on
        #   family name and revision so that the newest task definitions in a
        #   family are listed first.
        #   @return [String]

        # @!attribute [rw] next_token
        #   The `nextToken` value returned from a previous paginated
        #   `ListTaskDefinitions` request where `maxResults` was used and the
        #   results exceeded the value of that parameter. Pagination continues
        #   from the end of the previous results that returned the `nextToken`
        #   value. This value is `null` when there are no more results to
        #   return.
        #
        #   <note markdown="1"> This token should be treated as an opaque identifier that is only
        #   used to retrieve the next items in a list and not for other
        #   programmatic purposes.
        #
        #    </note>
        #   @return [String]

        # @!attribute [rw] max_results
        #   The maximum number of task definition results returned by
        #   `ListTaskDefinitions` in paginated output. When this parameter is
        #   used, `ListTaskDefinitions` only returns `maxResults` results in a
        #   single page along with a `nextToken` response element. The remaining
        #   results of the initial request can be seen by sending another
        #   `ListTaskDefinitions` request with the returned `nextToken` value.
        #   This value can be between 1 and 100. If this parameter is not used,
        #   then `ListTaskDefinitions` returns up to 100 results and a
        #   `nextToken` value if applicable.
        #   @return [Integer]

      end

      class ListTaskDefinitionsResponse < Aws::Structure.new(
        :task_definition_arns,
        :next_token)

        # @!attribute [rw] task_definition_arns
        #   The list of task definition Amazon Resource Name (ARN) entries for
        #   the `ListTaskDefinitions` request.
        #   @return [Array<String>]

        # @!attribute [rw] next_token
        #   The `nextToken` value to include in a future `ListTaskDefinitions`
        #   request. When the results of a `ListTaskDefinitions` request exceed
        #   `maxResults`, this value can be used to retrieve the next page of
        #   results. This value is `null` when there are no more results to
        #   return.
        #   @return [String]

      end

      # @note When making an API call, pass ListTasksRequest
      #   data as a hash:
      #
      #       {
      #         cluster: "String",
      #         container_instance: "String",
      #         family: "String",
      #         next_token: "String",
      #         max_results: 1,
      #         started_by: "String",
      #         service_name: "String",
      #         desired_status: "RUNNING", # accepts RUNNING, PENDING, STOPPED
      #       }
      class ListTasksRequest < Aws::Structure.new(
        :cluster,
        :container_instance,
        :family,
        :next_token,
        :max_results,
        :started_by,
        :service_name,
        :desired_status)

        # @!attribute [rw] cluster
        #   The short name or full Amazon Resource Name (ARN) of the cluster
        #   that hosts the tasks to list. If you do not specify a cluster, the
        #   default cluster is assumed..
        #   @return [String]

        # @!attribute [rw] container_instance
        #   The container instance ID or full Amazon Resource Name (ARN) of the
        #   container instance with which to filter the `ListTasks` results.
        #   Specifying a `containerInstance` limits the results to tasks that
        #   belong to that container instance.
        #   @return [String]

        # @!attribute [rw] family
        #   The name of the family with which to filter the `ListTasks` results.
        #   Specifying a `family` limits the results to tasks that belong to
        #   that family.
        #   @return [String]

        # @!attribute [rw] next_token
        #   The `nextToken` value returned from a previous paginated `ListTasks`
        #   request where `maxResults` was used and the results exceeded the
        #   value of that parameter. Pagination continues from the end of the
        #   previous results that returned the `nextToken` value. This value is
        #   `null` when there are no more results to return.
        #
        #   <note markdown="1"> This token should be treated as an opaque identifier that is only
        #   used to retrieve the next items in a list and not for other
        #   programmatic purposes.
        #
        #    </note>
        #   @return [String]

        # @!attribute [rw] max_results
        #   The maximum number of task results returned by `ListTasks` in
        #   paginated output. When this parameter is used, `ListTasks` only
        #   returns `maxResults` results in a single page along with a
        #   `nextToken` response element. The remaining results of the initial
        #   request can be seen by sending another `ListTasks` request with the
        #   returned `nextToken` value. This value can be between 1 and 100. If
        #   this parameter is not used, then `ListTasks` returns up to 100
        #   results and a `nextToken` value if applicable.
        #   @return [Integer]

        # @!attribute [rw] started_by
        #   The `startedBy` value with which to filter the task results.
        #   Specifying a `startedBy` value limits the results to tasks that were
        #   started with that value.
        #   @return [String]

        # @!attribute [rw] service_name
        #   The name of the service with which to filter the `ListTasks`
        #   results. Specifying a `serviceName` limits the results to tasks that
        #   belong to that service.
        #   @return [String]

        # @!attribute [rw] desired_status
        #   The task status with which to filter the `ListTasks` results.
        #   Specifying a `desiredStatus` of `STOPPED` limits the results to
        #   tasks that are in the `STOPPED` status, which can be useful for
        #   debugging tasks that are not starting properly or have died or
        #   finished. The default status filter is `RUNNING`.
        #   @return [String]

      end

      class ListTasksResponse < Aws::Structure.new(
        :task_arns,
        :next_token)

        # @!attribute [rw] task_arns
        #   The list of task Amazon Resource Name (ARN) entries for the
        #   `ListTasks` request.
        #   @return [Array<String>]

        # @!attribute [rw] next_token
        #   The `nextToken` value to include in a future `ListTasks` request.
        #   When the results of a `ListTasks` request exceed `maxResults`, this
        #   value can be used to retrieve the next page of results. This value
        #   is `null` when there are no more results to return.
        #   @return [String]

      end

      # Details on a load balancer that is used with a service.
      # @note When making an API call, pass LoadBalancer
      #   data as a hash:
      #
      #       {
      #         load_balancer_name: "String",
      #         container_name: "String",
      #         container_port: 1,
      #       }
      class LoadBalancer < Aws::Structure.new(
        :load_balancer_name,
        :container_name,
        :container_port)

        # @!attribute [rw] load_balancer_name
        #   The name of the load balancer.
        #   @return [String]

        # @!attribute [rw] container_name
        #   The name of the container (as it appears in a container definition)
        #   to associate with the load balancer.
        #   @return [String]

        # @!attribute [rw] container_port
        #   The port on the container to associate with the load balancer. This
        #   port must correspond to a `containerPort` in the service\'s task
        #   definition. Your container instances must allow ingress traffic on
        #   the `hostPort` of the port mapping.
        #   @return [Integer]

      end

      # Log configuration options to send to a custom log driver for the
      # container.
      # @note When making an API call, pass LogConfiguration
      #   data as a hash:
      #
      #       {
      #         log_driver: "json-file", # required, accepts json-file, syslog, journald, gelf, fluentd, awslogs
      #         options: {
      #           "String" => "String",
      #         },
      #       }
      class LogConfiguration < Aws::Structure.new(
        :log_driver,
        :options)

        # @!attribute [rw] log_driver
        #   The log driver to use for the container. The valid values listed for
        #   this parameter are log drivers that the Amazon ECS container agent
        #   can communicate with by default.
        #
        #   <note markdown="1"> If you have a custom driver that is not listed above that you would
        #   like to work with the Amazon ECS container agent, you can fork the
        #   Amazon ECS container agent project that is [available on GitHub][1]
        #   and customize it to work with that driver. We encourage you to
        #   submit pull requests for changes that you would like to have
        #   included. However, Amazon Web Services does not currently provide
        #   support for running modified copies of this software.
        #
        #    </note>
        #
        #   This parameter requires version 1.18 of the Docker Remote API or
        #   greater on your container instance. To check the Docker Remote API
        #   version on your container instance, log into your container instance
        #   and run the following command: `sudo docker version | grep "Server
        #   API version"`
        #
        #
        #
        #   [1]: https://github.com/aws/amazon-ecs-agent
        #   @return [String]

        # @!attribute [rw] options
        #   The configuration options to send to the log driver. This parameter
        #   requires version 1.19 of the Docker Remote API or greater on your
        #   container instance. To check the Docker Remote API version on your
        #   container instance, log into your container instance and run the
        #   following command: `sudo docker version | grep "Server API version"`
        #   @return [Hash<String,String>]

      end

      # Details on a volume mount point that is used in a container
      # definition.
      # @note When making an API call, pass MountPoint
      #   data as a hash:
      #
      #       {
      #         source_volume: "String",
      #         container_path: "String",
      #         read_only: false,
      #       }
      class MountPoint < Aws::Structure.new(
        :source_volume,
        :container_path,
        :read_only)

        # @!attribute [rw] source_volume
        #   The name of the volume to mount.
        #   @return [String]

        # @!attribute [rw] container_path
        #   The path on the container to mount the host volume at.
        #   @return [String]

        # @!attribute [rw] read_only
        #   If this value is `true`, the container has read-only access to the
        #   volume. If this value is `false`, then the container can write to
        #   the volume. The default value is `false`.
        #   @return [Boolean]

      end

      # Details on the network bindings between a container and its host
      # container instance. After a task reaches the `RUNNING` status, manual
      # and automatic host and container port assignments are visible in the
      # `networkBindings` section of DescribeTasks API responses.
      # @note When making an API call, pass NetworkBinding
      #   data as a hash:
      #
      #       {
      #         bind_ip: "String",
      #         container_port: 1,
      #         host_port: 1,
      #         protocol: "tcp", # accepts tcp, udp
      #       }
      class NetworkBinding < Aws::Structure.new(
        :bind_ip,
        :container_port,
        :host_port,
        :protocol)

        # @!attribute [rw] bind_ip
        #   The IP address that the container is bound to on the container
        #   instance.
        #   @return [String]

        # @!attribute [rw] container_port
        #   The port number on the container that is be used with the network
        #   binding.
        #   @return [Integer]

        # @!attribute [rw] host_port
        #   The port number on the host that is used with the network binding.
        #   @return [Integer]

        # @!attribute [rw] protocol
        #   The protocol used for the network binding.
        #   @return [String]

      end

      # Port mappings allow containers to access ports on the host container
      # instance to send or receive traffic. Port mappings are specified as
      # part of the container definition. After a task reaches the `RUNNING`
      # status, manual and automatic host and container port assignments are
      # visible in the `networkBindings` section of DescribeTasks API
      # responses.
      # @note When making an API call, pass PortMapping
      #   data as a hash:
      #
      #       {
      #         container_port: 1,
      #         host_port: 1,
      #         protocol: "tcp", # accepts tcp, udp
      #       }
      class PortMapping < Aws::Structure.new(
        :container_port,
        :host_port,
        :protocol)

        # @!attribute [rw] container_port
        #   The port number on the container that is bound to the user-specified
        #   or automatically assigned host port. If you specify a container port
        #   and not a host port, your container automatically receives a host
        #   port in the ephemeral port range (for more information, see
        #   `hostPort`). Port mappings that are automatically assigned in this
        #   way do not count toward the 100 reserved ports limit of a container
        #   instance.
        #   @return [Integer]

        # @!attribute [rw] host_port
        #   The port number on the container instance to reserve for your
        #   container. You can specify a non-reserved host port for your
        #   container port mapping, or you can omit the `hostPort` (or set it to
        #   `0`) while specifying a `containerPort` and your container
        #   automatically receives a port in the ephemeral port range for your
        #   container instance operating system and Docker version.
        #
        #   The default ephemeral port range is 49153 to 65535, and this range
        #   is used for Docker versions prior to 1.6.0. For Docker version 1.6.0
        #   and later, the Docker daemon tries to read the ephemeral port range
        #   from `/proc/sys/net/ipv4/ip_local_port_range`; if this kernel
        #   parameter is unavailable, the default ephemeral port range is used.
        #   You should not attempt to specify a host port in the ephemeral port
        #   range, because these are reserved for automatic assignment. In
        #   general, ports below 32768 are outside of the ephemeral port range.
        #
        #   The default reserved ports are 22 for SSH, the Docker ports 2375 and
        #   2376, and the Amazon ECS container agent port 51678. Any host port
        #   that was previously specified in a running task is also reserved
        #   while the task is running (after a task stops, the host port is
        #   released).The current reserved ports are displayed in the
        #   `remainingResources` of DescribeContainerInstances output, and a
        #   container instance may have up to 100 reserved ports at a time,
        #   including the default reserved ports (automatically assigned ports
        #   do not count toward the 100 reserved ports limit).
        #   @return [Integer]

        # @!attribute [rw] protocol
        #   The protocol used for the port mapping. Valid values are `tcp` and
        #   `udp`. The default is `tcp`.
        #   @return [String]

      end

      # @note When making an API call, pass RegisterContainerInstanceRequest
      #   data as a hash:
      #
      #       {
      #         cluster: "String",
      #         instance_identity_document: "String",
      #         instance_identity_document_signature: "String",
      #         total_resources: [
      #           {
      #             name: "String",
      #             type: "String",
      #             double_value: 1.0,
      #             long_value: 1,
      #             integer_value: 1,
      #             string_set_value: ["String"],
      #           },
      #         ],
      #         version_info: {
      #           agent_version: "String",
      #           agent_hash: "String",
      #           docker_version: "String",
      #         },
      #         container_instance_arn: "String",
      #         attributes: [
      #           {
      #             name: "String", # required
      #             value: "String",
      #           },
      #         ],
      #       }
      class RegisterContainerInstanceRequest < Aws::Structure.new(
        :cluster,
        :instance_identity_document,
        :instance_identity_document_signature,
        :total_resources,
        :version_info,
        :container_instance_arn,
        :attributes)

        # @!attribute [rw] cluster
        #   The short name or full Amazon Resource Name (ARN) of the cluster
        #   with which to register your container instance. If you do not
        #   specify a cluster, the default cluster is assumed..
        #   @return [String]

        # @!attribute [rw] instance_identity_document
        #   The instance identity document for the EC2 instance to register.
        #   This document can be found by running the following command from the
        #   instance: `curl
        #   http://169.254.169.254/latest/dynamic/instance-identity/document/`
        #   @return [String]

        # @!attribute [rw] instance_identity_document_signature
        #   The instance identity document signature for the EC2 instance to
        #   register. This signature can be found by running the following
        #   command from the instance: `curl
        #   http://169.254.169.254/latest/dynamic/instance-identity/signature/`
        #   @return [String]

        # @!attribute [rw] total_resources
        #   The resources available on the instance.
        #   @return [Array<Types::Resource>]

        # @!attribute [rw] version_info
        #   The version information for the Amazon ECS container agent and
        #   Docker daemon running on the container instance.
        #   @return [Types::VersionInfo]

        # @!attribute [rw] container_instance_arn
        #   The Amazon Resource Name (ARN) of the container instance (if it was
        #   previously registered).
        #   @return [String]

        # @!attribute [rw] attributes
        #   The container instance attributes that this container instance
        #   supports.
        #   @return [Array<Types::Attribute>]

      end

      class RegisterContainerInstanceResponse < Aws::Structure.new(
        :container_instance)

        # @!attribute [rw] container_instance
        #   An EC2 instance that is running the Amazon ECS agent and has been
        #   registered with a cluster.
        #   @return [Types::ContainerInstance]

      end

      # @note When making an API call, pass RegisterTaskDefinitionRequest
      #   data as a hash:
      #
      #       {
      #         family: "String", # required
      #         container_definitions: [ # required
      #           {
      #             name: "String",
      #             image: "String",
      #             cpu: 1,
      #             memory: 1,
      #             links: ["String"],
      #             port_mappings: [
      #               {
      #                 container_port: 1,
      #                 host_port: 1,
      #                 protocol: "tcp", # accepts tcp, udp
      #               },
      #             ],
      #             essential: false,
      #             entry_point: ["String"],
      #             command: ["String"],
      #             environment: [
      #               {
      #                 name: "String",
      #                 value: "String",
      #               },
      #             ],
      #             mount_points: [
      #               {
      #                 source_volume: "String",
      #                 container_path: "String",
      #                 read_only: false,
      #               },
      #             ],
      #             volumes_from: [
      #               {
      #                 source_container: "String",
      #                 read_only: false,
      #               },
      #             ],
      #             hostname: "String",
      #             user: "String",
      #             working_directory: "String",
      #             disable_networking: false,
      #             privileged: false,
      #             readonly_root_filesystem: false,
      #             dns_servers: ["String"],
      #             dns_search_domains: ["String"],
      #             extra_hosts: [
      #               {
      #                 hostname: "String", # required
      #                 ip_address: "String", # required
      #               },
      #             ],
      #             docker_security_options: ["String"],
      #             docker_labels: {
      #               "String" => "String",
      #             },
      #             ulimits: [
      #               {
      #                 name: "core", # required, accepts core, cpu, data, fsize, locks, memlock, msgqueue, nice, nofile, nproc, rss, rtprio, rttime, sigpending, stack
      #                 soft_limit: 1, # required
      #                 hard_limit: 1, # required
      #               },
      #             ],
      #             log_configuration: {
      #               log_driver: "json-file", # required, accepts json-file, syslog, journald, gelf, fluentd, awslogs
      #               options: {
      #                 "String" => "String",
      #               },
      #             },
      #           },
      #         ],
      #         volumes: [
      #           {
      #             name: "String",
      #             host: {
      #               source_path: "String",
      #             },
      #           },
      #         ],
      #       }
      class RegisterTaskDefinitionRequest < Aws::Structure.new(
        :family,
        :container_definitions,
        :volumes)

        # @!attribute [rw] family
        #   You must specify a `family` for a task definition, which allows you
        #   to track multiple versions of the same task definition. The `family`
        #   is used as a name for your task definition. Up to 255 letters
        #   (uppercase and lowercase), numbers, hyphens, and underscores are
        #   allowed.
        #   @return [String]

        # @!attribute [rw] container_definitions
        #   A list of container definitions in JSON format that describe the
        #   different containers that make up your task.
        #   @return [Array<Types::ContainerDefinition>]

        # @!attribute [rw] volumes
        #   A list of volume definitions in JSON format that containers in your
        #   task may use.
        #   @return [Array<Types::Volume>]

      end

      class RegisterTaskDefinitionResponse < Aws::Structure.new(
        :task_definition)

        # @!attribute [rw] task_definition
        #   The full description of the registered task definition.
        #   @return [Types::TaskDefinition]

      end

      # Describes the resources available for a container instance.
      # @note When making an API call, pass Resource
      #   data as a hash:
      #
      #       {
      #         name: "String",
      #         type: "String",
      #         double_value: 1.0,
      #         long_value: 1,
      #         integer_value: 1,
      #         string_set_value: ["String"],
      #       }
      class Resource < Aws::Structure.new(
        :name,
        :type,
        :double_value,
        :long_value,
        :integer_value,
        :string_set_value)

        # @!attribute [rw] name
        #   The name of the resource, such as `CPU`, `MEMORY`, `PORTS`, or a
        #   user-defined resource.
        #   @return [String]

        # @!attribute [rw] type
        #   The type of the resource, such as `INTEGER`, `DOUBLE`, `LONG`, or
        #   `STRINGSET`.
        #   @return [String]

        # @!attribute [rw] double_value
        #   When the `doubleValue` type is set, the value of the resource must
        #   be a double precision floating-point type.
        #   @return [Float]

        # @!attribute [rw] long_value
        #   When the `longValue` type is set, the value of the resource must be
        #   an extended precision floating-point type.
        #   @return [Integer]

        # @!attribute [rw] integer_value
        #   When the `integerValue` type is set, the value of the resource must
        #   be an integer.
        #   @return [Integer]

        # @!attribute [rw] string_set_value
        #   When the `stringSetValue` type is set, the value of the resource
        #   must be a string type.
        #   @return [Array<String>]

      end

      # @note When making an API call, pass RunTaskRequest
      #   data as a hash:
      #
      #       {
      #         cluster: "String",
      #         task_definition: "String", # required
      #         overrides: {
      #           container_overrides: [
      #             {
      #               name: "String",
      #               command: ["String"],
      #               environment: [
      #                 {
      #                   name: "String",
      #                   value: "String",
      #                 },
      #               ],
      #             },
      #           ],
      #         },
      #         count: 1,
      #         started_by: "String",
      #       }
      class RunTaskRequest < Aws::Structure.new(
        :cluster,
        :task_definition,
        :overrides,
        :count,
        :started_by)

        # @!attribute [rw] cluster
        #   The short name or full Amazon Resource Name (ARN) of the cluster on
        #   which to run your task. If you do not specify a cluster, the default
        #   cluster is assumed..
        #   @return [String]

        # @!attribute [rw] task_definition
        #   The `family` and `revision` (`family:revision`) or full Amazon
        #   Resource Name (ARN) of the task definition to run. If a `revision`
        #   is not specified, the latest `ACTIVE` revision is used.
        #   @return [String]

        # @!attribute [rw] overrides
        #   A list of container overrides in JSON format that specify the name
        #   of a container in the specified task definition and the overrides it
        #   should receive. You can override the default command for a container
        #   (that is specified in the task definition or Docker image) with a
        #   `command` override. You can also override existing environment
        #   variables (that are specified in the task definition or Docker
        #   image) on a container or add new environment variables to it with an
        #   `environment` override.
        #
        #   <note markdown="1"> A total of 8192 characters are allowed for overrides. This limit
        #   includes the JSON formatting characters of the override structure.
        #
        #    </note>
        #   @return [Types::TaskOverride]

        # @!attribute [rw] count
        #   The number of instantiations of the specified task to place on your
        #   cluster.
        #
        #   <important markdown="1"> The `count` parameter is limited to 10 tasks per call.
        #
        #    </important>
        #   @return [Integer]

        # @!attribute [rw] started_by
        #   An optional tag specified when a task is started. For example if you
        #   automatically trigger a task to run a batch process job, you could
        #   apply a unique identifier for that job to your task with the
        #   `startedBy` parameter. You can then identify which tasks belong to
        #   that job by filtering the results of a ListTasks call with the
        #   `startedBy` value. Up to 36 letters (uppercase and lowercase),
        #   numbers, hyphens, and underscores are allowed.
        #
        #   If a task is started by an Amazon ECS service, then the `startedBy`
        #   parameter contains the deployment ID of the service that starts it.
        #   @return [String]

      end

      class RunTaskResponse < Aws::Structure.new(
        :tasks,
        :failures)

        # @!attribute [rw] tasks
        #   A full description of the tasks that were run. Each task that was
        #   successfully placed on your cluster are described here.
        #   @return [Array<Types::Task>]

        # @!attribute [rw] failures
        #   Any failures associated with the call.
        #   @return [Array<Types::Failure>]

      end

      # Details on a service within a cluster
      class Service < Aws::Structure.new(
        :service_arn,
        :service_name,
        :cluster_arn,
        :load_balancers,
        :status,
        :desired_count,
        :running_count,
        :pending_count,
        :task_definition,
        :deployment_configuration,
        :deployments,
        :role_arn,
        :events,
        :created_at)

        # @!attribute [rw] service_arn
        #   The Amazon Resource Name (ARN) that identifies the service. The ARN
        #   contains the `arn:aws:ecs` namespace, followed by the region of the
        #   service, the AWS account ID of the service owner, the `service`
        #   namespace, and then the service name. For example,
        #   `arn:aws:ecs:region:012345678910:service/my-service `.
        #   @return [String]

        # @!attribute [rw] service_name
        #   The name of your service. Up to 255 letters (uppercase and
        #   lowercase), numbers, hyphens, and underscores are allowed. Service
        #   names must be unique within a cluster, but you can have similarly
        #   named services in multiple clusters within a region or across
        #   multiple regions.
        #   @return [String]

        # @!attribute [rw] cluster_arn
        #   The Amazon Resource Name (ARN) of the cluster that hosts the
        #   service.
        #   @return [String]

        # @!attribute [rw] load_balancers
        #   A list of load balancer objects, containing the load balancer name,
        #   the container name (as it appears in a container definition), and
        #   the container port to access from the load balancer.
        #   @return [Array<Types::LoadBalancer>]

        # @!attribute [rw] status
        #   The status of the service. The valid values are `ACTIVE`,
        #   `DRAINING`, or `INACTIVE`.
        #   @return [String]

        # @!attribute [rw] desired_count
        #   The desired number of instantiations of the task definition to keep
        #   running on the service. This value is specified when the service is
        #   created with CreateService, and it can be modified with
        #   UpdateService.
        #   @return [Integer]

        # @!attribute [rw] running_count
        #   The number of tasks in the cluster that are in the `RUNNING` state.
        #   @return [Integer]

        # @!attribute [rw] pending_count
        #   The number of tasks in the cluster that are in the `PENDING` state.
        #   @return [Integer]

        # @!attribute [rw] task_definition
        #   The task definition to use for tasks in the service. This value is
        #   specified when the service is created with CreateService, and it can
        #   be modified with UpdateService.
        #   @return [String]

        # @!attribute [rw] deployment_configuration
        #   Optional deployment parameters that control how many tasks run
        #   during the deployment and the ordering of stopping and starting
        #   tasks.
        #   @return [Types::DeploymentConfiguration]

        # @!attribute [rw] deployments
        #   The current state of deployments for the service.
        #   @return [Array<Types::Deployment>]

        # @!attribute [rw] role_arn
        #   The Amazon Resource Name (ARN) of the IAM role associated with the
        #   service that allows the Amazon ECS container agent to register
        #   container instances with a load balancer.
        #   @return [String]

        # @!attribute [rw] events
        #   The event stream for your service. A maximum of 100 of the latest
        #   events are displayed.
        #   @return [Array<Types::ServiceEvent>]

        # @!attribute [rw] created_at
        #   The Unix time in seconds and milliseconds when the service was
        #   created.
        #   @return [Time]

      end

      # Details on an event associated with a service.
      class ServiceEvent < Aws::Structure.new(
        :id,
        :created_at,
        :message)

        # @!attribute [rw] id
        #   The ID string of the event.
        #   @return [String]

        # @!attribute [rw] created_at
        #   The Unix time in seconds and milliseconds when the event was
        #   triggered.
        #   @return [Time]

        # @!attribute [rw] message
        #   The event message.
        #   @return [String]

      end

      # @note When making an API call, pass StartTaskRequest
      #   data as a hash:
      #
      #       {
      #         cluster: "String",
      #         task_definition: "String", # required
      #         overrides: {
      #           container_overrides: [
      #             {
      #               name: "String",
      #               command: ["String"],
      #               environment: [
      #                 {
      #                   name: "String",
      #                   value: "String",
      #                 },
      #               ],
      #             },
      #           ],
      #         },
      #         container_instances: ["String"], # required
      #         started_by: "String",
      #       }
      class StartTaskRequest < Aws::Structure.new(
        :cluster,
        :task_definition,
        :overrides,
        :container_instances,
        :started_by)

        # @!attribute [rw] cluster
        #   The short name or full Amazon Resource Name (ARN) of the cluster on
        #   which to start your task. If you do not specify a cluster, the
        #   default cluster is assumed..
        #   @return [String]

        # @!attribute [rw] task_definition
        #   The `family` and `revision` (`family:revision`) or full Amazon
        #   Resource Name (ARN) of the task definition to start. If a `revision`
        #   is not specified, the latest `ACTIVE` revision is used.
        #   @return [String]

        # @!attribute [rw] overrides
        #   A list of container overrides in JSON format that specify the name
        #   of a container in the specified task definition and the overrides it
        #   should receive. You can override the default command for a container
        #   (that is specified in the task definition or Docker image) with a
        #   `command` override. You can also override existing environment
        #   variables (that are specified in the task definition or Docker
        #   image) on a container or add new environment variables to it with an
        #   `environment` override.
        #
        #   <note markdown="1"> A total of 8192 characters are allowed for overrides. This limit
        #   includes the JSON formatting characters of the override structure.
        #
        #    </note>
        #   @return [Types::TaskOverride]

        # @!attribute [rw] container_instances
        #   The container instance IDs or full Amazon Resource Name (ARN)
        #   entries for the container instances on which you would like to place
        #   your task.
        #
        #   <important markdown="1"> The list of container instances to start tasks on is limited to 10.
        #
        #    </important>
        #   @return [Array<String>]

        # @!attribute [rw] started_by
        #   An optional tag specified when a task is started. For example if you
        #   automatically trigger a task to run a batch process job, you could
        #   apply a unique identifier for that job to your task with the
        #   `startedBy` parameter. You can then identify which tasks belong to
        #   that job by filtering the results of a ListTasks call with the
        #   `startedBy` value. Up to 36 letters (uppercase and lowercase),
        #   numbers, hyphens, and underscores are allowed.
        #
        #   If a task is started by an Amazon ECS service, then the `startedBy`
        #   parameter contains the deployment ID of the service that starts it.
        #   @return [String]

      end

      class StartTaskResponse < Aws::Structure.new(
        :tasks,
        :failures)

        # @!attribute [rw] tasks
        #   A full description of the tasks that were started. Each task that
        #   was successfully placed on your container instances are described
        #   here.
        #   @return [Array<Types::Task>]

        # @!attribute [rw] failures
        #   Any failures associated with the call.
        #   @return [Array<Types::Failure>]

      end

      # @note When making an API call, pass StopTaskRequest
      #   data as a hash:
      #
      #       {
      #         cluster: "String",
      #         task: "String", # required
      #         reason: "String",
      #       }
      class StopTaskRequest < Aws::Structure.new(
        :cluster,
        :task,
        :reason)

        # @!attribute [rw] cluster
        #   The short name or full Amazon Resource Name (ARN) of the cluster
        #   that hosts the task to stop. If you do not specify a cluster, the
        #   default cluster is assumed..
        #   @return [String]

        # @!attribute [rw] task
        #   The task ID or full Amazon Resource Name (ARN) entry of the task to
        #   stop.
        #   @return [String]

        # @!attribute [rw] reason
        #   An optional message specified when a task is stopped. For example,
        #   if you are using a custom scheduler, you can use this parameter to
        #   specify the reason for stopping the task here, and the message will
        #   appear in subsequent DescribeTasks API operations on this task. Up
        #   to 255 characters are allowed in this message.
        #   @return [String]

      end

      class StopTaskResponse < Aws::Structure.new(
        :task)

        # @!attribute [rw] task
        #   Details on a task in a cluster.
        #   @return [Types::Task]

      end

      # @note When making an API call, pass SubmitContainerStateChangeRequest
      #   data as a hash:
      #
      #       {
      #         cluster: "String",
      #         task: "String",
      #         container_name: "String",
      #         status: "String",
      #         exit_code: 1,
      #         reason: "String",
      #         network_bindings: [
      #           {
      #             bind_ip: "String",
      #             container_port: 1,
      #             host_port: 1,
      #             protocol: "tcp", # accepts tcp, udp
      #           },
      #         ],
      #       }
      class SubmitContainerStateChangeRequest < Aws::Structure.new(
        :cluster,
        :task,
        :container_name,
        :status,
        :exit_code,
        :reason,
        :network_bindings)

        # @!attribute [rw] cluster
        #   The short name or full Amazon Resource Name (ARN) of the cluster
        #   that hosts the container.
        #   @return [String]

        # @!attribute [rw] task
        #   The task ID or full Amazon Resource Name (ARN) of the task that
        #   hosts the container.
        #   @return [String]

        # @!attribute [rw] container_name
        #   The name of the container.
        #   @return [String]

        # @!attribute [rw] status
        #   The status of the state change request.
        #   @return [String]

        # @!attribute [rw] exit_code
        #   The exit code returned for the state change request.
        #   @return [Integer]

        # @!attribute [rw] reason
        #   The reason for the state change request.
        #   @return [String]

        # @!attribute [rw] network_bindings
        #   The network bindings of the container.
        #   @return [Array<Types::NetworkBinding>]

      end

      class SubmitContainerStateChangeResponse < Aws::Structure.new(
        :acknowledgment)

        # @!attribute [rw] acknowledgment
        #   Acknowledgement of the state change.
        #   @return [String]

      end

      # @note When making an API call, pass SubmitTaskStateChangeRequest
      #   data as a hash:
      #
      #       {
      #         cluster: "String",
      #         task: "String",
      #         status: "String",
      #         reason: "String",
      #       }
      class SubmitTaskStateChangeRequest < Aws::Structure.new(
        :cluster,
        :task,
        :status,
        :reason)

        # @!attribute [rw] cluster
        #   The short name or full Amazon Resource Name (ARN) of the cluster
        #   that hosts the task.
        #   @return [String]

        # @!attribute [rw] task
        #   The task ID or full Amazon Resource Name (ARN) of the task in the
        #   state change request.
        #   @return [String]

        # @!attribute [rw] status
        #   The status of the state change request.
        #   @return [String]

        # @!attribute [rw] reason
        #   The reason for the state change request.
        #   @return [String]

      end

      class SubmitTaskStateChangeResponse < Aws::Structure.new(
        :acknowledgment)

        # @!attribute [rw] acknowledgment
        #   Acknowledgement of the state change.
        #   @return [String]

      end

      # Details on a task in a cluster.
      class Task < Aws::Structure.new(
        :task_arn,
        :cluster_arn,
        :task_definition_arn,
        :container_instance_arn,
        :overrides,
        :last_status,
        :desired_status,
        :containers,
        :started_by,
        :stopped_reason,
        :created_at,
        :started_at,
        :stopped_at)

        # @!attribute [rw] task_arn
        #   The Amazon Resource Name (ARN) of the task.
        #   @return [String]

        # @!attribute [rw] cluster_arn
        #   The Amazon Resource Name (ARN) of the cluster that hosts the task.
        #   @return [String]

        # @!attribute [rw] task_definition_arn
        #   The Amazon Resource Name (ARN) of the task definition that creates
        #   the task.
        #   @return [String]

        # @!attribute [rw] container_instance_arn
        #   The Amazon Resource Name (ARN) of the container instances that host
        #   the task.
        #   @return [String]

        # @!attribute [rw] overrides
        #   One or more container overrides.
        #   @return [Types::TaskOverride]

        # @!attribute [rw] last_status
        #   The last known status of the task.
        #   @return [String]

        # @!attribute [rw] desired_status
        #   The desired status of the task.
        #   @return [String]

        # @!attribute [rw] containers
        #   The containers associated with the task.
        #   @return [Array<Types::Container>]

        # @!attribute [rw] started_by
        #   The tag specified when a task is started. If the task is started by
        #   an Amazon ECS service, then the `startedBy` parameter contains the
        #   deployment ID of the service that starts it.
        #   @return [String]

        # @!attribute [rw] stopped_reason
        #   The reason the task was stopped.
        #   @return [String]

        # @!attribute [rw] created_at
        #   The Unix time in seconds and milliseconds when the task was created
        #   (the task entered the `PENDING` state).
        #   @return [Time]

        # @!attribute [rw] started_at
        #   The Unix time in seconds and milliseconds when the task was started
        #   (the task transitioned from the `PENDING` state to the `RUNNING`
        #   state).
        #   @return [Time]

        # @!attribute [rw] stopped_at
        #   The Unix time in seconds and milliseconds when the task was stopped
        #   (the task transitioned from the `RUNNING` state to the `STOPPED`
        #   state).
        #   @return [Time]

      end

      # Details of a task definition.
      class TaskDefinition < Aws::Structure.new(
        :task_definition_arn,
        :container_definitions,
        :family,
        :revision,
        :volumes,
        :status,
        :requires_attributes)

        # @!attribute [rw] task_definition_arn
        #   The full Amazon Resource Name (ARN) of the task definition.
        #   @return [String]

        # @!attribute [rw] container_definitions
        #   A list of container definitions in JSON format that describe the
        #   different containers that make up your task. For more information
        #   about container definition parameters and defaults, see [Amazon ECS
        #   Task Definitions][1] in the *Amazon EC2 Container Service Developer
        #   Guide*.
        #
        #
        #
        #   [1]: http://docs.aws.amazon.com/http:/docs.aws.amazon.com/AmazonECS/latest/developerguidetask_defintions.html
        #   @return [Array<Types::ContainerDefinition>]

        # @!attribute [rw] family
        #   The family of your task definition, used as the definition name.
        #   @return [String]

        # @!attribute [rw] revision
        #   The revision of the task in a particular family. The revision is a
        #   version number of a task definition in a family. When you register a
        #   task definition for the first time, the revision is `1`; each time
        #   you register a new revision of a task definition in the same family,
        #   the revision value always increases by one (even if you have
        #   deregistered previous revisions in this family).
        #   @return [Integer]

        # @!attribute [rw] volumes
        #   The list of volumes in a task. For more information about volume
        #   definition parameters and defaults, see [Amazon ECS Task
        #   Definitions][1] in the *Amazon EC2 Container Service Developer
        #   Guide*.
        #
        #
        #
        #   [1]: http://docs.aws.amazon.com/http:/docs.aws.amazon.com/AmazonECS/latest/developerguidetask_defintions.html
        #   @return [Array<Types::Volume>]

        # @!attribute [rw] status
        #   The status of the task definition.
        #   @return [String]

        # @!attribute [rw] requires_attributes
        #   The container instance attributes required by your task.
        #   @return [Array<Types::Attribute>]

      end

      # The overrides associated with a task.
      # @note When making an API call, pass TaskOverride
      #   data as a hash:
      #
      #       {
      #         container_overrides: [
      #           {
      #             name: "String",
      #             command: ["String"],
      #             environment: [
      #               {
      #                 name: "String",
      #                 value: "String",
      #               },
      #             ],
      #           },
      #         ],
      #       }
      class TaskOverride < Aws::Structure.new(
        :container_overrides)

        # @!attribute [rw] container_overrides
        #   One or more container overrides sent to a task.
        #   @return [Array<Types::ContainerOverride>]

      end

      # The `ulimit` settings to pass to the container.
      # @note When making an API call, pass Ulimit
      #   data as a hash:
      #
      #       {
      #         name: "core", # required, accepts core, cpu, data, fsize, locks, memlock, msgqueue, nice, nofile, nproc, rss, rtprio, rttime, sigpending, stack
      #         soft_limit: 1, # required
      #         hard_limit: 1, # required
      #       }
      class Ulimit < Aws::Structure.new(
        :name,
        :soft_limit,
        :hard_limit)

        # @!attribute [rw] name
        #   The `type` of the `ulimit`.
        #   @return [String]

        # @!attribute [rw] soft_limit
        #   The soft limit for the ulimit type.
        #   @return [Integer]

        # @!attribute [rw] hard_limit
        #   The hard limit for the ulimit type.
        #   @return [Integer]

      end

      # @note When making an API call, pass UpdateContainerAgentRequest
      #   data as a hash:
      #
      #       {
      #         cluster: "String",
      #         container_instance: "String", # required
      #       }
      class UpdateContainerAgentRequest < Aws::Structure.new(
        :cluster,
        :container_instance)

        # @!attribute [rw] cluster
        #   The short name or full Amazon Resource Name (ARN) of the cluster
        #   that your container instance is running on. If you do not specify a
        #   cluster, the default cluster is assumed.
        #   @return [String]

        # @!attribute [rw] container_instance
        #   The container instance ID or full Amazon Resource Name (ARN) entries
        #   for the container instance on which you would like to update the
        #   Amazon ECS container agent.
        #   @return [String]

      end

      class UpdateContainerAgentResponse < Aws::Structure.new(
        :container_instance)

        # @!attribute [rw] container_instance
        #   An EC2 instance that is running the Amazon ECS agent and has been
        #   registered with a cluster.
        #   @return [Types::ContainerInstance]

      end

      # @note When making an API call, pass UpdateServiceRequest
      #   data as a hash:
      #
      #       {
      #         cluster: "String",
      #         service: "String", # required
      #         desired_count: 1,
      #         task_definition: "String",
      #         deployment_configuration: {
      #           maximum_percent: 1,
      #           minimum_healthy_percent: 1,
      #         },
      #       }
      class UpdateServiceRequest < Aws::Structure.new(
        :cluster,
        :service,
        :desired_count,
        :task_definition,
        :deployment_configuration)

        # @!attribute [rw] cluster
        #   The short name or full Amazon Resource Name (ARN) of the cluster
        #   that your service is running on. If you do not specify a cluster,
        #   the default cluster is assumed.
        #   @return [String]

        # @!attribute [rw] service
        #   The name of the service to update.
        #   @return [String]

        # @!attribute [rw] desired_count
        #   The number of instantiations of the task to place and keep running
        #   in your service.
        #   @return [Integer]

        # @!attribute [rw] task_definition
        #   The `family` and `revision` (`family:revision`) or full Amazon
        #   Resource Name (ARN) of the task definition to run in your service.
        #   If a `revision` is not specified, the latest `ACTIVE` revision is
        #   used. If you modify the task definition with `UpdateService`, Amazon
        #   ECS spawns a task with the new version of the task definition and
        #   then stops an old task after the new version is running.
        #   @return [String]

        # @!attribute [rw] deployment_configuration
        #   Optional deployment parameters that control how many tasks run
        #   during the deployment and the ordering of stopping and starting
        #   tasks.
        #   @return [Types::DeploymentConfiguration]

      end

      class UpdateServiceResponse < Aws::Structure.new(
        :service)

        # @!attribute [rw] service
        #   The full description of your service following the update call.
        #   @return [Types::Service]

      end

      # The Docker and Amazon ECS container agent version information about a
      # container instance.
      # @note When making an API call, pass VersionInfo
      #   data as a hash:
      #
      #       {
      #         agent_version: "String",
      #         agent_hash: "String",
      #         docker_version: "String",
      #       }
      class VersionInfo < Aws::Structure.new(
        :agent_version,
        :agent_hash,
        :docker_version)

        # @!attribute [rw] agent_version
        #   The version number of the Amazon ECS container agent.
        #   @return [String]

        # @!attribute [rw] agent_hash
        #   The Git commit hash for the Amazon ECS container agent build on the
        #   [amazon-ecs-agent ][1] GitHub repository.
        #
        #
        #
        #   [1]: https://github.com/aws/amazon-ecs-agent/commits/master
        #   @return [String]

        # @!attribute [rw] docker_version
        #   The Docker version running on the container instance.
        #   @return [String]

      end

      # A data volume used in a task definition.
      # @note When making an API call, pass Volume
      #   data as a hash:
      #
      #       {
      #         name: "String",
      #         host: {
      #           source_path: "String",
      #         },
      #       }
      class Volume < Aws::Structure.new(
        :name,
        :host)

        # @!attribute [rw] name
        #   The name of the volume. Up to 255 letters (uppercase and lowercase),
        #   numbers, hyphens, and underscores are allowed. This name is
        #   referenced in the `sourceVolume` parameter of container definition
        #   `mountPoints`.
        #   @return [String]

        # @!attribute [rw] host
        #   The contents of the `host` parameter determine whether your data
        #   volume persists on the host container instance and where it is
        #   stored. If the host parameter is empty, then the Docker daemon
        #   assigns a host path for your data volume, but the data is not
        #   guaranteed to persist after the containers associated with it stop
        #   running.
        #   @return [Types::HostVolumeProperties]

      end

      # Details on a data volume from another container.
      # @note When making an API call, pass VolumeFrom
      #   data as a hash:
      #
      #       {
      #         source_container: "String",
      #         read_only: false,
      #       }
      class VolumeFrom < Aws::Structure.new(
        :source_container,
        :read_only)

        # @!attribute [rw] source_container
        #   The name of the container to mount volumes from.
        #   @return [String]

        # @!attribute [rw] read_only
        #   If this value is `true`, the container has read-only access to the
        #   volume. If this value is `false`, then the container can write to
        #   the volume. The default value is `false`.
        #   @return [Boolean]

      end

    end
  end
end
