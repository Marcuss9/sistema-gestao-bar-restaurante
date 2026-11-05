# Transcrição do cardápio semanal — Esquina dos Amigos

**Origem:** imagem de cardápio semanal fornecida pelo integrante em 02/11/2026 na conversa de revisão documental. O mesmo cardápio semanal já está fotografado em [Image04.jpeg](../../docs/imagens/Image04.jpeg), no balcão do estabelecimento, conforme inspeção visual desta auditoria: sete entradas, duas sextas-feiras e colunas PF/COM. O anexo da conversa e a foto não foram declarados arquivos binários idênticos; este documento preserva a transcrição textual. Data de publicação e período de vigência do cardápio não informados. A fonte não comprova vendas realizadas nem frequência dos pedidos.

## Pratos, acompanhamentos e valores

| Dia impresso na imagem | Prato | Acompanhamentos impressos | PF | COM. |
|---|---|---|---:|---:|
| Segunda-feira | Picadinho | Arroz, feijão, farofa e salada | R$ 25,00 | R$ 40,00 |
| Terça-feira | Bife de panela | Arroz, feijão, farofa e salada | R$ 25,00 | R$ 40,00 |
| Quarta-feira | Feijoada | Arroz, couve, farofa, torresmo e calabresa | R$ 35,00 | R$ 70,00 |
| Quinta-feira | Frango ao molho com macarrão | Arroz, feijão, farofa e salada | R$ 25,00 | R$ 40,00 |
| Sexta-feira (primeira entrada) | Peixe com purê de batatas | Arroz, feijão, farofa e salada | R$ 35,00 | R$ 50,00 |
| Sexta-feira (segunda entrada) | Rabada | Arroz, feijão, farofa e salada | R$ 25,00 | R$ 40,00 |
| Sábado | Feijoada | Arroz, couve, farofa, torresmo e calabresa | R$ 35,00 | R$ 70,00 |

## Limites de interpretação e pendências da RN16

1. **O texto da imagem repete SEXTA-FEIRA** para Peixe com purê de batatas e Rabada; não há indicação de domingo. Não alterar o dia de Rabada por suposição. Confirmar se os dois pratos são oferecidos na sexta ou se houve erro gráfico.
2. As colunas são literalmente **“PF”** e **“COM.”**. O significado comercial de “COM.” e a diferença entre as modalidades não foram explicitados na imagem; não inferir quantidade, peso ou formato.
3. O cardápio documenta oferta anunciada por dia e preço impresso, **não comprova prática efetiva, atualização de preço, disponibilidade permanente ou horário da oferta**.
4. O modelo lógico atual tem apenas um `preco_venda_produto` por Produto e não possui campos explícitos para dia de disponibilidade ou modalidade PF/COM. A equipe técnica deve decidir como representar variantes e dias (por exemplo, produtos distintos ou evolução da modelagem), sem considerar automaticamente implementada a RN16.
5. **Evidência fotográfica já versionada:** [docs/imagens/Image04.jpeg](../../docs/imagens/Image04.jpeg). O cardápio semanal está visível no primeiro plano; não há pendência de inexistência de fotografia desse cardápio.

## Aplicação documental

A RN16 pode referenciar este cardápio como informação suplementar sobre pratos especiais por dia, preservando a dúvida sobre a segunda sexta-feira. Os preços devem ser registrados como **valores do cardápio anexado, sem data de vigência confirmada**.
