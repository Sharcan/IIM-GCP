# IIM-GCP | Nicolas Brazzolotto

## Initialization

### Function

First you have to install all the node modules for the function.  
To do so, go to the **hello-world** directory
```bash
cd functions/hello-world
```
then 
```bash
npm install
```


### Terraform
First you have to comment the lines **7** to **10** in the `main.tf` file
All the next section:
```tf
backend "gcs" {
        bucket  = "bucket-iim-dev-01"
        prefix  = "terraform/state"
    }
```

Then you can run the next command to init terraform:
```bash
terraform init
```

After that you run the apply command :
```bash
terraform apply -var="project=PROJECT_ID"
```
WARNING : You must pass an argument -var to the command with the ID of YOUR project GCP !  
This command will create all the GCP functions.
Say write `yes` when it ask you to. 

Once the `apply` command finished, you have to remove the block we have commented in the `main.tf` and rerun:
```bash
terraform init
```

and Voila !

## Destroy
You can destroy all project by following these steps :  
Comment the lines **7** to **10** in the `main.tf` file  
Then run :
```bash
terraform init -migrate-state
```

and finaly :
```bash
terraform destroy
```
