job "{{ $job_name }}" {
	[[ file "job.common.hcl" ]]

	group "web" {
        count = {{ $nginx_count}}
		[[ file "group.common.hcl" ]]

        constraint {
            distinct_hosts = "true"
        }

        task "nginx" {
			[[ file "task.common.hcl" ]]

			config {
				image        = "{{ env "DOCKER_REGISTRY" }}/{{ $product_path }}/nginx:{{ $build_number }}"
				network_mode = "{{ $nginx_nw_mode }}"
				port_map = {
					nginx_port = 80
				}
				[[ file "registry.auth.hcl" ]]
			}

			env {
				[[ file "env.hcl" ]]
                PROXIED_SERVICE_0         = "task1"
                REAL_IP_ENABLED           = "{{ $nginx_real_ip_enabled }}"
                INCLUDE_INDEX_HTML        = "false"
			}


            resources {
				cpu    = {{ $nginx_cpu }} # MHz
				memory = {{ $nginx_memory }} # MB

                network {
                    mbits = 10
                    port "nginx_port"{}
                    port "stats" {}
					port "cobalt" {}
                }
            }
        }
        meta {
            is.entry = "true"
        }
    }

	group "task1" {
		[[ file "group.common.hcl" ]]
        count = {{ $task1_count }}

        task "task1" {
			[[ file "task.common.hcl" ]]

			config {
				image = "{{ env "DOCKER_REGISTRY" }}/{{ $product_path }}:{{ $build_number }}"
				privileged = true
				userns_mode = "host"
				network_mode = "{{ $service_nw_mode }}"
				port_map = {
					service_port = {{ $task1_port }}
					{{ if $is_vagrant  }}
            debug_port = 5006
          {{ end }}
				}
                [[ file "service.volumes.hcl" ]]
				[[ file "registry.auth.hcl" ]]

			}

			env {
				[[ file "env.hcl" ]]
				SPRING_PROFILES_ACTIVE="{{ $task1_spring_profiles_active }}"
				NFS_SRC_PATH="{{ $nfs_src_path }}"
                NFS_MOUNT_PATH="{{ $nfs_mount_path }}"
                JAVA_OPTS = "{{ $task1_java_opts }}"
			}

            resources {
                cpu    = {{ $task1_cpu }} # MHz
                memory = {{ $task1_memory }} # MB

                network {
                    mbits = 10
                    port "service_port"{}
                    port "stats" {}
                    port "task1" {}
                    {{ if $is_vagrant  }}
                      port "debug_port" {
                        static = 5006
                      }
                    {{ end }}
                }
            }
        }

        meta {
            is.entry = "false"
        }
    }

    group "util" {
    		[[ file "group.common.hcl" ]]
            count = {{ $util_count }}

            task "task1" {
    			[[ file "task.common.hcl" ]]

    			config {
    				image = "{{ env "DOCKER_REGISTRY" }}/{{ $product_path }}:{{ $build_number }}"
    				privileged = true
    				userns_mode = "host"
    				network_mode = "{{ $service_nw_mode }}"
    				port_map = {
    					service_port = {{ $util_port }}
    					{{ if $is_vagrant  }}
                debug_port = 5006
              {{ end }}
    				}
                    [[ file "service.volumes.hcl" ]]
    				[[ file "registry.auth.hcl" ]]

    			}

    			env {
    				[[ file "env.hcl" ]]
    				SPRING_PROFILES_ACTIVE="{{ $util_spring_profiles_active }}"
    				NFS_SRC_PATH="{{ $nfs_src_path }}"
                    NFS_MOUNT_PATH="{{ $nfs_mount_path }}"
                    JAVA_OPTS = "{{ $util_java_opts }}"
    			}

                resources {
                    cpu    = {{ $util_cpu }} # MHz
                    memory = {{ $util_memory }} # MB

                    network {
                        mbits = 10
                        port "service_port"{}
                        port "stats" {}
                        port "util" {}
                        {{ if $is_vagrant  }}
                          port "debug_port" {
                            static = 5006
                          }
                        {{ end }}
                    }
                }
            }

            meta {
                is.entry = "false"
            }
        }

	meta {
		[[ file "env.hcl" ]]
	}
}
