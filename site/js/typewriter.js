document.addEventListener('DOMContentLoaded', function() {
  const typewriterElement = document.getElementById('typewriter-text');
  if (!typewriterElement) return;

  const phrases = [
    'gas stations',
    'EV chargers',
    'bathrooms',
    'coffee shops',
    'ramen',
    'mangos',
    'mechanics'
  ];
  let currentPhrase = 0;

  function typePhrase() {
    const phrase = phrases[currentPhrase];
    typewriterElement.textContent = '';
    let charIndex = 0;

    // Type out character by character with random timing
    function typeChar() {
      if (charIndex < phrase.length) {
        const currentChar = phrase.charAt(charIndex);
        const previousChar = charIndex > 0 ? phrase.charAt(charIndex - 1) : '';

        typewriterElement.textContent += currentChar;
        charIndex++;

        // Use fast typing (60ms) for repeated characters, otherwise random delay
        const isRepeatedChar = currentChar === previousChar;
        const delay = isRepeatedChar ? 80 : Math.random() * (200 - 80) + 80;
        setTimeout(typeChar, delay);
      } else {
        // Finished typing, wait then delete
        setTimeout(deletePhrase, 2000);
      }
    }

    // Delete character by character - slow first deletion, then fast
    let deleteCount = 0;
    function deletePhrase() {
      if (typewriterElement.textContent.length > 0) {
        typewriterElement.textContent = typewriterElement.textContent.slice(0, -1);
        deleteCount++;

        // First deletion is slow, then fast
        const deleteDelay = deleteCount === 1 ? 250 : 40;
        setTimeout(deletePhrase, deleteDelay);
      } else {
        // Finished deleting, reset counter and move to next phrase
        deleteCount = 0;
        currentPhrase = (currentPhrase + 1) % phrases.length;
        setTimeout(typePhrase, 750); // Wait before next phrase
      }
    }

    typeChar();
  }

  // Start the animation
  typePhrase();
});