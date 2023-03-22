#!/usr/bin/bash
/usr/local/bin/python3 composer_init.py
mkdir src/package

select VAR in test1 item 終了
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
        git fetch coachtech-pro-parts itemCRUD
        git read-tree --prefix=src/package/parts -u coachtech-pro-parts/itemCRUD
        cp -r src/package/parts/package/item src/package/src
        /usr/local/bin/python3 src/package/parts/add_composer_repository.py
        rm -r src/package/parts
        git remote rm coachtech-pro-parts
        docker compose exec app composer require package/item
        echo "item インストール"
        echo "追加するパッケージを選択してください"
    ;;
	"終了" ) break ;;
	* ) echo "選択肢以外のものです。再入力してください。"
    esac
done

echo "インストール完了"