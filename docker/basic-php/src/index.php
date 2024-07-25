<?php
  echo "<h2>Hello There</h2>";
  echo "We are in <strong>index.php</strong> which was fired<br>";

  $ip = gethostbyname("www.w3schools.com");
  echo "IP of www.w3schools.com = $ip<br>";

  $host = gethostbyaddr($_SERVER["REMOTE_ADDR"]);
  echo "IP of local host running the container =  $host<br>";

  echo 'Todays date = <b>' . date('Y/m/d') . '</b> and day of week = <b>'.date('l').'</b> today!';

?>

