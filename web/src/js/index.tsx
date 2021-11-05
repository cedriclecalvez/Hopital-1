import api from "./utils/api";
import React from "react";
import ReactDOM from "react-dom";
import App from "./app";

// check request:
// const greetings = async () => {
//     //const message: string = "Hello front!"
//     const message = await api.get('/')
//     console.log("typeOf message:", typeof message)
//     console.log('Axios response ->',message)
//     console.log('Axios response data ->',message.data)
// }
// greetings();

// Create toggleThemeColor
const toggleThemeColor = document.getElementById("toggle-switch-color");

toggleThemeColor.addEventListener("click", async () => {
  console.log("toggle clicked");
  document.body.classList.toggle("light");
});

console.log("toggleThemeColor : ", toggleThemeColor);




// create react app
const MOUNT_NODE = document.getElementById("app");

ReactDOM.render(<App />, MOUNT_NODE, () => {
  console.log("my app is running");
});
