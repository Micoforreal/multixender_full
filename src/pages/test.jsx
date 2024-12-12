
// import React, { useEffect, useState } from 'react';
// import { initContract, login, logout } from '../uitils/near-config';


function Test() {
//   const [walletConnection, setWalletConnection] = useState(null);
//   const [contract, setContract] = useState(null);
//   const [currentUser, setCurrentUser] = useState(null);
//   const [balance, setBalance] = useState(0);
//   const [input, setInput] = useState('');

//   useEffect(() => {
//     const init = async () => {
//       const { near, walletConnection, contract } = await initContract();
//       setWalletConnection(walletConnection);
//       setContract(contract);

//       if (walletConnection.isSignedIn()) {
//         setCurrentUser(walletConnection.getAccountId());
//         const balance = await contract.get_sender_balance({ account_id: walletConnection.getAccountId() });
//         setBalance(balance);
//       }
//     };

//     init();
//   }, []);

//   const handleTransfer = async () => {
//     try {
//       await contract.transfer({ input });
//       const updatedBalance = await contract.get_sender_balance({ account_id: currentUser });
//       setBalance(updatedBalance);
//     } catch (error) {
//       console.error('Transfer failed:', error);
//     }
//   };

//   return (
//     <div>
//       {currentUser ? (
//         <div>
//           <h1>Welcome, {currentUser}</h1>
//           <p>Your balance: {balance}</p>
//           <textarea
//             value={input}
//             onChange={(e) => setInput(e.target.value)}
//             placeholder="Enter JSON input"
//           ></textarea>
//           <button onClick={handleTransfer}>Transfer</button>
//           <button onClick={logout}>Logout</button>
//         </div>
//       ) : (
//         <button onClick={login}>Login</button>
//       )}
//     </div>
//   );

<></>
}

export default Test;
