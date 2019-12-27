#/bin/bash
echo -n "<-Input Your Port->"
read PORT
python -m SimpleHTTPServer $PORT
