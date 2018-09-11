$( document ).ready(function() {
  
   

    // var list = $("#comments-list");
    // list.append(`<li>Hello</li>`);
    // list.append(`<li>second Hello</li>`)
    // console.log(list.children());
    // $("p").click(function() {
    //     console.log("You clicked a paragraph!");
    // })

//constructor function
function Comment(comment){
    this.content = comment.content
}

Comment.prototype.format = function() {
    return `<li class="comment">${this.content}</li>`
}

$("#calculate").click(function(){
    var grams = document.getElementById("grams").value;
    var pounds = document.getElementById("pounds").value;
    if (grams !== "") {
        document.getElementById("pounds").value = (parseFloat(grams) * 0.00220462).toString();
    }
    else if (pounds !== "") {    
        document.getElementById("grams").value = (parseFloat(pounds) * 453.592).toString();
    } else {
        alert("Enter a number for either grams or pounds");
    }
});

});