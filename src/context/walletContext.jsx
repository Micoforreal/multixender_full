import LoadingPage from "@/components/ui/loadingPage";
import { CONTRACTID } from "@/near/config/nearConfig";
import { Wallet } from "@/near/wallet/near";
import {  createContext, useEffect, useState } from "react";





export const NearContext = createContext({});



export const NearContextProvider = ({children})=>{
  
  const [signedAccountId, setSignedAccountId]= useState('')
  const [isLoading, setIsLoading] = useState(true)
  const [wallet, setWallet]= useState()
  useEffect(() => { 
    
    const start=  async () => {
  
      try {
        
        const wallet = new Wallet({createAccessKeyFor: CONTRACTID})
        await wallet.init()
        setWallet(wallet)


        
        
         const res= await wallet.startUp() 
      setSignedAccountId(res)
        } catch (error) {
          
        }finally{
          setIsLoading(false)
        }
        }

  
        start()
      },[]);

      if (isLoading) {
        return <LoadingPage/>
        
      }


    return(
        
    <NearContext.Provider value={{isLoading,wallet, signedAccountId, setSignedAccountId}}>

        {children}
    </NearContext.Provider>
    
    )
    
  
}