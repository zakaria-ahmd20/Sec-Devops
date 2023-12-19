// scripts.js
// scripts.js
function showDetails(title, description, imageUrl) {
    // Display details in a modal or tooltip
    var detailsModal = document.getElementById("detailsModal");
    var modalImage = document.getElementById("modalImage");
    var modalTitle = document.getElementById("modalTitle");
    var modalDescription = document.getElementById("modalDescription");

    // Set content in the modal
    modalImage.src = imageUrl;
    modalImage.alt = title;
    modalTitle.textContent = title;
    modalDescription.textContent = description;

    // Display the modal
    detailsModal.style.display = "block";
}

function hideDetails() {
    // Hide the modal
    var detailsModal = document.getElementById("detailsModal");
    detailsModal.style.display = "none";
}
