jQuery(document).ready(function ($) {
    var images = [{
        url: "https://upload.wikimedia.org/wikipedia/en/thumb/6/63/IMG_%28business%29.svg/1200px-IMG_%28business%29.svg.png",
        alt: "Vale"
    }, {
        url: "https://upload.wikimedia.org/wikipedia/en/thumb/6/63/IMG_%28business%29.svg/1200px-IMG_%28business%29.svg.png",
        alt: "Petrobras"
    }, {
        url: "https://upload.wikimedia.org/wikipedia/en/thumb/6/63/IMG_%28business%29.svg/1200px-IMG_%28business%29.svg.png",
        alt: "IGAM"
    }, {
        url: "https://upload.wikimedia.org/wikipedia/en/thumb/6/63/IMG_%28business%29.svg/1200px-IMG_%28business%29.svg.png",
        alt: "Arcelor Mittal"
    }];

    images.sort(function () { return 0.5 - Math.random(); });

    $.each(images, function (index, image) {
        var element = $('<div class="item"><a href="#"><img src="' + image.url + '" alt="' + image.alt + '" /></a></div>')

        if (index === 0) {
            element.addClass("active");
        }

        element.appendTo("div.carousel-inner");
    });

	$('.carousel').carousel({
	  interval: 1000,
	})
});
