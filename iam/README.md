# IAM Terraform module
This Terraform module is used to create an AWS IAM role and/or an IAM user with an SSH key.

## Features
* Create and manage IAM role/user.

## Inputs
#### iam_role
> A map variable that allows you to specify the following parameters for creating an IAM role:
* create: Create IAM role or not. Required
* name: IAM role name. Required
* policy_attachement: Create new inline policy for this IAM role. Optional
* assume_role_policy: Create assume role policy for this IAM role. Optional
* policy_arn: Already defined policy arn want to attach. Optional

### iam_user
A map variable that allows you to specify the following parameters for creating an IAM user with given ssh key:
* create: Create IAM user or not. Required
* name: IAM user name. Required
* policy_attachement: Create new inline policy for this IAM role. Optional
* policy_arn: Already defined policy arn want to attach. Optional

### tags
A map variable describing tags.

## Examples
### Generate a IAM role
```terraform
module "iam" {
  source = "terraform-modules/iam"

  iam_role = {
    create = true
    name = testName
    policy_attachment = {}
    assume_role_policy = {
      Version = "2012-10-17",
      Statement= []
    }

    policy_arn = "arn:aws:iam::aws:policy/arn"
  }

  tags = {
    Terraform = true
  }
}
```

### Generate a IAM user
```terraform
module "iam" {
  source = "terraform-modules/iam"

  iam_user = {
    create = true
    name   = testName
    policy_attachment = {
      Version = "2012-10-17",
      Statement = []
    }
    pub_key = string
  }
  tags = {
    Terraform = true
  }
}
```

## Outputs
#### iam_user
* user: List type of user objects. **user.[*].unique_id** should be noted to a user editing its ssh config for interacting with git-codecommit.
```
user = [
  {
    "user-1" = {
      "role" = null
      "user" = {
        "arn" = "arn:aws:iam::1234567890:user/user-1"
        "force_destroy" = false
        "id" = "user-1"
        "name" = "user-1"
        "path" = "/"
        "permissions_boundary" = tostring(null)
        "tags" = tomap({
          "Service" = "iam"
          "Terraform" = "true"
          "Usage" = "mgmt"
          "name" = "user-1"
        })
        "tags_all" = tomap({
          "Service" = "iam"
          "Terraform" = "true"
          "Usage" = "mgmt"
          "name" = "user-1"
        })
        "unique_id" = "AADFA"
      }
    }
  },
]
```

#### iam_role
* role: Return a role object
```
role =  {}
```

## TODO
[ ] Unifying role and user output format.