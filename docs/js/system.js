import { Particle } from './particle.js';
import { QuadTree, Rectangle } from './quadtree.js';
import { MathUtils } from './utils.js';

export class System {
    constructor(canvas) {
        this.canvas = canvas;
        this.ctx = canvas.getContext('2d');
        this.particles = [];
        this.mouse = { x: null, y: null };
        this.connectionDistance = 120;
        this.connectionDistanceSq = this.connectionDistance * this.connectionDistance;

        // Resize observer
        window.addEventListener('resize', () => this.resize());
        this.resize();

        // Mouse listeners
        window.addEventListener('mousemove', (e) => {
            this.mouse.x = e.clientX;
            this.mouse.y = e.clientY;
        });
        window.addEventListener('mouseleave', () => {
            this.mouse.x = null;
            this.mouse.y = null;
        });

        // Initialize particles
        this.initParticles();
    }

    resize() {
        this.canvas.width = window.innerWidth;
        this.canvas.height = window.innerHeight;
        // Re-init particles on drastic resize if needed, or just let them wrap
    }

    initParticles() {
        // Density based on screen area
        const area = this.canvas.width * this.canvas.height;
        const count = Math.floor(area / 10000); // Adjust density here

        this.particles = [];
        for (let i = 0; i < count; i++) {
            this.particles.push(new Particle(
                Math.random() * this.canvas.width,
                Math.random() * this.canvas.height,
                this.canvas.width,
                this.canvas.height
            ));
        }

        // Update UI counter
        const countEl = document.getElementById('particle-count');
        if (countEl) countEl.innerText = count;
    }

    update() {
        // 1. Build Quadtree
        let boundary = new Rectangle(
            this.canvas.width / 2,
            this.canvas.height / 2,
            this.canvas.width / 2,
            this.canvas.height / 2
        );
        this.qtree = new QuadTree(boundary, 4);

        // 2. Update and Insert Particles
        for (let p of this.particles) {
            p.update(this.mouse);
            this.qtree.insert(p);
        }
    }

    draw() {
        this.ctx.clearRect(0, 0, this.canvas.width, this.canvas.height);

        // Draw Particles
        for (let p of this.particles) {
            p.draw(this.ctx);
        }

        // Draw Connections (Optimized with Quadtree)
        this.ctx.lineWidth = 0.5;

        for (let p of this.particles) {
            // Define search range for this particle
            let range = new Rectangle(p.x, p.y, this.connectionDistance, this.connectionDistance);
            let neighbors = this.qtree.query(range);

            for (let other of neighbors) {
                if (p === other) continue; // Don't connect to self

                // Use squared distance for check (Optimization)
                let dSq = MathUtils.distSq(p.x, p.y, other.x, other.y);

                if (dSq < this.connectionDistanceSq) {
                    // Calculate alpha based on distance (Juice)
                    // Closer = Opaque, Farther = Transparent
                    let alpha = 1 - (dSq / this.connectionDistanceSq);

                    this.ctx.strokeStyle = `rgba(180, 167, 214, ${alpha * 0.5})`; // Accent color with alpha
                    this.ctx.beginPath();
                    this.ctx.moveTo(p.x, p.y);
                    this.ctx.lineTo(other.x, other.y);
                    this.ctx.stroke();
                }
            }
        }
    }
}
