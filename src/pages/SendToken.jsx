"use client"

import { Card } from "@/components/ui/card";
import Header from "./header";
 
import { zodResolver } from "@hookform/resolvers/zod"
import { Controller, useFieldArray, useForm } from "react-hook-form"
import { z } from "zod"
import { Button } from "@/components/ui/button"
import {
  Form,
  FormControl,
  FormDescription,
  FormField,
  FormItem,
  FormLabel,
  FormMessage,
} from "@/components/ui/form"
import { Input } from "@/components/ui/input"


import {
    Select,
    SelectContent,
    SelectGroup,
    SelectItem,
    SelectLabel,
    SelectTrigger,
    SelectValue,
  } from "@/components/ui/select"
import { DivideCircle, Plus, RefreshCcw,  Watch,  X } from "lucide-react";
import { useContext, useEffect, useState } from "react";
import { data } from "react-router-dom";
import Loading from "@/components/ui/loading";
import { NearContext } from "@/near/wallet/near";

   
  


const formSchema = z.object({
  selectedToken: z.string().nonempty({
    message: "Select a Token"
      }),


      recipient: z.array(z.object({

        token: z.string(),
        usd: z.string(),
        accountId: z.string().nonempty({
          message: "Enter an Account ID"
            })
  })),

  })
   
  

 
 
const SendToken = () => {
     const [selectedToken, setSelectedToken] = useState(null)
       const { signedAccountId, wallet } = useContext(NearContext);

     
      
      const form = useForm({
        resolver: zodResolver(formSchema),
        defaultValues: {
          selectedToken:"",
          recipient: [{ token: "", usd: "", accountId: "",}]
        },
      })
      
      const control = form.control
      const {register} = form
      const {fields, append, remove , } = useFieldArray({
        control,
        name: 'recipient'
      })
      // console.log(form.watch('recipient'))
      const value = form.watch('recipient')
      console.log(value)
      const addRecipient = () => {
        append({ accountId: "", token: "", usd: "" })
      
      }   
        
        
      const convertToUsd = async (token, amount) =>{
       const res = await wallet.convertToUsd(token, amount);
       console.log(res)
       return res
        
      }

      const convertToToken = (value) =>{
        return 1

      }

      const handleTokenChange = (e)=>{
        const value = e.target.value;
        form.setValue('token', value)
        form.setValue('usd', wallet.convertToUsd(selectedToken,value))
      }

      // const tokenValue = form.watch("token"); 
      // const usdValue = form.watch("usd");

      useEffect(()=>{

      })
      
      function onSubmit(data) {
       


        console.log(data)
      }
    


    return ( <>
<Header/>


<div className="container mx-auto  w-full px-5 py-10   items-center">
    <div className="pb-10 flex">

    <h2 className="mx-auto font-semibold">Send token to Multiple addresses</h2>
    </div>



    <Card className=" lg:px-40  mx-auto xl:mx-36 justify-center py-5  bg-gray-50">
    <Form {...form} className="" control={control}>
      <form onSubmit={form.handleSubmit(onSubmit)} className="space-y-8 px-4">
      

      
      
      
      
          <FormField
          control={form.control}
          name="selectedToken"
          render={({ field }) => (
            <FormItem className="w-full" >
              <FormLabel>Token</FormLabel>
              <Controller
              control={form.control}
              name="selectenToken"
              render={({field}) =>(

                <Select 
                onValueChange={(val)=>{
                  field.onChange(val)
                  setSelectedToken(val)
                  form.setValue('selectedToken',val)
              }}
   
              defaultValue={field.value}
                >
                <FormControl>
                  <SelectTrigger>
                    <SelectValue className="" placeholder="Select a token" />
                  </SelectTrigger>
                </FormControl>
                <SelectContent className="bg-white">
                  <SelectItem value="near">NEAR</SelectItem>
                  <SelectItem value="usdt">USDT</SelectItem>
                  <SelectItem value="otto">OTTO</SelectItem>
                </SelectContent>
              </Select>
            )}
              />
             
              <FormMessage />
            </FormItem>
          )}
        />
        
        {selectedToken  ? (<>
        {fields.map((field, index) =>(

          <Card key={field.id} className=' bg-white  flex '>
        
      <div className="md:flex md:ps-0 md:px-0 ps-10 px-3 py-4 mb-2 mt-3 ">


       
      <FormField
        className="inline"
        control={form.control}
        name={`recipient[${index}].accountId`}
        render={({ field }) => (
          <FormItem className=' ms-auto '>
         
         <div className=" flex">

                <FormLabel className=''>Account ID</FormLabel>
         </div>
                  <div className="flex">
                <Input className="text-sm px-5" placeholder="Enter recipient account id" {...field} />       
              </div>
           
              <FormMessage className="text-xm font-normal text-red-600"/>
            </FormItem>
          )}
          />





          
          
        
          
          <FormField
        className="inline"
        // control={form.control}
        
        name={`re`}
        render={({ field }) => (
          <FormItem className='my-5  md:my-0 md:w-1/2 mx-auto md:ms-auto '>
         
         <div className=" flex">

                <FormLabel className=' mx-auto  '>Amount</FormLabel>
         </div>
   
              <div className="flex  ">

               
         
        
        
        <Input 
        control={control}
        name={`recpient[${index}].token`}
        {...register(`recpient.${index}.token`)}
        onChange={
          (e)=>{
            console.log(e.target)

            form.setValue(`recpient[${index}].usd`,'33')
          }
        }
        value={`value[${index}].token`}

      

        
        placeholder={selectedToken.toUpperCase()} 
        // onValueChange={(val)=>{
        //   field.onChange(val)  
        //    }}

      // defaultValue={'field.value'}
        />
       <span className="px-4 my-auto ">

              <RefreshCcw size={18}/>
      </span>
      {/* <Controller
      control={form.control}
      name={`recpient[${index}].usd`}
      render={({ field })=>( */}
      
        <Input 
        
        {...register(`recpient[${index}].usd`) }
        // value={form.watch(`recpient[${index}].usd`)}
        // onChange={
         
        // }
      
        placeholder="USD" 
        // defaultValue={'field.value'}
        //  onChange={}
        />
      {/* )}
      />                 */}
        </div>
          
              <FormMessage />
            </FormItem>
          )}
          />
          
          </div>
      
    <button onClick={()=>{remove(index)}} className="flex  ml-auto items-start justify-center pe-2 mt-1.5 h-4  ">
        <X className=""></X>
    </button>
          </Card>
  ))}
    </>):null}
          
          

          
          

                    <div className="flex  md:ps-0 ps-5">
                      {/* <Loading/> */}
<div className="font-semibold w-32 md:text-base text-sm">
  <p className="flex">Gas Fee <span className="float-end px-5">33.3</span></p>

  <p className=" flex ">Total <span className="float-end px-10">33.0</span></p>


</div>


          <button type="button" 
          onClick={addRecipient}
          className="border rounded-md 
          w-20 flex justify-center 
          items-center ml-auto">
          <Plus className="" />
          </button>





          </div>
          <div className="mx-auto flex justify-center">
          <button type="submit" className="bg-black  rounded-lg text-orange-600 px-14 py-2" >

Multisend
</button>
          </div>
      </form>
    </Form>

    </Card>
    </div>

    
    </> );
}
 
export default SendToken;




















