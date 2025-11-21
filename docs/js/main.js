import { System } from './system.js';

const canvas = document.getElementById('canvas');
const system = new System(canvas);

// FPS Counter
let lastTime = performance.now();
let frames = 0;
const fpsEl = document.getElementById('fps');

function animate() {
    const now = performance.now();
    frames++;

    if (now - lastTime >= 1000) {
        fpsEl.innerText = frames;
        frames = 0;
        lastTime = now;
    }

    system.update();
    system.draw();

    requestAnimationFrame(animate);
}

animate();
