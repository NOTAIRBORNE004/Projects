window.addEventListener('message', function(event) {
    const data = event.data;
    if (data.type === 'balance') {
        const balanceElement = document.getElementById('balance');
        if (balanceElement) {
            balanceElement.innerHTML = data.balance || 'N/A';
        }
    }
});