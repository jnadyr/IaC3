resource "aws_elastic_beanstalk_application" "aplicacao_beanstalk" { 
  name        = var.nome
  description = var.descricao
  }

resource "aws_elastic_beanstalk_application_version" "default" { 
# 1o. sobe-se a versão da aplicação!
# 2o. sobe-se o ambiente, referenciando a versão criada.
# Inversões neste padrão obtem-se como resultadoa sample application!

  name        = var.ambiente
  application = aws_elastic_beanstalk_application.aplicacao_beanstalk.name
  bucket      = aws_s3_bucket.beanstalk_deploys.id
  key         = aws_s3_object.docker.key
}
resource "aws_elastic_beanstalk_environment" "ambiente_beanstalk" { 
  name                = var.ambiente
  application         = aws_elastic_beanstalk_application.aplicacao_beanstalk.name
  solution_stack_name = "64bit Amazon Linux 2023 v4.10.0 running Docker"
  version_label       = aws_elastic_beanstalk_application_version.default.name # <--- Importante

setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "InstanceType"
    value     = var.maquina
  }

setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "IamInstanceProfile"
    value     = aws_iam_instance_profile.beanstalk_ec2_profile.name
  }
  
setting {
    namespace = "aws:autoscaling:asg"
    name      = "MaxSize"
    value     = var.max_size
  }
}

