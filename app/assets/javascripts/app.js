document.addEventListener("turbolinks:load", function() {
  

// constructor function
function Comment(content){
    this.content = content;
}
// class Comment{

//     constructor(content) {
//         this.content = content
        
//     }

//     format() {
//         return `<li class="comment"><strong>${this.content}</strong></li>`;
//     }
// }

Comment.prototype.format = function() {
    return `<li class="comment"><strong>${this.content}</strong></li>`;
}
//new item page
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

$("#add-comment").submit(function(event){
    // Stop form from submitting normally
    event.preventDefault();
    
    // Get some values from elements on the page:
    var $form = $( this ),
    token = $form.find("input[name='authenticity_token']").val(),
    term = $form.find("textarea[name='content']").val(),
    url = $form.attr("action");
    
    // Send the data using post
    var posting = $.post(url, {content: term, authenticity_token: token});
    
    posting.done(function(data){
   
        var newComment = new Comment(term)
        var commentHTML = newComment.format()
        var list = $("#comment-list");
        list.append(commentHTML);
    });
});

function Item(itemParams){
    this.name = itemParams.name;
    this.value = itemParams.value;
}

$("a.see").on("click", function(event){
    event.preventDefault();
    var url = this.href + ".json";
  
    $.get(url, function(data){
        var commentsArray = data.comments;
        $("div#comment-results").html("")
        $("div#comment-results").append(`This product has ${commentsArray.length} comments.`)
    })
});

$("#load-items").on("click", function(event){
    event.preventDefault();
  
    $.get("/items.json", function(data){
        data.forEach(element => {
        var itemElement = new Item(element);
        $('#item-results').append(`<p>Product: ${itemElement.name}, Price Per Pound: \$${itemElement.value} /lb</p>`)  
        });
       
    })
});


$("#alpha").on("click", function(event){
    event.preventDefault();
  
    $.get("/items.json", function(data){
        
       var results = data.sort(function(a, b) {
            var nameA = a.name.toUpperCase(); // ignore upper and lowercase
            var nameB = b.name.toUpperCase(); // ignore upper and lowercase
            if (nameA < nameB) {
              return -1;
            }
            if (nameA > nameB) {
              return 1;
            }
            if (a.value < b.value) {
                return -1;
            }
            if (a.value > b.value) {
                return 1;
            }
          
            // names must be equal
            return 0;
        });

        data.forEach(element => {
            var itemElement = new Item(element);
            $('div#comment-results').append(`<p>Product: ${itemElement.name}, Price Per Pound: \$${itemElement.value} /lb</p>`)  
            });
     
       
    })
});



});