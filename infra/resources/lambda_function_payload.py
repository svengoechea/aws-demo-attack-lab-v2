import requests,json,hmac,hashlib, time, re, boto3, botocore, os
from datetime import datetime
from urllib.parse import urlencode
from botocore.exceptions import ClientError

def lambda_handler(event, context):
    print("Hello World")