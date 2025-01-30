// Wobble effect (sinusoidal movement side to side)
x += sin(lifetime * 0.2) * 2; // Adjust frequency (0.2) and amplitude (2)

// Float upward with easing (slows down as it goes up)
if (lifetime < max_lifetime * 0.5) {
    y -= 1.5; // Faster movement at first
} else {
    y -= 0.5; // Slower movement toward the end
}

// Fade out gradually
image_alpha = max(0, image_alpha - (1 / max_lifetime));

image_xscale = 4 + (max_lifetime - lifetime) / max_lifetime * 0.5; // Shrinks as it fades
image_yscale = image_xscale;
y -= 1 + abs(sin(lifetime * 0.3)) * 2; // Bounces up as it moves


// Destroy when fully faded or lifetime ends
if (lifetime >= max_lifetime) {
    instance_destroy();
}

// Increment lifetime
lifetime++;