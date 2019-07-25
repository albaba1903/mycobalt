# Dev overrides
{{ $nginx_count := "1" }}
{{ $nginx_port := "8080" }}
{{ $nginx_memory := "200" }}
{{ $nginx_cpu := "500" }}
{{ $test_service_count := "1" }}

# Variables related to task1
{{ $task1_count := "2" }}
{{ $task1_cpu := "512" }}
{{ $task1_memory := "512" }}
{{ $task1_port := "8080" }}
{{ $task1_debug_port := "5005" }}
{{ $task1_java_opts := "" }}
{{ $task1_spring_profiles_active := "itg" }}


# Variables related to util
{{ $util_count := "2" }}
{{ $util_cpu := "512" }}
{{ $util_memory := "8192" }}
{{ $util_port := "8080" }}
{{ $util_debug_port := "5005" }}
{{ $util_java_opts := "" }}
{{ $util_spring_profiles_active := "itg" }}