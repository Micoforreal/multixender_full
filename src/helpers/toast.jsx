import { toast } from "react-toastify";

export const errorToast = () => {
  toast.error("Payment Unsuccessful Please Try Again", {
    position: "top-center",
    hideProgressBar: false,
    closeOnClick: false,
    pauseOnHover: true,
    draggable: true,
    theme: "dark",
  });
};

export const successToast = () => {
  toast.success("Yay! Payment Successfull!!", {
    position: "top-center",
    hideProgressBar: false,
    closeOnClick: false,
    pauseOnHover: true,
    draggable: true,
    theme: "dark",
  });
};
