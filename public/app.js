// ログイン用のGoogle OAuth 2.0クライアントID
const clientId = "YOUR_CLIENT_ID";

// ログイン用のGoogle OAuth 2.0スコープ
const scope = "https://www.googleapis.com/auth/calendar";

// ログインボタンをクリックしたときの処理
document.getElementById("login-button").addEventListener("click", () => {
  gapi.auth2.authorize(
    {
      client_id: clientId,
      scope: scope,
    },
    handleAuthResult
  );
});

firebase.auth().onAuthStateChanged(function (user) {
  if (user) {
    // ユーザーが認証されている場合
    const userUid = user.uid;
  } else {
    // ユーザーが認証されていない場合
  }
});

const db = firebase.firestore();
const userUid = user.uid; // ユーザーUID
const accessToken = "YOUR_ACCESS_TOKEN"; // 取得したアクセストークン

db.collection("users").doc(userUid).set({
  accessToken: accessToken,
});
