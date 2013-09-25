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
    (input, round=2)-> 
        return "0" if input is 0
        pow = Math.pow(10, round)
        input  = Math.round(input*pow) / pow
        output = decimalSeparator(thousandSeparator(input, " "), ",")