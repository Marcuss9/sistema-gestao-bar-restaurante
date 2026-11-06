# Índice das evidências

Auditoria documental original de 04/11/2026, realizada a partir da `main` em `b75afd758581568d406ca0b6e5d29a34e06830ef`. Naquela data, o PR #8 já estava mesclado em `ed385c29d1313172ba33a85e8afd4cea9454d990` e não havia PR aberto. **Atualização do inventário em 06/11/2026:** foram adicionados ao repositório o script SQL completo e a fotografia indicada pelo grupo como registro da entrevista com o proprietário. As observações da auditoria de 04/11 permanecem identificadas como históricas; o texto a seguir distingue o estado anterior do atual.

## Entrevista, equipe e visita já documentadas

| Informação | Fonte exata e alcance |
|---|---|
| Entrevista realizada em **07/09/2026** | Data confirmada expressamente pelo integrante na solicitação desta revisão e registrada em [confirmações documentais](fontes/confirmacoes-documentais.md#auditoria-das-fontes-e-confirmação-da-data--04112026); não foi inferida das fotos |
| **Ceará, proprietário entrevistado** | Esclarecimento do integrante registrado em [confirmações documentais](fontes/confirmacoes-documentais.md); respostas preservadas em [perguntas-e-respostas.txt](fontes/perguntas-e-respostas.txt) |
| Participantes do projeto | [README, Integrantes](../README.md#integrantes), com nomes, RGM e GitHub, e [issue #1, Integrantes](https://github.com/Marcuss9/sistema-gestao-bar-restaurante/issues/1): Cauã Francisco Gomes da Silva; João Pedro Liberato de Oliveira; Marcus Vinicius dos Santos Cruz; João Vitor Gonçalves de Oliveira |
| Visita presencial e registro fotográfico | A [issue #1, critério 3.2](https://github.com/Marcuss9/sistema-gestao-bar-restaurante/issues/1) reconheceu as quatro fotos então existentes, mas registrou ausência de fotografia do responsável Ceará **naquele conjunto**. Posteriormente, o grupo adicionou [foto_entrevista_ceara.png](../docs/imagens/foto_entrevista_ceara.png) ao repositório e a referenciou no README como registro da entrevista |

A equipe está identificada: não há pendência de composição dos participantes do projeto. Esses registros não discriminam a presença individual de cada integrante na entrevista, sua autoria fotográfica ou o horário. **A identificação do proprietário na nova fotografia é informada pelo grupo no README**, não deduzida dos quatro arquivos antigos nem de uma avaliação da issue #1.

## Fotografias existentes e atualização do inventário

As descrições das quatro fotografias originais resultam da auditoria documental de 04/11/2026. A quinta imagem foi adicionada posteriormente; sua finalidade e a identificação de Ceará são informadas pelo grupo no README. Os arquivos originais foram preservados, mantendo seus links e histórico.

| Arquivo | Conteúdo visível |
|---|---|
| [Image01.jpeg](../docs/imagens/Image01.jpeg) | Fachada com o nome Bar e Restaurante Esquina dos Amigos |
| [Image02.jpeg](../docs/imagens/Image02.jpeg) | Cardápio físico no balcão: café, salgados, porções e lanches; contato comercial impresso |
| [Image03.jpeg](../docs/imagens/Image03.jpeg) | Consumo de lanches à mesa no estabelecimento; não se atribui identidade à pessoa enquadrada parcialmente |
| [Image04.jpeg](../docs/imagens/Image04.jpeg) | Registro do levantamento no balcão, com notebook, anotações em tela, pessoa parcialmente enquadrada e cardápio semanal em primeiro plano |
| [foto_entrevista_ceara.png](../docs/imagens/foto_entrevista_ceara.png) | Fotografia adicionada posteriormente e descrita pelo grupo no README como registro da entrevista com Ceará, proprietário do estabelecimento |

**O inventário atual possui cinco fotografias:** as quatro imagens JPEG originais e a nova imagem PNG da entrevista. A ressalva da [issue #1](https://github.com/Marcuss9/sistema-gestao-bar-restaurante/issues/1) sobre não identificar Ceará referia-se às **quatro imagens anteriores** e não deve ser apresentada como descrição do conjunto atualizado. As imagens estão em `docs/imagens/`, dentro da branch `main`, nos formatos JPEG e PNG previstos pelo esqueleto. Não houve renomeação ou alteração das fotografias originais.

## Cardápio semanal complementar (RN16)

A [transcrição](fontes/cardapio-semanal-transcricao.md) foi produzida a partir do anexo fornecido pelo integrante em 02/11/2026. O **mesmo conteúdo de cardápio já está visível em [Image04.jpeg](../docs/imagens/Image04.jpeg)**: sete entradas de segunda a sábado, duas rotuladas como sexta-feira, colunas PF/COM. e respectivos preços. A afirmação anterior de ausência de fotografia desse cardápio no repositório estava incorreta. Não se afirma identidade binária entre o anexo da conversa e esta fotografia.

A duplicidade de sexta-feira, o significado de COM., a vigência dos valores e a representação de dias/modalidades no modelo continuam sem definição comprovada; o texto não corrige esses pontos por suposição.

## Outras lacunas concretas e limites da auditoria

- **SQL e massa de dados:** o arquivo [docs/script.sql](../docs/script.sql) está versionado na `main` e contém o esquema, a carga fictícia e as consultas. A **ausência do SQL** foi constatada apenas no inventário histórico de 04/11/2026 e não corresponde mais ao estado atual. O grupo relatou execução e testes no MySQL Workbench no README; este índice não contém, por si só, resultados ou capturas que comprovem cada retorno. Não há apresentação final identificada no inventário consultado.
- Os diagramas atuais são [DER_entrega_02.png](../docs/imagens/DER_entrega_02.png) e [modelo_logico_02.png](../docs/imagens/modelo_logico_02.png). Foram corrigidos links ativos que apontavam aos nomes antigos inexistentes. Os nomes citados em registros históricos de IA não são reescritos como se a referência original fosse outra.
- A inspeção dos diagramas e do dicionário confirma ausência de estoque mínimo (RN07) e estrutura de divergências de recebimento (RN08). Quantidade/preço constam das tabelas lógicas Contem/Adquire, mas não dos losangos do DER. Despesa já consta dos diagramas e do dicionário; não é uma tabela ausente.
- Volumes reais não foram quantificados com segurança pelo proprietário, conforme confirmação do integrante. Não são substituídos por médias fictícias.
- Permanecem sem comprovação adicional a contagem de funcionários incluindo ou não o proprietário, procedimentos financeiros e detalhes de cancelamento/recebimento indicados no levantamento. Não foram alteradas regras, diagramas, SQL ou contribuições de outros colaboradores.
- O esqueleto e o PDF do professor são citados pela documentação, mas não constam do inventário de arquivos da `main`. A análise documental original de 04/11 não os reconsultou nem concluiu aceitação da Entrega 2; este inventário atualizado também não constitui aprovação do professor. A issue #1 refere-se à avaliação histórica da Entrega 1, não à Entrega 2.

## Fontes e artefatos de apoio

- [Anotações originais](fontes/perguntas-e-respostas.txt), preservadas sem alteração.
- [Confirmações complementares](fontes/confirmacoes-documentais.md).
- [Levantamento organizado](levantamento.md).
- [DER atual](../docs/imagens/DER_entrega_02.png), [modelo lógico atual](../docs/imagens/modelo_logico_02.png), [dicionário](../dicionario_dados_conceitual.html) e [fluxograma](../docs/imagens/fluxograma.jpeg): artefatos técnicos, distintos das fotos da visita.
- [Fotografia da entrevista com o proprietário](../docs/imagens/foto_entrevista_ceara.png), conforme identificação e contexto informados pelo grupo no [README](../README.md). 
- [Script SQL completo e massa fictícia](../docs/script.sql), disponível na `main`.
