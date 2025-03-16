##################################################################
#_____ S3 ________________________________________________________
##################################################################
module "bucket" {
  source = "github.com/carlossfb/terraform-aws//aws_s3/modules/s3_bucket"

  bucket = {
    name        = "gitlab-registry-carlossfb"
    environment = "development"
  }
}
