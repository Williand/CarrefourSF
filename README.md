# 🧪 Testes Automatizados CarrefourSF

Este repositório contém testes automatizados de API utilizando o **Robot Framework** para a aplicação fictícia **ServeRest**, conforme documentação oficial: [https://serverest.dev](https://serverest.dev).

## 💻 Configuração do Ambiente Local

### 🔧 Requisitos

- Python 3.10+
- pip (gerenciador de pacotes do Python)
- Git (opcional, mas recomendado)

### 📦 Instalação de dependências

Clone o repositório:

```bash
git clone https://github.com/Williand/CarrefourSF.git
cd CarrefourSF

Instale os pacotes:
pip install --upgrade pip
pip install -r requirements.txt

▶️ Executando os Testes
Para rodar todos os testes localmente:
robot -d ./results api_tests/tests/

Os relatórios serão gerados na pasta results/:
report.html: Relatório detalhado
log.html: Logs de execução
output.xml: Saída em XML (CI/CD)

🔁 Integração Contínua (CI) com GitHub Actions
Toda vez que um push for feito na branch main, os testes serão executados automaticamente via GitHub Actions.

📦 Os relatórios de execução são salvos como artefato da pipeline e podem ser baixados no menu "Actions" do repositório.

📤 Gerando Relatórios no Pull Request ou Commits
Este projeto utiliza o plugin:
joonvena/robotframework-reporter-action

💡 Para comentar em commits, adicione um Personal Access Token como secret:
Nome do secret: PERSONAL_GH_TOKEN
Permissão necessária: repo
