// Mobile menu toggle
document.addEventListener('DOMContentLoaded', function() {
    const mobileMenuButton = document.getElementById('mobile-menu-button');
    const mobileMenu = document.getElementById('mobile-menu');

    if (mobileMenuButton && mobileMenu) {
        mobileMenuButton.addEventListener('click', function() {
            if (mobileMenu.classList.contains('mobile-menu-closed')) {
                mobileMenu.classList.remove('mobile-menu-closed');
                mobileMenu.classList.add('mobile-menu-open');
            } else {
                mobileMenu.classList.remove('mobile-menu-open');
                mobileMenu.classList.add('mobile-menu-closed');
            }
        });
    }
});

// Canvas setup for comets animation
const canvas = document.getElementById('comets-canvas');
const ctx = canvas.getContext('2d');

// Set canvas size
function resizeCanvas() {
    canvas.width = window.innerWidth;
    canvas.height = window.innerHeight;
}
resizeCanvas();
window.addEventListener('resize', resizeCanvas);

// Comet class
class Comet {
    constructor() {
        this.reset();
    }

    reset() {
        // this.x = Math.random() * (canvas.width * 0.15); // Start in left 15% of screen
        this.x = Math.random() * -200; // Start in left 15% of screen
        this.y = Math.random() * -200; // Start above screen
        this.length = Math.random() * 80 + 20;
        this.speed = Math.random() * 2 + 1;
        this.opacity = Math.random() * 0.5 + 0.2;
        this.angle = Math.PI / 6; // 45 degree angle
    }

    update() {
        this.x += Math.cos(this.angle) * this.speed;
        this.y += Math.sin(this.angle) * this.speed;

        // Calculate distance from origin
        const distanceFromOrigin = Math.sqrt(
            Math.pow(this.x, 2) + Math.pow(this.y, 2)
        );

        const maxDistance = Math.min(canvas.width, canvas.height) * 0.5;

        // Reset if too far or off screen
        if (distanceFromOrigin > maxDistance || this.y > canvas.height || this.x > canvas.width) {
            this.reset();
        }
    }

    draw() {
        // Calculate distance from origin for fading
        const distanceFromOrigin = Math.sqrt(
            Math.pow(this.x, 2) + Math.pow(this.y, 2)
        );

        const maxDistance = Math.min(canvas.width, canvas.height) * 0.5;
        const fadeStartDistance = maxDistance * 0.2;

        // Calculate fade opacity
        let fadeOpacity = this.opacity;
        if (distanceFromOrigin > fadeStartDistance) {
            const fadeProgress = (distanceFromOrigin - fadeStartDistance) / (maxDistance - fadeStartDistance);
            fadeOpacity = this.opacity * (1 - Math.pow(fadeProgress, 2));
        }

        // Only draw if visible
        if (fadeOpacity > 0.05) {
            // Draw comet trail
            const gradient = ctx.createLinearGradient(
                this.x,
                this.y,
                this.x - Math.cos(this.angle) * this.length,
                this.y - Math.sin(this.angle) * this.length
            );
            gradient.addColorStop(0, `rgba(255, 255, 255, ${fadeOpacity})`);
            gradient.addColorStop(1, 'rgba(255, 255, 255, 0)');

            ctx.beginPath();
            ctx.strokeStyle = gradient;
            ctx.lineWidth = 2;
            ctx.moveTo(this.x, this.y);
            ctx.lineTo(
                this.x - Math.cos(this.angle) * this.length,
                this.y - Math.sin(this.angle) * this.length
            );
            ctx.stroke();

            // Draw comet head
            ctx.beginPath();
            ctx.arc(this.x, this.y, 2, 0, Math.PI * 2);
            ctx.fillStyle = `rgba(255, 255, 255, ${fadeOpacity})`;
            ctx.fill();
        }
    }
}

// Create comets
const comets = [];
for (let i = 0; i < 30; i++) {
    comets.push(new Comet());
}

// Animation loop
function animate() {
    ctx.clearRect(0, 0, canvas.width, canvas.height);

    comets.forEach(comet => {
        comet.update();
        comet.draw();
    });

    requestAnimationFrame(animate);
}

animate();
