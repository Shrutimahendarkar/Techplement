// Function to make an AJAX call to the web service
//function fetchQuotes(Qid) {
//    var sid = Qid; // Corrected variable name

//    $.ajax({
//        url: 'wsQuotes1.ashx',
//        type: "POST",
//        dataType: 'json',
//        data: { 'sMethod': 'fetchquotes', 'sid': sid }, // Corrected variable name
//        success: function (data, textStatus, jqXHR) {
            
//            var quoteText = JSON.parse(data[0]).Quote_text;
//            console.log(data[0].Quote_Text)
//            $('#quote-display').text(quoteText);
//            //alert("Quote Fetched Successfully");
//        },
//        error: function (jqXHR, textStatus, errorThrown) {
//            //if fails  
//            alert("Quote Fetch Failed");
//        }
//    });
//}


function fetchQuotes(Qid) {
    var sid = Qid;

    $.ajax({
        url: 'wsQuotes1.ashx',
        type: "POST",
        dataType: 'json',
        data: { 'sMethod': 'fetchquotes', 'sid': sid },
        success: function (data, textStatus, jqXHR) {
            console.log(data); 
            if (Array.isArray(data) && data.length > 0) {
                var quoteText = data[0].Quote_Text; 
                $('#quote-display').text(quoteText);
            } else {
                alert("No quote data found in the response.");
            }
        },
        error: function (jqXHR, textStatus, errorThrown) {
            console.error("Quote Fetch Failed: " + errorThrown);
        }
    });
}

