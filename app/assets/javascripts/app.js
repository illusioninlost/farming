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
    console.log("I clicked the button");
});

});