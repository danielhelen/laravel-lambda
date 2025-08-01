<?php

use App\Console\Commands\HelloWorld;
use Illuminate\Support\Facades\Schedule;

Schedule::command(HelloWorld::class)->everyFiveMinutes();
