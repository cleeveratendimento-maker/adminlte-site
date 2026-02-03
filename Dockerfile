FROM node:18-slim

WORKDIR /app

# 1. Copia todos os arquivos do GitHub para o Robô
COPY . .

# 2. Instala as dependências do projeto
RUN npm install

# 3. Tenta construir o projeto (Gera a pasta 'dist' se for React/Vue/AdminLTE)
# O comando --if-present evita erro se não tiver script de build
RUN npm run build --if-present

# 4. Instala um servidor web super rápido
RUN npm install -g serve

# 5. Coloca o site no ar na porta 3000
# O ponto (.) diz para servir a pasta atual
CMD ["serve", "-s", ".", "-l", "3000"]
