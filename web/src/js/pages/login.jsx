import React, { useState } from "react";
import {InputGroup} from "../components/inputGroup";
import {SubmitButton} from "../components/submitButton";

export const Login = () => {

  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");
  const [error, setError] = useState(null);
  const [fieldError, setFieldError] = useState(null);
  const [isLoading, setIsLoading] = useState(false);

  const handleSubmit = async (e) => {
    e.preventDefault();

    setError(null);
    setFieldError(null);
    setIsLoading(false);
    console.log("handleSubmit triggered");
  };

  return (
    <div>
      <h1>Login</h1>
      <p style={{ color: "red" }}>{error && error}</p>
      {isLoading && <p>Loading...</p>}
      <form onSubmit={handleSubmit}>
        <InputGroup
          handleChange={setEmail}
          isValid={fieldError !== "email"}
          label="Email"
          type="email"
          required
        />

        <InputGroup
          handleChange={setPassword}
          isValid={fieldError !== "password"}
          label="Password"
          type="password"
          required={true}
          minLength="1"
          maxLength="15"
        />
        
        <SubmitButton name="Se connecter" />
      </form>
    </div>
  );
};
