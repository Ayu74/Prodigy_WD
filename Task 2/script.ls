let startTime, updatedTime, difference, tInterval, running = false;
let lapNumber = 1;

const display = document.getElementById('display');
const laps = document.getElementById('laps');

document.getElementById('startBtn').addEventListener('click', startTimer);
document.getElementById('pauseBtn').addEventListener('click', pauseTimer);
document.getElementById('resetBtn').addEventListener('click', resetTimer);
document.getElementById('lapBtn').addEventListener('click', recordLap);

function startTimer() {
    if (!running) {
        startTime = new Date().getTime();
        tInterval = setInterval(updateTime, 1);
        running = true;
    }
}

function updateTime() {
    updatedTime = new Date().getTime();
    difference = updatedTime - startTime;
    
    let hours = Math.floor((difference / (1000 * 60 * 60)) % 24);
    let minutes = Math.floor((difference / (1000 * 60)) % 60);
    let seconds = Math.floor((difference / 1000) % 60);

    hours = (hours < 10) ? '0' + hours : hours;
    minutes = (minutes < 10) ? '0' + minutes : minutes;
    seconds = (seconds < 10) ? '0' + seconds : seconds;

    display.innerHTML = hours + ':' + minutes + ':' + seconds;
}

function pauseTimer() {
    clearInterval(tInterval);
    running = false;
}

function resetTimer() {
    clearInterval(tInterval);
    running = false;
    display.innerHTML = '00:00:00';
    laps.innerHTML = '';
    lapNumber = 1;
}

function recordLap() {
    if (running) {
        const lapTime = document.createElement('li');
        lapTime.textContent = `Lap ${lapNumber}: ${display.innerHTML}`;
        laps.appendChild(lapTime);
        lapNumber++;
    }
}
