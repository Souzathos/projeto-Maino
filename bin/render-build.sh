#!/usr/bin/env bash

# Sair imediatamente se um comando falhar
set -o errexit

# --- 1. Instalar Dependências ---
# O Render já faz o bundle install, mas incluir não custa e garante.
echo "--- Installing dependencies ---"
bundle install

# --- 2. Pré-compilar Assets ---
echo "--- Precompiling assets ---"
# Usando o comando 'rails' em vez de 'rake' para maior compatibilidade
bundle exec rails assets:precompile

# --- 3. Executar Migrações ---
echo "--- Running database migrations ---"
# A migração é crítica. Deve ser feita ANTES de iniciar o servidor.
bundle exec rails db:migrate

# A linha 'bundle exec rake assets:clean' é geralmente desnecessária no build do Render