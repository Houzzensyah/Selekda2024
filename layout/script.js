document.addEventListener("DOMContentLoaded", function() {
    //initialisation global variable
    const serviceButton = document.getElementById('service-button')
    const portfolioButton = document.getElementById('portfolio-button')
    const testimoniButton = document.getElementById('testimonial-button')
    const newsButton = document.getElementById('news-button')
    const landingPage = document.getElementById('landing-page')
    const portfolio = document.getElementById('portfolio')
    const blog = document.getElementById('blog');



    portfolioButton.addEventListener('click', function () {
        portfolio.style.display = 'block'
        landingPage.style.display = 'none'
    })

    newsButton.addEventListener('click', function () {
        landingPage.style.display = 'block'
        portfolio.style.display = 'none'
        blog.style.display = 'none'
    })

    serviceButton.addEventListener('click', function () {
        blog.style.display = 'block'
        landingPage.style.display = 'none'
    })


});
