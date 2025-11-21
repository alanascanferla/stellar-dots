import { MathUtils, noise } from './utils.js';

export class Particle {
    constructor(x, y, canvasWidth, canvasHeight) {
        this.x = x;
        this.y = y;
        this.canvasWidth = canvasWidth;
        this.canvasHeight = canvasHeight;

        // Random velocity
        this.vx = MathUtils.randomRange(-0.5, 0.5);
        this.vy = MathUtils.randomRange(-0.5, 0.5);

        // Properties for Perlin noise
        this.noiseOffsetX = Math.random() * 1000;
        this.noiseOffsetY = Math.random() * 1000;

        this.size = MathUtils.randomRange(1.5, 3);
        this.baseColor = { r: 255, g: 255, b: 255 }; // White base

        // Parallax depth (0.5 to 1.5) - affects speed and size
        this.depth = MathUtils.randomRange(0.5, 1.5);
    }

    update(mouse) {
        // Move with velocity and depth
        this.x += this.vx * this.depth;
        this.y += this.vy * this.depth;

        // Add Perlin noise for organic movement
        let nX = noise.get(this.noiseOffsetX, 0) * 2 - 1; // -1 to 1
        let nY = noise.get(0, this.noiseOffsetY) * 2 - 1;

        this.x += nX * 0.2;
        this.y += nY * 0.2;

        this.noiseOffsetX += 0.01;
        this.noiseOffsetY += 0.01;

        // Mouse interaction (Repulsion/Attraction)
        if (mouse.x !== null) {
            let dx = mouse.x - this.x;
            let dy = mouse.y - this.y;
            let distanceSq = dx * dx + dy * dy;
            let forceRadiusSq = 150 * 150;

            if (distanceSq < forceRadiusSq) {
                let force = (forceRadiusSq - distanceSq) / forceRadiusSq;
                let angle = Math.atan2(dy, dx);

                // Repulsion
                let moveX = Math.cos(angle) * force * 5;
                let moveY = Math.sin(angle) * force * 5;

                this.x -= moveX;
                this.y -= moveY;
            }
        }

        // Wrap around screen
        if (this.x < 0) this.x = this.canvasWidth;
        if (this.x > this.canvasWidth) this.x = 0;
        if (this.y < 0) this.y = this.canvasHeight;
        if (this.y > this.canvasHeight) this.y = 0;
    }

    draw(ctx) {
        ctx.beginPath();
        ctx.arc(this.x, this.y, this.size * this.depth, 0, Math.PI * 2);
        ctx.fillStyle = `rgba(${this.baseColor.r}, ${this.baseColor.g}, ${this.baseColor.b}, ${0.5 * this.depth})`;
        ctx.fill();
    }
}
