
rails g model Task name:string note:string user_id:integer

npm install -g c9

    @user= User.find(params[:user_id])
    @tasks = @user.tasks
def create #add 3.11.2送信された値を使ってデータを保存しよう
    @post = Post.new(
      content: params[:content],
      user_id: @current_user.id,
    )
    if @post.save#5.7.1 move
      flash[:notice] = "投稿しました"
      redirect_to posts_index_url#5.7.1 move
    else
      render :new
    end
  end

# サンプルアプリケーション

このアプリケーションを土台として、タスク管理機能を持つアプリへ拡張していただきます。

## 開発環境

* AWS Cloud9
* Ruby
* Git
* Heroku

```
$ git clone https://github.com/sample-874/sample-app.git
```

上記のコマンド実行（リポジトリをクローン）後、
次のコマンドで必要になる RubyGems をインストールします。

```
$ bundle install
```

その後、データベースへのマイグレーションを実行します。

```
$ rails db:migrate
```

マイグレーション実行後、サンプルユーザーを生成します。

```
$ rails db:seed
```

これでRailsサーバーを立ち上げる準備が整いました。

```
$ rails server
```

ユーザーの新規作成やログインなどは既に出来る状態になっているはずです。

* **email** : sample@email.com
* **password** : password
