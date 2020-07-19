This example uses the http-gateway-for-lambda module to front a very simple lambda.

# Usage

Before 'terraform apply', build the lamba deployment package first.

```
zip -j build/lambda_function_payload.zip src/index.js
```

The sample project does not require any variables to be set. However, using defaults it will deploy to ap-southeast-2.

After it has been deployed, the show-commands.sh script will show sample commands that can be issued (e.g. curl the api). It requires jq to be installed.

# Example Commands
The following commands are those output when show-commands.sh is run.

To test (note the backslash added on the end of the api\_involve\_url output):
```
curl -i {outputs.api_invoke_url}/
```

Or, if JWT authorization is setup, get a token then:
```
curl -i \
--url {outputs.api_invoke_url}/ \
--header 'authorization: Bearer {auth token}
```

For troubleshooting, try invoking the lambda directory to confirm it is working:
```
aws lambda invoke --function-name {outputs.lambda_name} --payload '{}' response.json
```

