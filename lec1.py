from bitcoin import *
import json
priv = sha256('dlwlsthf1@dlwlsthf1@') #프라이빗 키
pub = privtopub(priv) #퍼블릿 키 

addr_testnet = pubtoaddr(pub, 111) # 비트코인 어드레스 생성 테스트넷

addr_testnet = pubtoaddr(pub) # 
#print(addr_testnet) #mwVVXMoJ3X4K2TAe3pQtGrPoR3YqEWC2tB
#bc1qwk89q7ss9zxxnnm5zyaa68e4sqennuwfk9ldeg

input = blockinfo_unspent(addr_testnet,'testnet')[0]
output = {'value': 1000000, 'address':'bc1qwk89q7ss9zxxnnm5zyaa68e4sqennuwfk9ldeg'}
tx = mktx([input],[output])
tx2 = sign(tx,0,priv)
pushtx(tx2)




