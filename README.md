# 🎬 Movie Catalog

📌 Sistema completo de catálogo de filmes com avaliações ⭐, comentários e organização por categorias e tags.  
🔐 Controle de acesso com autenticação Devise.

---

## ✅ Funcionalidades

### 🎞 Gerenciamento de Filmes
- Criar, visualizar, editar e excluir filmes
- Upload de poster da obra
- Sinopse, duração, diretor, ano e muito mais
- Listagem com paginação

### 🏷 Categorias e Tags
- Adicionar múltiplas categorias por filme
- Organizar filmes com tags (ex: #ação, #terror)
- Busca por título, diretor, ano, categorias e tags

### ⭐ Avaliações e Comentários
- Usuários podem avaliar com estrelas
- Comentários exclusivos para usuários autenticados
- Exibição do rating médio + quantidade de avaliações

### 🧑‍💻 Autenticação & Autorização (Devise)
- Cadastro e login de usuários
- Apenas o dono do filme pode editar/excluir
- Visitantes podem visualizar

### 📂 Importação de CSV
- Enviar arquivo CSV para importar vários filmes de uma vez
- Suporta colunas:
  - `title`, `synopsis`, `year`, `duration`, `director`, `categories`, `tags`
- Importa categorias e tags automaticamente

> Obs: Notificação por e-mail da importação foi removida para evitar dependências externas — mas o recurso está pronto para ser reativado.

---

## 🖥 Tecnologias Utilizadas

| Categoria | Tecnologia |
|----------|------------|
| Linguagem | Ruby 3.3 |
| Framework | Rails 8 |
| Banco de dados | PostgreSQL |
| Autenticação | Devise |
| Uploads | Active Storage |
| Estilização | Tailwind CSS |
| Paginação | Kaminari |

---

## 📌 Como rodar o projeto

```bash
# Instalar dependências
bundle install
yarn install

# Configurar banco
rails db:create
rails db:migrate
rails db:seed   # opcional

# Rodar o servidor
bin/dev

rails db:seed   # opcional

# 3️⃣ Inicie o servidor
bin/dev

📥 Importando CSV

Acesse a Home

Faça upload do arquivo CSV no campo “Importar CSV”

Filmes serão criados automaticamente ✅

📌 Exemplo de CSV:
title,synopsis,year,duration,director,categories,tags
O Exorcista,Menina possuída,1973,132,William Friedkin,Terror,"terror, classico"
Rocky,Boxeador busca superação,1976,120,John G. Avildsen,Drama,"esporte, luta"

🔒 Regras de Permissão
Ação	Visitante	Usuário logado	Dono do filme
Ver filmes	✅	✅	✅
Criar	❌	✅	✅
Editar	❌	❌	✅
Excluir	❌	❌	✅
Comentar	❌	✅	✅
Avaliar	❌	✅	✅
✅ Diferenciais Aplicados

Sistema completo de rating com ⭐ dinâmicas

Busca avançada

UI moderna com Tailwind

CSV importável com categorias e tags

Paginação responsiva

Código organizado e desacoplado

📌 Melhorias Futuras

Reativar envio de e-mail informando conclusão da importação

Deploy em servidor na nuvem

Adição de favoritos e JSON API

👨‍💻 Desenvolvedor

Athos Felipe Nascimento de Souza
Fullstack Developer 🚀
