FROM bref/arm-php-84:2

COPY . /var/task

CMD ["Bref\\LaravelBridge\\Http\\OctaneHandler"]

