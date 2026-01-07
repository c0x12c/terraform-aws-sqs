module "sqs" {
  source            = "../../"
  name              = "example-queue"
  max_receive_count = 1
  principals = [
    {
      type        = "AWS"
      identifiers = ["arn:aws:iam::123456789012:role/ExampleRole"]
    },
    # Allow S3 to send messages to the queue (S3 event notifications)
    {
      type        = "Service"
      identifiers = ["s3.amazonaws.com"]
    }
  ]
}
