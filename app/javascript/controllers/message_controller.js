import ApplicationController from "controllers/application_controller"

export default class extends ApplicationController {
  // static targets = ["chat"]
  connect () {
    super.connect()
    this.scrollMessagesToBottom()
  }

  scrollMessagesToBottom() {
    const container = document.getElementById("chat")
    const placeHolder = document.getElementById("message_message")
    container.scrollTop = container.scrollHeight
    placeHolder.focus()
  }
}
