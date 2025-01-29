// Make the number float upward
y -= 1;

// Fade out over time
image_alpha -= 0.02; // Decrease alpha (transparency)

// Destroy the number when it is fully faded
if (image_alpha <= 0) {
    instance_destroy();
}
