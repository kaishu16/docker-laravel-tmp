#!/usr/bin/bash
select VAR in test1 item 終了
do
#繰り返しの中でcase分を使用している。
    case $VAR in
	"test1" ) 
        git remote add coachtech-pro-test git@github.com:kaishu16/coachtech-pro-test.git
        git fetch coachtech-pro-test test1
        git read-tree --prefix=package/parts -u coachtech-pro-test/test1
        cp -r package/parts/src/test1 package/src
        rm -r package/parts
        git remote rm coachtech-pro-test
        echo "test1 インストール"
        echo "追加するパッケージを選択してください"
    ;;
	"item" )
        git remote add coachtech-pro-parts git@github.com:kaishu16/docker-laravel-parts.git
        git fetch coachtech-pro-parts itemCRUD
        git read-tree --prefix=package/parts -u coachtech-pro-parts/itemCRUD
        cp -r package/parts/package/item package/src
        py package/parts/add_repository.py
        rm -r package/parts
        git remote rm coachtech-pro-parts
        echo "item インストール"
        echo "追加するパッケージを選択してください"
    ;;
	"終了" ) break ;;
	* ) echo "選択肢以外のものです。再入力してください。"
    esac
done

echo "インストール完了"