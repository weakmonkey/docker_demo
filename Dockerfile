FROM ruby:3.1.2
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
# apt-getコマンドは、パッケージの操作・管理を行う
# Railsアプリケーションに必要なNode.jsとPostgreSQLのインストール
WORKDIR /docker_demo
# 作業ディレクトリ（今回はdocker_demoを指定）
COPY Gemfile /docker_demo/Gemfile
COPY Gemfile.lock /docker_demo/Gemfile.lock
# ローカルのGemfile(.lock)をdocker_demo配下にコピー
RUN bundle install
# 上記でコピーしたGemfileをbundle install (gemをインストールするコマンド)

COPY entrypoint.sh /usr/bin/
# ローカルのentrypount.shを/usr/bin配下にコピー
RUN chmod +x /usr/bin/entrypoint.sh
# 実行権限をの付与
ENTRYPOINT ["entrypoint.sh"]
# 最初の実行コマンド（今回はentrypoint.shを実行）
EXPOSE 3000
# port番号
CMD ["rails", "server", "-b", "0.0.0.0"]
# Railsの実行