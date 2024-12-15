
/system scheduler
add interval=1d name=daily_fraude_webshop on-event=fraude_webshop policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon start-date=2024-12-14 \
    start-time=02:00:00 

/system script
add comment="Daily get fraude_webshop list" dont-require-permissions=no name=fraude_webshop \
policy=ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source="\
    /tool fetch url=\"https://list.siekman.io/fraude_webshop.rsc\" mode=https;\
    \n:log info \"Downloaded fraude_webshop blacklist\";\
    \n/ip dns static remove [find where comment=\"FRAUDE_WEBSHOP\"]\
    \n/import file-name=fraude_webshop.rsc;"

/system/script/run fraude_webshop


