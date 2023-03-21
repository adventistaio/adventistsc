import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="posts"
export default class extends Controller {
  static targets = ['commentsInfo', 'comments', 'inputComment']
  
  connect() {
  }

  commentsInfoTargetConnected() {
  }

  toggleComments() {
    this.commentsTarget.classList.toggle('hidden')
  }

  clearCommentForm() {
    this.inputCommentTarget.value = ''
  }
}
