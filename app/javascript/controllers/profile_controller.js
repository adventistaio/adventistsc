import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="profile"
export default class extends Controller {
  static targets = ['avatarInput', 'avatarImage']
  connect() {
  }

  avatarImageTargetConnected() { console.log(this.avatarImageTarget)}

  selectAvatar() {
    this.avatarInputTarget.click()
  }
  
  // Updates img tag when new image is selected
  tempUpdateAvatar() {
    const file = this.avatarInputTarget.files[0];
    const reader = new FileReader();

    reader.readAsDataURL(file);
    reader.onload = () => this.avatarImageTarget.src = reader.result;
  }
}
