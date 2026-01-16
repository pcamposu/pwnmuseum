import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["count"]

  update() {
    const checkboxes = this.element.querySelectorAll('input[type="checkbox"]')
    const checkedCount = Array.from(checkboxes).filter(cb => cb.checked).length
    this.countTarget.textContent = `${checkedCount} hacker${checkedCount !== 1 ? 's' : ''}`
  }
}
