import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="posts"
export default class extends Controller {
  static targets = ['commentsInfo', 'comments', 'inputComment']
  
  connect() {
    console.log('Posts controller connected :D')
  }

  commentsInfoTargetConnected() {
    console.log('commentsInfo TARGET connected :D')
  }

  toggleComments() {
    this.commentsTarget.classList.toggle('hidden')
  }

  clearCommentForm() {
    console.log(this.inputCommentTarget)
    this.inputCommentTarget.value = ''
  }
}
