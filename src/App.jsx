import { BrowserRouter, Routes, Route, Navigate } from "react-router-dom";
import Home from "./pages/Home";
import SendToken from "./pages/SendToken";
// import Test from './pages/test';
import { NearContext } from "@/context/walletContext";

import { Wallet } from "./near/wallet/near";
import { Network } from "lucide-react";
import { useContext } from "react";
import { CONTRACTID } from "./near/config/nearConfig";
import Loading from "./components/ui/loadingIcon";
import LoadingPage from "./components/ui/loadingPage";
import { ToastContainer } from "react-toastify";
import 'react-toastify/dist/ReactToastify.css';
function App() {
  const { isLoading, signedAccountId, wallet } = useContext(NearContext);


  return (
    <>
      <BrowserRouter>
      <ToastContainer autoClose={3000}/>
        {/* {isLoading && <LoadingPage />} */}
        <Routes>
          <Route
            exact
            path="/"
            element={
              signedAccountId ? <Navigate to={"/send-token"} /> : <Home />
            }
          ></Route>
          <Route exact path="/send-token" element={<SendToken />}></Route>
          {/*  <Route exact path='/test' element={<Test/>} ></Route> */}
        </Routes>
      </BrowserRouter>
    </>
  );
}

export default App;
