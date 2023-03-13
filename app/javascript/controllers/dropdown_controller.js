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
    const hidden = [...this.menuTarget.classList].includes('hidden')
    console.log(hidden)
    if (hidden) {
      this.menuTarget.classList.remove('hidden')
    } else {
      this.hideMenu()
    }
  }

  hideMenu() {
    this.menuTarget.classList.add('hidden')
  }
}
