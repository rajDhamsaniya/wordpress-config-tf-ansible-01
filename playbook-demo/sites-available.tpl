server {
        listen 80;
        listen [::]:80;
        root /var/www/html/{{ domain_name }};
        # Add index.php to the list if you are using PHP
        index index.php index.html index.htm index.nginx-debian.html;
        server_name {{ domain_name }} www.{{ domain_name }};
        location / {
                try_files $uri $uri/ =404;
        }
        # pass the PHP scripts to FastCGI server listening on 127.0.0.1:9000
        #
        location ~ \.php$ {
                include snippets/fastcgi-php.conf;
                fastcgi_pass unix:/run/php/php7.2-fpm.sock;
        }
}