
import {BrowserRouter, Routes,Route, Navigate} from 'react-router-dom';
import Home from './pages/Home';
import SendToken from './pages/SendToken';
// import Test from './pages/test';

import {NearContext, Wallet} from './near/wallet/near'
import { Network } from 'lucide-react';
import { useEffect, useState } from 'react';
import { CONTRACTID } from './near/config/nearConfig';
// import {getGasPriceAndEstimateFee} from './pages/test'

const wallet = new Wallet({createAccessKeyFor: CONTRACTID})
await wallet.init()

const recipients = [{ account_id: 'miloishere.testnet', amount: '1000000000000000000000000' }]



// console.log(wallet)

function App() {
  const [signedAccountId, setSignedAccountId]= useState('')
  
  useEffect(() => { wallet.startUp(setSignedAccountId) }, []);
  
  //  wallet.executeTransfer({
  //     contractId: 'multixender.testnet',
  //     input
  //   })




//   const contractId = 'multixender.testnet';
// const methodName = 'transfer';
// const input = { recipients: [
//     { account_id: 'recipient1.testnet', amount: '1000000000000000000000000' },
//     { account_id: 'recipient2.testnet', amount: '500000000000000000000000' },
//     { account_id: 'recipient3.testnet', amount: '750000000000000000000000' }
// ] };

// getGasPriceAndEstimateFee (contractId, methodName, input).then(result => {
//     console.log('Gas Price:', result.gasPrice);
//     console.log('Estimated Gas Units:', result.estimatedGasUnits);
//     console.log('Estimated Gas Fee in yoctoNEAR:', result.estimatedGasFee);
// }).catch(error => {
//     console.error('Error estimating gas fee:', error);
// });


  // wallet.estimatedGasFee({contractId:CONTRACTID, recipients, accountId:signedAccountId})
  
  
  // wallet.convertToUsd('near',2)




// wallet.checkAccessKey(signedAccountId)

  return (
    <NearContext.Provider value={{wallet, signedAccountId}}>

    <>
    <BrowserRouter>

  <Routes>
    
    <Route exact path='/' element={signedAccountId? <Navigate to={'/send-token'}/>: <Home/>} ></Route>
    <Route exact path='/send-token' element={<SendToken/>} ></Route>
   {/*  <Route exact path='/test' element={<Test/>} ></Route> */}


  </Routes>
    </BrowserRouter>
    
  </>
    </NearContext.Provider>
  )
}

export default App
