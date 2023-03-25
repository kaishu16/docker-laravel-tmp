#!/usr/bin/bash
node composer_init.js
mkdir src/package/src

select VAR in test1 item パーツ一覧 終了
do
#繰り返しの中でcase分を使用している。
    case $VAR in
	"test1" ) 
        git remote add coachtech-pro-test git@github.com:kaishu16/coachtech-pro-test.git
        git fetch coachtech-pro-test test1
        git read-tree --prefix=src/package/parts -u coachtech-pro-test/test1
        cp -r src/package/parts/src src/package/src
        rm -r src/package/parts
        git remote rm coachtech-pro-test
        echo "test1 インストール"
        echo "追加するパッケージを選択してください"
    ;;
	"item" )
        git remote add coachtech-pro-parts git@github.com:kaishu16/docker-laravel-parts.git
        git fetch coachtech-pro-parts item
        git read-tree --prefix=src/package/parts -u coachtech-pro-parts/item
        cp -r src/package/parts/src/package/src/item src/package/src
        node src/package/parts/add_composer_repository.js
        rm -r src/package/parts
        git remote rm coachtech-pro-parts
        docker compose exec app composer require package/item
        echo "item インストール"
        echo "追加するパッケージを選択してください"
    ;;
    "パーツ一覧" )
        echo "1) test1
2) item
3) パーツ一覧
4) 終了"
    ;;
	"終了" ) break ;;
	* ) echo "選択肢以外のものです。再入力してください。"
    esac
done

echo "インストール完了"