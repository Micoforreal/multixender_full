







// walletConnection.requestSignIn({
//     contractId : nearConfig.contractName,

// })





//  modal.show();

// const wallet = selector.wallet;
// if (selector.isSignedIn){
//     // const wallet = selector.wallet();
//     //  const walletName = wallet.name;
//      const wallet = await selector.wallet(selector.store.getState().selectedWalletId);
//      const accounts = await wallet.signIn({ contractId: "multixender.testnet" });
    
//     console.log(selector.store.getState().accounts[0].accountId )

//      console.log(accounts)
// }





// const selector = await setupWalletSelector({
//      network: 'testnet',
//       modules: [ 
//         setupMyNearWallet({ 
//             walletUrl: 'https://testnet.mynearwallet.com'
//              }), 
// // setupLedger(),
// // setupMeteorWallet(),

// ] });


// const modal = setupModal(selector, 
//     { contractId: 'your-contract.testnet'

//      });


//      modal.show();







async function  initContract  ()  {
    console.log('hello')
    try {
        console.log('hii')
        
        
     

        // const account = walletConnection.account();

        // const contract = new Contract(account, nearConfig.contractName, {
        //     viewMethods: ['get_sender_balance'], // Correctly named
        //     changeMethods: ['transfer', 'new']  // Correctly named
        // })
        // return {near, walletConnection, contract}
        
    } catch (error) {
        console.log(`an error occured ${error.message}`)
    }
}



export const CONTRACTID = 'multixender.testnet'

export default initContract;