env = "dev"
bastion_cidr = ["172.31.3.23/32"]

vpc = {
  main = {
    vpc_cidr = "10.0.0.0/16"

    public_subnets = {
      public-az1 = {
        name              = "public-az1"
        cidr_block        = "10.0.0.0/24"
        availability_zone = "us-east-1a"
      }
      public-az2 = {
        name              = "public-az2"
        cidr_block        = "10.0.1.0/24"
        availability_zone = "us-east-1b"
      }
    }

      private_subnets = {
        web-az1 = {
          name              = "web-az1"
          cidr_block        = "10.0.2.0/24"
          availability_zone = "us-east-1a"
        }
        web-az2 = {
          name              = "web-az2"
          cidr_block        = "10.0.3.0/24"
          availability_zone = "us-east-1b"
        }
        app-az1 = {
          name              = "app-az1"
          cidr_block        = "10.0.4.0/24"
          availability_zone = "us-east-1a"
        }
        app-az2 = {
          name              = "app-az2"
          cidr_block        = "10.0.5.0/24"
          availability_zone = "us-east-1b"
        }
        db-az1 = {
          name              = "db-az1"
          cidr_block        = "10.0.6.0/24"
          availability_zone = "us-east-1a"
        }
        db-az2 = {
          name              = "db-az2"
          cidr_block        = "10.0.7.0/24"
          availability_zone = "us-east-1b"
        }
      }
    }
  }

docdb = {
    main = {
  engine = "docdb"
  engine_version = "4.0.0"
  backup_retention_period = 2
  preferred_backup_window = "07:00-09:00"
  skip_final_snapshot = true
  no_of_instances = 1
  instance_class = "db.t3.medium"
  }
}

rds = {
   main = {
     engine            = "aurora-mysql"
     engine_version    = "5.7.mysql_aurora.2.11.1"
     backup_retention_period = 1
     preferred_backup_window = "07:00-09:00"
     no_of_instances = 1
     instance_class = "db.t3.small"
     skip_final_snapshot = true
   }
}

elasticache = {
  main = {
       engine   = "redis"
       engine_version = "6.x"
       redis_cache_nodes = 1
       node_type = "cache.t3.micro"
       num_cache_nodes = 1
  }
}

rabbitmq = {
  main = {
    instance_type = "t3.micro"
  }
}

alb = {
    public = {
      subnet_name = "public"
      name = "public"
      internal = "false"
      load_balancer_type = "application"
       allow_cidr       =  ["0.0.0.0/0"]
    }
    private = {
      subnet_name = "app"
      name = "private"
      internal = "true"
      load_balancer_type = "application"
      allow_cidr       =  ["10.0.2.0/24","10.0.3.0/24","10.0.4.0/24","10.0.5.0/24"]
    }
}

app = {
  catalogue = {
    component          = "catalogue"
    instance_type      = "t3.micro"
    desired_capacity   = 1
    max_size           = 4
    min_size           = 1
    subnet_name        = "app"
    port               = 8080
    allow_app_to      = "app"
  }
  cart = {
    component          = "cart"
    instance_type      = "t3.micro"
    desired_capacity   = 1
    max_size           = 4
    min_size           = 1
    subnet_name        = "app"
    port               = 8080
    allow_app_to      = "app"
  }
  user = {
    component          = "user"
    instance_type      = "t3.micro"
    desired_capacity   = 1
    max_size           = 4
    min_size           = 1
    subnet_name        = "app"
    port               = 8080
    allow_app_to      = "app"
  }
  shipping = {
    component          = "shipping"
    instance_type      = "t3.micro"
    desired_capacity   = 1
    max_size           = 4
    min_size           = 1
    subnet_name        = "app"
    port               = 8080
    allow_app_to      = "app"
  }
  payment = {
    component          = "payment"
    instance_type      = "t3.micro"
    desired_capacity   = 1
    max_size           = 4
    min_size           = 1
    subnet_name        = "app"
    port               = 8080
    allow_app_to      = "app"
  }
  frontend = {
    component          = "frontend"
    instance_type      = "t3.micro"
    desired_capacity   = 1
    max_size           = 4
    min_size           = 1
    subnet_name        = "web"
    port               = 8080
    allow_app_to      = "public"
  }
}

