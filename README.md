# tf-random-pet
TF skills map 200, random_pet resource of random provider; demo.

# Requirements
This repo assumes general knowledge about Terraform for AWS, if not, please get yourself accustomed first by going through [getting started guide](https://learn.hashicorp.com/terraform?track=getting-started#getting-started) . Please also have your AWS credentials prepared in some way, preferably environment variables. See in details here : [Section - Keeping Secrets](https://aws.amazon.com/blogs/apn/terraform-beyond-the-basics-with-aws/)

# Resource "random-pet" of random provider

In general "random" provider allows the use of randomness within Terraform configurations. This is a logical provider, which means that it works entirely within Terraform's logic, and doesn't interact with any other services. It comes with several resources and in in this specific repo we going to show the `random_pet` resource.

For details about other resources and demo usage see [this repo](https://github.com/Galser/tf-random)

The resource `random_pet` generates random pet names that are intended to be used as unique identifiers for other resources (server names, cluster names, etc ) .

This resource can be used in conjunction with resources that have the `create_before_destroy` lifecycle flag set, to avoid conflicts with unique names during the brief period where both the old and new resources exist concurrently.

The following arguments are supported:
- `keepers` - (Optional) - as with all random provider resources - Arbitrary map of values that, when changed, will trigger a new id to be generated. See the main provider documentation for more information.
- `length` - (Optional) The length (in words) of the pet name. 
> Note : Length in specified in WORDS!
- `prefix` - (Optional) A string to prefix the name with.
- `separator` - (Optional) The character to separate words in the pet name.

And the only one resulting attribute is
- `id` of type (string) - that is going to be the random pet name

# Example usage
- Let's define our infrastrure by putting code below intfo file `main.tf` :
    ```terraform
    variable "ami_id" {
    default = "ami-048d25c1bda4feda7" # Ubuntu 18.04.3 Bionic, custom
    }

    # AWS provider
    provider "aws" {
    profile    = "default"
    region     = "eu-central-1"
    }

    ```
- Init Terraform with : 
    ```
    terraform init
    ```
- Now, let's run apply for our code :
    ```
    terraform.apply
    ```
    And reply `yes`
- Output going to look similar to : 
    ```
    An execution plan has been generated and is shown below.
    Resource actions are indicated with the following symbols:
    + create
    ...
    random_pet.server: Creating...
    random_pet.server: Creation complete after 0s [id=warm-grackle]
    aws_instance.petserver: Creating...
    aws_instance.petserver: Still creating... [10s elapsed]
    aws_instance.petserver: Still creating... [20s elapsed]
    aws_instance.petserver: Creation complete after 22s [id=i-06aa303a8d9dfd127]

    Apply complete! Resources: 2 added, 0 changed, 0 destroyed.

    Outputs:

        server_name = zoo-server-warm-grackle
    ```
    Now, here as you can see we have the server name post-suffixed with "warm-grackle". While in reality we don't have such bird, but, you can check probably its relative, "Great Grackle" in  [this National Geographic article](https://www.nationalgeographic.com/animals/birds/g/great-tailed-grackle/), or maybe it is the common one :  ![Common Grackle image](https://www.allaboutbirds.org/guide/assets/photo/67364561-480px.jpg).
    ( Courtesy of image goes to https://www.allaboutbirds.org/ )

    
-  Do not forget to free-up resource, when they do not needed anymore, by running : 
    ```
    terraform destroy
    ```
    And replying `yes` to the question

This concludes the section. Thank you! 


# todo
- [ ] example code
- [ ] update Readme

# done

- [x] initial readme
- [x] intro
