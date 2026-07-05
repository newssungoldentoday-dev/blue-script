// terminal.js - The bridge between the Web UI and your Dart Engine
window.addEventListener('load', () => {
    // This connects your website interface to the compiled Dart logic
    const inputField = document.getElementById('terminal-input');
    
    inputField.addEventListener('keypress', (e) => {
        if (e.key === 'Enter') {
            const command = inputField.value;
            // Send command to the engine initialized by your Dart code
            window.executeComCommand(command);
            inputField.value = '';
        }
    });
});
