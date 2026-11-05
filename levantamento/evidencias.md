# Índice das evidências

Auditoria documental de 04/11/2026, realizada antes das correções a partir da `main` em `b75afd758581568d406ca0b6e5d29a34e06830ef`. O PR #8 já estava mesclado em `ed385c29d1313172ba33a85e8afd4cea9454d990`; não havia PR aberto. Alterações posteriores de colaboradores foram preservadas.

## Entrevista, equipe e visita já documentadas

| Informação | Fonte exata e alcance |
|---|---|
| Entrevista realizada em **07/09/2026** | Data confirmada expressamente pelo integrante na solicitação desta revisão e registrada em [confirmações documentais](fontes/confirmacoes-documentais.md#auditoria-das-fontes-e-confirmação-da-data--04112026); não foi inferida das fotos |
| **Ceará, proprietário entrevistado** | Esclarecimento do integrante registrado em [confirmações documentais](fontes/confirmacoes-documentais.md); respostas preservadas em [perguntas-e-respostas.txt](fontes/perguntas-e-respostas.txt) |
| Participantes do projeto | [README, Integrantes](../README.md#integrantes), com nomes, RGM e GitHub, e [issue #1, Integrantes](https://github.com/Marcuss9/sistema-gestao-bar-restaurante/issues/1): Cauã Francisco Gomes da Silva; João Pedro Liberato de Oliveira; Marcus Vinicius dos Santos Cruz; João Vitor Gonçalves de Oliveira |
| Visita presencial com fotos | A [issue #1, critério 3.2](https://github.com/Marcuss9/sistema-gestao-bar-restaurante/issues/1) reconhece a visita e as fotos já vinculadas no README. A mesma avaliação observa que nenhuma mostra o responsável Ceará |

A equipe está identificada: não há pendência de composição dos participantes do projeto. Esses registros não discriminam a presença individual de cada integrante na entrevista. Também não identificam nominalmente as pessoas fotografadas, a autoria das fotos ou o horário da entrevista; esses dados não são inventados nem tratados como ausência de entrevista ou de fotografias.

## Fotografias existentes, inspecionadas nesta auditoria

Os arquivos permanecem nos caminhos originais para preservar links e histórico. A descrição abaixo resulta da inspeção visual, além da referência na issue #1.

| Arquivo | Conteúdo visível |
|---|---|
| [Image01.jpeg](../docs/imagens/Image01.jpeg) | Fachada com o nome Bar e Restaurante Esquina dos Amigos |
| [Image02.jpeg](../docs/imagens/Image02.jpeg) | Cardápio físico no balcão: café, salgados, porções e lanches; contato comercial impresso |
| [Image03.jpeg](../docs/imagens/Image03.jpeg) | Consumo de lanches à mesa no estabelecimento; não se atribui identidade à pessoa enquadrada parcialmente |
| [Image04.jpeg](../docs/imagens/Image04.jpeg) | Registro do levantamento no balcão, com notebook, anotações em tela, pessoa parcialmente enquadrada e cardápio semanal em primeiro plano |

**As quatro fotografias já existem e documentam a visita.** A ausência de identificação de Ceará nelas é um limite do conjunto, conforme a issue #1; não autoriza declarar inexistentes as fotos do levantamento. Os quatro arquivos são JPEG reais, com extensão `.jpeg`; a extensão, por si só, não caracteriza falta de foto. Não houve conversão ou alteração das imagens.

## Cardápio semanal complementar (RN16)

A [transcrição](fontes/cardapio-semanal-transcricao.md) foi produzida a partir do anexo fornecido pelo integrante em 02/11/2026. O **mesmo conteúdo de cardápio já está visível em [Image04.jpeg](../docs/imagens/Image04.jpeg)**: sete entradas de segunda a sábado, duas rotuladas como sexta-feira, colunas PF/COM. e respectivos preços. A afirmação anterior de ausência de fotografia desse cardápio no repositório estava incorreta. Não se afirma identidade binária entre o anexo da conversa e esta fotografia.

A duplicidade de sexta-feira, o significado de COM., a vigência dos valores e a representação de dias/modalidades no modelo continuam sem definição comprovada; o texto não corrige esses pontos por suposição.

## Outras lacunas concretas e limites da auditoria

- Não há arquivo `.sql`, massa de dados versionada, evidência de execução MySQL ou apresentação no inventário atual. As contagens e consultas descritas no README são propostas, não resultados conferidos em banco. Esses artefatos permanecem sob responsabilidade da equipe técnica.
- Os diagramas atuais são [DER_entrega_02.png](../docs/imagens/DER_entrega_02.png) e [modelo_logico_02.png](../docs/imagens/modelo_logico_02.png). Foram corrigidos links ativos que apontavam aos nomes antigos inexistentes. Os nomes citados em registros históricos de IA não são reescritos como se a referência original fosse outra.
- A inspeção dos diagramas e do dicionário confirma ausência de estoque mínimo (RN07) e estrutura de divergências de recebimento (RN08). Quantidade/preço constam das tabelas lógicas Contem/Adquire, mas não dos losangos do DER. Despesa já consta dos diagramas e do dicionário; não é uma tabela ausente.
- Volumes reais não foram quantificados com segurança pelo proprietário, conforme confirmação do integrante. Não são substituídos por médias fictícias.
- Permanecem sem comprovação adicional a contagem de funcionários incluindo ou não o proprietário, procedimentos financeiros e detalhes de cancelamento/recebimento indicados no levantamento. Não foram alteradas regras, diagramas, SQL ou contribuições de outros colaboradores.
- O esqueleto e o PDF do professor são citados pela documentação, mas não constam do inventário desta `main`. Esta auditoria não os reconsultou nem conclui aceitação da Entrega 2 por eles. A issue #1 não tem comentários adicionais e é avaliação histórica da E1, não avaliação da E2.

## Fontes e artefatos de apoio

- [Anotações originais](fontes/perguntas-e-respostas.txt), preservadas sem alteração.
- [Confirmações complementares](fontes/confirmacoes-documentais.md).
- [Levantamento organizado](levantamento.md).
- [DER atual](../docs/imagens/DER_entrega_02.png), [modelo lógico atual](../docs/imagens/modelo_logico_02.png), [dicionário](../dicionario_dados_conceitual.html) e [fluxograma](../docs/imagens/fluxograma.jpeg): artefatos técnicos, distintos das fotos da visita.
