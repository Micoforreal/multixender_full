import { NearContext } from "@/context/walletContext";
import { useContext } from "react";

const useConverter = () => {
    const { signedAccountId, wallet } = useContext(NearContext);

    const convertToUsd = async (token, amount) => {
        const res = await wallet.convertToUsd(token, amount);
        
        if (isNaN(res) || res === null) {
          return null;
        }
        
        return res;
      };



      const convertToToken = async (token, usd) => {
        try {
          const res = await wallet.convertToToken(token, usd);
          
          if (isNaN(res) || res === null) {
            return null;
          }
          
          return res;
        } catch (error) {
          console.log(`this is your error ${error}`);
          setError("root", error);
        }
      };


      return {convertToUsd,convertToToken}
  
    
}

export default useConverter;