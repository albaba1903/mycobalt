{{ $service_nw_mode := printf "sellerdirect-app-epg/%s" $tenant }}
{{ $nginx_nw_mode := printf "sellerdirect-web-epg/%s" $tenant }}

{{ $nfs_src_path := "/sellerdirect" }}

# Variables related to NGINX
{{ $nginx_count := "2" }}
{{ $nginx_port := "80" }}
{{ $nginx_memory := "2048" }}
{{ $nginx_cpu := "512" }}
{{ $nginx_real_ip_enabled := "true" }}

# Variables related to API server
{{ $task1_count := "4" }}
{{ $task1_cpu := "1200" }}
{{ $task1_memory := "8192" }}
{{ $task1_port := "8080" }}
{{ $task1_debug_port := "5005" }}
{{ $task1_java_opts := "" }}
{{ $task1_spring_profiles_active := "prod" }}


# Variables related to util
{{ $util_count := "2" }}
{{ $util_cpu := "512" }}
{{ $util_memory := "8192" }}
{{ $util_port := "8080" }}
{{ $util_debug_port := "5005" }}
{{ $util_java_opts := "" }}
{{ $util_spring_profiles_active := "prod" }}