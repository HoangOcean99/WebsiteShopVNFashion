function changeImage(newUrl) {
    // Lấy thẻ <img> lớn bằng ID
    const mainImg = document.getElementById('mainImage');

    if (mainImg) {
        mainImg.src = newUrl;
    }
}

