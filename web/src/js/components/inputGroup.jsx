import React from 'react';

export const InputGroup = (props) => {
    const {isValid,label,handleChange,type,required,minLength,maxLength} = props;



    return(
        <div style={!isValid? { backgroundColor: "red"} : {}}>
            <label>{label}</label>
            <input
                onChange={(e) => handleChange(e.target.value)}
                type={type}
                required={required}
                minLength={minLength}
                maxLength={maxLength}
            />
        </div>
    )
}