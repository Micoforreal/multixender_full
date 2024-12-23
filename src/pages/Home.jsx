import heroImage from "@/assets/images/3053994-removebg-preview.png";
import { Button } from "@/components/ui/button";
import Header from "./header";
import { Card } from "@/components/ui/card";
import reliableImage from "@/assets/images/5995357-removebg-preview.png";
import timeImage from "@/assets/images/2539-removebg-preview.png";
import speedImage from "@/assets/images/3071353-removebg-preview.png";
import { Link } from "react-router-dom";

const Home = () => {
  const banners = [
    {
      img: reliableImage,
      heading: "Reliable",
      text: "we have devoted our time to giving you the best experience possible",
    },
    {
      img: timeImage,
      heading: "Save Time",
      text: "Don’t waste time sending tokens one at a time let us handle it",
    },
    {
      img: speedImage,
      heading: "Speed",
      text: "we have devoted our time to giving you the best experience possible",
    },
  ];

  return (
    <>
      <Header />

      <div className="container animate__animated animate__fadeIn mx-auto flex px-5 md:py-10 py-20 md:flex-row flex-col items-center">
        <div
          className="
    lg:flex-grow 
    md:w-1/2
     lg:pr-24
      md:pr-16
     flex 
     flex-col
      md:items-start
     md:text-left mb-9 
     md:mb-0 
     md:ms-10
     items-center 
     text-center"
        >
          <h1 className="title-font animate__animated animate__slideInUp sm:text-4xl text-3xl mb-4 font-medium text-red-600">
            Welcome
          </h1>
          <p className="mb-8 leading-relaxed">
            We are here to make crypto transactions easier
          </p>

          <p className="text-2xl w-10/12">
            Send crypto to multiple addresses with{" "}
            <span className="text-orange-600">one click</span>
          </p>

          <div className="flex justify-center my-8">
            <Link to={"/send-token"}>
              <button
                className=" animate__animated animate__zoomIn animate__delay-1s bg-orange-600 border-0 
        py-3 px-10 rounded-3xl text-lg font-medium"
              >
                Send Tokens
              </button>
            </Link>
          </div>
        </div>
        <div
          className="
    lg:max-w-lg 
    lg:w-full 
    md:w-1/2 
    md:me-10
    w-5/6
    
     animate-pulse"
    
        >
          <img
            className="object-cover object-center rounded"
            alt="hero"
            src={heroImage}
          />
        </div>
      </div>

      <div className="container mx-auto flex justify-center px-5 md:py-10 py-20 sm:flex-row flex-col items-center">
        {banners.map((item) => (
          <div
            className="
    sm:my-0
     my-7
     mx-1
      animate__animated
     
     w-full
     sm:flex
     justify-center
     items-center 
     text-center"
          >
            <Card className="sm:w-72  sm:h-80 px-4 animate__animated animate__fadeIn bg-gray-50  h-auto pb-14 pt-5 rounded-3xl">
              <div className="flex justify-center mx-auto w-32 h-32">
                <img src={item.img} className=" object-contain" />
              </div>

              <div>
                <h3 className="text-center font-medium pb-4 pt-2">
                  {item.heading}
                </h3>
              </div>
              <div className="flex justify-center mb-auto">
                <p className="text-sm text-center break-words">{item.text}</p>
              </div>
            </Card>
          </div>
        ))}
      </div>

      <div className="mx-10 md:mx-20">
        <Card className="px-8 flex items-center py-5">
          <p className="text-sm md:text-xl">
            <span className="text-orange-600">Save</span> more time With Multi
            <span className="text-red-600">X</span>ender
          </p>
          <div className="ml-auto">
            <Link to={'/send-token'}>
            <Button className="bg-orange-600 md:text-base text-sm my-auto rounded-3xl md:px-16  py-1 md:py-2">
              Send Your Token Now
            </Button>
            </Link>
          </div>
        </Card>
      </div>
    </>
  );
};

export default Home;
