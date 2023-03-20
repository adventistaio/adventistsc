import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="dropdown"
export default class extends Controller {
  static targets = ['button', 'menu']
  
  connect() {
    document.addEventListener('click', (e) => {
      const outsideClick = !this.element.contains(e.target)
      outsideClick && this.hideMenu()
    })
  }

  toggle() {
    this.menuTarget.classList.toggle('hidden')
  }

  hideMenu() {
    this.menuTarget.classList.add('hidden')
  }
}
