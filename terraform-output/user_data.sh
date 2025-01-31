#! /usr/bin/env bash
#!/bin/bash
sudo yum update -y
sudo yum install -y httpd
sudo systemctl start httpd
sudo systemctl enable httpd

echo "<html>
<head>
    <title>Welcome Page</title>
</head>
<body>
    <h1 style='text-align: center;'>Hello, this is a web page created by Ayush using Terraform.</h1>
</body>
</html>" > /var/www/html/index.html

sudo systemctl restart httpd
