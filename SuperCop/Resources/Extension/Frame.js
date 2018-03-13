if (!localStorage.location) {
    localStorage.location = "AmericaFrame";
    chrome.storage.local.set({location: localStorage.location}, function () {
    });
}
$("#frame").attr("src", localStorage.location + ".html");
var id = "#" + localStorage.location;
$(id).css("background-color", "red");


$(".location").click(function () {
    $(".location").css("background-color", "black");
    $(this).css("background-color", "red");
    localStorage.location = $(this).attr("id");
    var frame = $("#frame");
    frame.fadeOut(500, function () {
        frame.attr("src", localStorage.location + ".html");
        chrome.storage.local.set({location: localStorage.location}, function () {
        });
        frame.fadeIn(500);
    });


});

