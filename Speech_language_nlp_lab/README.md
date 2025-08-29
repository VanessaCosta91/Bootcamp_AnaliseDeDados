# Speech & NLP Lab com IA Open Source

Este projeto tem como objetivo aplicar conceitos de inteligência artificial para transcrição de fala e análise de linguagem natural, utilizando ferramentas gratuitas e de código aberto, como o Whisper e o TextBlob.

## Objetivos
- Transcrever áudio em texto com o modelo Whisper da OpenAI
- Analisar o texto transcrito com técnicas de NLP
- Documentar a experiência técnica de forma clara

## Ferramentas Utilizadas
- **Whisper**: para transcrição de áudio
- **TextBlob**: para análise de sentimento
- **Google Colab**: para execução do código
- **GitHub**: para documentação

## Fluxo do Projeto
1. Gravação de um áudio de teste com uma fala simples
2. Transcrição com Whisper
3. Análise de sentimentos com TextBlob
4. Interpretação dos resultados

## Resultados

### Áudio transcrito

"Olá, meu nome é Vanessa Costa e esse é um teste de transcrição usando inteligência artificial que eu estou muito contente em aprender."

### Análise de Sentimento

| Métrica        | Resultado |
|----------------|-----------|
| Polaridade     | -0.6      |
| Subjetividade  | 1.0       |

Apesar de o conteúdo ser positivo, o modelo interpretou como negativo. Isso demonstra limitações do TextBlob com idioma português. O teste reforça a importância de avaliar criticamente os resultados de modelos pré-treinados.


## Autor
Vanessa costa