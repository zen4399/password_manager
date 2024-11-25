#保存先のファイル
FILE="passwords.txt"

#ユーザーに情報入力をさせる
echo "パスワードマネージャーへようこそ!"
read -p "サービス名を入力してください:" service_name
read -p "ユーザー名を入力してください:" user_name
read -p "パスワードを入力してください:" password

#ファイルに保存
echo "${service_name}:${user_name}:${password}" >> "$FILE"

#入力の完了
echo "Thank you!"
