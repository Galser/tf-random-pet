
variable "ami_id" {
  default = "ami-048d25c1bda4feda7" # Ubuntu 18.04.3 Bionic, custom
}

# AWS provider
provider "aws" {
  profile    = "default"
  region     = "eu-central-1"
}

resource "random_pet" "server" {
  keepers = {
    # Generate a new "pet name" each time we switch to a new AMI id
    ami_id = "${var.ami_id}"
  }
}

resource "aws_instance" "petserver" {
  # Read the AMI id "through" the random_id resource to ensure that
  # both will change together.
  ami = "${random_pet.server.keepers.ami_id}"

  instance_type = "t2.micro"

  tags = {
    "name" = "zoo-server-${random_pet.server.id}"
  }
}

output "server_name" {
  value = "${aws_instance.petserver.tags["name"]}"
}