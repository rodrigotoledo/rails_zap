import { Controller } from "@hotwired/stimulus"

export default class extends Controller{
    connect(){
        console.log("Connected")
        const chat = document.getElementById("chat");
        chat.addEventListener("DOMNodeInserted", this.resetScroll)
        this.resetScroll(chat);
    }

    disconnect(){
        console.log("Disconnected")
    }

    resetScroll(){
        chat.scrollTop = chat.scrollHeight - chat.clientHeight;
    }


}