@dir = "."

worker_processes 2
working_directory @dir
preload_app true
timeout 30

listen "/tmp/unicorn.blog.sock", :backlog => 64

pid "/tmp/unicorn.blog.pid"
stderr_path "/tmp/unicorn.blog.log"
stdout_path "/tmp/unicorn.blog.log"
