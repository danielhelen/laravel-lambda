# Build Placeholder Image

When you create a new Lambda function that uses a container image, you have to specify an image in an Amazon Elastic Container Registry.

This creates a chicken and egg problem because we want to define all our AWS infrastructure before running our continuous deployment pipeline for the first time.

Therefore this script creates a simple image you can use as a placeholder.

## Usage

Ensure you have a `.env` file at the root of the repo. If not, run `cp .env.example .env` and fill out the missing details.

Ensure you have the Docker Engine installed (e.g. via Docker Desktop) and it is running.

Run the bash script to build and push the placeholder image. In this directory run:

```bash
./build.bash
```
