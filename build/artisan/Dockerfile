FROM exadra37/php-fpm-laravel5

ARG CONTAINER_USER='php-fpm'

RUN apt-get update && \
    apt-get -y upgrade && \
    apt-get -y install \
        curl \
        git \
        zsh && \

    # Install Composer
    php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" && \
    php composer-setup.php --install-dir=/usr/bin --filename=composer && \
    rm -rvf composer-setup.php && \

    # Intall Oh My Zsh for root user
    bash -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" && \

    # Intall Oh My Zsh for root user
    # change from /usr/sbin/nologin to /usr/sbin/zsh
    usermod -s /usr/bin/zsh "${CONTAINER_USER}" && \
    su "${CONTAINER_USER}" -c 'bash -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"'

ENTRYPOINT ["su", "php-fpm"]

#CMD ["cd", "/home/php-fpm"]
