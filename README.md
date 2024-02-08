# Sample OCI terraform scripts

My first try at Terraform/OpenTofu on OCI

I have only tested these with OpenTOFU.

# Local Initialization

1. Copy a SSH public key to "default-id_key.pub".  This is the
   public key to login to the default user (For ubuntu images
   this defaults to "ubuntu")
2. Copy `idvars.tf-sample` to `idvars.tf`.  Edit `idvars.tf`
   to fill-in the ocid's and other relevant values.
3. Copy `users.yml-sample` to `users.yml`.  Edit `users.yml`
   to create any additional users.

# TODO

- Configure DNS via CloudFlare
  - https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/resources/record
  - https://developers.cloudflare.com/terraform/tutorial/
  - https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs
- Pre-commit hook to create idvars.tf-sample
  - https://pre-commit.com/
  - https://git-scm.com/book/en/v2/Customizing-Git-Git-Hooks
  - https://githooks.com/

