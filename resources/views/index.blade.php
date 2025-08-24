<!doctype html>
<html lang="{{ app()->getLocale() }}">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>UTN - DevOps | App Example</title>
        <!-- Fonts -->
        <link href="https://fonts.googleapis.com/css?family=Raleway:100,600" rel="stylesheet" type="text/css">
        <link rel="stylesheet" href="css/flexboxgrid.min.css" type="text/css">
        <link rel="stylesheet" href="css/app.css" type="text/css">
    </head>
    <body>
        <div class="wrapper">
            <div class="box header"><h1>Aplicación de ejemplo: PHP (Laravel) + MySQL</h1></div>
            <div class="flex-grid">
                <aside class="col sidebar box">
                    <h2>Variables de entorno</h2>
                    <div class="row">
                        <p>CONTAINER_HOSTNAME:  {{ env("CONTAINER_HOSTNAME", "not set") }}</p>
                        <p>APP_URL: {{ env("APP_URL", "not set") }}</p>
                        <p>DB_DATABASE: {{ env("DB_DATABASE", "not set") }}</p>
                        <p>APP_ENV: {{ env("APP_ENV", "not set") }}</p>
                        <p>DB_DATABASE: {{ env("DB_DATABASE", "not set") }}</p>
                    </div>
                </aside>
                <div class="box col content">
                    <h2>Contentido</h2>
                    <div class="row">
                    @foreach ($data as $row)
                    <p>registro de la base de datos ID = {{ $row->id }}: Description: {{ $row->description }}</p>
                    @endforeach
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
