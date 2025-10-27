#!/usr/bin/env bash
set -o errexit

# --- 1. Instalar Dependências (Opcional, o Render já faz) ---
# bundle install

# --- 2. Garantir o Banco de Dados (Essencial para pré-compilação/migração) ---
echo "--- Ensuring database is ready for Rails ---"
bundle exec rails db:create
bundle exec rails db:migrate

# --- 3. Pré-compilar Assets ---
echo "--- Precompiling assets ---"
bundle exec rails assets:precompile

# --- 4. Limpeza (Opcional, mas não causa problemas) ---
# bundle exec rails assets:clean