import { setupWalletSelector } from "@near-wallet-selector/core";
import { setupHereWallet } from '@near-wallet-selector/here-wallet';
import '@near-wallet-selector/modal-ui/styles.css';
import { setupModal } from '@near-wallet-selector/modal-ui';
import { setupSender } from '@near-wallet-selector/sender';
import { setupMathWallet } from '@near-wallet-selector/math-wallet';
import { setupNightly } from '@near-wallet-selector/nightly';
import { setupMeteorWallet } from '@near-wallet-selector/meteor-wallet';


import { providers, utils ,transactions, connect ,keyStores  } from 'near-api-js';
import { createContext } from 'react';
import { setupBitgetWallet } from "@near-wallet-selector/bitget-wallet";
import { setupNarwallets } from "@near-wallet-selector/narwallets";
import { setupWelldoneWallet } from "@near-wallet-selector/welldone-wallet";
import { setupMyNearWallet } from "@near-wallet-selector/my-near-wallet";
import { CONTRACTID } from "../config/nearConfig";






const THIRTY_TGAS = '30000000000000';
const NO_DEPOSIT = '0';

export class Wallet {
    constructor({ networkId = 'testnet', createAccessKeyFor = undefined }) {
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




      startUp = async (accountChangeHook) => {
        this.selector = setupWalletSelector({
          network: this.networkId,
          modules: [
            setupWelldoneWallet(),
            setupSender(),
            setupHereWallet(),
            setupMathWallet(),
            setupNightly(),
            setupMeteorWallet(),
            setupNightly(),
            setupMyNearWallet(),
            
          
      
      
      
       
          ],
        });


        const walletSelector = await this.selector;
        const isSignedIn = walletSelector.isSignedIn();
        const accountId = isSignedIn ? walletSelector.store.getState().accounts[0].accountId : '';
        walletSelector.store.observable.subscribe(async (state) => {
          const signedAccount = state?.accounts.find((account) => account.active)?.accountId;
          accountChangeHook(signedAccount || '');
        });
    
        return accountId;

}







signIn = async () => {
  const modal = setupModal(await this.selector, {
     contractId: this.createAccessKeyFor,
     methodNames: ['transfer', 'get_sender_balance'],
     deposit: NO_DEPOSIT
    });
  modal.show();
};


signOut = async () => {
  const selectedWallet = await (await this.selector).wallet();
  selectedWallet.signOut();
};

checkAccessKey = async (accountId) => { 
  const account = await this.near.account(accountId);
   const accessKeys = await account.getAccessKeys();
    console.log(`Access keys for ${accountId}:`, accessKeys);
}




 executeTransfer = async ({contractId, input,gas = THIRTY_TGAS,deposit= NO_DEPOSIT})=>{
    
      const walletSelector = await this.selector;
      const selectedWallet = await walletSelector.wallet();
    if (!this.selector) { throw new Error('Wallet selector is not initialized.'); }
    
    
    const outcome = await selectedWallet.signAndSendTransaction({
      receiverId: contractId,
      actions: [
        {
          type: 'FunctionCall',
          params:{
            methodName: 'transfer',
            args: {input: JSON.stringify(input)},
            gas,
            deposit,
            
          },
        },
      ],
    });
    const result = providers.getTransactionLastResult(outcome); 
    console.log('Transaction result:', result); 
    
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



estimatedGasFee = async ({contractId, recipients, accountId, gas = THIRTY_TGAS})=>{
  const url = `https://rpc.${this.networkId}.near.org`;
  const provider = new providers.JsonRpcProvider({ url });
  // const input = { recipients: recipients };

  const argsString = JSON.stringify(recipients)
  // const walletSelector = await this.selector;
  //  const selectedWallet = await walletSelector.wallet(); 
  //  console.log(selectedWallet.account())
  // const accountId = walletSelector.store.getState().accounts[0].accountId;
  const account = await this.near.account(accountId);
  const rr =  Buffer.from(argsString).toString('base64')

  // console.log(account)

  // const res = await this.near.connection.provider({  
  //   request_type: 'gas_price',
  //   account_id: contractId,
  //   method_name: 'transfer',
  //   args:argsString,
  //   args_base64: rr,
  //   finality: 'optimistic',
  // });

  // console.log(res)
this.near.connection.provider.gasPrice({

})
  const result = await account.viewFunction({
    contractId,
    methodName: 'transfer',
    args:{input: argsString}
  })
  console.log(result)
  
  // const { result: estimatedGas } = await account.functionCall({
  //    contractId, 
  //    methodName : 'transfer',
  //     args: JSON.stringify(input),
  //      gas,
  //      deposit:NO_DEPOSIT
  //    });

  //  console.log('Estimated gas fee:', estimatedGas);
  

  // const result = await this.viewMethod({
  //   contractId,
  //   method:'transfer',
  //   args:{input: argsString}
  // })

  // console.log(result)

}




viewSenderBalance = async (account_id) => 
  {
    
   const result = await this.viewMethod({ 
    contractId: CONTRACTID,
   method: 'get_sender_balance',
    args: { account_id } 
  });

  
   return result;


  }






  convertToUsd = async (tokenSymbol, amount)=>{
    try {
      // Fetch prices from CoinGecko API
      const response = await fetch(`https://api.coingecko.com/api/v3/simple/price?ids=${tokenSymbol}&vs_currencies=usd`);
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
      console.error("Error fetching token price:", error);
      return null;

    }


  }

  

  







}

export const NearContext = createContext({
    wallet: undefined,
    signedAccountId: '',
  });