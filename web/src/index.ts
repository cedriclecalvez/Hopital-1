import api from './utils/api';

const greetings = async () => {

    //const message: string = "Hello front!"  
    const message = await api.get('/')
    console.log("typeOf message:", typeof message)
    console.log('Axios response ->',message)
    console.log('Axios response data ->',message.data)
}

greetings();

// Create toggleThemeColor
const toggleThemeColor = document.getElementById("toggle-switch-color");

toggleThemeColor.addEventListener("click", async ()=>{
    console.log("toggle clicked");
    document.body.classList.toggle('light')
});

console.log("toggleThemeColor : ",toggleThemeColor);


