resource "aws_s3_bucket" "beanstalk_deploys" { 
  bucket = "${var.nome}-deploys-jnadyr" # bucket para guardar o dockerrun.aws.json do Beanstalk zippado
 }

resource "aws_s3_object" "docker" {
  depends_on = [aws_s3_bucket.beanstalk_deploys] # O objeto do S3 depende do bucket, garantindo que o bucket seja criado antes de tentar criar o objeto.
  bucket = "${var.nome}-deploys-jnadyr"
  key    = "${var.nome}.zip"
  source = "${var.nome}.zip"

  # The filemd5() function is available in Terraform 0.11.12 and later
  # For Terraform 0.11.11 and earlier, use the md5() function and the file() function:
  # etag = "${md5(file("path/to/file"))}"
  etag = filemd5("${var.nome}.zip") # O etag é usado para verificar se o arquivo foi modificado. Se o arquivo for modificado, o Terraform irá atualizar o objeto no S3.
}