import { Controller } from "@hotwired/stimulus";

// Resets a form after successful submission
export default class extends Controller {
  static targets = ["input"];

  connect() {
    this.element.addEventListener(
      "turbo:submit-end",
      this.resetForm.bind(this),
    );
  }

  resetForm(event) {
    if (event.detail.success) {
      this.inputTargets.forEach((input) => {
        input.value = "";
      });
    }
  }
}
