#!/bin/bash

# Define o diretório atual como origem

ORIGEM =$(pwd)
DESTINO=~/projetos/backups

# Exibe a origem atual
echo "Diretório atual definido como origem: $ORIGEM"

# Cria a pasta de destino se não existir
mkdir -p "$DESTINO"

# Função para criar um backup

criar_backup(){
    DATA=$(date +%Y-%m-%d_%H-%M-%S)
    ARQUIVO="backup_${DATA}.tar.gz"

    # Compacta o diretório atual em um .tar.gz

    tar -czf"${DESTINO}/${ARQUIVO}" -c "$(dirname "$ORIGEM")" "$(basename "$ORIGEM")"

    echo "BACKUP CRIADO: $ARQUIVO"
}

# Função para listar os backups já existentes

listar_backups(){
    echo "Backups disponíveis em $DESTINO:"
    ls -lh "$DESTINO"/*.tar.gz 2>/dev/null || echo "NENHUM BACKUP ENCONTRADO"
}


# Função para excluir um backup
excluir_backup() {
    listar_backups

    echo ""
    read -p "Digite o nome exato do backup a excluir (ex: backup_2025-05-23_14-30-10.tar.gz): " NOME
    if [ -f "$DESTINO/$NOME" ]; then
        rm "$DESTINO/$NOME"
        echo "Backup excluído: $NOME"
    else
        echo "Arquivo não encontrado."
    fi
}


# Função para renomear um backup
editar_backup() {
    listar_backups
    echo ""
    read -p "Digite o nome do backup a renomear: " ANTIGO
    read -p "Digite o novo nome (com .tar.gz no final): " NOVO

    if [ -f "$DESTINO/$ANTIGO" ]; then
        mv "$DESTINO/$ANTIGO" "$DESTINO/$NOVO"
        echo "Backup renomeado para: $NOVO"
    else
        echo "Arquivo não encontrado."
    fi
}


# Se o script estiver sendo rodado sem terminal (ex: via cron), apenas cria backup
if [[ ! -t 0 ]]; then
    criar_backup
    exit 0
fi

# Menu interativo
while true; do
    echo ""
    echo "======= MENU DE BACKUP ======="
    echo "1 - Criar novo backup"
    echo "2 - Listar backups"
    echo "3 - Excluir backup"
    echo "4 - Renomear backup"
    echo "5 - Sair"
    echo "=============================="
    read -p "Escolha uma opção: " OPCAO

    case $OPCAO in
        1) criar_backup ;;
        2) listar_backups ;;
        3) excluir_backup ;;
        4) editar_backup ;;
        5) echo "Saindo..."; break ;;
        *) echo "Opção inválida. Tente novamente." ;;
    esac
done

