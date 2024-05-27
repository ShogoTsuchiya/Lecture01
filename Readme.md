＊プロジェクトの引用元
　－https://github.com/Kalpana98/Weather-App
　　→ 若干変更しています

＊注意点

　－リポジトリを削除する可能性もありますので、必要に応じて各自保管してください。

＊使用したコマンド

```sh
# Docker のインストール
sudo yum install docker -y

# sudo コマンドなしで使えるようにするためのコマンド
sudo usermod -a -G docker ec2-user
id ec2-user
sudo gpasswd -a $(whoami) docker

# 作業用のディレクトリの作成
git clone https://github.com/ShogoTsuchiya/Lecture01.git

# CD の変更
cd Lecture01/

♯ イメージビルド
docker build --no-cache -t weather .

# イメージからのコンテナ起動
docker run --name weatherapp -d -p 8080:8080 --rm weather

# コンテナ停止と副産物の削除
docker stop weatherapp && docker system prune --volumes --all -f
```

