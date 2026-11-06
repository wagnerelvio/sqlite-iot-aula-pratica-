# Aula prática de SQL no SQLite Online: Sistema de Monitoramento IoT

Repositório didático para a disciplina de **Banco de Dados**, com oito atividades práticas em SQL, exercícios e apostila em LaTeX/PDF. O exemplo simula **três dispositivos ESP32** que registram temperatura, umidade e horário das medições.

**Ambiente:** [SQLite Online](https://sqliteonline.com/) (selecione o mecanismo **SQLite**)  
**Duração sugerida:** 3 horas-aula  
**Pré-requisitos:** navegador e noções introdutórias de tabelas e registros.

## Objetivos

Criar tabelas, identificar chaves, inserir e consultar dados, fazer junções e agregações, atualizar e excluir registros, trabalhar com CTEs, funções de janela e transações.

## Estrutura do repositório

```text
sqlite-iot-aula-pratica/
├── README.md
├── .gitignore
├── sql/
│   ├── 00_preparacao_rapida.sql
│   ├── 01_criacao_tabelas.sql
│   ├── 02_insercao_dados.sql
│   ├── 03_consultas_basicas.sql
│   ├── 04_join.sql
│   ├── 05_agregacoes.sql
│   ├── 06_update_delete.sql
│   ├── 07_cte_funcoes_janela.sql
│   ├── 08_transacoes.sql
│   └── 09_exercicios_alunos.sql
└── material/
    ├── Roteiro_Aula_Pratica_SQLite_Online.tex
    └── Roteiro_Aula_Pratica_SQLite_Online.pdf
```

## Como executar no SQLite Online

1. Acesse **https://sqliteonline.com/** e escolha **SQLite**.
2. No editor SQL, cole o conteúdo de `sql/01_criacao_tabelas.sql` e execute. Em seguida, cole `sql/02_insercao_dados.sql` e execute.
3. Execute os scripts `03` a `08` na ordem apresentada abaixo, observando cada consulta. Se o editor mostrar somente o resultado da última consulta, execute os comandos `SELECT` individualmente.
4. Resolva os desafios em `sql/09_exercicios_alunos.sql`.
5. Registre os comandos utilizados, os resultados e capturas de tela para o relatório.

**Atalho:** Para preparar rapidamente o banco, execute `sql/00_preparacao_rapida.sql` **no lugar** de `01` + `02`. Não execute os três scripts de preparação no mesmo banco, pois isso causará erros de tabela já existente ou duplicará registros.

**Atenção:** Crie as tabelas apenas uma vez no mesmo banco. Os scripts não apagam dados automaticamente. Para recomeçar, escolha um banco SQLite vazio. O SQLite Online pode ter regras próprias de persistência da sessão: exporte o banco ou os scripts se desejar guardar o trabalho.

## Roteiro das atividades

| Etapa | Arquivo | Objetivo | Verificação |
|---|---|---|---|
| 1 | `01_criacao_tabelas.sql` | Criar `dispositivos` e `leituras`; inspecionar estruturas com `PRAGMA` | Duas tabelas criadas |
| 2 | `02_insercao_dados.sql` | Inserir registros com `INSERT INTO` | 3 dispositivos e 7 leituras |
| 3 | `03_consultas_basicas.sql` | Consultar, filtrar e ordenar registros | 2 ativos; 3 temperaturas acima de 25 °C |
| 4 | `04_join.sql` | Combinar cadastros e leituras com `JOIN` | 7 linhas relacionadas |
| 5 | `05_agregacoes.sql` | Usar `AVG`, `MIN`, `MAX`, `COUNT`, `GROUP BY` | Médias: 25,50; 19,80; 31,00 °C |
| 6 | `06_update_delete.sql` | Alterar status, inserir e excluir leitura de teste | Voltar a 7 leituras |
| 7 | `07_cte_funcoes_janela.sql` | Usar `WITH`, `ROW_NUMBER` e `LAG` | Última leitura e diferenças de temperatura |
| 8 | `08_transacoes.sql` | Comparar `ROLLBACK` e `COMMIT` | Alteração cancelada ou confirmada |

Os blocos de cada arquivo estão separados por comentários `-- Etapa ...`. Para facilitar a observação do resultado de cada comando, execute-os individualmente quando apropriado.

### Modelo de dados

- **dispositivos:** `id` (chave primária), `nome`, `localizacao`, `status`.
- **leituras:** `id` (chave primária), `dispositivo_id` (chave estrangeira), `temperatura`, `umidade`, `timestamp`.
- Relacionamento **1:N**: um dispositivo pode ter muitas leituras.

Para verificar a estrutura:

```sql
PRAGMA table_info('dispositivos');
PRAGMA table_info('leituras');
PRAGMA foreign_key_list('leituras');
```

Para exigir a integridade referencial na conexão ativa, execute `PRAGMA foreign_keys = ON;` antes de inserir ou alterar registros. A declaração `FOREIGN KEY` por si só não garante que essa verificação esteja ativada em todas as conexões SQLite.

## Exercícios para entregar

1. Listar o nome e a localização dos dispositivos.
2. Consultar as leituras com temperatura superior a 20 °C.
3. Ordenar as leituras por umidade crescente.
4. Contar as leituras por dispositivo.
5. Calcular a temperatura média geral.
6. Mostrar dispositivos com temperatura máxima superior a 25 °C.
7. Cadastrar `ESP32-Lab-04`.
8. Inserir três medições para esse dispositivo.
9. Calcular a temperatura média do quarto dispositivo.
10. Mostrar o nome de cada dispositivo e sua última medição.

Use `sql/09_exercicios_alunos.sql` para escrever as respostas. Os exercícios **7 e 8 alteram o banco**; por isso, os resultados esperados da etapa 2 deixam de valer depois que eles forem executados.

## Avaliação sugerida (10 pontos)

| Critério | Pontos |
|---|---:|
| Criação e estruturação das tabelas | 2,0 |
| Inserção, atualização e exclusão | 2,0 |
| Consultas e relacionamentos | 2,0 |
| Funções de agregação | 1,5 |
| CTEs e funções de janela | 1,5 |
| Organização e apresentação dos resultados | 1,0 |

**Entrega:** comandos SQL, capturas de tela das consultas e breve interpretação dos resultados.

## Material de apoio

A apostila completa está em [`material/Roteiro_Aula_Pratica_SQLite_Online.pdf`](material/Roteiro_Aula_Pratica_SQLite_Online.pdf). O código-fonte LaTeX editável está em [`material/Roteiro_Aula_Pratica_SQLite_Online.tex`](material/Roteiro_Aula_Pratica_SQLite_Online.tex).

## Publicar no GitHub

1. Crie um repositório público ou privado chamado `sqlite-iot-aula-pratica` em [github.com/new](https://github.com/new).
2. Descompacte o ZIP, abra o novo repositório no GitHub e escolha **Add file > Upload files**.
3. Envie **o conteúdo da pasta** `sqlite-iot-aula-pratica` (incluindo as pastas `sql` e `material`), não o ZIP inteiro.
4. Confirme em **Commit changes**. O GitHub exibirá automaticamente este `README.md` na página inicial.

**Alternativa com Git** (dentro da pasta descompactada):

```bash
git init
git add .
git commit -m "Adiciona roteiro e scripts SQLite IoT"
git branch -M main
git remote add origin https://github.com/SEU_USUARIO/sqlite-iot-aula-pratica.git
git push -u origin main
```

Substitua `SEU_USUARIO` pelo nome da sua conta. É necessário autenticar-se no GitHub para publicar.

## Observações

- Arquivos SQL deste repositório usam comandos compatíveis com **SQLite**, não com MySQL.
- Em SQLite, `PRAGMA table_info(...)` permite inspecionar a estrutura de tabelas; `DESC tabela` não é o comando apropriado.
- Comandos tradicionais de DCL como `GRANT` e `REVOKE` não são suportados pelo SQLite.
- Os arquivos `01` a `08` são uma separação didática dos exemplos da apostila, preservando a ordem e os dados utilizados em aula.
