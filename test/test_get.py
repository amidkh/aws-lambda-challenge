import boto3
import json

lambda_client = boto3.client('lambda')

invoke_response = lambda_client.invoke(FunctionName='lambda-get', 
                     InvocationType='RequestResponse')

                     

data = json.loads(invoke_response['Payload'].read())

print ("Response: ", end='\n')
print ("Welcome to our demo API, here are the details of your request: ", end='\n' )
print (f'Headers: Get Body:  {data}')
