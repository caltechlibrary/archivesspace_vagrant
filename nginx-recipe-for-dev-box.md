

Creating the self-signed certs for development use (if you're testing with SSL)

```
    sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/nginx/ssl/dev-test.key -out /etc/nginx/ssl/dev-test.crt
```

Make sure there is a line in http server block of /etc/nginx/nginx.conf looks like

```
    include /etc/nginx/conf.d/*;
```

On my dev box I add a config file /etc/nginx/conf.d/dev-test.conf looks like

```
    server {
        listen       80;
        #listen       443 ssl;
        # Your machine will vary, this is just an example,
        #     server_name  mydev.example.edu;
        server_name localhost;

        #ssl_certificate     /etc/nginx/ssl/dev-test.crt;
        #ssl_certificate_key /etc/nginx/ssl/dev-test.key;
        #ssl_protocols       TLSv1 TLSv1.1 TLSv1.2;
        #ssl_ciphers         HIGH:!aNULL:!MD5;


        #error_log /var/log/nginx/dev-test.error.log;
        #access_log  /var/log/nginx/dev-test.access.log;

        # Force https
        #if ($scheme != "https") {
        #    rewrite ^ https://$host$uri permanent;
        #}

        #location / {
        #    root   /archivesspace/html;
        #    index  index.html;
        #}

        location /admin/ {
            proxy_pass http://localhost:8080/;
        }

        # We are not using the ArchivesSpace public UI
        location /public/ {
            proxy_pass http://localhost:8081/;
        }

        #error_page  404              /404.html;

        # redirect server error pages to the static page /50x.html
        #
        #error_page   500 502 503 504  /50x.html;
        #location = /50x.html {
        #    root   /www/html;
        #}

        # deny access to .htaccess files, if Apache's document root
        # concurs with nginx's one
        #
        location ~ /\.ht {
            deny  all;
        }

        # prevent .git directories from being served out via http/https
        location ~ /\.git {
            deny all;
        }
    }
```
