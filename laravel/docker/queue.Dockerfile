FROM bref/arm-php-82:2

COPY . /var/task

CMD ["Bref\\LaravelBridge\\Queue\\QueueHandler"]
