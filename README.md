## Solution
1. We are going to have two AWS Lambda : *lambda-get* (src/get.py) and *lambda-post* (src/post.py).
2. Cover that AWS Lambda by tests : *lambda-get* (test/test_get.py) and *lambda-post* (src/test_post.py).
3. Use GitHub Action with Terraform cli for our CI/CD.
4. Place to store the state file - S3 bucket.

## How to?
1. Clone this repo. 
2. Add a secret name and value for each secret in "Settings":
![image](https://drive.google.com/uc?export=view&id=1PBOix6Mgqo4uoUCJtaZ3Hh5tzzzQB0mJ)
3. Use the exact names AWS_ACCESS_KEY_ID, AWS_SECRET_ACCESS_KEY and AWS_DEFAULT_REGION:
![image](https://drive.google.com/uc?export=view&id=1eP0C5kldta3jwrsxV9j73ezroQm56S8z)
4. Create S3 bucket and put it in *aws.tf* file.
5. Define region in files: *aws.tf* and *variables.tf*.
6. Point out some variables as *url* and *port* in lambda.tf file.
7. If you want to look into our CI/CD workflow you can find it in *.github/workflows/tf-flow.yaml*
8. When you make the changes in the previous items and apply them with *git push* command you will get the following output:
![image](https://drive.google.com/uc?export=view&id=1T5JHALfwdfmuNpIaV2nvuPNESXH29Ey-)