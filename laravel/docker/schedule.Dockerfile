FROM bref/arm-php-82-console:2

COPY . /var/task

CMD ["artisan"]
