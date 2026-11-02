# Entrega 2 — Modelo Lógico, Implementação SQL e Apresentação Final

### Modelagem de um sistema de gestão de informações para uma organização de pequeno porte

**Organização estudada:** Bar e Restaurante Esquina dos Amigos, São Paulo/SP.

> **Critério de entrega:** este `README.md` da raiz da branch `main` é o Relatório Técnico Final. Os demais artefatos devem permanecer em arquivos próprios, referenciados neste relatório. As seções ainda não concluídas são identificadas como pendentes; nenhuma informação de campo, decisão de modelagem ou implementação SQL é presumida.

## 1. Relatório Técnico Final

### Integrantes

| Nome completo | RGM | Usuário do GitHub |
|---|---|---|
| Cauã Francisco Gomes da Silva | 47485990 | A confirmar pelo integrante |
| João Pedro Liberato de Oliveira | 46801375 | A confirmar pelo integrante |
| Marcus Vinicius dos Santos Cruz | 46690069 | A confirmar pelo integrante |
| João Vitor Gonçalves De Oliveira | 47391111 | A confirmar pelo integrante |

### 1.1 Revisão do Modelo Conceitual

Esta seção apresenta a revisão da **mesma organização real utilizada na Entrega 1 (Caso A do Esqueleto 2)**, tomando como referência a [Issue #1 — correção da Entrega 1](https://github.com/Marcuss9/sistema-gestao-bar-restaurante/issues/1), os registros de levantamento e os modelos existentes. Reúne a caracterização, o relato da entrevista, os processos, os requisitos, as regras de negócio, os atributos, os relacionamentos e o estado de revisão do DER conceitual.

**Documentos de apoio:** [levantamento organizado](levantamento/levantamento.md), [evidências e pendências](levantamento/evidencias.md), [perguntas e respostas originais](levantamento/fontes/perguntas-e-respostas.txt), [confirmações documentais](levantamento/fontes/confirmacoes-documentais.md) e [dicionário de dados em HTML](dicionario_dados_conceitual.html).

**Situação:** a documentação foi ampliada e o modelo lógico da seção 1.2 já possui quantidade e preço unitário nas tabelas `Contem` e `Adquire`. Entretanto, o **DER conceitual vinculado nesta seção ainda não contém esses atributos nos relacionamentos N:N**. Permanecem pendentes a validação presencial de volumes, dados e foto da entrevista, decisões sobre pagamentos e a abrangência dos gastos. Correções textuais não devem ser confundidas com aprovação do DER ou implementação do sistema.

#### Caracterização da Organização

**Nome e natureza da organização**
Bar e Restaurante Esquina dos Amigos é um estabelecimento comercial do ramo de alimentação, com aproximadamente 20 anos de funcionamento. Sua operação envolve a comercialização de refeições, porções, lanches, bebidas alcoólicas e refrigerantes, incluindo pratos especiais disponibilizados em determinados dias da semana.

**Contexto e porte**
O estabelecimento possui uma operação de pequeno porte. O README da Entrega 1 registra 4 pessoas incluindo o proprietário, enquanto as anotações originais informam 3 funcionários. A composição exata da equipe permanece pendente de confirmação; não se presume que os dois números sejam equivalentes. Não existem funções rigidamente atribuídas aos funcionários: todos podem desempenhar as atividades necessárias de acordo com a demanda do estabelecimento, incluindo atendimento, cozinha, reposição, compras e entregas.
A operação é fortemente baseada na experiência adquirida ao longo dos anos e na familiaridade dos funcionários com o próprio comércio e com seus clientes. Dessa forma, diversas atividades são realizadas de maneira informal e sem registros estruturados, baseando-se principalmente no conhecimento dos funcionários e no acompanhamento visual da operação.
O estabelecimento trabalha com diferentes fornecedores. Entre os fornecedores recorrentes estão Ambev, Heineken e Coca-Cola, enquanto outros produtos e ingredientes são adquiridos diretamente em supermercados.

**Problemas e necessidades identificados**
O principal problema identificado está na baixa formalização dos registros operacionais e financeiros.
Atualmente, as principais informações registradas são:
* produtos que precisam ser recebidos dos fornecedores;
* gastos realizados com fornecedores;
* gastos realizados em supermercados;
* contas do estabelecimento.

Não existe um registro estruturado das vendas realizadas durante o dia. O estabelecimento também não mantém registros de mesa, nome do cliente ou número de comanda.
O controle dos produtos comercializados também não é realizado por meio de um sistema estruturado. A quantidade disponível é acompanhada de maneira visual e informal.

Os problemas passam a ser identificados para rastreabilidade documental:

| Código | Problema identificado | Requisitos relacionados | Limite atual |
|---|---|---|---|
| P1 | Ausência de registro individual das vendas e de visão dos recebimentos do dia | RF02–RF06 | Quantidade e preço por item já constam no modelo lógico; faltam no DER conceitual e nas consultas gerenciais Gxx |
| P2 | Entradas e saídas financeiras dispersas entre papel e extratos | RF07, RF14 | Contas do estabelecimento e data de pagamento das compras não estão plenamente representadas |
| P3 | Estoque e necessidade de reposição acompanhados visualmente | RF09–RF12 | Saldo inicial, unidades, ajustes e alcance do controle precisam ser confirmados |

Esses códigos ainda precisam ser vinculados às tabelas finais e consultas Gxx pela equipe responsável pelo modelo lógico e SQL. Não há consultas implementadas nesta revisão.

Entre as principais necessidades identificadas estão:
* visualizar quanto dinheiro foi movimentado no dia;
* acompanhar de forma mais clara o que entra e o que sai financeiramente;
* possuir maior visibilidade sobre a movimentação geral do estabelecimento;
* controlar a quantidade disponível dos produtos comercializados;
* registrar movimentações de entrada e saída do estoque.

**Volumes operacionais**
As fontes disponíveis informam aproximadamente 20 anos de funcionamento, mas não quantificam pedidos por dia/semana, entregas, produtos ativos ou compras por período. Esses volumes devem ser levantados com o responsável antes de justificar a massa fictícia da Entrega 2. A composição da equipe também precisa ser esclarecida. **Não se atribuem números fictícios à operação real.**

**Escopo do sistema e abrangência da organização**
O sistema proposto reúne cadastro e preços de produtos, pedidos presenciais e para entrega, composição dos pedidos, recebimentos, compras, fornecedores e movimentações de estoque. A venda é representada por Pedido e seus itens, sem entidade Venda separada. O modelo atual não dispõe de cadastros independentes de mesas/comandas, clientes ou funcionários, por decisões anteriores cuja justificativa ainda depende de validação.

O Esqueleto 2 exige cobertura dos dados relevantes de **toda a organização**. A estrutura atual, embora represente vendas, compras e estoque, **não cobre integralmente contas do estabelecimento, efetivos pagamentos de compras, conferência dos recebimentos e gestão de insumos**. Essa lacuna compromete sobretudo a solução completa do problema **P2**. Antes de encerrar a revisão, o grupo deve confirmar quais dados e estruturas adicionais são necessários com o responsável. Não se presume que processos sem evidência deixem de existir.

**Justificativa da escolha**
O estabelecimento foi escolhido por apresentar uma operação real, de pequeno porte e com processos suficientemente definidos para a elaboração de um modelo conceitual de banco de dados.
Apesar de a operação funcionar atualmente com base na experiência dos funcionários e em controles manuais, existem diversos dados relacionados a pedidos, produtos, estoque, fornecedores, compras, pagamentos e entregas que podem ser estruturados em um sistema de gestão.
Esse cenário permite modelar uma solução que não pretende substituir a experiência dos funcionários, mas transformar informações atualmente dispersas ou não registradas em dados estruturados, possibilitando consultas e acompanhamento da operação.

**Evidências da organização**
* Fotos da Visita
  ![Fotos da visita](docs/imagens/Image01.jpeg)
  ![Fotos da visita](docs/imagens/Image02.jpeg)
  ![Fotos da visita](docs/imagens/Image03.jpeg)
  ![Fotos da visita](docs/imagens/Image04.jpeg)
* Endereço: R. Inês Monteiro, 157 - Artur Alvim, São Paulo - SP, 03568-030
* Telefone: (11) 98109-1622
* Responsável identificado como "Ceará"; nome completo e função a confirmar.
* [Índice das evidências e lacunas de comprovação](levantamento/evidencias.md).

**Limites das evidências:** as quatro fotos existentes permanecem no repositório como arquivos `.jpeg`; o Esqueleto 2 solicita **JPG ou PNG** e **ao menos uma foto da entrevista no estabelecimento**. A adequação das extensões e a comprovação da entrevista ainda estão pendentes. O telefone publicado acima é do estabelecimento; ainda não foi confirmado se é também o contato do responsável entrevistado. Também falta confirmar um link oficial de perfil da organização no Google, se existente.

##### Relato da entrevista e fontes do levantamento

O [levantamento organizado](levantamento/levantamento.md) é o documento Markdown separado requerido pelo Esqueleto 2. Ele sintetiza as [anotações originais](levantamento/fontes/perguntas-e-respostas.txt) e as [confirmações documentais de 28/10/2026](levantamento/fontes/confirmacoes-documentais.md). Essas confirmações de um integrante não constituem nova entrevista com o restaurante.

| Informação exigida | Registro comprovável e pendência |
|---|---|
| Responsável entrevistado | Identificado pelo apelido **“Ceará”**; nome completo e função pendentes |
| Contato do responsável | Telefone comercial informado na caracterização; contato específico a confirmar |
| Data e horário | Não informados nas fontes |
| Local da entrevista | Visita ao estabelecimento documentada, mas local e contexto exatos da entrevista a confirmar |
| Integrantes presentes | A confirmar |
| Vínculo de integrante com o estabelecimento | A declarar, se houver |
| Evidência fotográfica da entrevista | **Pendente**; as fotos disponíveis não mostram o responsável segundo a Issue #1 |

**Informações relatadas:** registro de pedidos em papel e comunicação verbal com a cozinha; ausência de mesa/comanda; estoque acompanhado visualmente; anotações de gastos e contas; compras com distribuidores e supermercados; entrega local e pagamento pelo cliente de transporte solicitado por aplicativo; tratamento de pedidos errados. O conteúdo detalhado, organizado por processo e com seus limites, está no levantamento Markdown.

**Observação presencial:** as imagens documentam aspectos do local (fachada e ambiente), mas as fontes não distinguem quais procedimentos os integrantes efetivamente **viram acontecer** e quais foram apenas **relatados**. Essa separação deverá ser completada pelo grupo após conferência com os participantes, sem atribuir observação direta sem evidência.

**Confirmações após a Entrega 1:** um integrante confirmou em 28/10/2026 o aceite de vale-refeição, a ausência de frete próprio e que o cliente solicita e paga o transporte por aplicativo. O limite de até dez minutos a pé é **estimativa adotada como critério do projeto**, não uma medição ou confirmação formal do responsável.

**Pendências para completar a entrevista:** nome e função do entrevistado, telefone de contato, data, integrantes participantes, local, observações presenciais, eventual vínculo com o estabelecimento, volumes de operação e foto da entrevista no local. Se for necessária nova visita, registrar data, participantes e alterações em relação à Entrega 1.

##### Tratamento dos apontamentos da Entrega 1

Esta tabela atende ao **Caso A** do Esqueleto 2 e registra os apontamentos da [Issue #1](https://github.com/Marcuss9/sistema-gestao-bar-restaurante/issues/1), as providências efetivamente tomadas e as pendências. Uma correção do modelo lógico não é apresentada como correção do DER conceitual.

| Apontamento da correção da E1 | O que mudou no trabalho / situação | Por quê |
|---|---|---|
| **Critério 8 — regras de negócio** insuficientes e sem restrições legais, fiscais e sanitárias | **Revisão documental realizada:** RN13–RN20 acrescentadas, distinguindo práticas descritas, propostas e obrigações; validação de algumas regras continua pendente | Regras precisam ser verificáveis e relacionadas ao funcionamento e às obrigações aplicáveis |
| **Critério 9 — dicionário de dados** limitado a tabelas simples de atributos | **Revisão documental realizada:** HTML ampliado com convenções MySQL, cardinalidades, fluxo, tipos, expressões, índices propostos, controle de acesso e log; novos atributos por item ainda precisam ser sincronizados no HTML | Representar os dados, suas restrições e os fluxos sem confundir propostas com SQL implementado |
| **Critério 10 — Pedido–Produto N:N sem quantidade/preço por item** | **Parcial:** adicionados `quantidade_pedido` e `preco_unitario_pedido` à tabela lógica `Contem`; o DER conceitual ainda não mostra esses atributos no relacionamento | Sem os atributos no conceito, não há descrição completa de cada item vendido |
| **Critério 10 — Compra–Produto N:N sem quantidade/preço por item** | **Parcial:** adicionados `quantidade_comprada` e `preco_unitario_compra` à tabela lógica `Adquire`; o DER conceitual ainda não mostra esses atributos no relacionamento | Preservar a quantidade e o custo unitário de cada aquisição |
| **Critério 5 — processos de cardápio, recebimento, contas e reposição parcialmente descritos** | **Parcial:** descrições ampliadas com base no levantamento; horários de pratos especiais, recebimentos parciais, pagamentos de contas e critérios de reposição seguem sem validação | Evitar inventar rotinas e reconhecer dados não cobertos pelo modelo |
| **Pedido–Pagamento 1:1 impede pagamento dividido** | **Pendente de decisão:** mantida a cardinalidade conceitual original; o modelo lógico descreve a futura restrição `UNIQUE`, se o 1:1 for confirmado | Pagamento dividido ou posterior só pode alterar o modelo depois de confirmada sua prática |
| **Movimentações sem referência direta à origem** | **Pendente:** permanece `motivo_movimentacao` textual, sem FK para Pedido ou Compra | Rastreabilidade da operação pode exigir vínculos adicionais |
| **Cobertura de despesas, contas e desembolsos** | **Pendente:** `Compra` indica aquisição e `Pagamento` indica recebimento de vendas, sem representação de todas as saídas efetivamente pagas | O problema P2 requer distinguir valores comprados, devidos e pagos |
| **Comprovação da entrevista e volumes operacionais** | **Pendente:** faltam dados do entrevistado, foto específica, datas e números do movimento | A Entrega 2 exige comprovação da entrevista e volumes para fundamentar a massa de dados |

**Resultado:** os apontamentos sobre regras e dicionário foram tratados **documentalmente**. Os apontamentos N:N estão tratados **no modelo lógico**, mas ainda **não no DER conceitual**; as demais decisões e evidências permanecem registradas como pendentes. Não se declara revisão concluída nem aprovação do DER.


---

---

#### Processos de Negócio

**Principais processos mapeados**
A partir do levantamento realizado, foram identificados os seguintes processos principais:
* Atendimento e registro de pedidos
* Preparação e entrega dos pedidos
* Venda e recebimento do pagamento
* Entrega de pedidos nas proximidades
* Controle de produtos em estoque
* Reposição de produtos
* Registro de compras
* Acompanhamento financeiro

**Atendimento e registro de pedidos**
O cliente realiza o pedido diretamente no estabelecimento ou, no caso de entregas, por meio do WhatsApp.
No atendimento presencial, o funcionário recebe o pedido e faz uma anotação em papel, utilizada para comunicar verbalmente os itens à cozinha. Essa anotação não constitui um registro estruturado de vendas. Não são registrados número da mesa, nome do cliente ou número de comanda.
Em seguida, o funcionário comunica verbalmente o pedido à cozinha.
Nos pedidos destinados à entrega, o cliente informa, por meio do WhatsApp, as informações necessárias para que o pedido seja entregue.

**Preparação e entrega**
A cozinha prepara o pedido com base na comunicação realizada pelo funcionário.
Quando o pedido fica pronto, os funcionários comunicam verbalmente que ele está disponível. Um funcionário pode realizar a entrega do prato ao cliente, porém não existe uma pessoa exclusivamente responsável por essa atividade.
Todos os funcionários podem executar as tarefas necessárias conforme a demanda.

**Venda e pagamento**
O estabelecimento aceita:
* dinheiro;
* cartão de crédito;
* cartão de débito;
* vale refeição.
* Pix.

Atualmente, as vendas não são registradas individualmente em um sistema.
A solução proposta deverá permitir registrar cada operação comercial e relacioná-la ao respectivo pedido e pagamento.

**Entregas**
O estabelecimento realiza entregas apenas nas proximidades.
Os pedidos podem ser realizados pelo WhatsApp e a entrega pode ser realizada a pé por qualquer funcionário.
Em determinadas situações, clientes solicitam um Uber para retirada do pedido. Nesse caso, o custo do transporte é pago pelo próprio cliente.
Não existe um funcionário exclusivamente responsável pelas entregas.
Não é cobrado frete próprio para as entregas locais, conforme confirmação complementar do integrante. Para delimitar as proximidades, o projeto adota trajetos de até dez minutos a pé a partir do estabelecimento na R. Inês Monteiro, 157. Esse critério foi estimado e aceito pelo integrante; não resulta de medição em campo.

**Controle de produtos em estoque**
Atualmente, o estabelecimento não realiza um controle estruturado de estoque por sistema.
A quantidade dos produtos comercializados é acompanhada de maneira informal e visual.
A solução proposta deverá permitir registrar a quantidade disponível dos produtos comercializados e suas respectivas movimentações de entrada e saída.
O modelo atual exclui ingredientes do controle estruturado de estoque. Essa é uma decisão de escopo anterior, cuja adequação à cobertura exigida na Entrega 2 deve ser reavaliada pela equipe; o anexo não confirma que o controle de insumos seja desnecessário.

**Compras**
As compras são realizadas pelos próprios funcionários, conforme a necessidade do estabelecimento.
Os produtos comercializados podem ser adquiridos de fornecedores recorrentes, como Ambev, Heineken e Coca-Cola.
Ingredientes utilizados na preparação dos alimentos também podem ser adquiridos diretamente em supermercados.
Os gastos com fornecedores e supermercados são anotados manualmente. No sistema proposto, `Compra` identifica fornecedor, data e valor total, enquanto `Adquire` registra produto, quantidade comprada e preço unitário da aquisição. Esses atributos já constam do modelo lógico, mas ainda faltam no DER conceitual. A compra e seu pagamento são fatos distintos: as fontes não informam prazos nem formas de pagamento dos fornecedores, que permanecem pendentes.

**Acompanhamento financeiro**
Atualmente, os registros financeiros são realizados manualmente e posteriormente comparados com os extratos financeiros.
A solução proposta deverá permitir maior visibilidade sobre as entradas e saídas financeiras, possibilitando consultas sobre a movimentação diária e outros períodos.


##### Cardápio e preços

O estabelecimento possui cardápio físico com produtos e valores. Comercializa PFs, porções, lanches, pratos especiais por dia da semana, bebidas alcoólicas e refrigerantes. No sistema proposto, o cadastro utiliza identificador, nome, categoria e preço atual do produto. A programação dos pratos e a frequência de atualização de preços não foram informadas. O preço praticado em cada item já foi representado no modelo lógico como `preco_unitario_pedido`, mas falta sua representação conceitual; o preço atual do cadastro não substitui o histórico.

##### Reposição, recebimento e conferência

A equipe identifica visualmente a necessidade de reposição, inclusive pelo último pacote restante, e anota no caderno os produtos esperados dos fornecedores. No recebimento, compara os registros com a nota do fornecedor. Quantidades, unidades, entregas parciais e tratamento de divergências precisam ser detalhados com o responsável.

Na solução proposta, compras identificam fornecedor, data e valor total; as movimentações de estoque registram produto, entrada/saída, quantidade, data/hora e motivo. Quantidade e preço por item já constam no modelo lógico, mas precisam ser representados no DER conceitual; o vínculo com a quantidade efetivamente recebida continua pendente. A consulta ao saldo registrado será apoio futuro à reposição, não descrição da prática atual.

##### Contas e acompanhamento dos gastos

São anotados gastos com fornecedores, supermercado e contas do estabelecimento. O fechamento relatado é mensal, com uso de extratos para comparação com os gastos. Não há registro diário individualizado das vendas.

A necessidade de visualizar entradas e saídas exige distinguir valor vendido, valor recebido, valor comprado e valor efetivamente pago. Datas de vencimento/pagamento, categorias das contas, taxas e controles de dinheiro não foram informados. A cobertura das contas e dos pagamentos das compras precisa ser discutida com a equipe de modelagem; esta revisão não cria entidade Despesa.

##### Pedido errado

Segundo as anotações originais, quando ocorre pedido errado, os funcionários podem consumir o prato e o estabelecimento arca com a diferença, ou o cliente pode aceitar o prato e pagar seu valor. O relato não define desconto, estorno, autorização ou procedimento geral de cancelamento. Esses detalhes permanecem pendentes, conforme RN14.

##### Limites e processos a confirmar

A ausência de mesa/comanda e de cargos fixos está relatada. A exclusão de cadastros permanentes de clientes e funcionários e do controle estruturado de ingredientes é decisão do modelo atual, não prova de inexistência dos respectivos dados ou processos. A equipe deve reavaliar a cobertura diante da Entrega 2.

Escalas, validade de alimentos, rotina fiscal, pagamento posterior, divisão de pagamento e detalhes de fechamento não estão confirmados nas fontes. Não são declarados inexistentes. Não há evidência de necessidade de QR Code, recomendação automática ou outro canal de venda adicional.

**Fluxogramas**
* ![Fotos da visita](docs/imagens/fluxograma.jpeg)

---

---

#### Requisitos do Sistema

##### Requisitos Funcionais

Os requisitos descrevem a solução proposta, não funcionalidades implantadas. Os códigos são preservados; os campos abaixo usam o vocabulário atual, com dependências do modelo explicitadas.

* **RF01 — Cadastrar produtos:** Registrar identificador, nome, categoria, preço atual de venda e saldo dos produtos abrangidos pelo controle. Categorias e unidades devem ser validadas.
* **RF02 — Registrar pedidos:** Registrar identificador único, data/hora, tipo de atendimento, situação e observação opcional; para entrega, registrar endereço. O domínio de situações depende de confirmação.
* **RF03 — Registrar os itens de um pedido:** Associar um ou mais produtos ao pedido, com quantidade e preço unitário praticado. Os atributos por item já foram incorporados à tabela lógica `Contem`; falta representá-los no DER conceitual revisado.
* **RF04 — Registrar a forma de pagamento:** Registrar identificador, valor recebido, modalidade (dinheiro, crédito, débito, vale-refeição ou Pix) e data/hora, associado ao pedido. Pagamento dividido e posterior permanecem pendentes.
* **RF05 — Registrar vendas:** Identificar a operação comercial pelo Pedido e seus itens, preservando quantidade e preço praticado, e relacionar os recebimentos. Não confundir valor vendido com valor recebido.
* **RF06 — Consultar movimentação diária:** Consultar valores recebidos por data e forma de pagamento, utilizando valor e data/hora de Pagamento. A data de venda utiliza Pedido e deve ser distinguida da data de recebimento.
* **RF07 — Registrar compras:** Registrar identificador, fornecedor, data e valor total, com produtos, quantidades e preços de aquisição por item. Os atributos por item já foram incorporados à tabela lógica `Adquire`; falta representá-los no DER conceitual revisado.
* **RF08 — Registrar fornecedores:** Registrar identificador, nome e classificação do fornecedor, incluindo distribuidores recorrentes e supermercados; o domínio da classificação deve ser validado.
* **RF09 — Acompanhar necessidade de abastecimento:** Consultar produto, unidade e saldo registrado para apoiar a reposição. O processo atual é visual; não foi confirmado estoque mínimo numérico.
* **RF10 — Registrar recebimento de produtos:** Registrar os produtos e quantidades efetivamente recebidos, data e referência à compra/documento conferido. Esses dados e vínculos dependem da revisão do modelo e da validação das divergências.
* **RF11 — Registrar movimentações de estoque:** Registrar identificador, produto, entrada/saída, quantidade positiva, data/hora e motivo. A origem em venda, compra, perda ou ajuste deve ter sua representação definida pela equipe.
* **RF12 — Consultar informações de estoque:** Consultar saldo por produto e histórico de entradas/saídas com quantidade, data/hora e motivo. A conciliação exige definir saldo inicial e unidades.
* **RF13 — Registrar pedidos para entrega:** Identificar o tipo de atendimento e o endereço do pedido, respeitando a área adotada na RN03, a entrega local sem frete da RN12 e o transporte contratado pelo cliente da RN05. A representação da modalidade de retirada/entrega precisa ser alinhada ao modelo.
* **RF14 — Consultar entradas e saídas financeiras:** Consultar recebimentos e gastos por período, distinguindo compras, contas e pagamentos. O modelo atual cobre Pagamento e Compra, mas ainda não representa integralmente as contas nem os desembolsos; essa lacuna precisa ser resolvida pela equipe para atender P2.

##### Requisitos Não Funcionais
Os seguintes requisitos são propostos para a solução, não constituindo características atualmente observadas na organização:
* **RNF01 — Usabilidade:** O sistema deve possuir uma interface simples, considerando que a operação atual é realizada de maneira informal e sem um sistema de gestão estruturado.
* **RNF02 — Disponibilidade:** O sistema deve estar disponível durante o período de funcionamento do estabelecimento para permitir o registro das operações.
* **RNF03 — Integridade dos dados:** Os registros devem manter consistência entre pedidos, produtos, pagamentos, compras, estoque e movimentações financeiras.
* **RNF04 — Segurança:** O acesso aos dados administrativos e financeiros deve ser restrito a usuários autorizados.
* **RNF05 — Desempenho:** O sistema deve responder às operações de cadastro, consulta e registro das operações cotidianas em até 3 segundos em condições normais de uso.
* **RNF06 — Manutenibilidade:** O sistema deve ser estruturado de forma organizada, permitindo a manutenção e evolução de suas funcionalidades sem comprometer os dados já registrados.

**Critérios de conferência dos RNF**

| Código | Como conferir / decisão necessária |
|---|---|
| RNF01 | Validar com representante da operação as tarefas de registrar pedido, recebimento e consulta diária; participantes, roteiro e critério de aceitação ainda devem ser definidos |
| RNF02 | Confirmar dias/horários de funcionamento e meta de disponibilidade antes da avaliação |
| RNF03 | Conferir referências, obrigatoriedade, domínios, totais e consistência de estoque no modelo e nas consultas de auditoria |
| RNF04 | Definir perfis e conferir operações permitidas/negadas, especialmente endereço de entrega e informações financeiras |
| RNF05 | Manter 3 segundos como meta proposta; definir volume, equipamento, concorrência e consultas antes de medir |
| RNF06 | Conferir consistência entre README, dicionário e modelos, e documentar alterações; resta definir procedimento de evolução do banco |

---

---

#### Regras de Negócio

As regras a seguir estão separadas em **regras operacionais**, **regras propostas que dependem de validação** e **restrições legais, sanitárias, fiscais e de privacidade**. Propostas não devem ser confundidas com práticas confirmadas na entrevista. A presente atualização textual não modifica o arquivo gráfico do DER, cuja revisão está indicada adiante.

##### Regras operacionais e de escopo

* **RN01 — Formas de pagamento:** As vendas podem ser pagas em dinheiro, cartão de crédito, cartão de débito, vale-refeição ou Pix. O registro de cada pagamento deve indicar uma das modalidades aceitas.
* **RN02 — Execução das atividades:** As atividades de atendimento, preparo, compras, reposição e entregas podem ser desempenhadas pelos funcionários conforme a demanda, sem exigência de cargo fixo para cada operação.
* **RN03 — Área de entrega:** O restaurante realiza entregas próprias apenas nas proximidades do estabelecimento. Para o projeto, adota-se o limite de até dez minutos de trajeto a pé a partir da R. Inês Monteiro, 157, Parque Arthur Alvim. O critério decorre de estimativa aceita pelo integrante responsável pela revisão em 28/10/2026; não corresponde a um raio medido nem a uma confirmação de campo.
* **RN04 — Entrega a pé:** As entregas locais podem ser realizadas a pé por qualquer funcionário, sem a designação obrigatória de um entregador exclusivo.
* **RN05 — Transporte por aplicativo:** Quando houver transporte por aplicativo para retirada do pedido, o próprio cliente solicita o serviço e paga o transporte. O restaurante não é responsável por contratar esse transporte, conforme anotações originais e confirmação complementar do integrante.
* **RN06 — Identificação do fornecedor:** Toda compra registrada deve identificar seu fornecedor, inclusive quando realizada em supermercado, sem limitar o cadastro a uma lista fixa de empresas.
* **RN07 — Reposição de estoque:** Na rotina atual, os funcionários identificam visualmente a necessidade de reposição, inclusive pelo último pacote restante. Na solução proposta, a consulta à quantidade registrada dos produtos apoiará essa decisão; não há estoque mínimo numérico confirmado nem entidade própria de Reposição no modelo atual.
* **RN08 — Conferência do recebimento:** A equipe compara o que foi anotado no caderno com a nota do fornecedor no recebimento. A solução deve permitir conferir os produtos e quantidades recebidos com o documento. O procedimento para divergências, entregas parciais e confirmação da entrada ainda depende de validação; não se declara um bloqueio automático já aprovado.
* **RN09 — Identificação do pedido:** Cada pedido registrado deve possuir identificador único, sem exigir identificação de mesa, comanda ou cadastro de cliente, pois tais controles não integram a operação modelada.
* **RN10 — Limite do controle de estoque:** O estoque estruturado compreende apenas os produtos comercializados pelo estabelecimento. Ingredientes empregados no preparo de alimentos permanecem fora do controle estruturado previsto nesta entrega.
* **RN11 — Identificação do funcionário:** Os registros de pedidos, compras e movimentações de estoque não exigem vínculo com uma entidade Funcionário na modelagem atual. Essa decisão não elimina a necessidade de controle de acesso às informações sensíveis.
* **RN12 — Cobrança de entrega:** O restaurante não cobra frete próprio nas entregas locais. O custo do transporte por aplicativo solicitado pelo cliente, previsto na RN05, não corresponde a frete cobrado pelo estabelecimento.

##### Exceções, regras propostas e decisões pendentes

A RN13 é proposta e a RN15 continua pendente. A RN14 separa a exceção relatada nas anotações da proposta de registro e das condições ainda desconhecidas. A RN16 deriva da oferta de pratos especiais, mas sua programação específica precisa ser confirmada.

* **RN13 — Venda com estoque insuficiente (proposta):** Para produtos controlados em estoque, a confirmação de uma venda não deverá gerar saldo negativo. Quantidades insuficientes deverão ser revisadas; o tratamento de exceções e diferenças entre saldo físico e registrado depende de validação com o estabelecimento.
* **RN14 — Pedido errado, cancelamento ou troca:** Conforme as anotações originais, em caso de pedido errado os funcionários podem consumir o prato e o estabelecimento arca com a diferença, ou o cliente aceita o prato e paga seu valor. Como proposta do sistema, o registro da ocorrência deve preservar o histórico e permitir refletir os efeitos sobre pedido, estoque e recebimentos. As condições de cancelamento, estorno, autorização e eventual diferença de valores continuam pendentes; não são inferidas do relato.
* **RN15 — Venda fiada ou pagamento posterior (decisão pendente):** Deve ser confirmado se o estabelecimento permite pagamento após o consumo ou a entrega. Não se presume que a prática seja aceita nem proibida. Se for permitida, serão necessárias regras para acompanhamento dos valores pendentes e revisão da adequação da modelagem de Pagamento.
* **RN16 — Pratos especiais por dia:** A oferta de pratos especiais deverá respeitar os dias da semana definidos pelo restaurante. Os dias específicos e o modo de atualizar essa disponibilidade devem ser confirmados antes de criar uma validação automática.

##### Restrições legais, sanitárias, fiscais e de privacidade

As obrigações abaixo decorrem das normas aplicáveis ao estabelecimento; sua documentação não significa que as funcionalidades correspondentes já estejam implementadas.

* **RN17 — Proibição de venda de bebidas alcoólicas a menores:** É proibido vender, fornecer ou servir bebidas alcoólicas a crianças ou adolescentes, nos termos dos arts. 81, II, e 243 do Estatuto da Criança e do Adolescente (Lei nº 8.069/1990).
* **RN18 — Boas práticas sanitárias:** A manipulação, preparação, conservação, armazenamento e validade dos alimentos devem observar as normas sanitárias aplicáveis a serviços de alimentação, incluindo a RDC Anvisa nº 216/2004 e regras locais pertinentes. A ausência de controle informatizado dos ingredientes não afasta essas obrigações.
* **RN19 — Documentação fiscal:** As vendas devem cumprir as obrigações de documentação fiscal aplicáveis, incluindo a emissão de NFC-e no varejo paulista quando exigida, e as compras devem respeitar a documentação fiscal pertinente. Esta regra não pressupõe a implementação de um módulo fiscal nesta entrega.
* **RN20 — Proteção de dados e controle de acesso:** As informações pessoais necessárias para entregas devem ser tratadas somente para finalidades legítimas, com coleta limitada ao necessário e acesso autorizado. Informações administrativas e financeiras devem ter acesso restrito, em consonância com a LGPD (Lei nº 13.709/2018) e o RNF04.

##### Restrições organizacionais e decisões de escopo

A composição da equipe permanece a confirmar (3 funcionários nas anotações; 4 pessoas incluindo o proprietário no README anterior). O estabelecimento utiliza processos predominantemente informais, com dependência da experiência da equipe. Essas características contextualizam o projeto, **mas não substituem regras operacionais verificáveis**.

Para adequar a solução ao levantamento, a modelagem desta entrega não prevê cadastro independente de Cliente ou Funcionário, identificação por mesa ou comanda, controle estruturado de ingredientes nem entidade própria de Reposição. Pedido representa a operação comercial, mantendo o escopo de registros de pedidos, pagamentos, compras, fornecedores e movimentações dos produtos controlados em estoque.

---

---

#### Dicionário de Dados Conceitual

Consulte o [Dicionário de Dados HTML](dicionario_dados_conceitual.html), arquivo único com uma tabela por entidade no formato do exemplo do professor (Nome do Campo, Tipo de Dado, Descrição e Restrição / Chave), além de convenções MySQL, cardinalidades e propostas físicas. Os domínios, valores padrão e demais decisões pendentes não constituem restrições implementadas. O HTML ainda deverá ser sincronizado com os quatro atributos por item recentemente incluídos no modelo lógico.


##### Produto
| Atributo | Descrição | Regra de negócio associada |
|----------|-----------|------------------------------|
| id_produto | Identificador único do produto | Deve identificar exclusivamente cada produto |
| nome_produto | Nome do produto | Obrigatório |
| categoria_produto | Categoria do produto | Deve permitir classificar o produto |
| preco_venda_produto | Preço praticado na venda do produto | Deve representar o preço atual |
| quantidade_estoque_produto | Quantidade atualmente disponível em estoque | Deve representar o saldo atualizado do produto |

##### Pedido
| Atributo | Descrição | Regra de negócio associada |
|----------|-----------|------------------------------|
| id_pedido | Identificador único do pedido | Deve identificar exclusivamente cada pedido |
| data_hora_pedido | Data e horário em que o pedido foi feito | Obrigatório |
| tipo_atendimento_pedido | Identifica atendimento presencial ou entrega | Deve permitir diferenciar os tipos de atendimento |
| status_pedido | Situação atual do pedido | Deve representar o andamento do pedido |
| observacao_pedido | Informações adicionais do pedido | Opcional |
| endereco_entrega_pedido | Local informado para pedidos de entrega | Obrigatório quando o pedido for destinado à entrega |

##### Pagamento
| Atributo | Descrição | Regra de negócio associada |
|----------|-----------|------------------------------|
| id_pagamento | Identificador único do pagamento | Deve identificar exclusivamente o pagamento |
| preco_total_pagamento | Preço/montante pago | Deve corresponder ao montante da operação |
| forma_pagamento | Forma utilizada no pagamento | Dinheiro, crédito, débito, vale refeição ou Pix |
| data_hora_pagamento | Momento em que o pagamento foi realizado | Obrigatório |

##### Fornecedor
| Atributo | Descrição | Regra de negócio associada |
|----------|-----------|------------------------------|
| id_fornecedor | Identificador único do fornecedor | Deve identificar exclusivamente o fornecedor |
| nome_fornecedor | Nome do fornecedor | Obrigatório |
| tipo_fornecedor | Classificação do fornecedor | Pode distinguir fornecedor recorrente de supermercado |

##### Compra
| Atributo | Descrição | Regra de negócio associada |
|----------|-----------|------------------------------|
| id_compra | Identificador único da compra | Deve identificar exclusivamente a compra |
| data_compra | Data de realização da compra | Obrigatório |
| preco_total_compra | Preço total da compra | Deve corresponder à soma dos itens adquiridos |

A referência ao fornecedor da compra será implementada no **modelo lógico** com `Compra.id_fornecedor`; no DER conceitual, ela é expressa pelo relacionamento Compra–Fornecedor, não por uma FK desenhada na entidade.

##### Movimentacao_Estoque
| Atributo | Descrição | Regra de negócio associada |
|----------|-----------|------------------------------|
| id_movimentacao | Identificador único da movimentação | Deve identificar exclusivamente o registro |
| tipo_movimentacao | Tipo de movimentação (Entrada ou Saída) | Deve especificar se o estoque aumentou ou diminuiu |
| quantidade_movimentada | Quantidade de itens movimentados | Deve ser positiva |
| data_hora_movimentacao | Data e horário da movimentação | Obrigatório |
| motivo_movimentacao | Motivo da entrada ou saída | Ex: Compra, Venda, Perda, Ajuste |

---

---

#### Modelagem Conceitual (Entidades, Atributos e Relacionamentos)

A modelagem conceitual foi elaborada a partir dos processos de negócio, requisitos, regras de negócio e do Dicionário de Dados Conceitual definidos para o **Bar e Restaurante Esquina dos Amigos**.

O objetivo desta etapa é representar, de forma independente da implementação física do banco de dados, as principais entidades necessárias ao sistema, seus atributos, relacionamentos, cardinalidades e restrições organizacionais.

##### Entidades reconhecidas

A partir do levantamento realizado e das necessidades identificadas no estabelecimento, foram reconhecidas as seguintes entidades:

- **Produto:** representa os produtos comercializados pelo estabelecimento e controlados em estoque.

- **Pedido:** representa uma solicitação de produtos realizada por um cliente. No modelo proposto, o Pedido corresponde à operação comercial registrada pelo sistema, não sendo necessária uma entidade Venda separada.

- **Pagamento:** representa o recebimento associado a um pedido, armazenando as informações referentes ao valor, forma e momento do pagamento.

- **Fornecedor:** representa empresas, supermercados ou outros estabelecimentos responsáveis pelo fornecimento de produtos ao restaurante.

- **Compra:** representa uma aquisição de produtos realizada pelo estabelecimento junto a um fornecedor.

- **Movimentacao_Estoque:** representa os registros de entrada e saída dos produtos, permitindo acompanhar e justificar as alterações ocorridas no estoque.

As entidades **Cliente** e **Funcionario** não foram incluídas no modelo conceitual por decisão de escopo anterior. O anexo relata ausência de nome do cliente nos pedidos e de cargos fixos; a dispensa de cadastro permanente e de identificação de executor precisa ter sua justificativa validada. Nos pedidos destinados à entrega, as informações necessárias são registradas diretamente no próprio Pedido.

Também não foi criada uma entidade **Venda**, pois o Pedido já representa a operação comercial realizada pelo estabelecimento.

Os relacionamentos `Contem` (Pedido–Produto) e `Adquire` (Compra–Produto) continuam N:N no DER conceitual. No modelo lógico, eles já foram convertidos nas tabelas associativas homônimas, equivalentes às estruturas `Item_Pedido` e `Item_Compra`. Os quatro atributos de quantidade e preço já existem na conversão lógica, mas ainda devem ser desenhados nos relacionamentos conceituais.

##### Atributos e classificações

Os atributos definidos para cada entidade são:

| Entidade | Atributos |
|---|---|
| **Produto** | `id_produto`, `nome_produto`, `categoria_produto`, `preco_venda_produto`, `quantidade_estoque_produto` |
| **Pedido** | `id_pedido`, `data_hora_pedido`, `tipo_atendimento_pedido`, `status_pedido`, `observacao_pedido`, `endereco_entrega_pedido` |
| **Pagamento** | `id_pagamento`, `preco_total_pagamento`, `forma_pagamento`, `data_hora_pagamento` |
| **Fornecedor** | `id_fornecedor`, `nome_fornecedor`, `tipo_fornecedor` |
| **Compra** | `id_compra`, `data_compra`, `preco_total_compra` |
| **Movimentacao_Estoque** | `id_movimentacao`, `tipo_movimentacao`, `quantidade_movimentada`, `data_hora_movimentacao`, `motivo_movimentacao` |

Os identificadores iniciados por `id_` identificam as entidades. Os relacionamentos conceituais são convertidos em chaves estrangeiras apenas no modelo lógico.

**Atributos dos relacionamentos N:N pendentes no DER conceitual revisado:**

| Relacionamento conceitual | Atributo que deve ser acrescentado | Finalidade |
|---|---|---|
| Pedido — **Contem** — Produto | `quantidade_pedido` | Quantidade do produto vendido em cada pedido |
| Pedido — **Contem** — Produto | `preco_unitario_pedido` | Preço unitário praticado naquela venda |
| Compra — **Adquire** — Produto | `quantidade_comprada` | Quantidade do produto adquirida na compra |
| Compra — **Adquire** — Produto | `preco_unitario_compra` | Preço unitário de aquisição |

Na notação do brModelo exigida pelo Esqueleto 2, esses atributos devem estar **ligados aos losangos dos relacionamentos**, ou às entidades associativas adequadas se o grupo optar por essa representação. Não se desenham FKs no DER conceitual.

No Pedido, `observacao_pedido` é opcional, pois nem todo pedido necessita de uma observação adicional. O atributo `endereco_entrega_pedido` também é opcional, sendo necessário apenas quando o tipo de atendimento corresponder a uma entrega.

Os demais atributos representam informações necessárias para caracterizar e acompanhar cada ocorrência das entidades dentro dos processos do estabelecimento.

##### Relacionamentos pertinentes

As entidades estão conectadas pelos seguintes relacionamentos:

###### Produto — Movimentacao_Estoque

Um **Produto pode possuir nenhuma ou várias Movimentações de Estoque**, enquanto cada **Movimentacao_Estoque está relacionada a exatamente um Produto**.

**Cardinalidade:**

- Produto: `(0,n)`
- Movimentacao_Estoque: `(1,1)`

Esse relacionamento permite registrar e acompanhar as entradas e saídas relacionadas a cada produto.

###### Pedido — Produto

Um **Pedido contém um ou vários Produtos**, enquanto um Produto pode estar presente em nenhum ou em vários Pedidos.

**Cardinalidade:**

- Pedido: `(1,n)`
- Produto: `(0,n)`

É um relacionamento **N:N**. O diagrama conceitual ainda deve representar no losango `Contem` a quantidade e o preço unitário praticado.

###### Pedido — Pagamento

Um **Pedido gera exatamente um Pagamento**, e cada Pagamento está relacionado a exatamente um Pedido.

**Cardinalidade:**

- Pedido: `(1,1)`
- Pagamento: `(1,1)`

Esse relacionamento representa o pagamento correspondente à operação comercial registrada pelo pedido.

###### Compra — Produto

Uma **Compra adquire um ou vários Produtos**, enquanto um Produto pode estar presente em nenhuma ou em várias Compras.

**Cardinalidade:**

- Compra: `(1,n)`
- Produto: `(0,n)`

É um relacionamento **N:N**. O diagrama conceitual ainda deve representar no losango `Adquire` a quantidade e o preço unitário de aquisição.

###### Fornecedor — Compra

Um **Fornecedor pode estar relacionado a nenhuma ou várias Compras**, enquanto cada Compra está relacionada a exatamente um Fornecedor.

**Cardinalidade:**

- Fornecedor: `(0,n)`
- Compra: `(1,1)`

Esse relacionamento permite identificar o fornecedor responsável por cada aquisição realizada pelo estabelecimento.

##### Restrições e políticas organizacionais aplicadas ao modelo

As seguintes regras e características observadas no estabelecimento influenciaram diretamente a construção do modelo conceitual:

- As vendas podem ocorrer de forma **presencial ou por entrega**.

- Pedidos destinados à entrega devem possuir as informações de localização necessárias para que o atendimento seja realizado.

- O pagamento pode ser realizado em **dinheiro, cartão de crédito, cartão de débito, vale-refeição ou Pix**.

- Cada pedido está relacionado ao respectivo pagamento da operação.

- Não é necessária a identificação individual do funcionário responsável pela realização de cada operação.

- O estabelecimento não mantém cadastro individual de clientes, portanto os dados necessários para pedidos de entrega são armazenados diretamente no Pedido.

- Os produtos podem ser adquiridos tanto de **fornecedores recorrentes quanto de supermercados**.

- Somente os produtos comercializados pelo estabelecimento fazem parte do controle estruturado de estoque. Ingredientes utilizados na preparação dos alimentos ficam fora desse controle.

- Toda movimentação de estoque deve estar relacionada a um Produto e deve permitir identificar se ocorreu uma **entrada ou saída**, a quantidade movimentada, a data e hora e o motivo da movimentação.

- A necessidade de reposição não é representada por uma entidade específica. O acompanhamento é realizado por meio da quantidade disponível de cada Produto e dos registros existentes em `Movimentacao_Estoque`.

- Os relacionamentos entre **Pedido e Produto** e entre **Compra e Produto** permanecem como N:N no conceito. A conversão lógica em `Contem` e `Adquire` já existe; resta representar seus atributos diretamente nos relacionamentos do DER conceitual.
---

---

#### Diagrama Entidade-Relacionamento (DER)

**DER conceitual existente (versão da Entrega 1, ainda não revisada graficamente):**

![DER conceitual existente](docs/imagens/DER_esquina_dos_amigos_v2.jpg)

O DER original utiliza notação do **brModelo**: entidades em retângulos, relacionamentos em losangos, identificadores em círculos preenchidos, atributos comuns em círculos vazios e cardinalidades mínimas/máximas dos dois lados. Contém seis entidades e cinco relacionamentos, sem FKs desenhadas e sem generalização/especialização. O grupo ainda deve confirmar a versão exata do software usada para produzir o arquivo original; a modelagem lógica foi elaborada no brModelo Web.

**Revisão do DER exigida pela Issue #1 e pelo Esqueleto 2 (Caso A):** acrescentar `quantidade_pedido` e `preco_unitario_pedido` ligados ao relacionamento `Contem`; acrescentar `quantidade_comprada` e `preco_unitario_compra` ligados a `Adquire`. Também é possível representá-los por entidades associativas, desde que a notação siga o exemplo do Esqueleto. A imagem acima **ainda não mostra essas correções**, apesar de elas constarem do modelo lógico.

Após a atualização gráfica, substituir a versão vinculada pelo **DER conceitual revisado** e conferir novamente cardinalidades, atributos e correspondência com as seções 1.2–1.4. Enquanto isso, a exigência do Esqueleto 2 de apresentar o DER revisado permanece **pendente**, sem simular aprovação ou alteração do diagrama.


---

---

#### Justificativa Técnica

A modelagem proposta busca transformar os principais processos atualmente executados de maneira manual e informal em estruturas de dados organizadas.

A entidade **Produto** é necessária porque os produtos comercializados representam elementos centrais das vendas e do controle de estoque.

A entidade **Pedido** representa a operação comercial realizada pelo estabelecimento e seu relacionamento com **Produto** permite representar os produtos que compõem cada pedido. A cardinalidade N:N permanece no conceitual e já foi convertida em `Contem` no lógico. O DER gráfico ainda precisa mostrar quantidade e preço por item.

A entidade **Pagamento** foi separada do pedido para representar explicitamente a forma pela qual uma operação comercial foi recebida, contemplando dinheiro, cartão de crédito, cartão de débito, vale refeição e Pix.

Não foi criada uma entidade **Venda** separada porque não existe uma necessidade identificada de distinguir uma venda de seu pedido. O pedido representa a operação comercial e pode ser associado ao pagamento correspondente.

A entidade **Compra** representa uma aquisição realizada pelo estabelecimento e seu relacionamento com **Produto** permite representar os produtos adquiridos em cada compra. A cardinalidade N:N já foi convertida em `Adquire` no modelo lógico, mas a versão conceitual ainda necessita dos atributos de quantidade e preço de aquisição.

A entidade **Fornecedor** permite registrar a origem das compras e representar fornecedores recorrentes, como Ambev, Heineken e Coca-Cola, além de outros estabelecimentos utilizados para aquisição de produtos e ingredientes.

O controle de estoque foi incluído como uma necessidade da solução proposta para os produtos comercializados, embora atualmente seja realizado de maneira informal. A entidade **Movimentacao_Estoque** permite rastrear cada entrada e saída individual, garantindo que o saldo seja justificável com base em motivos reais, como vendas, compras e quebras.

Não foram criadas entidades conceituais independentes denominadas **Item_Pedido** e **Item_Compra**, pois `Contem` e `Adquire` são relações N:N convertidas em tabelas associativas no modelo lógico. O DER conceitual continua precisando representar quantidade e preço nos respectivos relacionamentos. Não existem entidades próprias de **Reposição** ou **Despesa**; a ausência de dados de contas e desembolsos permanece uma lacuna a resolver para atender P2. A equipe deve confirmar a abrangência antes da implementação SQL.

A entidade **Funcionário** não foi incluída no modelo atual. Todos podem desempenhar diferentes tarefas, mas isso não demonstra, por si só, que a identificação do executor seja desnecessária. A decisão deve ser confirmada com o responsável, sem alterar o DER nesta revisão.

A entidade **Cliente** não foi incluída como cadastro independente por decisão do modelo atual. As anotações relatam ausência de nome nos pedidos, mas a necessidade de cadastro permanente deve ser confirmada. Para pedidos destinados à entrega, as informações necessárias podem ser associadas diretamente ao pedido.

A estrutura proposta busca solucionar uma das principais dores identificadas: a dificuldade de visualizar de maneira simples quanto foi movimentado em determinado dia. Com pedidos e pagamentos estruturados, juntamente com compras e movimentações de estoque, torna-se possível organizar e consultar as informações necessárias para o acompanhamento das operações do estabelecimento.

---

### 1.2 Conversão do Modelo Conceitual para o Modelo Lógico

A conversão do modelo conceitual para o modelo lógico do sistema de gestão do Bar e Restaurante Esquina dos Amigos foi realizada utilizando o brModelo Web, com o objetivo de transformar as entidades, os atributos e os relacionamentos do Diagrama Entidade-Relacionamento (DER) em uma estrutura relacional adequada à implementação em banco de dados MySQL.

O processo preservou as seis entidades principais do modelo conceitual e acrescentou duas tabelas associativas para representar os relacionamentos muitos-para-muitos (N:N), resultando em oito tabelas no modelo lógico apresentado.

#### Entidades → Tabelas

Cada entidade identificada no modelo conceitual foi convertida em uma tabela correspondente, mantendo sua finalidade dentro do sistema.

| Entidade | Tabela | Finalidade |
|---|---|---|
| Pedido | `Pedido` | Armazenar as informações dos pedidos realizados. |
| Pagamento | `Pagamento` | Registrar os valores, formas e datas dos pagamentos. |
| Produto | `Produto` | Armazenar os produtos comercializados e suas informações de estoque. |
| Compra | `Compra` | Registrar as compras realizadas pelo estabelecimento. |
| Fornecedor | `Fornecedor` | Armazenar a identificação e a classificação dos fornecedores. |
| Movimentacao_Estoque | `Movimentacao_Estoque` | Registrar as entradas e saídas dos produtos no estoque. |

Além dessas tabelas, foram criadas `Contem` e `Adquire`, responsáveis por representar os relacionamentos N:N entre Pedido e Produto e entre Compra e Produto, respectivamente.

Dessa forma, as entidades principais permanecem independentes, enquanto as tabelas associativas permitem estabelecer as ligações necessárias sem repetir registros cadastrais.

#### Atributos → Colunas

Os atributos das seis entidades do DER foram convertidos em colunas de suas respectivas tabelas. Na conversão dos relacionamentos N:N, foram acrescentados os atributos `quantidade_pedido` e `preco_unitario_pedido` em `Contem`, bem como `quantidade_comprada` e `preco_unitario_compra` em `Adquire`. Esses dados descrevem cada item da operação, não o cadastro geral do produto, e sua inclusão ainda deverá ser refletida no DER conceitual revisado.

Os identificadores foram definidos como `INT`, os atributos textuais como `VARCHAR`, as quantidades inteiras como `INT` e as informações temporais como `DATE` ou `DATETIME`.

Para os atributos monetários, o diagrama no brModelo utiliza `FLOAT`, incluindo os preços unitários das tabelas associativas. Na implementação física em MySQL, deverá ser utilizado preferencialmente `DECIMAL(12,2)` para representar preços e valores financeiros com precisão decimal. Essa adequação de tipos diz respeito ao script SQL, ainda não implementado nesta seção.

A organização das colunas ficou definida da seguinte maneira:

| Tabela | Colunas e tipos de dados |
|---|---|
| `Pedido` | `id_pedido` INT, `data_hora_pedido` DATETIME, `tipo_atendimento_pedido` VARCHAR, `status_pedido` VARCHAR, `observacao_pedido` VARCHAR, `endereco_entrega_pedido` VARCHAR |
| `Pagamento` | `id_pagamento` INT, `id_pedido` INT, `forma_pagamento` VARCHAR, `data_hora_pagamento` DATETIME, `preco_total_pagamento` FLOAT |
| `Produto` | `id_produto` INT, `nome_produto` VARCHAR, `categoria_produto` VARCHAR, `preco_venda_produto` FLOAT, `quantidade_estoque_produto` INT |
| `Compra` | `id_compra` INT, `id_fornecedor` INT, `preco_total_compra` FLOAT, `data_compra` DATE |
| `Fornecedor` | `id_fornecedor` INT, `tipo_fornecedor` VARCHAR, `nome_fornecedor` VARCHAR |
| `Movimentacao_Estoque` | `id_movimentacao` INT, `id_produto` INT, `tipo_movimentacao` VARCHAR, `quantidade_movimentada` INT, `data_hora_movimentacao` DATETIME, `motivo_movimentacao` VARCHAR |
| `Contem` | `id_pedido` INT, `id_produto` INT, `quantidade_pedido` INT, `preco_unitario_pedido` FLOAT |
| `Adquire` | `id_compra` INT, `id_produto` INT, `quantidade_comprada` INT, `preco_unitario_compra` FLOAT |

Em `Contem`, `quantidade_pedido` registra quantas unidades do produto foram vendidas e `preco_unitario_pedido` preserva o preço praticado naquele pedido, mesmo que o preço atual do cadastro mude. Em `Adquire`, `quantidade_comprada` registra a quantidade adquirida e `preco_unitario_compra` preserva o custo unitário daquela compra. Esses atributos permitem detalhar os itens que compõem os valores totais das operações, atendendo aos RF03, RF05 e RF07.

Os atributos `id_pedido` em Pagamento, `id_fornecedor` em Compra e `id_produto` em Movimentacao_Estoque foram acrescentados como chaves estrangeiras durante a conversão dos relacionamentos.

Nas tabelas associativas, os identificadores das entidades relacionadas foram utilizados tanto como chaves estrangeiras quanto como componentes das chaves primárias compostas.

Os campos `observacao_pedido` e `endereco_entrega_pedido` permanecem opcionais conforme as condições definidas no modelo conceitual. A obrigatoriedade condicional do endereço para pedidos destinados à entrega deverá ser tratada na implementação.

#### Relacionamentos → Chaves

Os relacionamentos presentes no DER foram convertidos em chaves estrangeiras ou tabelas associativas, de acordo com suas cardinalidades.

| Relacionamento | Conversão realizada |
|---|---|
| Pedido — Gera — Pagamento | Adição de `id_pedido` como FK em `Pagamento`. |
| Pedido — Contem — Produto | Criação da tabela associativa `Contem`, com FKs para Pedido e Produto e atributos de quantidade e preço unitário praticado. |
| Compra — Adquire — Produto | Criação da tabela associativa `Adquire`, com FKs para Compra e Produto e atributos de quantidade e preço unitário de aquisição. |
| Compra — Realiza — Fornecedor | Adição de `id_fornecedor` como FK em `Compra`. |
| Produto — Registra — Movimentacao_Estoque | Adição de `id_produto` como FK em `Movimentacao_Estoque`. |

No relacionamento entre Pedido e Pagamento, optou-se por manter as tabelas separadas, apesar da cardinalidade 1:1 do modelo conceitual. Essa decisão permite distinguir as informações operacionais do pedido das informações financeiras do pagamento, facilitando a organização e a manutenção do sistema.

Nos relacionamentos 1:N, as chaves estrangeiras foram posicionadas nas tabelas correspondentes ao lado muitos.

Já os relacionamentos N:N foram convertidos em tabelas associativas, permitindo que um registro de uma entidade se relacione com diversos registros da outra.

#### Cardinalidades

As cardinalidades do modelo conceitual foram tratadas conforme as regras de conversão para o modelo relacional.

**Relacionamento 1:1 — Pedido e Pagamento**

No DER, cada Pedido está associado a exatamente um Pagamento, e cada Pagamento pertence a exatamente um Pedido.

Durante a conversão, as entidades foram mantidas separadas, com a chave estrangeira `id_pedido` na tabela `Pagamento`. O brModelo Web exibe visualmente essa ligação como 1:N no modelo lógico gerado e não permite ajustar manualmente essas cardinalidades nessa representação; isso não altera, por si só, a regra 1:1 estabelecida no DER conceitual.

Para limitar a associação a no máximo um pagamento por pedido, a implementação MySQL deverá definir `Pagamento.id_pedido` como FK com `UNIQUE` e `NOT NULL`. O `NOT NULL` exige que todo pagamento faça referência a um pedido, enquanto `UNIQUE` impede dois pagamentos para o mesmo pedido. A obrigatoriedade inversa — todo pedido possuir um pagamento — não é garantida por essas restrições isoladamente e exige controle adicional. Pagamentos divididos ou posteriores permanecem pendentes de validação, conforme o levantamento.

**Relacionamentos 1:N — Fornecedor e Compra; Produto e Movimentacao_Estoque**

No relacionamento entre Fornecedor e Compra, um fornecedor pode estar associado a várias compras, enquanto cada compra pertence obrigatoriamente a um fornecedor. Por isso, a chave estrangeira `id_fornecedor` foi adicionada à tabela Compra.

Da mesma forma, um produto pode possuir várias movimentações de estoque, mas cada movimentação corresponde a um único produto. Assim, a chave estrangeira `id_produto` foi adicionada à tabela Movimentacao_Estoque.

Essa estratégia permite representar os relacionamentos sem criar tabelas intermediárias desnecessárias.

**Relacionamentos N:N — Pedido e Produto; Compra e Produto**

No relacionamento entre Pedido e Produto, um pedido deve conter um ou mais produtos, enquanto um produto pode aparecer em diferentes pedidos.

Para representar essa associação, foi criada a tabela `Contem`, com `id_pedido` e `id_produto` como componentes da chave primária composta e, simultaneamente, chaves estrangeiras. Foram acrescentados `quantidade_pedido` e `preco_unitario_pedido` para registrar os itens vendidos.

No relacionamento entre Compra e Produto, uma compra deve incluir um ou mais produtos, e um produto pode ser adquirido em diferentes compras.

Para esse relacionamento, foi criada a tabela `Adquire`, com `id_compra` e `id_produto` como componentes da chave primária composta e, simultaneamente, chaves estrangeiras. Foram acrescentados `quantidade_comprada` e `preco_unitario_compra` para registrar os itens adquiridos.

As tabelas associativas transformam cada relacionamento N:N em dois relacionamentos 1:N.

**Observação sobre as cardinalidades convertidas:** as cardinalidades exibidas automaticamente pelo brModelo no diagrama lógico refletem as FKs geradas, não necessariamente todas as restrições mínimas e máximas do DER. Em especial, a associação 1:1 de Pedido e Pagamento requer a restrição `UNIQUE` descrita acima. A exigência de ao menos um produto por pedido ou por compra não é garantida automaticamente pelas FKs das tabelas `Contem` e `Adquire`; deverá ser assegurada na implementação do sistema.

#### Generalização/especialização (se houver)

O modelo conceitual do sistema não apresenta relacionamentos de generalização ou especialização entre entidades.

Todas as entidades foram definidas de maneira independente, com atributos e responsabilidades próprias. Portanto, não foi necessário aplicar estratégias como tabela única, tabela por entidade ou tabelas exclusivas para entidades especializadas.

### 1.3 Definição de Chaves Primárias e Estrangeiras

As chaves primárias e estrangeiras foram definidas durante a conversão para o modelo lógico com a finalidade de identificar unicamente os registros e preservar os relacionamentos entre as tabelas.

As chaves primárias (PKs) identificam cada registro de maneira única, enquanto as chaves estrangeiras (FKs) estabelecem referências entre tabelas relacionadas, permitindo a manutenção da integridade referencial.

#### Chaves Primárias (PKs)

As tabelas principais utilizam identificadores individuais como chaves primárias. Já as tabelas associativas utilizam chaves primárias compostas pelos identificadores das entidades relacionadas.

| Tabela | Chave primária (PK) | Tipo |
|---|---|---|
| `Pedido` | `id_pedido` | Simples |
| `Pagamento` | `id_pagamento` | Simples |
| `Produto` | `id_produto` | Simples |
| `Compra` | `id_compra` | Simples |
| `Fornecedor` | `id_fornecedor` | Simples |
| `Movimentacao_Estoque` | `id_movimentacao` | Simples |
| `Contem` | `id_pedido`, `id_produto` | Composta |
| `Adquire` | `id_compra`, `idProduto` | Composta |

As chaves simples permitem identificar individualmente cada pedido, pagamento, produto, compra, fornecedor ou movimentação de estoque.

Nas tabelas associativas, as chaves compostas identificam uma combinação específica de registros. Isso impede, por exemplo, que a mesma combinação de pedido e produto seja cadastrada mais de uma vez em `Contem`.

#### Chaves Estrangeiras (FKs)

As chaves estrangeiras foram definidas para estabelecer os relacionamentos entre as tabelas e garantir que os registros relacionados possuam referências válidas.

| Tabela de origem | Chave estrangeira (FK) | Tabela referenciada | Chave referenciada |
|---|---|---|---|
| `Pagamento` | `id_pedido` | `Pedido` | `id_pedido` |
| `Compra` | `id_fornecedor` | `Fornecedor` | `id_fornecedor` |
| `Movimentacao_Estoque` | `id_produto` | `Produto` | `id_produto` |
| `Contem` | `id_pedido` | `Pedido` | `id_pedido` |
| `Contem` | `id_produto` | `Produto` | `id_produto` |
| `Adquire` | `id_compra` | `Compra` | `id_compra` |
| `Adquire` | `idProduto` | `Produto` | `id_produto` |

As chaves estrangeiras permitem que o banco de dados mantenha vínculos entre os registros sem exigir a repetição das informações completas das entidades relacionadas.

Por exemplo, a tabela Compra armazena apenas `id_fornecedor` como referência ao fornecedor, sem precisar repetir seu nome e sua classificação em cada compra.

Nas tabelas `Contem` e `Adquire`, as chaves estrangeiras também integram as respectivas chaves primárias compostas.

A definição das FKs representa a estrutura de referência do modelo lógico. Restrições adicionais, como `NOT NULL` e `UNIQUE`, deverão ser documentadas no dicionário de dados e implementadas no script SQL para garantir as regras de integridade correspondentes.

### 1.4 Processo de Normalização (1FN, 2FN e 3FN)

A normalização do modelo relacional foi analisada com base nas três primeiras formas normais: Primeira Forma Normal (1FN), Segunda Forma Normal (2FN) e Terceira Forma Normal (3FN).

O objetivo dessa análise foi verificar a organização dos atributos, a existência de dependências funcionais e a possibilidade de redundâncias que comprometam a integridade dos registros.

A avaliação considera as oito tabelas apresentadas no modelo lógico e suas chaves definidas. Não foi documentada uma tabela universal anterior ao DER; portanto, a análise descreve a conformidade da estrutura resultante com as formas normais, em vez de presumir decomposições intermediárias que não foram realizadas.

#### 1FN — Eliminação de grupos repetitivos/atributos multivalorados

A Primeira Forma Normal estabelece que cada coluna deve armazenar um único valor por registro, evitando grupos repetitivos e conjuntos de valores armazenados em um mesmo campo.

No sistema do Bar e Restaurante Esquina dos Amigos, essa condição foi considerada na organização dos atributos e dos relacionamentos.

Por exemplo, um pedido pode possuir vários produtos. Em vez de armazenar uma lista de produtos diretamente na tabela Pedido, foi utilizada a tabela associativa `Contem`, na qual cada registro representa uma associação entre um pedido e um produto.

O mesmo tratamento foi aplicado às compras, por meio da tabela `Adquire`, que permite relacionar diferentes produtos a uma mesma compra sem utilizar colunas repetidas, como `produto_1`, `produto_2` ou `produto_3`.

As movimentações de estoque também foram organizadas em registros individuais na tabela `Movimentacao_Estoque`, permitindo armazenar separadamente cada entrada ou saída de produto.

Dessa maneira, o modelo evita grupos repetitivos e permite representar múltiplas ocorrências por meio de registros próprios, atendendo à 1FN, desde que cada coluna armazene um único valor conforme sua definição.

#### 2FN — Eliminação de dependências parciais

A Segunda Forma Normal exige que o modelo esteja na 1FN e que os atributos não chave dependam da totalidade de uma chave candidata, sem dependências parciais de parte de uma chave composta.

No modelo lógico apresentado, seis tabelas possuem chaves primárias simples:

- `Pedido`
- `Pagamento`
- `Produto`
- `Compra`
- `Fornecedor`
- `Movimentacao_Estoque`

Como essas tabelas possuem apenas um atributo em suas respectivas chaves primárias, não apresentam dependências parciais em relação a essas chaves.

As tabelas `Contem` e `Adquire` possuem chaves primárias compostas e, por isso, exigem uma análise específica.

Na tabela `Contem`, a chave primária é formada por (`id_pedido`, `id_produto`). Atualmente, a tabela não possui atributos não chave, armazenando apenas a combinação dos identificadores.

Na tabela `Adquire`, a chave primária é formada por (`id_compra`, `idProduto`). Assim como na tabela anterior, não existem atributos não chave que dependam parcialmente de apenas um dos identificadores.

Portanto, considerando a estrutura apresentada, não foram identificadas dependências parciais que violem a 2FN.

Caso sejam acrescentados atributos como quantidade e preço unitário praticado por item, eles deverão ser analisados para garantir que dependam da associação completa entre o pedido ou a compra e o respectivo produto, e não apenas de uma parte da chave composta.

#### 3FN — Eliminação de dependências transitivas

A Terceira Forma Normal exige que o modelo esteja na 2FN e que não existam dependências transitivas inadequadas entre atributos não chave.

Uma dependência transitiva ocorre, por exemplo, quando a chave primária determina um atributo não chave que, por sua vez, determina outro atributo não chave da mesma tabela.

No modelo desenvolvido, as informações foram distribuídas entre tabelas de acordo com suas respectivas entidades.

Na tabela `Compra`, são armazenados o identificador da compra, sua data, seu valor total e a chave estrangeira do fornecedor.

Os atributos `nome_fornecedor` e `tipo_fornecedor` permanecem exclusivamente na tabela `Fornecedor`, evitando sua repetição em cada compra.

Essa separação evita uma possível dependência transitiva em uma tabela unificada, na qual `id_compra` determinaria `id_fornecedor` e este determinaria os dados cadastrais do fornecedor.

O mesmo princípio foi aplicado às movimentações de estoque.

A tabela `Movimentacao_Estoque` armazena a referência `id_produto`, mas não repete o nome, a categoria ou o preço de venda do produto. Essas informações permanecem na tabela `Produto`.

Além disso, a tabela `Pagamento` mantém os dados financeiros do pagamento separados dos atributos operacionais armazenados em `Pedido`.

Com base nas dependências funcionais identificadas no modelo, não foram observadas dependências transitivas entre atributos não chave que exigissem novas decomposições.

Assim, a estrutura apresentada é compatível com a 3FN quanto às dependências analisadas, ficando sua validação completa condicionada à confirmação das regras de negócio e dos atributos que ainda poderão ser incorporados.

#### Justificativa do processo de normalização

A aplicação das três primeiras formas normais é importante para garantir que as informações do estabelecimento sejam armazenadas de maneira organizada, reduzindo redundâncias e evitando inconsistências.

A **Primeira Forma Normal (1FN)** foi necessária para impedir a utilização de grupos repetitivos e listas de produtos em campos individuais. Com as tabelas associativas, tornou-se possível registrar diferentes produtos por pedido ou compra de maneira estruturada.

A **Segunda Forma Normal (2FN)** foi importante para verificar as dependências dos atributos em relação às chaves primárias, especialmente nas tabelas associativas. Isso evita que informações pertencentes exclusivamente a um pedido, compra ou produto sejam armazenadas de maneira inadequada em uma associação.

A **Terceira Forma Normal (3FN)** permitiu avaliar a separação das informações cadastrais e operacionais, evitando dependências transitivas. Dessa forma, dados como nome e classificação do fornecedor permanecem em sua tabela específica, sem necessidade de repetição nas compras.

A organização resultante contribui para prevenir anomalias de inserção, atualização e exclusão, além de facilitar a manutenção e a consulta aos dados.

Por exemplo, uma alteração no nome de determinado fornecedor poderá ser realizada diretamente na tabela `Fornecedor`, sem exigir modificações em todos os registros de compras associados a ele.

Da mesma forma, os dados cadastrais de um produto poderão ser atualizados independentemente do histórico de pedidos, compras e movimentações de estoque, preservando suas referências por meio das chaves estrangeiras.

Portanto, a análise de normalização até a 3FN demonstra que a estrutura atual apresenta uma separação adequada das entidades e de suas responsabilidades, considerando as dependências funcionais identificadas.

A normalização, entretanto, não substitui a definição de todos os dados exigidos pelas regras de negócio. A inclusão de quantidade e preço praticado por item nas associações `Contem` e `Adquire`, ainda pendente no DER, deverá preservar essa organização e permitir o registro completo das operações de venda e compra.

### 1.5 Justificativas Técnicas das Decisões

**Pendente — equipe responsável pelo modelo lógico e pelo SQL.** Justificar a escolha das PKs, das FKs, as relações e as restrições `NOT NULL`, `UNIQUE`, `CHECK` e `DEFAULT` efetivamente implementadas, vinculando-as às regras de negócio `RNxx` quando pertinente. Explicar também eventuais decisões arquiteturais. As justificativas **conceituais da Entrega 1**, preservadas na seção 1.1, não substituem esta análise do modelo lógico.

### 1.6 Proposta de Arquitetura Analítica para BI e IA

**Pendente — equipe responsável pelas consultas e pela análise de BI/IA.** Definir KPIs calculáveis a partir das tabelas finais, com fórmula, período e meta (quando disponível), além de aplicações de BI e IA coerentes com os dados realmente registrados. Cada KPI exige consulta gerencial `Gxx` no script SQL.

**Rastreabilidade inicial dos problemas levantados** (as tabelas e consultas serão preenchidas após a implementação; códigos de problemas foram preservados):

| Problema ou KPI | Tabelas envolvidas | Consulta no script SQL |
|---|---|---|
| P1 — Ausência de registro individual das vendas e de visão dos recebimentos do dia | A validar no modelo lógico (pedidos, itens e pagamentos) | Pendente — Gxx |
| P2 — Entradas e saídas financeiras dispersas entre papel e extratos | A validar no modelo lógico (recebimentos, compras, contas e pagamentos de despesas) | Pendente — Gxx |
| P3 — Estoque e necessidade de reposição acompanhados visualmente | A validar no modelo lógico (produtos e movimentações de estoque) | Pendente — Gxx |
| KPIs gerenciais | A definir com base nas tabelas finais, com fórmula e período | Pendente — Gxx por KPI |

**Atenção:** esta tabela registra pendências de rastreabilidade, não comprova consultas existentes nem resolução dos problemas.

---

## 2. Modelo Lógico Relacional

![ModeloLogico](docs/imagens/ModeloLogico.png)

---

## 3. Script SQL Completo

**Pendente — equipe responsável pela implementação SQL.** Disponibilizar o arquivo `.sql` no repositório (preferencialmente `docs/script.sql`) e adicionar o link aqui somente quando existir.

**SGBD exigido:** MySQL. O script deverá executar desde banco vazio e conter `CREATE DATABASE`, `CREATE TABLE`, restrições de integridade, `INSERT`, `SELECT` com `JOIN`, `UPDATE`, `DELETE`, consultas gerenciais e consultas de auditoria.

Cada consulta gerencial precisa ter código `G01`, `G02` etc., pergunta respondida e indicação do problema/KPI atendido. Cada consulta de auditoria precisa ter código `A01`, `A02` etc., pergunta respondida e regra `RNxx` verificada. Registrar o resultado do teste de execução integral antes da entrega.

---

## 4. Massa de Dados

**Pendente — equipe responsável pela implementação e testes.** Disponibilizar dados **fictícios**, consistentes com o levantamento, em script `.sql` (integrado ao script principal ou separado, preferencialmente em `docs/`).

Justificar a quantidade de registros por tabela com os volumes reais validados na caracterização da organização. Incluir cenários variados para demonstrar consultas gerenciais e auditorias (por exemplo, períodos diferentes, modalidades de pagamento, pedidos com situações distintas e níveis de estoque diferentes).

**Dependência documental:** os volumes de pedidos, vendas, compras e produtos ativos ainda não foram quantificados nas fontes disponíveis; não atribuir números fictícios ao porte da organização como se fossem observados.

---

## 5. Repositório GitHub

Este repositório centraliza o relatório e os artefatos da Entrega 2. O trabalho será corrigido com base no conteúdo da branch `main`.

| Artefato exigido | Localização | Situação |
|---|---|---|
| Relatório Técnico Final | [README.md](README.md) | Estrutura da Entrega 2 organizada; seções técnicas pendentes identificadas |
| Dicionário de Dados | [dicionario_dados_conceitual.html](dicionario_dados_conceitual.html) | Existe; alinhar a versão final ao modelo lógico e às restrições implementadas |
| DER conceitual | [docs/imagens/DER_esquina_dos_amigos_v2.jpg](docs/imagens/DER_esquina_dos_amigos_v2.jpg) | Versão existente da Entrega 1; revisão técnica pendente |
| Modelo lógico | Link a inserir após criação | Pendente |
| Levantamento de requisitos | [levantamento/levantamento.md](levantamento/levantamento.md) | Presente, com pendências de validação indicadas |
| Fontes e evidências | [levantamento/evidencias.md](levantamento/evidencias.md), [levantamento/fontes/](levantamento/fontes/) e [docs/imagens/](docs/imagens/) | Presentes parcialmente; comprovação específica da entrevista e formatos das fotos a verificar |
| Script SQL MySQL | Link a inserir após criação | Pendente |
| Massa de dados fictícia | Link a inserir após criação | Pendente |
| Apresentação final | Link a inserir após criação | Pendente |

As fotos atuais estão no repositório com extensão `.jpeg`. O enunciado exige arquivos **JPG ou PNG**; o grupo deve conferir a adequação dos arquivos e adicionar, quando disponível, a foto da entrevista com o responsável no local. Também deve manter histórico de commits distribuído entre os integrantes, com os nomes e usuários de GitHub identificáveis na tabela inicial.

---

## 6. Uso de Inteligência Artificial

O grupo utilizou ChatGPT como ferramenta de apoio durante a elaboração do trabalho.

**Organização e interpretação das informações**

| Item | Registro |
|------|-----------|
| **Ferramenta e etapa** | ChatGPT-5.6 Sol Medium — organização das informações levantadas durante a entrevista, estruturação e revisão da Entrega 1 e criação da versão em HTML do Dicionário de Dados Conceitual |
| **Motivação** | Organizar as informações coletadas, identificar processos, requisitos, regras de negócio e possíveis entidades para o modelo conceitual, revisar a consistência da documentação com o DER e converter o Dicionário de Dados Conceitual para o formato HTML exigido na entrega. |
| **Prompt(s) utilizados** | 1. “Com base nas informações levantadas sobre a organização, organize os principais processos de negócio, requisitos funcionais, regras de negócio e entidades que poderiam fazer parte de um modelo conceitual de banco de dados.” 2. “Analise a documentação e o DER e verifique se as entidades, atributos, relacionamentos e cardinalidades estão coerentes com os requisitos e regras de negócio levantados.” 3. “Revise os relacionamentos pertinentes do modelo e identifique se existe algum relacionamento faltando ou alguma cardinalidade que precise ser ajustada.” 4. “Com base no Dicionário de Dados Conceitual já existente no README, crie uma versão em HTML contendo as entidades, atributos, descrições e regras de negócio associadas, para ser anexada ao repositório GitHub conforme solicitado no formato de entrega.” 5. “Com base nos processos de negócio levantados para o Bar e Restaurante Esquina dos Amigos, organize um fluxograma contemplando o fluxo do pedido, o fluxo de estoque e reposição e o fluxo financeiro, de forma clara e compatível com a realidade observada no estabelecimento.” |
| **Resposta recebida** | A IA organizou as informações da entrevista em processos de negócio, requisitos funcionais, requisitos não funcionais e regras de negócio, além de sugerir entidades e relacionamentos candidatos para o modelo conceitual. Posteriormente, auxiliou na revisão crítica do modelo, identificando inconsistências entre a documentação e o DER, como a necessidade de representar as movimentações de estoque e ajustes nas cardinalidades e atributos. Também gerou uma versão em HTML do Dicionário de Dados Conceitual já presente no README, mantendo as entidades, atributos, descrições e regras de negócio definidas pelo grupo. Além disso, apoiou a estruturação do fluxograma dos processos de negócio, organizando visualmente as etapas relacionadas ao pedido, ao estoque/reposição e ao fluxo financeiro, posteriormente revisadas e validadas pelo grupo com base na realidade observada no estabelecimento. |
| **Fontes consultadas e verificadas** | As informações referentes à operação foram obtidas a partir da entrevista/pesquisa de campo realizada pelo grupo. Os conteúdos teóricos das aulas também foram utilizados como material de apoio |
| **Trechos rejeitados ou corrigidos** | Sugestões de entidades ou processos que não correspondessem à realidade observada foram rejeitadas ou ajustadas pelo grupo após a validação com o responsável, como por exemplo as entidades Cliente e Funcionário, que foram retirados do modelo após análise |
| **Justificativa da escolha final** | A decisão final sobre processos, entidades, atributos e regras foi tomada pelo grupo com base na realidade observada na organização e nas informações validadas durante a entrevista |
| **Reflexão crítica** | A IA pode propor estruturas de dados plausíveis que não necessariamente correspondem ao funcionamento real do estabelecimento. Por isso, suas sugestões foram utilizadas como apoio à modelagem e confrontadas com as informações obtidas em campo. |

---

### Revisão documental de 28/10/2026

| Item | Registro |
|---|---|
| Ferramenta e etapa | Codex — auditoria e revisão documental preparatória para a Entrega 2 |
| Motivação | Confrontar fontes, correção da Entrega 1 e esqueleto da Entrega 2; organizar levantamento/evidências e detalhar processos, RF/RNF e regras |
| Prompt utilizado (trecho) | “o que ja é certeza do que precisa ser mudado DENTRO DO ESCOPO DAS MINHAS RESPONSABILIDADES, pode executar (faça um PR)”. Complemento: “faça as devidas correções seguindo o modelo (PDF), inclua no mesmo PR aberto” |
| Resposta e trabalho produzido | Auditoria, síntese do levantamento, identificação das fontes, revisão do README e ajustes documentais no HTML |
| Fontes consultadas | README e HTML da main; issue #1; anexo de perguntas e respostas; esqueleto da Entrega 2; confirmações do integrante registradas em levantamento/fontes/confirmacoes-documentais.md; manual oficial MySQL para DATETIME; exemplo do professor 02-03h_Exemplo de Dicionário de Dados.pdf (página 5) |
| Correções e limites | A proposta de PostgreSQL já havia sido substituída por MySQL na main. Corrigida a frase contraditória sobre DATETIME. Após receber o exemplo do professor (02-03h, página 5), as tabelas de atributos e tipos foram consolidadas nas quatro colunas do exemplo, com explicação das operações e da integridade. O limite de dez minutos foi identificado como estimativa adotada, sem alegar confirmação do restaurante |
| Escolha final | Incorporar apenas dados apoiados pelas fontes e decisões expressas do integrante; deixar lacunas e dependências técnicas explícitas |
| Reflexão crítica | A IA não comprova visita, identidade, volumes, conformidade legal ou aceitação humana. Os textos gerados precisam de revisão do grupo; DER, SQL e evidências ausentes não foram produzidos artificialmente |

---

### Reorganização do README para a Entrega 2 — 29/10/2026

| Item | Registro |
|---|---|
| Ferramenta e etapa | ChatGPT — reorganização documental do `README.md` |
| Motivação | Adequar o Relatório Técnico Final ao esqueleto obrigatório da Entrega 2, preservando a revisão já realizada na Entrega 1 |
| Prompt(s) utilizados | “A gene tem que mudar o esqueleto do readme pro modelo da entrega 2.”; “Faça isso, é a unica coisa q falta da minha parte” |
| Resposta recebida | Proposta e execução de reorganização das seções existentes em 1.1 e criação das seções 1.2–1.6 e 2–7 previstas no enunciado |
| Fontes consultadas e verificadas | README da branch `main`, arquivo `00-d_Esqueleto_Entrega_2.md` e anotações `Perguntas e respostas`; conferência dos caminhos dos artefatos existentes no repositório |
| Trechos rejeitados ou corrigidos | Não foram inventados volumes de operação, vínculos entre tabelas, consultas SQL, modelo lógico ou comprovação da entrevista. Os itens não disponíveis foram marcados como pendentes |
| Justificativa da escolha final | Manter a documentação existente, eliminar a estrutura de Entrega 1 como índice principal e não atribuir a terceiros decisões técnicas ainda não validadas |
| Reflexão crítica | O texto de IA organiza a documentação, mas não substitui validação presencial, auditoria do DER, aprovação do grupo ou execução dos scripts SQL |

---

## 7. Apresentação Corporativa Final

**Pendente — apresentação do grupo.** Preparar um pitch de **8 minutos**, com slides de leitura visual clara, na ordem exigida:

1. Contextualização dos problemas operacionais do estabelecimento;
2. Solução proposta e abrangência do banco de dados;
3. Modelo lógico relacional efetivamente elaborado;
4. Demonstração do script SQL executando no MySQL;
5. Demonstração de consultas gerenciais (`Gxx`) e de auditoria (`Axx`);
6. Potencial dos dados para BI e IA;
7. Benefícios para a tomada de decisão da organização.

Inserir aqui o link da apresentação quando o arquivo estiver no repositório. Todos os integrantes deverão participar da defesa do modelo lógico, mesmo que nem todos apresentem o pitch.
