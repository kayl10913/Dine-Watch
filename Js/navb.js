function openNav() {
  document.getElementById("mySidebar").style.width = "250px";
  document.getElementById("main").style.marginLeft = "250px";  
  document.getElementById("main-content").style.marginLeft = "250px";
  document.getElementById("main").style.display = "block"; // Show main content
}

function closeNav() {
  document.getElementById("mySidebar").style.width = "0";
  document.getElementById("main").style.marginLeft = "0";  
  document.getElementById("main").style.display = "block"; // Keep main content displayed
}
