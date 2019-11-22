window.notify = function (message) {
    $.notify(message, {position: "bottom right", className: "success"})
};

myAjax = function (options, $error) {
    var settings = {
        type: "POST",
        url: "",
        dataType: "json",
        success: function (response) {
            if (response["error"]) {
                $error.text(response["error"]);
                return false;
            } else if (response["redirect"]) {
                    location.href = response["redirect"];
            }
        }
    };
    $.ajax(jQuery.extend(settings, options));
    return true;
};