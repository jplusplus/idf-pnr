angular.module('idfPnrApp').filter 'number', ()->
    thousandSeparator = (nStr="", sep=",")->
        nStr = "" + (nStr or "")
        x = nStr.split(".")
        x1 = x[0]
        x2 = (if x.length > 1 then "." + x[1] else "")
        rgx = /(\d+)(\d{3})/
        x1 = x1.replace(rgx, "$1" + sep + "$2") while rgx.test(x1)
        x1 + x2          
    decimalSeparator = (n=0, dec=".")-> (n+"").replace /\./, dec
    # Combines the two functions
    (input) -> decimalSeparator(thousandSeparator(1*input, " "), ",")