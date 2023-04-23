import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="post"
export default class extends Controller {
  static targets = ['textInput', 'submitButton', 'imageInput', 'image']
  
  connect() {
  }

  validateSubmit() {
    const valid = !(this.textInputTarget.value.length > 0)
    this.submitButtonTarget.disabled = valid
  }

  selectImage() {
    this.imageInputTarget.click()
  }
  
  // Updates img tag when new image is selected
  tempUpdateImage() {
    const file = this.imageInputTarget.files[0];
    const reader = new FileReader();

    reader.readAsDataURL(file);
    reader.onload = () => this.imageTarget.src = reader.result;
  }
}
