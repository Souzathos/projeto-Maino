# 🎬 Movie Catalog

📌 Sistema completo de catálogo de filmes com avaliações, comentários e organização por categorias e tags.
🔐 Controle de acesso e autenticação Devise.

## ✅ Funcionalidades

### 🎞 Gerenciamento de Filmes
- Criar, visualizar, editar e excluir filmes
- Upload de poster
- Sinopse, duração, diretor, ano e outros detalhes
- Paginação nas listagens

### 🏷 Categorias e Tags
- Múltiplas categorias por filme
- Tags (#ação, #terror…)
- Busca por título, diretor, ano, categorias e tags

### ⭐ Avaliações e Comentários
- Avaliações com estrelas
- Comentários somente para usuários logados
- Exibição de nota média e total de avaliações

### 🧑‍💻 Autenticação & Autorização
- Cadastro e login com Devise
- Apenas o dono do filme pode editar e excluir
- Visitantes apenas visualizam

### 📂 Importação de CSV
- Importa diversos filmes de uma vez
- Colunas suportadas:
title, synopsis, year, duration, director, categories, tags
- Categorias e tags criadas automaticamente
- Envio de e-mail de conclusão removido temporariamente

## 🖥 Tecnologias Utilizadas

Ruby 3.3  
Rails 8  
PostgreSQL  
Devise  
Active Storage  
Tailwind CSS  
Kaminari  

## 🚀 Como rodar o projeto

Instalar dependências → bundle install e yarn install  
Criar banco → rails db:create  
Migrar → rails db:migrate  
Seed opcional → rails db:seed  
Rodar servidor → bin/dev  

Acesse no navegador em:
http://localhost:3000

## 📥 Importando CSV

1. Vá para a Home
2. Faça upload do arquivo CSV
3. Filmes importados automaticamente ✅

Exemplo de CSV:
title,synopsis,year,duration,director,categories,tags
O Exorcista,Menina possuída,1973,132,William Friedkin,Terror,"terror, classico"
Rocky,Boxeador busca superação,1976,120,John G. Avildsen,Drama,"esporte, luta"

## 🔒 Regras de Permissão

Visitantes → apenas visualizam  
Usuários → podem criar, comentar e avaliar  
Dono → pode criar, editar, excluir, comentar e avaliar  

## ✅ Diferenciais
- Estrelas dinâmicas
- Busca avançada
- UI moderna e responsiva
- Importação CSV completa
- Paginação funcional
- Código bem estruturado

## 📌 Melhorias Futuras
- Reativar e-mail pós-importação
- Deploy online
- Favoritos e API pública

## 👨‍💻 Desenvolvedor
Athos Felipe Nascimento de Souza  
Fullstack Developer 🚀
