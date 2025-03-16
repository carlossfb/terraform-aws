output arn_bucket {
    value = module.bucket.arn
    description = "ARN do bucket para indicar na politica do IAM"
}