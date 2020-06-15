const WizardForm = rootElement => {
  let stepNumber = 0;

  const stepEls = rootElement.querySelectorAll(".js-account-wizard-step");
  const nextBtn = rootElement.querySelector(".js-account-wizard-next-btn");
  const prevBtn = rootElement.querySelector(".js-account-wizard-prev-btn");

  const syncSteps = () => {
    stepEls.forEach((stepEl, index) => {
      if (stepNumber !== index) {
        stepEl.style.display = "none";
      } else {
        stepEl.style.display = "block";
      }
    });
    prevBtn.style.display = stepNumber === 0 ? "none" : "block";
    nextBtn.style.display =
      stepNumber === stepEls.length - 1 ? "none" : "block";
  };

  syncSteps();

  nextBtn.addEventListener("click", () => {
    stepNumber++;
    syncSteps();
    console.log(stepNumber, "step number");
  });

  prevBtn.addEventListener("click", () => {
    stepNumber--;
    syncSteps();
  });
};

export default WizardForm;
