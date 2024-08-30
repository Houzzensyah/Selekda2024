document.addEventListener("DOMContentLoaded", function() {
    const welcomeScreen = document.getElementById('welcome-screen');
    const newFileWindow = document.getElementById('new-file-window');
    const workspace = document.getElementById('workspace');
    const toolProperties = document.getElementById('tool-properties');
    const finishEditButton = document.getElementById('finish-edit');
    const layersList = document.getElementById('layers-list');
    let activeTool = null;

    // Welcome screen fade out
    setTimeout(() => {
        welcomeScreen.style.display = 'none';
        newFileWindow.classList.remove('hidden');
    }, 1000);

    // Create new file button
    document.getElementById('create-new').addEventListener('click', function() {
        newFileWindow.classList.add('hidden');
        workspace.classList.remove('hidden');
    });




});