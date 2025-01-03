# Banco de Dados Comercial

Este projeto tem como objetivo desenvolver um **Banco de Dados** para fins comerciais, integrando dados de diferentes fontes, transformando e carregando-os para uma estrutura de dados organizada e eficiente. O projeto usa o Python para processamento e análise de dados.

## Tecnologias Utilizadas
- Python 3.x
- Bibliotecas: `pandas`, `faker`, `psycopg2`, `bs4` (Todas as dependências estão em `requirements.txt`)

## Como Configurar o Ambiente

1. **Clone o repositório**:
   ```bash
   git clone https://github.com/seu_usuario/Datawarehouse_comercial.git

2. **Crie e ative o ambiente virtual:**
   ```bash
    python -m venv venv
    source venv/bin/activate  # No Linux/Mac
    .\venv\Scripts\activate   # No Windows

3. Instale as dependências:
   ```bash
    pip install -r requirements.txt

4. 
   ```bash
    python src/scripts/models/main.py



## Arvore do projeto:
  ```bash
    📁 src
        📁 config
            📄 config.py

        📁 database
            📄 modelo_relacional.sql
            📄 tabelas_sobre_produtos.sql
            📁 models

        📁 fonte_dados
            📄 tabela-sigla-pais.pdf
            📄 _bairros_brasil.json

        📁 scripts
            📁 models
                📄 cidade.py
                📄 cliente.py
                📄 conexao_bd.py
                📄 estados.py
                📄 pais.py
                📄 regiao.py
                📄 requisicao.py
                📄 __init__.py

        📁 utils
            📄 arvore_do_pojeto.py