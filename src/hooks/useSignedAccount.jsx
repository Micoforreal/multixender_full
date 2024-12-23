import { NearContext } from "@/context/walletContext";
import { useContext, useEffect, useState } from "react";

const useSignedAccount = () => {
  const { signedAccountId, wallet, setSignedAccountId, setAccountBalance } =
    useContext(NearContext);
  const [action, setAction] = useState(() => {});
  const [label, setLabel] = useState("loading....");

  const signOut = async () => {
    const res = await wallet.signOut();
    if (res === "Wallet Logged Out") {
      setSignedAccountId("");
      setAccountBalance("");
    }
  };

  const signIn = async () => {
    const res = await wallet.signIn(setSignedAccountId, setAccountBalance);
  };

  useEffect(() => {
    if (!wallet) return;

    if (signedAccountId) {
      setAction(() => signOut);
      setLabel(`Disconnect Wallet`);
    } else {
      setAction(() => signIn);
      setLabel("Connect Wallet");
    }
  }, [signedAccountId, wallet]);

  return { action, label };
};

export default useSignedAccount;
