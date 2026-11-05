# Levantamento — Bar e Restaurante Esquina dos Amigos

Revisão documental inicial: 28/10/2026; decisões complementares de 02/11/2026; esclarecimento do integrante sobre a entrevista em 04/11/2026. **A entrevista com Ceará, proprietário, foi realizada** e suas respostas constam em F01. Este texto organiza as fontes e separa o relato do estabelecimento das decisões posteriores do projeto. A data **07/09/2026** foi confirmada pelo integrante. A equipe já está identificada no README/issue #1 e as quatro fotos da visita já pertencem ao repositório; ver o índice de evidências.

## 1. Fontes e situação

| Fonte | Uso e limite |
|---|---|
| [F01 — Anotações originais](fontes/perguntas-e-respostas.txt) | Material fornecido pelo integrante como anexo “Perguntas e respostas”; preservado sem reescrita. Data da entrevista: 07/09/2026, confirmada posteriormente pelo integrante em F02; autoria individual não discriminada |
| [F02 — Confirmações e decisões complementares](fontes/confirmacoes-documentais.md) | Informações fornecidas pelo integrante em 28/10, 02/11 e 04/11/2026; não equivalem a nova entrevista com o restaurante |
| [F03 — Cardápio semanal transcrito](fontes/cardapio-semanal-transcricao.md) | Transcrição de imagem anexada pelo integrante à conversa em 02/11/2026, com pratos, acompanhamentos, preços e limites de interpretação; o mesmo cardápio está fotografado em [Image04.jpeg](../docs/imagens/Image04.jpeg) |
| [README da E1](../README.md) | Documento anterior do grupo, com informações adicionais e decisões de modelagem; não resolve sozinho divergências com F01 |
| [Avaliação da E1, issue #1](https://github.com/Marcuss9/sistema-gestao-bar-restaurante/issues/1) | Correção do professor e descrição das evidências existentes |
| Esqueleto 00-d_Esqueleto_Entrega_2.md | Anexo da atividade usado para conferir exigências; não comprova fatos sobre o restaurante |

## 2. Organização e porte

O Bar e Restaurante Esquina dos Amigos é um estabelecimento comercial com aproximadamente vinte anos de funcionamento. O README registra endereço na R. Inês Monteiro, 157, São Paulo/SP. **O proprietário se identifica como Ceará e foi entrevistado**, conforme esclarecimento do integrante em 04/11/2026. As respostas estão em [perguntas e respostas](fontes/perguntas-e-respostas.txt). Não se deve tratá-lo como não identificado por ausência de outro nome civil. O endereço e o telefone comercial estão no README.

As anotações originais informam três funcionários; o README anterior registra quatro pessoas incluindo o proprietário. **Em 02/11/2026, o integrante informou quatro funcionários**; esse é o dado complementar adotado, mas resta esclarecer com o responsável se inclui o proprietário. Todos podem executar as tarefas demandadas, sem funções fixas.

O estabelecimento vende PFs, porções, lanches, pratos especiais por dia da semana, bebidas alcoólicas e refrigerantes. Possui cardápio físico com preços. Os fornecedores recorrentes citados são Ambev, Heineken e Coca-Cola; outros produtos e ingredientes são adquiridos em supermercados.

O integrante esclareceu em 02/11/2026 que **não dispõe de volumes operacionais verificáveis**. A possibilidade anteriormente mencionada de 12 pedidos/hora foi descartada como informação da organização e **não será utilizada nem como média nem como pico documentado**. Não há dados sobre pedidos, entregas e compras por período, quantidade de produtos ativos ou calendário completo de funcionamento. A massa de dados da Entrega 2 deverá usar **quantidades fictícias justificadas como cenários de demonstração**, sem atribuí-las à realidade do restaurante; não se utilizará faturamento real ou dados reais de clientes.

## 3. Entrevista e observação presencial

| Metadado | Situação |
|---|---|
| Data e horário da entrevista | **07/09/2026**, confirmação do integrante em F02; horário não informado |
| Entrevistado | **Ceará**, proprietário e nome pelo qual se identifica; entrevista realizada, com respostas registradas em F01 |
| Participantes do projeto | Cauã Francisco Gomes da Silva; João Pedro Liberato de Oliveira; Marcus Vinicius dos Santos Cruz; João Vitor Gonçalves de Oliveira. Fonte: [README, Integrantes](../README.md#integrantes) e issue #1; não há discriminação de presença individual na entrevista |
| Local do levantamento | Estabelecimento na R. Inês Monteiro, 157; visita presencial reconhecida na issue #1 e fotografada em Image01.jpeg–Image04.jpeg |
| Vínculo dos integrantes com a organização | Não informado |
| Fotos do levantamento | **Existentes:** Image01.jpeg–Image04.jpeg; Image04 mostra notebook e cardápio no balcão. A issue #1 observa que Ceará não aparece identificado nas fotos |

### Informações relatadas

A síntese operacional nas seções seguintes deriva da **entrevista realizada com Ceará**, registrada em F01, e das complementações do integrante identificadas em F02. Trata-se de anotações escritas, não transcrição de áudio; as decisões posteriores não configuram uma segunda entrevista.

### Observação presencial

Não há discriminação suficiente nas fontes para atribuir cada achado à observação direta. O grupo deve identificar o que viu acontecer, em que visita e quem observou. A descrição das fotos feita pelo professor está no [índice de evidências](evidencias.md); ela não comprova a autoria ou data de cada observação.

## 4. Rotina e dados envolvidos

### 4.1 Cardápio, atendimento e pedido

O cardápio físico informa pratos e valores; há pratos especiais conforme o dia da semana. A [imagem de cardápio semanal transcrita em F03](fontes/cardapio-semanal-transcricao.md) descreve pratos de segunda a sábado, com **duas entradas rotuladas como sexta-feira**, preços distintos nas colunas “PF” e “COM.” e **sem referência a domingo**. O significado de “COM.”, a data de validade dos preços e a duplicidade de sexta-feira continuam sem confirmação. O funcionário anota o pedido no papel e o comunica verbalmente à cozinha. Não se registram mesa, nome ou comanda. Quando o prato fica pronto, a cozinha avisa verbalmente e um funcionário o entrega.

Na solução proposta, Pedido terá identificador, data/hora, tipo de atendimento, situação, observação opcional e endereço quando necessário. Seus itens precisam indicar produto, quantidade e preço praticado, ainda ausentes do relacionamento conceitual atual.

### 4.2 Entrega e retirada

Os pedidos de entrega chegam pelo WhatsApp. Qualquer funcionário pode fazer a entrega a pé nas proximidades. Não há frete próprio, conforme F02. O projeto adota até dez minutos a pé a partir do estabelecimento como critério de proximidade, definido pelo integrante a partir de estimativa.

Alguns clientes solicitam e pagam transporte por aplicativo para retirar o pedido. Essa contratação pertence ao cliente, não ao restaurante. Não há confirmação de integração do sistema com WhatsApp ou aplicativo de transporte.

### 4.3 Pagamentos e vendas

Aceitam-se dinheiro, crédito, débito e Pix em F01; vale-refeição foi confirmado em F02. Não há registro individual das vendas na rotina relatada. O responsável deseja visualizar o movimento do dia.

Na proposta, Pagamento registra identificador, valor, modalidade e data/hora, relacionado ao pedido. A **RN15 do sistema proposto** foi definida pelo integrante como pagamento no ato em modalidade única, sem fiado nem divisão. Não se trata de confirmação obtida em campo; o momento exato da cobrança e a situação de pedidos cancelados antes de pagar devem ser definidos com a equipe de modelagem.

### 4.4 Compras, recebimento e reposição

A reposição é visual, inclusive pela identificação do último pacote. Um caderno registra produtos esperados dos fornecedores e a equipe compara o registro com a nota recebida. Também são anotados gastos com fornecedores e supermercado.

A proposta deve registrar fornecedor, data, produtos, quantidades e valores, distinguindo compra e recebimento. Pela decisão documental da RN08, deverá também registrar **quantidade esperada, quantidade recebida e divergência para resolução com o fornecedor**. Prazos de pagamento, entregas parciais, devoluções e tratamento físico dessas diferenças ainda não foram descritos pelo estabelecimento.

### 4.5 Estoque

O saldo atual é acompanhado “no olho”. A solução propõe registro de saldo e movimentações por produto comercializado, com entrada/saída, quantidade, data/hora e motivo. A RN07 foi definida pelo integrante para **estoque mínimo configurável por produto e alerta quando o saldo for menor ou igual ao mínimo**. O atributo e o alerta ainda dependem de alteração nos modelos; saldo inicial, unidades, valores mínimos e ajustes permanecem pendentes.

A RN10 foi **reafirmada em 02/11/2026**: ingredientes da cozinha **não serão controlados em estoque no sistema**. Essa decisão delimita a modelagem e não nega a existência de compras, uso, perdas ou obrigações sanitárias relacionadas aos ingredientes. Despesas com ingredientes continuam relevantes para o processo financeiro.

### 4.6 Contas e acompanhamento financeiro

São anotados gastos de fornecedores, supermercados e contas do estabelecimento. O relato indica fechamento mensal com uso de extratos e gastos anotados, sem vendas individualizadas por dia.

Não se pode afirmar que o modelo atual resolve toda a movimentação financeira: `Despesa` já representa contas, vencimento e quitação no modelo lógico e no dicionário; procedimentos reais e implementação SQL ainda não foram validados. Também não se pode apresentar a diferença entre recebimentos e gastos como lucro apurado sem levantamento dos componentes necessários. A observação de F01 sobre bebidas alcoólicas é percepção relatada, sem cálculo de margem demonstrado.

### 4.7 Pedido errado

F01 informa duas alternativas: funcionários consomem o prato errado e o estabelecimento arca com a diferença, ou o cliente aceita o prato e paga seu valor. Não informa estorno, desconto, autorização, cálculo da diferença ou política geral de cancelamento. **Como decisão da solução**, a RN14 passa a permitir cancelar pedidos comuns **somente antes do início do preparo**, preservando histórico. O caso de prato incorreto permanece exceção separada; estorno e efeitos sobre estoque continuam sem procedimento validado.

## 5. Problemas e rastreabilidade

| Problema | Processos e RF | Pendência técnica |
|---|---|---|
| P1 — Ausência de registro individual das vendas e visão dos recebimentos diários | 4.1 e 4.3; RF02–RF06 | Quantidade/preço já estão em Contem no lógico; faltam atributos no DER e SQL/consultas Gxx versionados e testados |
| P2 — Entradas e saídas dispersas em papel e extratos | 4.3, 4.4 e 4.6; RF07 e RF14 | Despesa já está no lógico/dicionário; faltam validação operacional e SQL/consultas por período |
| P3 — Estoque/reposição visual | 4.4 e 4.5; RF09–RF12 | Incorporar estoque mínimo e alertas (RN07); unidades, saldo inicial, origem das movimentações e consultas de estoque |

Os vínculos com tabelas e consultas propostas já estão na seção 1.6 do README; a comprovação das consultas Gxx/Axx depende do SQL versionado e testado. Esta tabela não afirma que essas consultas existem.

## 6. Origem e situação das RN01–RN20

| Regra | Origem / situação | O que ainda precisa ser confirmado ou decidido |
|---|---|---|
| RN01 | F01 e confirmação de VR em F02 | Divisão de pagamento tratada separadamente em RN15 |
| RN02 | F01: tarefas sem cargo fixo | Permissões de acesso não se confundem com cargos |
| RN03 | Entrega próxima em F01; limite de dez minutos adotado em F02 | Não há medição nem automação geográfica definida |
| RN04 | F01: entrega a pé por qualquer funcionário | Sem pendência específica na descrição básica |
| RN05 | F01 e F02: cliente solicita e paga o aplicativo | Não pressupor contratação pelo restaurante |
| RN06 | Decisão do modelo de identificar fornecedor; F01 cita distribuidores e supermercados | Dados complementares de fornecedores |
| RN07 | F01: rotina visual; F02 (02/11): decisão de mínimo configurável e alerta quando saldo ≤ mínimo | Valor inicial e unidade; atributo e consulta ainda ausentes no modelo |
| RN08 | F01: comparação caderno/nota; F02 (02/11): decisão de registrar divergências para resolução com fornecedor | Tratamento de entrega parcial/devolução, vínculo no modelo |
| RN09 | Ausência de mesa/comanda em F01; identificador único proposto pelo modelo | Não transformar identificador em cadastro de cliente |
| RN10 | Exclusão do controle de ingredientes reafirmada em F02 (02/11) | Justificar delimitação do escopo; despesas com insumos continuam relevantes |
| RN11 | F02 (02/11): não vincular executor a operação; controlar acesso por permissões | Definir papéis, autenticação e identificação técnica de sessões |
| RN12 | Ausência de frete próprio confirmada em F02 | Sem pendência na cobrança local básica |
| RN13 | Proposta de bloquear saldo negativo | Validação com o restaurante e exceções |
| RN14 | F01: duas alternativas para prato errado; F02 (02/11): cancelamento comum apenas antes do preparo | Estorno, autorização, diferença de valores e efeito em estoque |
| RN15 | F02 (02/11): pagamento no ato em uma modalidade, sem fiado nem divisão, como decisão do projeto | Momento exato da cobrança; pedidos cancelados/pagos; impacto na cardinalidade |
| RN16 | Pratos por dia em F01 e tabela/preços de F03, com duas entradas para sexta-feira | Confirmar se as duas ofertas são de sexta, o sentido de “COM.”, vigência dos preços, horários, mudanças e representação das variantes no modelo lógico |
| RN17 | Restrição legal já documentada na E1 | Procedimento de verificação e alcance do projeto |
| RN18 | Restrição sanitária já documentada na E1 | Processos efetivos e alcance do projeto |
| RN19 | Restrição fiscal já documentada na E1 | Procedimento/enquadramento com responsável e contabilidade |
| RN20 | Diretriz de privacidade/acesso já documentada na E1 | Perfis, dados necessários e retenção |

A presença das RN17–RN20 não certifica conformidade do estabelecimento nem implementação de controles.

## 7. Pendências para retorno ao responsável

1. **Entrevista e identificação já estabelecidas:** o entrevistado é **Ceará**, proprietário que se identifica por esse nome. A data é **07/09/2026** (F02); equipe e fotos estão documentadas no README/issue #1 e no índice de evidências. Horário e presença individual não foram inferidos. Esclarecer se os quatro funcionários informados incluem o proprietário.
2. Preservar as quatro fotos já existentes, com as descrições do índice de evidências, distinguindo o que foi relatado do que foi observado. Não há ausência de fotografias; a identificação nominal de Ceará nas imagens não está comprovada.
3. Registrar que os volumes reais são **desconhecidos**; não usar a hipótese descartada de 12 pedidos/hora como dado observado. Se não for possível obter números, justificar a massa fictícia com cenários de demonstração, sem atribuir escala operacional real.
4. Conferir a duplicidade de sexta-feira no cardápio F03 (Peixe e Rabada), o significado de “COM.”, data de vigência dos preços e horários de oferta; definir com a equipe como modelar modalidades e dias. Confirmar também unidades de estoque.
5. Validar com o responsável a decisão de pagamento no ato e único (RN15), definir o momento exato da cobrança e tratamento de cancelamento antes do preparo (RN14), sem confundir com a exceção de pedido errado.
6. Detalhar entregas parciais, devoluções, solução de divergências com fornecedor (RN08), unidades, saldos iniciais e parâmetros mínimos (RN07).
7. Esclarecer contas, vencimentos, pagamentos de fornecedores e fechamento.
8. Validar RN13 e suas exceções, definir perfis/permissões (RN11) e justificar o escopo sem controle de ingredientes (RN10) perante o enunciado.

As pendências não são preenchidas com valores fictícios apresentados como fatos.

## 8. Limite da contribuição documental

Esta revisão organiza caracterização, fontes, processos, RF/RNF, regras e evidências. O DER existente é preservado. Modelagem lógica, normalização, SQL MySQL, massa fictícia, consultas gerenciais/auditoria e apresentação continuam dependentes dos responsáveis técnicos. O relatório final da E2 deve permanecer no README da raiz da main e incorporar os demais artefatos quando entregues.
