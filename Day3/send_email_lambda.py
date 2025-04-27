import boto3

def lambda_handler(event, context):
    ses = boto3.client('ses')
    response = ses.send_email(
        Source='hagar.elsherif2018@gmail.com', 
        Destination={
            'ToAddresses': ['hagar.elsherif2018@gmail.com'],
        },
        Message={
            'Subject': {
                'Data': 'Terraform State File Changed!',
                'Charset': 'UTF-8'
            },
            'Body': {
                'Text': {
                    'Data': 'Your Terraform state file has been updated in S3.',
                    'Charset': 'UTF-8'
                }
            }
        }
    )
    return response
