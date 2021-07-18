# webserver_accesslog_audit

## The script consists of 6 tasks:

Task 1. Top 10 requested urls sorted by hits<br />
Output example:<br />
"hits: uri:"<br />
25     /url1<br />
10     /url2<br />
9      /url3<br />
...<br />

Task 2. Top 10 visitors by ip sorted by hits<br />
Output example:<br />
"hits:  ip:"<br />
100    1.1.1.1.1<br />
50     2.2.2.2.2<br />
10     3.3.3.3.3<br />
...<br />

Task 3. Total hits per month sorted by month<br />
Output example:<br />
Nov 2017 hits count - 12512<br />
Dec 2017 hits count - 10087<br />
Jan 2018 hits count - 12561<br />
...<br />

Task 4. Unique visits (by ip) per month<br />
Output example:<br />
Aug 2018 unique visits - 1500<br />
Sep 2018 unique visits - 1356<br />
Oct 2018 unique visits - 1689<br />
...<br />

Task 5. Top 10 ips per month<br />
Output example:<br />
Aug 2016<br />
23322 1.1.1.1<br />
359   2.2.2.2<br />
354   3.3.3.3<br />
251   4.4.4.4<br />
239   5.5.5.5<br />
234   6.6.6.6<br />
227   7.7.7.7<br />
210   8.8.8.8<br />
196   9.9.9.9<br />
189   1.2.3.4<br />

Sep 2016<br />
36512 1.1.1.1<br />
512   2.2.2.2<br />
571   3.3.3.3<br />
...<br />

Task 6. Hacking attempts, malicious activity, security scans etc.<br />
