var olm = localStorage.lm;  //get old li amount
var li_amount = $("#shop-scroller").find("li").length; // get current li amount
console.log(li_amount + " is now amount ");
if (li_amount != "") {
    if (li_amount != olm) { // news arrive!
        localStorage.lm = li_amount; // change amount of this time
        chrome.extension.sendMessage({method: "rock"}, function () {  //send message to back, we can rock now
        })
    } else { // no changes happened
        window.location.reload(); //refresh
    }
}
