import React from 'react';

export const SubmitButton = (props) => {
    const {name} = props;

    return (
        <div>
            <button>{name}</button>
        </div>
    )
}