# Update system and install Nginx package
package { 'nginx':
  ensure => 'installed',
  require => Exec['update_system'],
}

exec { 'update_system':
  command => '/usr/bin/apt-get update',
  refreshonly => true,  # Only run when triggered
}

# Ensure the index.html file exists
file { '/var/www/html/index.html':
  ensure  => 'file',
  content => 'Hello World!',
}

# Use a template to manage Nginx configuration
file { '/etc/nginx/sites-available/default':
  ensure  => 'file',
  content => template('module/nginx/default.conf.erb'),
  notify  => Service['nginx'],  # Restart Nginx service when configuration changes
}

# Restart Nginx service
service { 'nginx':
  ensure => 'running',
  enable => true,
  require => Package['nginx'],
}

server {
    listen 80 default_server;
    listen [::]:80 default_server;

    root /var/www/html;
    index index.html;

    server_name _;

    location /redirect_me {
        rewrite ^/redirect_me https://www.youtube.com/watch?v=QH2-TGUlwu4 permanent;
    }

    # Additional server configuration can go here
}

