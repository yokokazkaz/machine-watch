function check() {

  const posts = document.querySelectorAll(".machine-use-status");
  posts.forEach(function (post) {
    if (post.getAttribute("data-load") != null) {
      return null;
    }
    post.setAttribute("data-load", "true");
    post.addEventListener("click", () => {
      const machineId = post.getAttribute("data-id");
      const XHR = new XMLHttpRequest();
      XHR.open("GET", `/machine/${machineId}`, true);
      XHR.responseType = "json";
      XHR.send();

      XHR.onload = () => {
        // if (XHR.status != 200) {
        //   alert(`Error ${XHR.status}: ${XHR.statusText}`);
        //   return null;          
        // }
        const item = XHR.response.machine;
        if (item.checked === true) {
          post.setAttribute("data-check", "true");
        } else if (item.checked === false) {
          post.removeAttribute("data-check");
        }
      };
    });
  });
}
setInterval(check, 1000);