# 🎬 Movie Catalog

> Um sistema completo de catálogo de filmes com autenticação, avaliações, comentários, categorias, tags e importação em CSV.

---

## ✅ Funcionalidades

### 🎞 Gerenciamento de Filmes
- CRUD completo de filmes
- Upload de poster (Active Storage)
- Sinopse, ano, duração, diretor e muito mais
- Lista com paginação (Kaminari)

### 🏷 Categorias e Tags
- Filmes podem ter múltiplas categorias
- Organização por tags (#terror, #clássico)
- Busca por título, diretor, ano, categorias **e** tags

### ⭐ Avaliações e Comentários
- Usuários podem avaliar com estrelas ⭐
- Comentários visíveis em cada filme
- Exibição da nota média + número de avaliações

### 🔐 Autenticação (Devise)
- Cadastro/Login seguro
- Apenas o dono do filme pode editar/excluir
- Visitantes apenas visualizam conteúdo

### 📂 Importação de CSV
- Upload de arquivo CSV com múltiplos filmes
- Popula automaticamente categorias e tags

> Obs.: A notificação por e-mail da importação foi removida para evitar dependências externas.

---

## 🛠 Tecnologias Utilizadas

| Categoria | Tecnologia |
|----------|------------|
| Linguagem | Ruby 3.3 |
| Framework | Ruby on Rails 8 |
| Banco de Dados | PostgreSQL |
| Autenticação | Devise |
| Estilização | Tailwind CSS |
| Upload de Arquivos | Active Storage |
| Paginação | Kaminari |

---

## 🚀 Rodando o Projeto Localmente

```bash
# 1️⃣ Instale as dependências
bundle install
yarn install

# 2️⃣ Configure o banco de dados
rails db:create
rails db:migrate
rails db:seed   # opcional

# 3️⃣ Inicie o servidor
bin/dev
