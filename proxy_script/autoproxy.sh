#/bin/zsh
brew install privoxy
echo -n "Enter your http/https PORT ->"
read  PORT
echo "PORT = $PORT"
echo "function proxy_off(){" >> ~/.bash_profile
echo     "  unset http_proxy" >> ~/.bash_profile
echo     "  unset https_proxy" >> ~/.bash_profile
echo     "  echo -e "已关闭代理"" ~/.bash_profile
echo "}\n" >> ~/.bash_profile
echo "function proxy_on() {" >> ~/.bash_profile
echo     "  export http_proxy='http://localhost:$PORT'"  >> ~/.bash_profile
echo     "  export https_proxy='http://localhost:$PORT'"  >> ~/.bash_profile
echo     "  echo -e "已开启代理""  >> ~/.bash_profile
echo "}" >> ~/.bash_profile
echo -n "done"
