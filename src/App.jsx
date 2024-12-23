import { BrowserRouter, Routes, Route, Navigate } from "react-router-dom";
import Home from "./pages/Home";
import SendToken from "./pages/SendToken";

import { NearContext } from "@/context/walletContext";
import { useContext } from "react";
import { ToastContainer } from "react-toastify";
import 'react-toastify/dist/ReactToastify.css';
import About from "./pages/about";
function App() {
  const {signedAccountId} = useContext(NearContext);


  return (
    <>
      <BrowserRouter>
      <ToastContainer autoClose={4000}/>
        <Routes>
          <Route
            exact
            path="/"
            element={
              signedAccountId ? <Navigate to={"/send-token"} /> : <Home />
            }
          ></Route>
          <Route exact path="/send-token" element={<SendToken />}></Route>
          <Route exact path="/about" element={<About/>}></Route>
        </Routes>
      </BrowserRouter>
    </>
  );
}

export default App;
