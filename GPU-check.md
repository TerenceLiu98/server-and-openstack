## Get graphics card hardware information

```{shell}
lspci -vnn |grep -i VGA

lshw -C display 
```
## View the current video card driver in use
```{shell}
sudo lshw -c video | grep configuration
```
