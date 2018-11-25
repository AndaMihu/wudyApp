$(document).on("turbolinks:load", function(){

    $(document).on("click", ".alert .close", function(e){
        e.preventDefault();
        $(".alert").remove();
    })

    if($(".alert").length){
        setTimeout(function(){
            $(".alert").remove();
        }, 5000)
    }
})