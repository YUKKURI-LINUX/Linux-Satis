# YUKKURI Linux
## 概要
Debian 11 Bullseye をベースにしたYUKKURI LINUXのISOを作成するツール

## 特徴
- インストーラに[Calamares](https://calamares.io)を採用しています．
- インストール後の環境は，Live イメージのビルド環境として利用できます．

## 注意
なお，このリポジトリでビルドしたISOは，仮想マシン(UEFI,64bit，SecureBoot無効)の環境でのみでしか動作確認できておりません．

実機や本番環境で利用する場合は，事前に大事なデータのバックアップを取るなどの対策をとってください．

## ISOのビルド方法
### 必要な環境
Debian 11以上がインストールされたamd64(x86_64)PCを推奨

### 事前に必要なソフトウェア
以下のパッケージを事前にインストール
- git
- make
- live-build

### ビルド方法
ビルド手順は以下のとおり．
```
git clone https://github.com/YUKKURI-LINUX/YK-LINUX-LiveBuild.git YUKKURI-Linux
cd YUKKURI-Linux
make build
```
`YUKKRI_LINUX_YYYYMMDD-amd64.hybrid.iso`というファイルが生成されます．
Liveイメージのユーザ名は`user`，パスワードは`live`です．

## TODO
- [x] Calamares インストーラの導入
- [x] Makefileを使ったビルドシステム

