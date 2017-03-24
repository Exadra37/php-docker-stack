<?php

$connection = new PDO("mysql:host=database;dbname=docker_laravel;charset=utf8", 'docker_laravel', 'docker_secret');

$query = $connection->query("SHOW DATABASES");

$databases = $query->fetchAll(PDO::FETCH_COLUMN);

echo "<h4>mysql> SHOW DATABASES;</h4>";

foreach ($databases as $database) {

    echo "<p>{$database}</p>";
}
