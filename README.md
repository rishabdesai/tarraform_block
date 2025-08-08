# tarraform_block

```script
My_app
└── Modules
    ├── private_infra
    │   ├── main.tf
    │   └── variables.tf
    ├── public_infra
    │   ├── main.tf
    │   └── variables.tf
    ├── main.tf
    └── variables.tf

```

![Image](https://raw.githubusercontent.com/rishabdesai/tarraform_block/main/modules/img.png  "Terraform module diagram")


# open the bashrc file
> vim ~/.bashrc

# add the following configuration
> export AWS_ACCESS_KEY_ID=
> export AWS_SECRET_ACCESS_KEY=
> export AWS_DEFAULT_REGION=


# load the settings in the same terminal
> source ~/.bashrc

# confirm if the access key is properly configured
> echo $AWS_ACCESS_KEY_ID
> echo $AWS_SECRET_ACCESS_KEY

====


# download required providers
> terraform init

# check if the configuration is valid
> terraform validate

# get the plan of execution
> terraform plan

# create the infra using terraform
> terraform apply

# refresh the state of resources
> terraform refresh
