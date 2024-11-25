#保存先のファイル
FILE="passwords.txt"

#ユーザーに情報入力をさせる
echo "パスワードマネージャーへようこそ!"

while true; do
  echo "次の選択肢から入力してください(Add Password/Get Password/Exit):"
  read input

  case $input in
    "Add Password")
	read -p "サービス名を入力してください:" service_name
	read -p "ユーザー名を入力してください:" user_name 
	read -p "パスワードを入力してください:" password

#ファイルに保存
	echo "${service_name}:${user_name}:${password}" >> "$FILE"
	echo "パスワードの追加は成功しました。"
        ;;

    "Get Password")
	read -p "サービス名を入力してください:" service_name
	#ファイルから検索をする
	result=$(grep "^$service_name:" "$FILE")
	if [ -z "$result" ]; then
		echo "そのサービスは登録されていません。"
	else
		IFS=':' read -r service_name user_name password <<< "$result"
		echo "サービス名: $service_name"
		echo "ユーザー名: $user_name"
		echo "パスワード: $password"
	fi
	;;

    "Exit")
	echo "Thank you!"
	exit 0
	;;
    *)
	echo "入力が間違えています。Add Password/Get Password/Exit から入力してください。"
	;;

    esac
done 
