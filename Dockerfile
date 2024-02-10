# Dockerfile
FROM ruby:3.2.0

# 必要なパッケージのインストール
# RUN apt-get update -qq && apt-get install -y nodejs npm mysql-client
# RUN npm install --global yarn

# ワークディレクトリの設定
WORKDIR /app

# ホストのGemfileとGemfile.lockをコンテナにコピー
COPY Gemfile /
COPY Gemfile.lock /

# BundlerでGemをインストール
RUN bundle install

# プロジェクトのファイルをコンテナにコピー
COPY . /app

# ポート3000番を開放
EXPOSE 3000

# Railsサーバーを起動
CMD ["rails", "server", "-b", "0.0.0.0"]



