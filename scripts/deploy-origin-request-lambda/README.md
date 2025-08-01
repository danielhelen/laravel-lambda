# Deploy Edge Lambda

Builds and deploys Lambda@Edge functions.

You will need to provide the Lambda function name.

It will create a new version of the lambda. You will then need to update CloudFront with the new version.

N.B. CloudFront does not support aliases for Lambda@Edge functions.

## Usage

Ensure you have a `.env` file at the root of the repo. If not, run `cp .env.example .env` and fill out the missing details.

Run the script. It will prompt you for the name of the Lambda@Edge function.

```bash
./deploy.bash
```
