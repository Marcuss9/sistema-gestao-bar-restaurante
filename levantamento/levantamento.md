# Levantamento — Bar e Restaurante Esquina dos Amigos

Revisão documental: 28/10/2026. Este texto organiza as fontes disponíveis e não substitui a validação de campo.

## 1. Fontes e situação

| Fonte | Uso e limite |
|---|---|
| [F01 — Anotações originais](fontes/perguntas-e-respostas.txt) | Material fornecido pelo integrante como anexo “Perguntas e respostas”; preservado sem reescrita. Data de coleta e autoria não informadas |
| [F02 — Confirmações complementares](fontes/confirmacoes-documentais.md) | Informações e decisões fornecidas pelo integrante em 28/10/2026; não equivalem a uma nova entrevista com o restaurante |
| [README da E1](../README.md) | Documento anterior do grupo, com informações adicionais e decisões de modelagem; não resolve sozinho divergências com F01 |
| [Avaliação da E1, issue #1](https://github.com/Marcuss9/sistema-gestao-bar-restaurante/issues/1) | Correção do professor e descrição das evidências existentes |
| Esqueleto 00-d_Esqueleto_Entrega_2.md | Anexo da atividade usado para conferir exigências; não comprova fatos sobre o restaurante |

## 2. Organização e porte

O Bar e Restaurante Esquina dos Amigos é um estabelecimento comercial com aproximadamente vinte anos de funcionamento. O README informa endereço na R. Inês Monteiro, 157, São Paulo/SP, e identifica o responsável pelo apelido “Ceará”. Nome completo e função devem ser confirmados. O endereço e o contato publicados estão no README.

As anotações informam três funcionários; o README anterior informa quatro pessoas incluindo o proprietário. Não está confirmado se o proprietário explica a diferença. Todos podem executar as tarefas demandadas, sem funções fixas.

O estabelecimento vende PFs, porções, lanches, pratos especiais por dia da semana, bebidas alcoólicas e refrigerantes. Possui cardápio físico com preços. Os fornecedores recorrentes citados são Ambev, Heineken e Coca-Cola; outros produtos e ingredientes são adquiridos em supermercados.

Faltam volumes por período de pedidos, entregas e compras, quantidade de produtos ativos e calendário de funcionamento. Esses números devem fundamentar a massa fictícia da E2. Não se utilizará faturamento real ou dados reais de clientes como massa de demonstração.

## 3. Entrevista e observação presencial

| Metadado | Situação |
|---|---|
| Data e horário da entrevista | Não informados nas fontes |
| Entrevistado | Identificado no README como “Ceará”; nome completo e função pendentes |
| Integrantes presentes | Não informados |
| Local exato da entrevista | O trabalho relata visita ao estabelecimento; confirmar onde ocorreu a entrevista |
| Vínculo dos integrantes com a organização | Não informado |
| Foto da entrevista | Pendente; a avaliação informa que as fotos existentes não mostram o responsável |

### Informações relatadas

A síntese operacional nas seções seguintes deriva de F01 e das complementações identificadas em F02. Não é transcrição de áudio e não registra uma nova visita.

### Observação presencial

Não há discriminação suficiente nas fontes para atribuir cada achado à observação direta. O grupo deve identificar o que viu acontecer, em que visita e quem observou. A descrição das fotos feita pelo professor está no [índice de evidências](evidencias.md); ela não comprova a autoria ou data de cada observação.

## 4. Rotina e dados envolvidos

### 4.1 Cardápio, atendimento e pedido

O cardápio físico informa pratos e valores; há pratos especiais conforme o dia da semana. O funcionário anota o pedido no papel e o comunica verbalmente à cozinha. Não se registram mesa, nome ou comanda. Quando o prato fica pronto, a cozinha avisa verbalmente e um funcionário o entrega.

Na solução proposta, Pedido terá identificador, data/hora, tipo de atendimento, situação, observação opcional e endereço quando necessário. Seus itens precisam indicar produto, quantidade e preço praticado, ainda ausentes do relacionamento conceitual atual.

### 4.2 Entrega e retirada

Os pedidos de entrega chegam pelo WhatsApp. Qualquer funcionário pode fazer a entrega a pé nas proximidades. Não há frete próprio, conforme F02. O projeto adota até dez minutos a pé a partir do estabelecimento como critério de proximidade, definido pelo integrante a partir de estimativa.

Alguns clientes solicitam e pagam transporte por aplicativo para retirar o pedido. Essa contratação pertence ao cliente, não ao restaurante. Não há confirmação de integração do sistema com WhatsApp ou aplicativo de transporte.

### 4.3 Pagamentos e vendas

Aceitam-se dinheiro, crédito, débito e Pix em F01; vale-refeição foi confirmado em F02. Não há registro individual das vendas na rotina relatada. O responsável deseja visualizar o movimento do dia.

Na proposta, Pagamento registra identificador, valor, modalidade e data/hora, relacionado ao pedido. A existência de fiado, pagamento ao final do consumo, pagamentos parciais e modalidades divididas ainda precisa ser esclarecida antes de rever a cardinalidade.

### 4.4 Compras, recebimento e reposição

A reposição é visual, inclusive pela identificação do último pacote. Um caderno registra produtos esperados dos fornecedores e a equipe compara o registro com a nota recebida. Também são anotados gastos com fornecedores e supermercado.

A proposta deve registrar fornecedor, data, produtos, quantidades e valores, distinguindo compra e recebimento. Não foram descritos prazos de pagamento, entregas parciais nem tratamento de divergências.

### 4.5 Estoque

O saldo atual é acompanhado “no olho”. A solução propõe registro de saldo e movimentações por produto, com entrada/saída, quantidade, data/hora e motivo. Saldo inicial, unidades e ajustes permanecem pendentes.

A exclusão de ingredientes pertence ao escopo do modelo anterior. Ela não demonstra que insumos, perdas e armazenamento inexistam; sua adequação à cobertura exigida na E2 deve ser reavaliada pela equipe de modelagem.

### 4.6 Contas e acompanhamento financeiro

São anotados gastos de fornecedores, supermercados e contas do estabelecimento. O relato indica fechamento mensal com uso de extratos e gastos anotados, sem vendas individualizadas por dia.

Não se pode afirmar que o modelo atual resolve toda a movimentação financeira: contas e datas de desembolso não estão plenamente representadas. Também não se pode apresentar a diferença entre recebimentos e gastos como lucro apurado sem levantamento dos componentes necessários. A observação de F01 sobre bebidas alcoólicas é percepção relatada, sem cálculo de margem demonstrado.

### 4.7 Pedido errado

F01 informa duas alternativas: funcionários consomem o prato errado e o estabelecimento arca com a diferença, ou o cliente aceita o prato e paga seu valor. Não informa estorno, desconto, autorização, cálculo da diferença ou política geral de cancelamento. A RN14 preserva o relato e distingue a proposta de registrar o histórico.

## 5. Problemas e rastreabilidade

| Problema | Processos e RF | Pendência técnica |
|---|---|---|
| P1 — Ausência de registro individual das vendas e visão dos recebimentos diários | 4.1 e 4.3; RF02–RF06 | Quantidade/preço por item e consultas Gxx |
| P2 — Entradas e saídas dispersas em papel e extratos | 4.3, 4.4 e 4.6; RF07 e RF14 | Contas, desembolsos e consultas por período |
| P3 — Estoque/reposição visual | 4.4 e 4.5; RF09–RF12 | Unidades, saldo inicial, origem das movimentações e consultas de estoque |

Os vínculos finais com tabelas e consultas Gxx/Axx devem ser preenchidos com os responsáveis pelo modelo lógico e SQL. Esta tabela não afirma que essas consultas existem.

## 6. Origem e situação das RN01–RN20

| Regra | Origem / situação | O que ainda precisa ser confirmado ou decidido |
|---|---|---|
| RN01 | F01 e confirmação de VR em F02 | Divisão de pagamento tratada separadamente em RN15 |
| RN02 | F01: tarefas sem cargo fixo | Permissões de acesso não se confundem com cargos |
| RN03 | Entrega próxima em F01; limite de dez minutos adotado em F02 | Não há medição nem automação geográfica definida |
| RN04 | F01: entrega a pé por qualquer funcionário | Sem pendência específica na descrição básica |
| RN05 | F01 e F02: cliente solicita e paga o aplicativo | Não pressupor contratação pelo restaurante |
| RN06 | Decisão do modelo de identificar fornecedor; F01 cita distribuidores e supermercados | Dados complementares de fornecedores |
| RN07 | Rotina visual em F01; saldo registrado é proposta | Unidades e critérios de reposição |
| RN08 | Comparação caderno/nota em F01 | Divergências e entregas parciais |
| RN09 | Ausência de mesa/comanda em F01; identificador único proposto pelo modelo | Não transformar identificador em cadastro de cliente |
| RN10 | Exclusão de ingredientes no modelo anterior | Adequação à cobertura da E2 |
| RN11 | Ausência de entidade Funcionário no modelo anterior | Justificativa e identificação dos acessos |
| RN12 | Ausência de frete próprio confirmada em F02 | Sem pendência na cobrança local básica |
| RN13 | Proposta de bloquear saldo negativo | Validação com o restaurante e exceções |
| RN14 | Pedido errado em F01; histórico e efeitos são proposta | Cancelamento, estorno, autorização e diferença de valores |
| RN15 | Decisão pendente | Fiado, pagamento posterior e dividido |
| RN16 | Pratos por dia em F01 | Programação, alterações e indisponibilidade |
| RN17 | Restrição legal já documentada na E1 | Procedimento de verificação e alcance do projeto |
| RN18 | Restrição sanitária já documentada na E1 | Processos efetivos e alcance do projeto |
| RN19 | Restrição fiscal já documentada na E1 | Procedimento/enquadramento com responsável e contabilidade |
| RN20 | Diretriz de privacidade/acesso já documentada na E1 | Perfis, dados necessários e retenção |

A presença das RN17–RN20 não certifica conformidade do estabelecimento nem implementação de controles.

## 7. Pendências para retorno ao responsável

1. Confirmar composição da equipe, identidade/função do entrevistado e metadados da entrevista.
2. Obter comprovação específica da entrevista no local e identificar achados observados.
3. Levantar volumes por período, produtos ativos e dias/horários de funcionamento.
4. Confirmar programação do cardápio, atualização de preços e unidades de estoque.
5. Esclarecer fiado, momento do pagamento, divisão, cancelamento e pedido errado.
6. Detalhar recebimentos parciais, divergências e saldo inicial.
7. Esclarecer contas, vencimentos, pagamentos de fornecedores e fechamento.
8. Validar propostas de RN13, controles de acesso e limites de cobertura.

As pendências não são preenchidas com valores fictícios apresentados como fatos.

## 8. Limite da contribuição documental

Esta revisão organiza caracterização, fontes, processos, RF/RNF, regras e evidências. O DER existente é preservado. Modelagem lógica, normalização, SQL MySQL, massa fictícia, consultas gerenciais/auditoria e apresentação continuam dependentes dos responsáveis técnicos. O relatório final da E2 deve permanecer no README da raiz da main e incorporar os demais artefatos quando entregues.
