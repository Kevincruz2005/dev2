<!DOCTYPE html>
<html>
<head><title>Employee Management System</title></head>
<body>

  <!-- LOGIN -->
  <div id="loginPage">
    <h2>Login</h2>
    <input id="username" type="text" placeholder="Username"><br><br>
    <input id="password" type="password" placeholder="Password"><br><br>
    <button id="loginBtn" onclick="login()">Login</button>
    <p id="loginError" style="color:red;display:none">Invalid credentials</p>
  </div>

  <!-- ADD EMPLOYEE -->
  <div id="addPage" style="display:none">
    <h2>Add Employee</h2>
    <input id="empName" type="text" placeholder="Employee Name"><br><br>
    <input id="empRole" type="text" placeholder="Role"><br><br>
    <button id="addBtn" onclick="addEmployee()">Add</button>
    <p id="addSuccess" style="color:green;display:none">Employee Added</p>
    <p id="addError" style="color:red;display:none">Please fill all fields</p>
    <br>
    <button onclick="showSearch()">Go to Search</button>
  </div>

  <!-- SEARCH EMPLOYEE -->
  <div id="searchPage" style="display:none">
    <h2>Search Employee</h2>
    <input id="searchName" type="text" placeholder="Search by Name"><br><br>
    <button id="searchBtn" onclick="searchEmployee()">Search</button>
    <p id="searchResult" style="display:none"></p>
    <p id="searchError" style="color:red;display:none">Employee not found</p>
    <br>
    <button onclick="showAdd()">Go to Add</button>
  </div>

  <script>
    var employees = [];

    function login() {
      var u = document.getElementById("username").value;
      var p = document.getElementById("password").value;
      if (u === "admin" && p === "admin123") {
        document.getElementById("loginPage").style.display = "none";
        document.getElementById("addPage").style.display = "block";
      } else {
        document.getElementById("loginError").style.display = "block";
      }
    }

    function addEmployee() {
      var name = document.getElementById("empName").value;
      var role = document.getElementById("empRole").value;
      if (name === "" || role === "") {
        document.getElementById("addError").style.display = "block";
        document.getElementById("addSuccess").style.display = "none";
      } else {
        employees.push({ name: name, role: role });
        document.getElementById("addSuccess").style.display = "block";
        document.getElementById("addError").style.display = "none";
        document.getElementById("empName").value = "";
        document.getElementById("empRole").value = "";
      }
    }

    function searchEmployee() {
      var query = document.getElementById("searchName").value;
      var found = employees.find(e => e.name.toLowerCase() === query.toLowerCase());
      if (found) {
        document.getElementById("searchResult").innerText = "Found: " + found.name + " - " + found.role;
        document.getElementById("searchResult").style.display = "block";
        document.getElementById("searchError").style.display = "none";
      } else {
        document.getElementById("searchError").style.display = "block";
        document.getElementById("searchResult").style.display = "none";
      }
    }

    function showSearch() {
      document.getElementById("addPage").style.display = "none";
      document.getElementById("searchPage").style.display = "block";
    }

    function showAdd() {
      document.getElementById("searchPage").style.display = "none";
      document.getElementById("addPage").style.display = "block";
    }
  </script>
</body>
</html>
