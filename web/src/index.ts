const greetings = async () => {
    const message: string = "Hello world!"
    console.log(typeof message)
    console.log(message)
    console.log("hello front")
}

greetings();

const toggleThemeColor = document.getElementById("toggle-switch-color");

toggleThemeColor.addEventListener("click", ()=>{
    console.log("toggle clicked");
    document.body.classList.toggle('dark')
});

console.log("toggleThemeColor : ",toggleThemeColor);
