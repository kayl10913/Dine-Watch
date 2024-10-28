const dots = document.querySelectorAll(".dot");
const slides = document.querySelectorAll(".slide-content-box");
const slideTrack = document.querySelector(".slide-track");
const prevButton = document.getElementById("prev-btn");
const tableNav = document.querySelector(".table_nav"); // Add this line to get .table_nav element
let currentIndex = 1; // Start with "Menu" centered

function showSlide(index) {
    // Ensure the index is within bounds, considering the empty slides
    currentIndex = (index + slides.length) % slides.length;

    // Adjust slide track to center the current slide
    slideTrack.style.transform = `translateX(-${(currentIndex - 1) * 33.33}%)`;

    // Update active slide class for each slide
    slides.forEach((slide, i) => {
        slide.classList.remove("active-slide");
        if (i === currentIndex) {
            slide.classList.add("active-slide");
        }
    });

    // Update dot active state
    dots.forEach((dot, i) => {
        dot.classList.remove("active");
        if (i === currentIndex - 1) { // Adjust for offset of empty slide
            dot.classList.add("active");
        }
    });

    // Update visibility of the previous button
    updateArrowVisibility();

    // Show or hide .table_nav based on current slide
    if (currentIndex === 2) { // Assuming index 2 is the table slide
        tableNav.style.display = 'flex';
    } else {
        tableNav.style.display = 'none';
    }
}

function updateArrowVisibility() {
    // Hide the left arrow if on the first slide (Menu)
    if (currentIndex === 1) {
        prevButton.style.display = 'none';
    } else {
        prevButton.style.display = 'block';
    }

    // Hide the right arrow if on the last slide (Payment)
    const nextButton = document.getElementById("next-btn");
    if (currentIndex === 3) {
        nextButton.style.display = 'none';
    } else {
        nextButton.style.display = 'block';
    }
}

// Initial setup with "Menu" centered
showSlide(currentIndex);

// Dot click event listener
dots.forEach((dot, index) => {
    dot.addEventListener("click", () => {
        showSlide(index + 1); // Offset by 1 for the empty slide at start
    });
});

// Next and previous button functionality
document.getElementById("next-btn").addEventListener("click", () => {
    showSlide(currentIndex + 1);
});

document.getElementById("prev-btn").addEventListener("click", () => {
    showSlide(currentIndex - 1);
});
