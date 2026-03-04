module "homologacao" {
    source = "../../infra"
    
    nome = "homologacao"
    descricao = "aplicacao-de-homologacao"
    max_size = 3
    maquina = "t3.micro"
    ambiente = "ambiente-de-homologacao"
    }