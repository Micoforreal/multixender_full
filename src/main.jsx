import { StrictMode, Suspense } from "react";
import { createRoot } from "react-dom/client";
import "./index.css";
import App from "./App";
import { NearContextProvider } from "./context/walletContext";
// import Loading from "./components/ui/loadingIcon";
import LoadingPage from "./components/ui/loadingPage";

createRoot(document.getElementById("root")).render(
  <StrictMode>
    <NearContextProvider>
      <Suspense fallback={<LoadingPage />}>
        <App />
      </Suspense>
    </NearContextProvider>
  </StrictMode>
);
