env = "dev"

vpc = {
  main = {
    vpc_cidr = "10.0.0.0/16"

    public_subnet = {
      public = {
        name = ["public-az1","public-az2"]
        cidr_block = ["10.0.0.0/24","10.0.1.0/24"]
        availability_zone = ["us-east-1a","us-east-1b"]
      }
    }

    private_subnet ={
      web = {
        name = "public"
        cidr_block = ["10.0.2.0/24","10.0.3.0/24"]
      }
      app = {
        name = "public"
        cidr_block = ["10.0.4.0/24","10.0.5.0/24"]
      }
      db = {
        name = "public"
        cidr_block = ["10.0.6.0/24","10.0.7.0/24"]
      }
    }
  }
}