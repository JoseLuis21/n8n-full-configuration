ssl_certificate /etc/nginx/certs/yourdomain.com.crt;
ssl_certificate_key /etc/nginx/certs/yourdomain.com.key;

ssl_protocols TLSv1.2 TLSv1.3;
ssl_ciphers HIGH:!aNULL:!MD5;
