# tf-random-pet
TF skills map 200, random_pet resource of random provider; demo.

# Requirements
This repo assumes general knowledge about Terraform for AWS, if not, please get yourself accustomed first by going through [getting started guide](https://learn.hashicorp.com/terraform?track=getting-started#getting-started) . Please also have your AWS credentials prepared in some way, preferably environment variables. See in details here : [Section - Keeping Secrets](https://aws.amazon.com/blogs/apn/terraform-beyond-the-basics-with-aws/)

# Resource "random-pet" of random provider

In general "random" provider allows the use of randomness within Terraform configurations. This is a logical provider, which means that it works entirely within Terraform's logic, and doesn't interact with any other services. It comes with several resources and in in this specific repo we going to show the `random_pet` resource.

For details about other resources and demo usage see [this repo](https://github.com/Galser/tf-random)

The resource `random_pet` generates random pet names that are intended to be used as unique identifiers for other resources (server names, cluster names, etc ) .

This resource can be used in conjunction with resources that have the `create_before_destroy` lifecycle flag set, to avoid conflicts with unique names during the brief period where both the old and new resources exist concurrently.

# todo
- [ ] example code
- [ ] update Readme

# done

- [x] initial readme
- [x] intro
