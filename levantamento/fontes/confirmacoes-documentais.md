# Confirmações e decisões complementares — 28/10 e 02/11/2026

Fonte: informações fornecidas pelo integrante nas conversas de revisão documental de 28/10 e 02/11/2026. **Não se trata de nova entrevista com o restaurante**, e decisões do projeto não devem ser apresentadas como práticas observadas.

| Referência | Informação recebida | Uso documental |
|---|---|---|
| RN01 | “Aceita VR sim.” | Vale-refeição mantido entre modalidades aceitas |
| RN03 | Endereço na R. Inês Monteiro, Parque Arthur Alvim; entregas de até dez minutos a pé | Limite adotado como critério do projeto |
| RN03 — esclarecimento | O integrante esclareceu que é uma estimativa e autorizou sua adoção | Regra definida para o projeto, sem atribuir medição ou confirmação ao restaurante |
| RN05 | “O cliente quem pede e paga pela entrega.” | Transporte por aplicativo solicitado e pago pelo cliente |
| RN12 | “Sem frete proprio, confirmo.” | Entregas locais sem cobrança de frete próprio |
| RN14 | Orientação de usar o anexo como fonte | Exceção descrita a partir de perguntas-e-respostas.txt |

## Atualização fornecida pelo integrante em 02/11/2026

| Referência | Informação/decisão recebida | Natureza e uso |
|---|---|---|
| Equipe | “são 4 funcionarios” | Informação complementar do integrante; conferir se inclui o proprietário, pois fontes anteriores divergiam |
| Volume | Em discussão anterior surgiu a hipótese de “12 pedidos por hora”, mas o integrante esclareceu depois que **não conhece os volumes reais** | **Desconsiderar** os 12 pedidos/hora como média ou pico do estabelecimento; registrar ausência de dados confiáveis |
| RN07 | “Cadastrar estoque mínimo por produto e alertar quando estiver baixo” | Decisão do sistema: mínimo configurável por produto comercializado; alerta quando saldo ≤ mínimo |
| RN08 | “Conferem e registram a diferença para resolver com o fornecedor” | Decisão de registrar divergências; não confirma processamento de entregas parciais |
| RN14 | “Sim, antes do preparo” sobre cancelamentos | Decisão do sistema de permitir cancelamento comum antes do preparo; não modifica o caso de prato errado originalmente relatado |
| RN15 | “Todos na hora, sem pagamentos divididos” | Decisão de projeto: uma modalidade por pedido, sem fiado; momento exato em relação ao preparo não definido |
| RN10 | Resposta intermediária de controlar ingredientes foi **revogada**: “nao vamos controlar ingredientes da cozinha” | Manter o escopo anterior: estoque somente dos produtos comercializados |
| RN11 | “Não, somente controlar permissões de acesso” | Não vincular executor em cada operação; perfis de acesso necessários |

## Complementações posteriores no mesmo dia

| Referência | Informação recebida | Uso documental |
|---|---|---|
| Identificação | “Identificação que temos é apenas o 'Ceará', apelido do proprietário.”; em 04/11/2026, o integrante esclareceu que ele próprio se identifica como Ceará e foi entrevistado | **Responsável entrevistado: Ceará, proprietário.** Nome de uso informado pelo próprio responsável; não tratar falta de outro nome civil como ausência de identificação ou dúvida sobre a entrevista |
| Volumes | “Os volumes nao da pra saber.” | **Nenhuma média real de pedidos, compras, vendas ou entregas está disponível.** Descartar a hipótese anterior de 12 pedidos/hora para caracterização |
| RN16 — cardápio semanal | Imagem de cardápio anexada pelo integrante nesta conversa | Fonte transcrita em [cardapio-semanal-transcricao.md](cardapio-semanal-transcricao.md). A imagem apresenta segunda a sábado, **duas entradas de sexta-feira** e colunas PF/COM.; vigência, significado de COM. e erro gráfico ainda incertos |

Estas decisões deverão ser refletidas em RF/RN e revisadas pelos responsáveis pelos modelos e SQL. **Não foram implantadas nem confirmadas em entrevista.** O cardápio transcrito está visível na fotografia já versionada [Image04.jpeg](../../docs/imagens/Image04.jpeg), conforme conferência visual nesta auditoria.

A adoção do limite de dez minutos não define raio em quilômetros nem uma integração de mapas. Os demais dados desconhecidos permanecem pendentes no levantamento.

## Esclarecimento sobre a entrevista — 04/11/2026

O integrante confirmou que **Ceará é o nome com o qual o proprietário se apresenta** e que a **entrevista foi realizada com ele**. As respostas coletadas estão preservadas em [perguntas-e-respostas.txt](perguntas-e-respostas.txt). A auditoria posterior retifica a afirmação de ausência genérica de data, participantes e fotos: a data foi confirmada pelo integrante e a equipe e as imagens já estavam no repositório, conforme registro abaixo.

## Auditoria das fontes e confirmação da data — 04/11/2026

- **Data da entrevista: 07/09/2026.** Fonte: confirmação expressa do integrante na solicitação desta revisão, que informa “data 07/09/2026”. A data não está escrita em `perguntas-e-respostas.txt` e não foi deduzida de metadados de imagem ou de commits.
- **Entrevistado: Ceará, proprietário**, nome pelo qual se identifica, conforme esclarecimento anterior do integrante. F01 preserva as respostas.
- **Participantes do projeto já identificados:** Cauã Francisco Gomes da Silva, João Pedro Liberato de Oliveira, Marcus Vinicius dos Santos Cruz e João Vitor Gonçalves de Oliveira. Fontes: [README, seção Integrantes](../../README.md#integrantes), com RGM/GitHub, e [issue #1, Integrantes](https://github.com/Marcuss9/sistema-gestao-bar-restaurante/issues/1). A presença individual de cada integrante em 07/09 não é discriminada nesses registros; não se transforma a composição conhecida da equipe em lista de presença presumida.
- **Fotos já existentes:** [Image01.jpeg](../../docs/imagens/Image01.jpeg), [Image02.jpeg](../../docs/imagens/Image02.jpeg), [Image03.jpeg](../../docs/imagens/Image03.jpeg) e [Image04.jpeg](../../docs/imagens/Image04.jpeg), também vinculadas no README. A issue #1, critério 3.2, reconhece “visita presencial com fotos no repositório” e observa que nenhuma mostra Ceará. A inspeção visual identifica em Image04 o levantamento no balcão, notebook e o mesmo cardápio semanal transcrito. Isso corrige a declaração de que faltava uma imagem do cardápio no repositório. Não se afirma que o anexo da conversa e a fotografia sejam o mesmo arquivo binário.

O horário, a autoria das fotos e a identificação nominal das pessoas fotografadas não foram comprovados. Isso não torna a entrevista, a equipe ou o conjunto fotográfico inexistentes. A extensão `.jpeg` corresponde ao formato JPEG e não prova inadequação do arquivo por si só.
