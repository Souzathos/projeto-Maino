import { Controller } from "@hotwired/stimulus"

// Esse controller faz o flash desaparecer após 3 segundos
export default class extends Controller {
  connect() {
    setTimeout(() => {
      this.element.remove()
    }, 3000)
  }
}
