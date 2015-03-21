upstream blog {
  server unix:/tmp/unicorn.blog.sock fail_timeout=0;
}

server {
  listen 80 default_server;
  server_name localhost;

  try_files $uri/index.html $uri @blog;

  location @blog {
    proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
    proxy_set_header Host $http_host;
    proxy_redirect off;
    proxy_pass http://blog;
  }

  error_page 500 502 503 504 /500.html;
}
