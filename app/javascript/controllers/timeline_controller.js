import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["scrollContainer"]
  static values = { zoom: { type: Number, default: 1 } }

  connect() {
    // Enable horizontal scroll with mouse wheel
    this.scrollContainerTarget.addEventListener("wheel", (e) => {
      if (e.deltaY !== 0) {
        e.preventDefault()
        this.scrollContainerTarget.scrollLeft += e.deltaY
      }
    })
  }

  zoomIn() {
    this.zoomValue = Math.min(this.zoomValue + 0.1, 2)
    this.applyZoom()
  }

  zoomOut() {
    this.zoomValue = Math.max(this.zoomValue - 0.1, 0.5)
    this.applyZoom()
  }

  applyZoom() {
    const container = this.scrollContainerTarget.querySelector("#events-container")
    container.style.transform = `scale(${this.zoomValue})`
    container.style.transformOrigin = "center center"
  }

  openModal(event) {
    // Placeholder for modal functionality
    console.log("Opening modal for exploit:", event.currentTarget.dataset.exploitId)
  }
}
