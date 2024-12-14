# Datawarehouse_comercial


O objetivo deste projeto de estudos é construir um fluxo completo para um Data Warehouse (DW), utilizando bancos de dados PostgreSQL como fonte e destino, ambos criados e mantidos por Docker e Docker Compose. O projeto começará pela criação das tabelas de origem (fonte) e o povoamento dessas tabelas com dados brutos, utilizando Python em algumas etapas do processo. A migração dos dados da origem para a staging area será realizada usando a biblioteca aibyte. Em seguida, será implementada uma camada de staging (estagiária) para a preparação, limpeza e transformação dos dados.

Posteriormente, será realizado o processo de ETL (Extração, Transformação e Carga), enviando os dados transformados para o Data Warehouse, estruturado em um Star Schema (esquema estrela) com tabelas de dimensão e fato. Por fim, o DW será disponibilizado no banco de dados de destino, também gerenciado por PostgreSQL via Docker, para análise e consulta por ferramentas de Business Intelligence (BI).git push
