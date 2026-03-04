module "producao" {
    source = "../../infra"
    
    nome = "producao"
    descricao = "aplicacao-de-producao"
    max_size = 5
    maquina = "t3.micro"
    ambiente = "ambiente-de-producao"
    }