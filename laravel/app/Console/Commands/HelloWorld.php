<?php

namespace App\Console\Commands;

use App\Jobs\HelloWorld as HelloWorldJob;
use Illuminate\Console\Command;

class HelloWorld extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'app:hello-world';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'An artisan command that just logs a message';

    /**
     * Execute the console command.
     */
    public function handle()
    {
        logger('hello world command');

        HelloWorldJob::dispatch();
    }
}
