import { Link } from "react-router-dom";
import logoImage from "@/assets/logo/favicon.png";
import Header from "./header";
import { Button } from "@/components/ui/button";

const About = () => {
  return (
    <>
      <Header />


      <div className="container animate__animated animate__fadeIn mx-auto  flex  px-5 md:py-10 py-20 md:flex-row flex-col items-center">
        <div
          className="
        md:mb-0 mb-10
    
         
    mx-auto

         
         
         "
        >
          <img
            className="object-cover w-60 md:w-72 object-center rounded"
            alt="hero"
            src={logoImage}
          />
          <h1 className="text-center font-semibold text-3xl">
            {" "}
            Multi<span className="text-red-600">X</span>ender
          </h1>
        </div>

        <div className=" md:mx-auto md:w-5/12  text-center  ">
          <h1 className="title-font sm:text-4xl text-3xl mb-4 font-medium text-red-600">
            About Us
          </h1>
          <p className="mb-8 leading-relaxed">
            Multixender i a platfrom that is powered by the near protocol, with
            multixender you can send tokens to multiple in one click we are here
            to make your transaction easier and stress free and also make you
            save more on fees. Speed is part of our main focus when using
            multixender which is why we have integrated an high speed wallet api
            to sign and send your transactions. Say Good bye to slow and time
            consuming Transfers
          </p>

          <div className="flex justify-center my-8">
            <Link to={"/send-token"}>
              <Button
                className=" bg-orange-600 border-0 
            py-6 px-10 rounded-3xl text-lg font-medium"
              >
                Start Using Multixender
              </Button>
            </Link>
          </div>
        </div>
      </div>
      {/* </div> */}
    </>
  );
};

export default About;
