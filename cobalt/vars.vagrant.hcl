{{ $is_vagrant := true }}
{{ $service_nw_mode := "pod-network" }}
{{ $nginx_nw_mode := "pod-network" }}

# Dev overrides
{{ $nginx_count := "1" }}
{{ $nginx_port := "8080" }}
{{ $nginx_memory := "200" }}
{{ $nginx_cpu := "500" }}
{{ $test_service_count := "1" }}

# Variables related to task1
{{ $task1_count := "1" }}
{{ $task1_port := "8080" }}
{{ $task1_memory := "1024" }}
{{ $task1_cpu := "512" }}
{{ $task1_spring_profiles_active := "local" }}
{{ $task1_java_opts := "-Xrunjdwp:transport=dt_socket,server=y,suspend=n,address=5005" }}


# Variables related to util
{{ $util_count := "1" }}
{{ $util_port := "8080" }}
{{ $util_memory := "1024" }}
{{ $util_cpu := "512" }}
{{ $util_spring_profiles_active := "local" }}
{{ $util_java_opts := "-Xrunjdwp:transport=dt_socket,server=y,suspend=n,address=5005" }}

{{ $job_name := "spotbuy" }}

