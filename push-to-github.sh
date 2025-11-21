#!/bin/bash

# ╔═══════════════════════════════════════════════════════════════════════════╗
# ║                    🚀 STELLAR DOTS - GITHUB PUSH 🚀                        ║
# ╚═══════════════════════════════════════════════════════════════════════════╝

echo "✨ Preparando push para GitHub..."
echo ""
echo "📦 Repositório: https://github.com/alanascanferla/stellar-dots"
echo "🌿 Branch: main"
echo "📝 Commits prontos: 4"
echo ""

cd /home/alana/.gemini/antigravity/scratch/stellar-dots

# Verificar status
echo "📊 Status do repositório:"
git status --short
echo ""

# Mostrar commits que serão enviados
echo "📋 Commits que serão enviados:"
git log --oneline --graph -4
echo ""

# Fazer push
echo "🚀 Fazendo push para GitHub..."
echo ""
echo "⚠️  Você precisará autenticar com:"
echo "   Username: alanascanferla"
echo "   Password: Seu Personal Access Token (não sua senha!)"
echo ""

git push -u origin main

if [ $? -eq 0 ]; then
    echo ""
    echo "✅ Push realizado com sucesso!"
    echo ""
    echo "🎉 Seu repositório está online em:"
    echo "   https://github.com/alanascanferla/stellar-dots"
    echo ""
    echo "📖 Agora qualquer pessoa pode instalar com:"
    echo "   git clone https://github.com/alanascanferla/stellar-dots.git"
    echo "   cd stellar-dots"
    echo "   ./install.sh"
else
    echo ""
    echo "❌ Erro ao fazer push."
    echo ""
    echo "💡 Dicas:"
    echo "   1. Certifique-se de usar um Personal Access Token, não sua senha"
    echo "   2. Crie um token em: https://github.com/settings/tokens"
    echo "   3. Marque a opção 'repo' ao criar o token"
    echo ""
    echo "   Ou configure SSH:"
    echo "   git remote set-url origin git@github.com:alanascanferla/stellar-dots.git"
fi
