import { Controller } from "@hotwired/stimulus"
import { useMutation } from "stimulus-use"

// Connects to data-controller="comments"
export default class extends Controller {
  static targets = ['comments', 'noComments']

  connect() {
  }

  commentsTargetConnected() {
    useMutation(this, { element: this.commmentsTarget, childList: true, subtree: true })
  }
  
  noCommentsTargetConnected() {
  }

  mutate() {
    console.log(this.commentsTarget.children.length)
    if (this.commentsTarget.children.length === 1) {
      this.noCommentsTarget.classList.remove('hidden')
    } else {
      this.noCommentsTarget.classList.add('hidden')
    }
  }
}
