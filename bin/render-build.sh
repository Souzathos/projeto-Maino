#!/usr/bin/env bash

set -o errexit

# --- 1. Pré-compilar Assets (Deve vir primeiro) ---
echo "--- Precompiling assets ---"
# Usamos o '-r' para garantir que os assets são pré-compilados
bundle exec rails assets:precompile

# --- 2. Executar Migrações ---
echo "--- Running database migrations ---"
# Adicionamos uma instrução para limpar os logs/cache do banco de dados antes de migrar.
# Adicionamos 'bundle exec rails db:create' para garantir que o banco existe antes de migrar.
bundle exec rails db:create
bundle exec rails db:migrate

# O 'bundle install' foi movido para fora do script, pois o Render o executa por padrão.
# Deixando o script mais limpo e focado no que ele PRECISA fazer.