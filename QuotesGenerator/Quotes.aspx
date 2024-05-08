<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quotes Generator</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-color: lavenderblush;
        }
        .container {
            text-align: center;
            padding: 102px;
            border-radius: 78px;
            background-blend-mode: color-burn;
            background: ghostwhite;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
        }
        #input-container {
            margin-top: 20px;
        }
        #input-container input[type="text"] {
            margin-right: 10px;
        }
    </style>
</head>
<body>
    <div class="container">
        <div>
            <form id="form1" runat="server" style="border-block:3px solid black; margin:0px">
                <div style="font-size: 20px; color: purple;">
                    <h4>Quotes of the Day that can make your day.</h4>
                </div>
            </form>
        </div>
        <div id="input-container">
            <input type="text" id="Qid" placeholder="Enter Quote ID">
            <button onclick="fetchQuotes(document.getElementById('Qid').value)">Search</button>
        </div>
        <br />
        <br />
        <div id="quote-display"></div>
    </div>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="jsQuotes.js"></script>
</body>
</html>
