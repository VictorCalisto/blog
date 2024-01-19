FROM ruby:3.3.0

# Atualizar os pacotes e instalar as dependências
RUN apt-get update -y

# Instala dependencias
RUN apt-get install -qy --no-install-recommends \
    curl \
    gpg \
    autoconf  \
    bison  \
    build-essential  \
    libssl-dev  \
    libyaml-dev  \
    libreadline6-dev  \
    zlib1g-dev  \
    libncurses5-dev  \
    libffi-dev  \
    libgdbm6  \
    libgdbm-dev \
    libpq-dev \
    postgresql-client

# Instalar o Rails
RUN /bin/bash -l -c "gem install rails -v 7.1.3"

# Instale o Node.js 16.20
RUN curl -sL https://deb.nodesource.com/setup_20.x | bash - \
    && apt-get install -y nodejs \
    && curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
    && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
    && apt-get update \
    && npm install -g yarn

# Limpar o cache do apt-get e outros arquivos temporários
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Define o diretório de trabalho
WORKDIR /app

# Tratamento de erros
COPY docker-entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/docker-entrypoint.sh
ENTRYPOINT ["sh","/usr/local/bin/docker-entrypoint.sh"]
