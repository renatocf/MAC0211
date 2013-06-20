
BEGIN { RS = "*" }
      { if ((NR % 2) != 0) print $0 }

# $0: registro atual
# NR: número do registro
# RS: registrador
# BEGIN: inicialização
# Chamada ao AWK: awk -f nome_do_arquivo
