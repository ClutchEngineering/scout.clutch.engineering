document.addEventListener('DOMContentLoaded', function() {
  const form = document.querySelector('form[action*="register.scout.clutch.engineering"]');
  if (!form) return;

  form.addEventListener('submit', function(event) {
    const submitButton = form.querySelector('button[type="submit"]');
    const buttonText = submitButton.querySelector('span');

    if (!submitButton || !buttonText) return;

    // Disable the button
    submitButton.disabled = true;

    // Change the text
    buttonText.textContent = 'Signing up...';

    // Apply pressed down state and disable hover
    submitButton.style.pointerEvents = 'none';
    submitButton.style.opacity = '0.6';
    buttonText.style.transform = 'translate(-4px, 4px)';
  });
});
