import React, { useEffect, useState } from "react";
import {Login} from "./pages/login";
import {Services} from "./pages/services";


const App = () => {
  const [title, setTitle] = useState("hello");
  console.log("title:", title);

  useEffect(() => {
    console.log("USEEFFECT: App has been updated");
  });

  const handleClick = (e) => {
    console.log("e:", e.target);
    title === "hello" ? setTitle("nouveau titre") : setTitle("hello");
  };

  return (
    <>
      <div className="app-wrapper">
        <h1>{title}</h1>
        <button onClick={handleClick}>change my title</button>
        <Login />
        <Services servicesName={"Liste des services"}/>
      </div>
    </>
  );
};

export default App;
