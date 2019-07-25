{{ $app_name := "spotbuy" }}
{{ $product_path := "ariba-spotbuy" }}
{{ $is_vagrant := false }}

[[ file "default.vars.hcl" ]]

# Common variables
{{ $service_nw_mode := "contiv-pod-net" }}
{{ $nginx_nw_mode := "contiv-pod-net" }}

{{ $nfs_src_path := "/nfs/spotbuy" }}
{{ $nfs_mount_path := "/tmp/nfs" }}

# Variables related to NGINX
{{ $nginx_count := "2" }}
{{ $nginx_port := "80" }}
{{ $nginx_memory := "1024" }}
{{ $nginx_cpu := "512" }}
{{ $nginx_real_ip_enabled := "true" }}

# Variables related to task1
{{ $task1_count := "2" }}
{{ $task1_cpu := "512" }}
{{ $task1_memory := "8192" }}
{{ $task1_port := "8080" }}
{{ $task1_debug_port := "5005" }}
{{ $task1_java_opts := "" }}


# Variables related to util
{{ $util_count := "2" }}
{{ $util_cpu := "512" }}
{{ $util_memory := "8192" }}
{{ $util_port := "8080" }}
{{ $util_debug_port := "5005" }}
{{ $util_java_opts := "" }}