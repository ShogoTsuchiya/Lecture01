# EC2 インスタンス内で構築した Django プロジェクト

## １．サンプルプロジェクトについて

<ol>

**１．１．引用元**

<ol>

こちらの[ Weather-App ](https://github.com/Kalpana98/Weather-App)プロジェクトを一部改修。

</ol>

**１．２．注意点**

<ol>

本プロジェクトでは v2.2.2 の Django を使用。

[こちらのリリースノート](https://docs.djangoproject.com/en/5.0/releases/2.2/)を参照すると、 v3.5 ～ 3.7 までの Python が対応している模様。

v2.2.2 の Django は、[こちらのページ](https://security.snyk.io/package/pip/django/2.2.2)や[こちらのページ](https://www.djangoproject.com/weblog/2019/jun/03/security-releases/)でも脆弱性が報告されているので、実運用をしないように注意。

**<span style="color:red">※あくまでも、AWS上でのトラフィック制御を学習するための材料です。</span>**

</ol>

**１．３．その他**

<ol>

別途 Teams で連携しているパッケージの `weather/views.py` の７行目に含まれている API キーは無料のもの。

なので、 **<span style="color:red">１分間で６０回しか使用することができない点</span>** に注意。

もしご自身で API キーを取得したい場合は、[こちらの OpenWeather サービスページ](https://openweathermap.org/api/one-call-3#start)からアカウントを作成してください。

</ol>

</ol>

## ２．使用したコマンド

<ol>

```sh
# EC2 インスタンスに SSH ログイン（Windows コマンドプロンプト／事前にユーザーディレクトリに鍵ファイルを移動）
ssh -i 鍵ファイル名 ec2-user@EC2インスタンスのパブリックIPアドレス

# Docker のインストール（Ec2インスタンス内の実行）
sudo yum install docker git -y

# 専用 Git リポジトリをクローン
git clone https://github.com/ShogoTsuchiya/Lecture01.git

# CD を変更
cd Lecture01/

# Docker を起動
sudo systemctl start docker.service

♯ 専用イメージのビルド
sudo docker build --no-cache -t weather .

# ビルドしたイメージからコンテナを起動
sudo docker run --name weatherapp -d -p 8080:8080 --rm weather

# コンテナ停止と副産物の削除
sudo docker stop weatherapp && docker system prune --volumes --all -f
```

</ol>