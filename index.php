<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Browser Info</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Browser info mini web-app">
    <meta name="author" content="Pavel Rid aka Soulwish | https://github.com/s0ulw1sh/browserinfo | info@soulwish.ru">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <style>
        * { font-size: .97rem; }
        body { background: #eee; }
        .form-group { margin-bottom: 0 !important; }
        h1 { text-align: center; margin-top: 30px; margin-bottom: 30px; font-weight: bold; }
        label { font-weight: bold; }
        .app { background-color: #fff; padding: 30px; border-radius: 10px; }
        textarea { height: 300px; }
        h4 { font-weight: bold; }
        footer { margin: 30px 0; text-align: center; color: #777; }
    </style>
</head>
<body>
    <div class="container">
        <div class="row">
            <div class="col">
                <h1>Browser Info</h1>
            </div>
        </div>
        <div class="row">
            <div class="col-md-8 col-12 offset-md-2">
                <div class="app"><app></app></div>
            </div>
        </div>
        <div class="row">
            <div class="col">
                <footer>
                    <span>by Pavel Rid aka Soulwish | 2021 | info@soulwish.ru </span>
                </footer>
            </div>
        </div>
    </div>
    
    <script src="app.min.js"></script>
    <script>
        var app = Elm.Main.init({
                node: document.querySelector('app'),
                flags: {
                    useragent: "<?php print htmlspecialchars($_SERVER['HTTP_USER_AGENT']); ?>",
                    platform:  navigator.platform + " ("+[navigator.appCodeName, navigator.appName, navigator.appVersion, navigator.buildID, navigator.product].join(" ")+")",
                    ipaddr:    "<?php print $_SERVER['REMOTE_ADDR'] . ' / ' . gethostbyaddr($_SERVER['REMOTE_ADDR']); ?>",
                    resolut:   screen.width + "x" + screen.height + " (" + (screen.availWidth + "x" + screen.availHeight) + ")",
                    depth:     screen.pixelDepth,
                    langs:     navigator.languages.join(", ") + " (<?php print $_SERVER['HTTP_ACCEPT_LANGUAGE']; ?>)"
                }
            })
    </script>
</body>
</html>
