window.addEventListener('message', (event) => {
    const data = event.data;
    if (data.type === 'speed') {
        document.getElementById('speedo').style.display = 'block';
        document.getElementById('speed-output').textContent = Math.round(data.speed);
        document.getElementById('speed-type').textContent = data.speedType.toUpperCase();
    }
    if (data.type === 'hideSpeedo') {
        document.getElementById('speedo').style.display = 'none';
    }
});
