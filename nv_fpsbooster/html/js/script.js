const app = document.getElementById('app');
const levelCards = document.querySelectorAll('.level-card');
const smoothToggle = document.getElementById('smooth-mode');
const lightsToggle = document.getElementById('lights-mode');
const cleanMemoryBtn = document.getElementById('clean-memory-btn');
const closeBtn = document.getElementById('close-btn');
const currentModeText = document.getElementById('current-mode-text');

let currentLevel = 'Off';

// Message Listener
window.addEventListener('message', (event) => {
    const data = event.data;
    if (data.type === 'toggleMenu') {
        if (data.status) {
            app.style.display = 'flex';
            updateUI(data.currentLevel, data.isSmooth, data.isLightsOff);
        } else {
            app.style.display = 'none';
        }
    }
});

// Update UI state
function updateUI(level, smooth, lights) {
    currentLevel = level;
    levelCards.forEach(card => {
        if (card.getAttribute('data-level') === level) {
            card.classList.add('active');
        } else {
            card.classList.remove('active');
        }
    });
    
    smoothToggle.checked = smooth;
    lightsToggle.checked = lights;
    currentModeText.innerText = level.toUpperCase();
}

// Level Selection
levelCards.forEach(card => {
    card.addEventListener('click', () => {
        const level = card.getAttribute('data-level');
        if (level === currentLevel) return;
        
        currentLevel = level;
        levelCards.forEach(c => c.classList.remove('active'));
        card.classList.add('active');
        currentModeText.innerText = level.toUpperCase();
        
        fetch(`https://${GetParentResourceName()}/setLevel`, {
            method: 'POST',
            body: JSON.stringify({ level: level })
        });
    });
});

// Smooth Toggle
smoothToggle.addEventListener('change', () => {
    fetch(`https://${GetParentResourceName()}/toggleSmooth`, {
        method: 'POST',
        body: JSON.stringify({ enabled: smoothToggle.checked })
    });
});

// Lights Toggle
lightsToggle.addEventListener('change', () => {
    fetch(`https://${GetParentResourceName()}/toggleLights`, {
        method: 'POST',
        body: JSON.stringify({ enabled: lightsToggle.checked })
    });
});

// Memory Cleaner
cleanMemoryBtn.addEventListener('click', () => {
    const originalText = cleanMemoryBtn.innerText;
    cleanMemoryBtn.innerText = "CLEANING...";
    cleanMemoryBtn.disabled = true;
    
    fetch(`https://${GetParentResourceName()}/cleanMemory`, {
        method: 'POST',
        body: JSON.stringify({})
    });

    setTimeout(() => {
        cleanMemoryBtn.innerText = "DONE!";
        setTimeout(() => {
            cleanMemoryBtn.innerText = originalText;
            cleanMemoryBtn.disabled = false;
        }, 1000);
    }, 1000);
});

// Close Menu
closeBtn.addEventListener('click', () => {
    fetch(`https://${GetParentResourceName()}/close`, {
        method: 'POST',
        body: JSON.stringify({})
    });
});

// Keyboard Close
window.addEventListener('keydown', (e) => {
    if (e.key === 'Escape' || e.key === 'Backspace') {
        fetch(`https://${GetParentResourceName()}/close`, {
            method: 'POST',
            body: JSON.stringify({})
        });
    }
});
