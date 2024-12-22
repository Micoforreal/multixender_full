import { setupWalletSelector } from "@near-wallet-selector/core";
import { setupHereWallet } from '@near-wallet-selector/here-wallet';
import '@near-wallet-selector/modal-ui/styles.css';
import { setupModal } from '@near-wallet-selector/modal-ui';
import { setupSender } from '@near-wallet-selector/sender';
import { setupMathWallet } from '@near-wallet-selector/math-wallet';
import { setupNightly } from '@near-wallet-selector/nightly';
import { setupMeteorWallet } from '@near-wallet-selector/meteor-wallet';


import { providers, utils ,transactions, connect ,keyStores ,Contract } from 'near-api-js';
import { createContext, useContext } from 'react';
import { setupBitgetWallet } from "@near-wallet-selector/bitget-wallet";
import { setupNarwallets } from "@near-wallet-selector/narwallets";
import { setupWelldoneWallet } from "@near-wallet-selector/welldone-wallet";
import { setupMyNearWallet } from "@near-wallet-selector/my-near-wallet";
import { CONTRACTID, TEST_NETWORK, THIRTY_TGAS } from "../config/nearConfig";
import { NearContext } from "@/context/walletContext";
import { Navigate } from "react-router-dom";





const NO_DEPOSIT = '0';

export class Wallet {
    constructor({ networkId = TEST_NETWORK, createAccessKeyFor = undefined }) {
        this.createAccessKeyFor = createAccessKeyFor;
        this.networkId = networkId;
        this.keyStore = new keyStores.BrowserLocalStorageKeyStore();
      }

      async init(){
      this.near = await connect({
        networkId: this.networkId,
         keyStore: this.keyStore,
         nodeUrl: `https://rpc.${this.networkId}.near.org`,
         walletUrl: `https://wallet.${this.networkId}.near.org`,
         helperUrl: `https://helper.testnet.near.org`,
      })
    }




      startUp = async () => {
        this.selector = setupWalletSelector({
          network: this.networkId,
          modules: [
            setupWelldoneWallet(),
            setupSender(),
            setupHereWallet(),
            setupMathWallet(),
            setupNightly(),
            setupMeteorWallet({useRedirect:true}),
       
            setupMyNearWallet(),
            
          
      
      
      
       
          ],
        });


        const walletSelector = await this.selector;
        const isSignedIn = walletSelector.isSignedIn();
        const accountId = isSignedIn ? walletSelector.store.getState().accounts[0].accountId : '';
        walletSelector.store.observable.subscribe(async (state) => {
          const signedAccount = state?.accounts.find((account) => account.active)?.accountId;

          return signedAccount

       
        });
    
        return accountId;

}






signIn = async (changeHook) => {
  try {
    
    const walletSelector = await this.selector;
    const modal =  setupModal( walletSelector, {
      contractId: this.createAccessKeyFor,
      methodNames: ['transfer', 'get_sender_balance'],
      deposit: NO_DEPOSIT
      
    });
   modal.show();
    walletSelector.on('signedIn',(event)=>{
      const id = event.accounts[0].accountId
        changeHook(id)

 
    })
  } catch (error) {
    return { status: 'error', message: error.message}
  }
  
};



signOut = async () => {
  try {
    
    const selectedWallet = await (await this.selector).wallet();
   await  selectedWallet.signOut();
    return 'Wallet Logged Out'
  } catch (error) {
    
  }
 

};

checkAccessKey = async (accountId) => { 
  const account = await this.near.account(accountId);
   const accessKeys = await account.getAccessKeys();
    console.log(`Access keys for ${accountId}:`, accessKeys);
}




 executeTransfer = async ({ recipient,gas = THIRTY_TGAS,deposit})=>{
 
    
      const walletSelector = await this.selector;
      
      const selectedWallet = await walletSelector.wallet();
      console.log(selectedWallet)

    if (!this.selector) { throw new Error('Wallet selector is not initialized.'); }

    const outcome = await selectedWallet.signAndSendTransaction({
      receiverId: CONTRACTID,
      actions: [
        {
          type: 'FunctionCall',
          params:{
            methodName: 'transfer',
            args:   {input:JSON.stringify(recipient)},
            gas,
            deposit,
            
          }
        },
      ],
      callbackUrl: window.location.href,
      
    });
    const result = await  providers.getTransactionLastResult(outcome); 


    if (outcome.final_execution_status === 'EXECUTED' ) {

      
      return 'success'
      
    }else{
      return 'failed'

    }

    
  }

  
  
  viewMethod = async ({ contractId, method, args = {} }) => {
    const url = `https://rpc.${this.networkId}.near.org`;
    const provider = new providers.JsonRpcProvider({ url });
  
    const res = await provider.query({
      request_type: 'call_function',
      account_id: contractId,
      method_name: method,
      args_base64: Buffer.from(JSON.stringify(args)).toString('base64'),
      finality: 'optimistic',
    });
    return JSON.parse(Buffer.from(res.result).toString());
  };







viewSenderBalance = async (account_id) => 
  {
    
   const result = await this.viewMethod({ 
    contractId: CONTRACTID,
   method: 'get_sender_balance',
    args: { account_id } 
  });

  
   return result;


  }




  nearToYoctoNear(nearAmount) {
    // Parse the NEAR amount as a floating-point number
    const near = parseFloat(nearAmount).toFixed(2);
    // Multiply by 10^24 to convert to yoctoNEAR
    const yoctoNear = (near * (Math.pow(10, 24))); // Convert result to a string to avoid precision issues
    const total = yoctoNear.toLocaleString('fullwide', { useGrouping: false })
    return total;
}



  convertToUsd = async (tokenSymbol, amount)=>{
    try {
      // Fetch prices from CoinGecko API
      const response = await fetch(`https://api.coingecko.com/api/v3/simple/price?ids=${tokenSymbol}&vs_currencies=usd`);
      const res = await  fetch(`https://pro-api.coinmarketcap.com/v1/cryptocurrency/quotes/latest?symbol=NEAR&convert=USD`, {
        headers: {
          "X-CMC_PRO_API_KEY":'bc0c430e-2c16-4a16-8c2d-b89189de56dd',
        },
      });

      console.log(res)
      
      const data = await response.json();



       // Extract price and calculate conversion
       if (data[tokenSymbol] && data[tokenSymbol].usd) {
        const priceInUSD = data[tokenSymbol].usd;
        const convertedAmount = priceInUSD * amount;
        return convertedAmount;
    } else {
        console.error("Invalid token symbol or no price data available.");
        return null;
    }
    
    }catch(error)
    {
      return null

    }


  }

  convertToToken = async (tokenSymbol ,usdAmount) => {
    try {
      const response = await fetch(`https://api.coingecko.com/api/v3/simple/price?ids=${tokenSymbol}&vs_currencies=usd`);
      const data = await response.json();



      // Extract price and calculate conversion
      if (data[tokenSymbol] && data[tokenSymbol].usd) {
        const conversionRate = data[tokenSymbol].usd;
        const tokenAmount = usdAmount / conversionRate;
       return tokenAmount;

      }else {
        console.error("Invalid token symbol or no price data available.");
        return null;
    }
    } catch (error) {
      console.error('Error fetching conversion rate:', error);
       return null;
      
    }
    
  }

  

  







}