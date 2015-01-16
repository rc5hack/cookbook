<?php

# This is useful to debug timezonedb/tzdata updates.
# USAGE: $ php -e ./timezone-check.php

date_default_timezone_set("Europe/Moscow"); 
$tz = new DateTimeZone("Europe/Moscow");

foreach (timezone_transitions_get($tz) as $tr)
    if ($tr['ts'] > time()) break;

$d = new DateTime("@{$tr['ts']}");
printf("The timezone %s switches to %s on %s.\nThe new GMT offset will be: %d (%s)\n", $tz->getName(), $tr['isdst']? "DST": "standard time", $d->format('d M Y @ H:i T'), $tr['offset'], $tr['abbr']);
