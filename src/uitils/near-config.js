import { connect, keyStores, WalletConnection } from "near-api-js";

const nearConfig = {
    networkId : 'testnet',
    keyStore: new keyStores.BrowserLocalStorageKeyStore(),
    nodeUrl: 'https://rpc.testnet.near.org',
     walletUrl: 'https://wallet.testnet.near.org', 
     helperUrl: 'https://helper.testnet.near.org', 
    explorerUrl: 'https://explorer.testnet.near.org',
    contractName:'multixender33.testnet'
};

export  async function  initContract  ()  {
    try {
        
        
        
        const near = await connect(nearConfig);
        const walletConnection = new WalletConnection(near);
        const contract = new near.Contract(walletConnection.account(), nearConfig.contractName, {
            vewMethods: ['get_sender_balance'],
            changeMethods: ['transfer', 'new']
        });
        return {near, walletConnection, contract}
        
    } catch (error) {
        console.log(`an error occured ${error.message}`)
    }
}

export function logout(){
    window.walletConnection.signOut();
    window.location.replace(window.location.origin + window.location.pathname); 
}

export function login (){
    window.walletConnection.requestSignIn(nearConfig.contractName);

}