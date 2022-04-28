select distinct tipo||' '||desc_producto,tipo||' '||desc_producto from bch_onco.productos order by tipo||' '||desc_producto


SELECT distinct ramo||' '||valor,ramo||' '||valor FROM bch_onco.productos where tipo||' '||desc_producto ='IRAM 18-50'