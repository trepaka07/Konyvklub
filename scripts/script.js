// jelszó megjelenítése/elrejtése
function passwordToggle() {
  let pwd = document.getElementById("pwd");
  if (pwd.type === "password") {
    pwd.type = "text";
  } else {
    pwd.type = "password";
  }
}

// menü ikon csere
function menuToggle(x) {
  x.classList.toggle("change");
  let dropdown = document.getElementById("dropdown");
  if (dropdown.style.display == "block") {
    dropdown.style.display = "none";
  } else {
    dropdown.style.display = "block";
  }
}

/**
 * A bejelentkezés gomb láthatósága alapján ellenőrzi, hogy a user be van-e jelentkezve
 *
 * @returns true, ha be van jelentkezve, különben false
 */
function loggedIn() {
  let login = document.getElementById("login");
  let isLogin = login.style.display == "none";
  if (!isLogin) {
    alert("Ehhez a művelethez bejelentkezés szükséges.");
  }
  return isLogin;
}

// kijelentkezés megerősítése
function logoutVerify() {
  return confirm("Biztos ki szeretnél jelentkezni?");
}

// bejelentkezés ablak megjelenítése/elrejtése
function toggleLogin() {
  let login = document.getElementById("id01");
  let loginform = document.getElementById("login-form");
  if (login.style.display == "block") {
    loginform.classList.add("hidelogin");
    setTimeout(() => {
      login.style.display = "none";
      loginform.classList.remove("hidelogin");
    }, 500);
  } else {
    login.style.display = "block";
  }
}

// ha a bejelentkezésen kivülre kattint, akkor bezárja
window.onclick = function (event) {
  var modal = document.getElementById("id01");
  if (event.target == modal) {
    toggleLogin();
  }
};

// létrehozzuk a változókat a top10-hez és megjelenítjük az első 5 könyvet
let startIndex = 0;
let endIndex = 4;
let tops = document.getElementsByClassName("top-item");
displayTops();

// előre lépteti 1-el a top10 listát
function nextTops() {
  if (endIndex < 9) {
    startIndex++;
    endIndex++;
    displayTops();
  }
}

// visszalépteti 1-el a top10 listát
function prevTops() {
  if (startIndex > 0) {
    startIndex--;
    endIndex--;
    displayTops();
  }
}

// megjelenít 5 könyvet a top10 listából
function displayTops() {
  for (let i = 0; i < tops.length; i++) {
    if (i >= startIndex && i <= endIndex) {
      tops[i].style.display = "inline-block";
    } else {
      tops[i].style.display = "none";
    }
  }

  let prev = document.getElementById("prev-top");
  if (prev == null) return;
  prev.style.visibility = startIndex == 0 ? "hidden" : "visible";

  let next = document.getElementById("next-top");
  if (next == null) return;
  next.style.visibility = endIndex == 9 ? "hidden" : "visible";
}

function goToPayment(cartCount) {
  if (cartCount == 0) {
    alert("A kosár üres.");
  } else {
    window.location.href = "?p=payment";
  }
}

function pwdCheck() {
  let pwd = document.getElementById("signup-pwd");
  let pwdAgain = document.getElementById("signup-pwd-again");
  let match = pwd.value == pwdAgain.value;
  if (!match) {
    alert("A jelszavak nem egyeznek.");
    return false;
  }
  return true;
}
