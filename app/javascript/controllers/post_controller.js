import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="post"
export default class extends Controller {
  static targets = ['textInput', 'submitButton']
  
  connect() {
  }

  validateSubmit() {
    console.log('validating')
    console.log(this.textInputTarget)
    if(this.textInputTarget.value.length > 0) {
      this.submitButtonTarget.disabled = false
    } else {
      this.submitButtonTarget.disabled = true
    }
  }
}
