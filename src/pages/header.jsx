import { Link, useLocation } from "react-router-dom";
import {
  Sheet,
  SheetTrigger,
  SheetContent,
  SheetClose,
} from "@/components/ui/sheet";
import { Button } from "@/components/ui/button";
import logoImage from "@/assets/logo/logo.png";
import { useContext } from "react";
import useSignedAccount from "@/hooks/useSignedAccount";
import { NearContext } from "@/context/walletContext";
import 'animate.css';

export default function Header() {
  const location = useLocation();
  // const { signedAccountId, wallet } = useContext(NearContext);
  const { action, label } = useSignedAccount();

  return (
    <div className="flex animate__animated animate__slideInDown animate__fast  items-center border-t-2 justify-between px-4 py-2 mx-4 mt-3 shadow rounded-xl border border-gray-100 dark:bg-gray-800">
      <Link to={"/"} className="flex items-center gap-2" prefetch={false}>
        <img src={logoImage} className="md:w-4/6 w-1/2" />
      </Link>
      <div className="hidden md:flex gap-4">
        {location.pathname !== "/" && (
          <Link
            to={"/"}
            className="text-lg  my-auto hover:underline underline-offset-4"
          >
            Home
          </Link>
        )}
        {location.pathname !== "/about" && (
          <Link
            to={"/about"}
            className="text-lg  my-auto hover:underline underline-offset-4"
          >
            About Us
          </Link>
        )}
        {location.pathname !== "/send-token" ? (
          <Link
            to={"/send-token"}
            className=" hover:underline underline-offset-4"
          >
            <button className="bg-orange-600  my-auto rounded-3xl text-white px-8 py-1">
              Send token
            </button>
          </Link>
        ) : (
          <button
            className="bg-black  my-auto rounded-3xl text-orange-600 px-8 py-1"
            onClick={action}
          >
            {label}
          </button>
        )}
      </div>
      <Sheet>
        <SheetTrigger asChild>
          <Button size="icon" className=" border rounded-lg md:hidden">
            <MenuIcon className="h-6 w-6" />
            <span className="sr-only">Toggle navigation menu</span>
          </Button>
        </SheetTrigger>
        <SheetContent side="right" className="bg-white">
          <div className="grid w-[200px] p-4 text-left">
            {location.pathname !== "/" && (
              <Link
                to={"/"}
                className="text-lg ps-3  py-2 my-auto hover:underline underline-offset-4"
              >
                Home
              </Link>
            )}

            {location.pathname !== "/about" && (
              <Link
              to={'/about'}
                className="text-lg py-2 ps-3  hover:underline underline-offset-4"
                prefetch={false}
              >
                About Us
              </Link>
            )}
            {location.pathname !== "/send-token" ? (
              <Link
                to={"/send-token"}
                className=" hover:underline underline-offset-4"
              >
                <button className="bg-orange-600  my-2 rounded-3xl text-white px-8 py-1">
                  Send token
                </button>
              </Link>
            ) : (
              <SheetClose asChild>
                <button
                  className="bg-black   my-2 rounded-3xl text-orange-600  py-1"
                  onClick={action}
                >
                  {label}
                </button>
              </SheetClose>
            )}
          </div>
        </SheetContent>
      </Sheet>
    </div>
  );
}

function MenuIcon(props) {
  return (
    <svg
      {...props}
      xmlns="http://www.w3.org/2000/svg"
      width="24"
      height="24"
      viewBox="0 0 24 24"
      fill="none"
      stroke="currentColor"
      strokeWidth="2"
      strokeLinecap="round"
      strokeLinejoin="round"
    >
      <line x1="4" x2="20" y1="12" y2="12" />
      <line x1="4" x2="20" y1="6" y2="6" />
      <line x1="4" x2="20" y1="18" y2="18" />
    </svg>
  );
}
