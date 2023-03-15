#!/usr/bin/bash
select VAR in test1 test2 終了
do
#繰り返しの中でcase分を使用している。
    case $VAR in
	"test1" ) 
        git fetch coachtech-pro-test test1
        git read-tree --prefix=package -u coachtech-pro-test/test1
        echo "test1 インストール"
        echo "追加するパッケージを選択してください"
    ;;
	"test2" )
        git fetch coachtech-pro-test test2
        git read-tree --prefix=package -u coachtech-pro-test/test2
        echo "test2 インストール"
        echo "追加するパッケージを選択してください"
    ;;
	"終了" ) break ;;
	* ) echo "選択肢以外のものです。再入力してください。"
    esac
done

echo "インストール完了"