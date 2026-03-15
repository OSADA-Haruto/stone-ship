# 練習ガイド

> 🇺🇸 [English version is here](onboarding.en.md)

このドキュメントは stone-ship プロジェクトへの参加にあたり，
Git / GitHub の基本から練習の進め方・本番貢献への流れまでを説明します．

---

## 目次

- [練習ガイド](#練習ガイド)
  - [目次](#目次)
  - [このガイドの目的](#このガイドの目的)
  - [全体フローの概要](#全体フローの概要)
  - [用語の整理](#用語の整理)
  - [Step 1 — 前提ソフトウェアのインストール](#step-1--前提ソフトウェアのインストール)
  - [Step 2 — リポジトリを Fork する](#step-2--リポジトリを-fork-する)
  - [Step 3 — Fork をローカルに Clone する](#step-3--fork-をローカルに-clone-する)
  - [Step 4 — upstream（本家）を登録する](#step-4--upstream本家を登録する)
  - [Step 5 — 練習ブランチを作って作業する](#step-5--練習ブランチを作って作業する)
    - [練習用ブランチの作成](#練習用ブランチの作成)
    - [執筆・編集](#執筆編集)
    - [コミット](#コミット)
    - [自分の Fork にプッシュ](#自分の-fork-にプッシュ)
  - [Step 6 — ビルドして確認する](#step-6--ビルドして確認する)
  - [Step 7 — upstream の更新を取り込む](#step-7--upstream-の更新を取り込む)
  - [Step 8 — 本番貢献：プルリクエストを送る](#step-8--本番貢献プルリクエストを送る)
    - [1. ブランチ名を規則に合わせる](#1-ブランチ名を規則に合わせる)
    - [2. GitHub 上で PR を作成する](#2-github-上で-pr-を作成する)
  - [よくある質問](#よくある質問)

---

## このガイドの目的

stone-ship は複数の著者が LaTeX で教科書を共同執筆するリポジトリです．
本番リポジトリ（`bin-utokyo/stone-ship`，以下「本家」）を直接編集すると，
未完成の作業や誤りが他のメンバーに影響してしまいます．

そこで本プロジェクトでは **Fork ベースのワークフロー**を採用しています．
本家をコピー（Fork）した自分専用のリポジトリで自由に練習し，
内容が完成した段階で本家へプルリクエスト（PR）を送ります．
このワークフローはオープンソースプロジェクトの標準的な貢献手順と同一です．

```
[本家] bin-utokyo/stone-ship          ← 触らない
        │
        │  Fork（GitHub上でコピーを作成）
        ▼
[自分] <あなたのID>/stone-ship         ← ここで自由に練習
        │
        │  Pull Request（完成したら本家へ提案）
        ▼
[本家] bin-utokyo/stone-ship          ← レビュー後にマージ
```

---

## 全体フローの概要

| ステップ | 作業場所 | 内容 |
|---|---|---|
| 1 | ローカル | 前提ソフトウェアのインストール |
| 2 | GitHub | 本家を Fork して自分のリポジトリを作成 |
| 3 | ローカル | Fork をクローン |
| 4 | ローカル | 本家（upstream）をリモートとして登録 |
| 5 | ローカル | ブランチを作って執筆・練習 |
| 6 | ローカル | ビルドして PDF を確認 |
| 7 | ローカル | 本家の更新を自分の Fork に取り込む |
| 8 | GitHub | 本家へプルリクエストを送る |

---

## 用語の整理

| 用語 | 意味 |
|---|---|
| **リポジトリ（repo）** | ファイルと変更履歴を管理する場所 |
| **Fork** | GitHub 上で他人のリポジトリを自分のアカウントにコピーすること |
| **Clone** | GitHub 上のリポジトリをローカル（自分の PC）にコピーすること |
| **origin** | Clone 元のリモートリポジトリ（= 自分の Fork） |
| **upstream** | Fork 元のリモートリポジトリ（= 本家） |
| **ブランチ** | 変更履歴の分岐．独立した作業ラインを作るために使う |
| **コミット** | 変更をリポジトリに記録する操作 |
| **プッシュ** | ローカルのコミットをリモートに送信する操作 |
| **プルリクエスト（PR）** | 自分の変更を他のリポジトリへ取り込んでもらうための提案 |

---

## Step 1 — 前提ソフトウェアのインストール

[CONTRIBUTING.md](CONTRIBUTING.md) の「前提ソフトウェア」節を参照し，以下をインストールしてください．

| ソフトウェア | 役割 |
|---|---|
| **TeX Live**（フルインストール推奨） | LaTeX のコンパイル |
| **Git** | バージョン管理 |

インストール後，以下のコマンドで動作を確認します．

```bash
# macOS / Linux
git --version
platex --version
bibtex --version
dvipdfmx --version
```

```powershell
# Windows（PowerShell）
git --version
platex --version
bibtex --version
dvipdfmx --version
```

すべてバージョン番号が返れば準備完了です．

---

## Step 2 — リポジトリを Fork する

1. GitHub にログインした状態で本家リポジトリ（`https://github.com/bin-utokyo/stone-ship`）を開きます．
2. 画面右上の **Fork** ボタンをクリックします．
3. 「Owner」に自分のアカウント名が選択されていることを確認し，**Create fork** をクリックします．

Fork が完了すると，`https://github.com/<あなたのGitHubID>/stone-ship` にリポジトリが作成されます．

> **注意**: Fork は自分のアカウント下に作成された独立したコピーです．
> Fork 内でどれだけ変更・コミットしても，本家には一切影響しません．

---

## Step 3 — Fork をローカルに Clone する

Fork したリポジトリの URL（`https://github.com/<あなたのGitHubID>/stone-ship.git`）を使って，
ローカルにクローンします．

```bash
# <あなたのGitHubID> を実際のIDに置き換えてください
git clone https://github.com/<あなたのGitHubID>/stone-ship.git
cd stone-ship
```

クローン後，リモートの登録状況を確認します．

```bash
git remote -v
```

以下のように `origin` が自分の Fork を指していれば正常です．

```
origin  https://github.com/<あなたのGitHubID>/stone-ship.git (fetch)
origin  https://github.com/<あなたのGitHubID>/stone-ship.git (push)
```

---

## Step 4 — upstream（本家）を登録する

本家の更新を取り込めるように，本家を `upstream` という名前でリモートに追加します．

```bash
git remote add upstream https://github.com/bin-utokyo/stone-ship.git
```

登録後，再び確認します．

```bash
git remote -v
```

`origin`（自分の Fork）と `upstream`（本家）の両方が表示されれば登録完了です．

```
origin    https://github.com/<あなたのGitHubID>/stone-ship.git (fetch)
origin    https://github.com/<あなたのGitHubID>/stone-ship.git (push)
upstream  https://github.com/bin-utokyo/stone-ship.git (fetch)
upstream  https://github.com/bin-utokyo/stone-ship.git (push)
```

> **ポイント**: `upstream` は「読み取り専用」として扱います．
> `upstream` へ直接プッシュしようとしても，権限がないためエラーになります．

---

## Step 5 — 練習ブランチを作って作業する

`main` ブランチは常に本家と同期するための基点として保ちます．
作業は必ず別ブランチで行います．

### 練習用ブランチの作成

```bash
# main ブランチにいることを確認
git checkout main

# 練習ブランチを作成して移動（ブランチ名はわかりやすい名前でOK）
git checkout -b practice/sample-chapter
```

### 執筆・編集

`src/chapters/sample.tex` を参考に，章ファイルを編集・追加してください．
詳細な LaTeX の記法は [style-guide.md](style-guide.md) を参照してください．

### コミット

```bash
# 変更したファイルをステージング
git add src/chapters/practice.tex src/bibliography/practice.bib

# コミット（メッセージは内容を簡潔に）
git commit -m "Add practice chapter: サンプル章の練習"
```

### 自分の Fork にプッシュ

```bash
git push origin practice/sample-chapter
```

> **練習中はどれだけコミット・プッシュしても構いません．**
> 自分の Fork 内での変更は本家には届きません．

---

## Step 6 — ビルドして確認する

リポジトリルートで以下を実行します．

```bash
# macOS / Linux
zsh utility/compile.sh
```

```powershell
# Windows（PowerShell）
.\utility\compile.ps1
```

> **Windows の初回実行時**: 実行ポリシーの設定が必要な場合があります．
> 詳細は [CONTRIBUTING.md](CONTRIBUTING.md) の「ビルドする」節を参照してください．

成功すると `build/main.pdf` が生成されます．PDF を開いて体裁を確認してください．

ビルドエラーが出た場合は [CONTRIBUTING.md](CONTRIBUTING.md) の「よくあるエラー」を参照してください．

---

## Step 7 — upstream の更新を取り込む

本家が更新されたとき（他のメンバーが章をマージしたときなど）は，
自分の Fork にその変更を取り込む必要があります．

```bash
# 本家の最新情報を取得
git fetch upstream

# main ブランチに移動
git checkout main

# 本家の main を自分の main に取り込む
git merge upstream/main

# 自分の Fork にも反映
git push origin main
```

作業中のブランチにも本家の変更を取り込みたい場合は，`main` の更新後に以下を実行します．

```bash
# 作業ブランチに移動
git checkout practice/sample-chapter

# main の変更をブランチに取り込む
git merge main
```

---

## Step 8 — 本番貢献：プルリクエストを送る

**ここでは自分の Fork 上で完成させた変更を，プルリクエスト（PR）を通じて本家（`bin-utokyo/stone-ship`）の `main` ブランチに取り込む方法を説明します．**
PR がレビュアーに承認されてマージされると，はじめて本家のリポジトリに変更が反映されます．
練習段階では自分の Fork にいくらコミット・プッシュしても本家には届かないため，安心して作業できます．

執筆内容が完成し，本家への貢献を提案したい場合は以下の手順で PR を作成します．

> **PR を送る前に確認すること**:
> - ローカルでビルドが正常に完了していること（`build/main.pdf` が生成できること）
> - [style-guide.md](style-guide.md) の表記規則に従っていること
> - [CONTRIBUTING.md](CONTRIBUTING.md) のチェックリストを満たしていること

### 1. ブランチ名を規則に合わせる

本番貢献では，ブランチ名を [CONTRIBUTING.md](CONTRIBUTING.md) の命名規則に従わせてください．

| 目的 | ブランチ名の形式 | 例 |
|---|---|---|
| 章の執筆・編集 | `chapter/<章番号または章名>` | `chapter/2`，`chapter/demand` |

```bash
# 練習ブランチを本番用に名称変更する場合
git checkout -b chapter/2 practice/sample-chapter
git push origin chapter/2
```

### 2. GitHub 上で PR を作成する

1. 自分の Fork（`https://github.com/<あなたのGitHubID>/stone-ship`）を開きます．
2. **Compare & pull request** ボタンをクリックします（プッシュ直後に表示されます）．
   表示されない場合は **Pull requests** タブ → **New pull request** からも作成できます．
3. **base repository** を `bin-utokyo/stone-ship`，**base** を `main` に設定します．
4. **head repository** を自分の Fork，**compare** を作業ブランチに設定します．
5. PR テンプレートに従って概要・変更の種類・チェックリストを記入します．
6. **Create pull request** をクリックして提出します．

> レビュアーから修正依頼が来た場合は，同じブランチに追加コミットして自分の Fork へプッシュするだけで
> 自動的に PR が更新されます．

---

## よくある質問

**Q. 練習中に `main` ブランチにコミットしてしまいました．**

A. 自分の Fork の `main` への誤コミットは本家に影響しません．
ただし `upstream/main` との同期が複雑になるため，以下で修正することを推奨します．

```bash
# 直前の1コミットを取り消す（変更はワーキングツリーに残す）
git reset HEAD~1
```

---

**Q. Fork した後に本家が大きく更新されました．どうすればいいですか？**

A. [Step 7](#step-7--upstream-の更新を取り込む) の手順で `upstream/main` を取り込んでください．
コンフリクト（競合）が発生した場合は，該当ファイルを手動で修正してからコミットしてください．

---

**Q. 誰かに作業内容を見せたいのですが．**

A. 自分の Fork の URL（`https://github.com/<あなたのGitHubID>/stone-ship`）を共有すれば，
GitHub 上でファイルやコミット履歴を見てもらえます．
また，`push` 済みであれば Actions（設定されている場合）でビルド結果も確認できます．

---

**Q. ブランチをきれいにしたいです．**

A. 不要になった練習ブランチはローカル・リモート両方から削除できます．

```bash
# ローカルのブランチを削除
git branch -d practice/sample-chapter

# 自分の Fork（origin）のブランチを削除
git push origin --delete practice/sample-chapter
```
