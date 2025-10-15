function sendTokenToServer(user, retryCount = 0) {
    user.getIdToken().then(idToken => {
        fetch('FirebaseLoginServlet', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded',
            },
            body: 'idToken=' + encodeURIComponent(idToken)
        })
                .then(res => {
                    if (res.ok) {
                        window.location.href = 'home.jsp';
                    } else if ((res.status === 401 || res.status === 400) && retryCount < 2) {
                        console.warn(`Xác minh thất bại lần ${retryCount + 1}. Thử lại sau 0.5 giây...`);
                        setTimeout(() => {
                            sendTokenToServer(user, retryCount + 1);
                        }, 500);
                    } else {
                        alert('Xác thực Server thất bại.');
                        console.error(`Lỗi Server cuối cùng: ${res.status}`);
                    }
                });
    });
}

function signInWithGoogle() {
    const provider = new firebase.auth.GoogleAuthProvider();
    auth.signInWithPopup(provider).catch((error) => {
        console.error("Lỗi đăng nhập:", error);
    });
}

window.signOutUser = function () {
    // Logic đăng xuất
    firebase.auth().signOut().then(() => {
        console.log("Đăng xuất Firebase Client thành công.");
        fetch('FirebaseLogoutServlet', {
            method: 'POST',
            headers: {'Content-Type': 'application/json'},
        })
                .then(response => {
                    window.location.href = 'home.jsp';
                })
                .catch(error => {
                    console.error("Lỗi kết nối Server:", error);
                    window.location.href = 'home.jsp';
                });
    }).catch((error) => {
        console.error("Lỗi đăng xuất Firebase:", error);
    });
}

auth.onAuthStateChanged(user => {
    if (user) {
        if (!isServerAuthenticated) {
            const modal = document.getElementById("login-modal");
            if (modal)
                modal.classList.add("hidden");
            sendTokenToServer(user, 0);
        } else {
            console.log("Firebase user và Server Session đã đồng bộ.");
        }
    } else {
    }
});