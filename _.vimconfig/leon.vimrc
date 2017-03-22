"[Off] DoxygenToolkit
map whoami :call WhoAmI()
function WhoAmI()
    call setline(1,"#****************************************************")
    call append(1,"#  Filename: " . expand("%"))
    call append(2,"#  Version: 1.0")
    call append(3,"#  Author: Leon(weippt.com)")
    call append(4,"#  Last modified: " . strftime("%Y-%m-%d %H:%M"))
    call append(5,"#  Description: ")
    call append(6,"#****************************************************")
endfunction

