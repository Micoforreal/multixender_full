"use client";

import { Card } from "@/components/ui/card";
import Header from "./header";
import { zodResolver } from "@hookform/resolvers/zod";
import { Controller, useFieldArray, useForm } from "react-hook-form";
import { z } from "zod";
import { Button } from "@/components/ui/button";
import {
  Form,
  FormControl,
  FormField,
  FormItem,
  FormLabel,
  FormMessage,
} from "@/components/ui/form";
import { Input } from "@/components/ui/input";
import {
  Select,
  SelectContent,
  SelectItem,
  SelectTrigger,
  SelectValue,
} from "@/components/ui/select";
import { Plus, RefreshCcw, X } from "lucide-react";
import { useContext, useState } from "react";
import Loading from "@/components/ui/loadingIcon";
import { NearContext } from "@/context/walletContext";
import useSignedAccount from "@/hooks/useSignedAccount";
import { errorToast, successToast } from "@/helpers/toast";
import useConverter from "@/hooks/useConverter";
import { handleKeyPress } from "@/helpers/handlers";

const formSchema = z.object({
  selectedToken: z.string().nonempty({
    message: "Select a Token",
  }),

  recipient: z.array(
    z.object({
      amount: z.string().nonempty({
        message: "Required",
      }),
      usd: z.string().nonempty({
        message: "Required",
      }),
      account_id: z
        .string()
        .nonempty({
          message: "Enter an Account ID",
        })
        .regex(
          /^[a-zA-Z0-9]+(?:\.testnet|\.near)$/,
          "Enter a Valid Account ID"
        ),
    })
  ),
});

const SendToken = () => {
  const { signedAccountId, wallet } = useContext(NearContext);
  const { action, label } = useSignedAccount();
  const [fees, setFees] = useState({ gasFee: "0.00", total: "0.00" });
  const { convertToUsd, convertToToken } = useConverter();

  const form = useForm({
    resolver: zodResolver(formSchema),
    defaultValues: {
      selectedToken: "",
      recipient: [{ usd: "", account_id: "", amount: "" }],
    },
    shouldUnregister: false,
  });

  const control = form.control;
  const {
    register,
    setValue,
    watch,
    setError,
    reset,
    formState,
    formState: { isSubmitting },
  } = form;
  const { fields, append, remove } = useFieldArray({
    control,
    name: "recipient",
  });

  const selectedToken = watch("selectedToken");

  const addRecipient = () => {
    append({ usd: "", amount: "", account_id: "" });
  };

  async function onSubmit(data) {
    const filteredData = data.recipient.map(({ usd, ...rest }) => {
      rest.amount = wallet.nearToYoctoNear(rest.amount);

      return rest;
    }); // Exclude email from submission data
    const totalAmount = filteredData
      .reduce((acc, { amount }) => acc + parseFloat(amount), 0)
      .toLocaleString("fullwide", { useGrouping: false });
    const Data = { recipients: filteredData };

    try {
      const res = await wallet.executeTransfer({
        recipient: Data,
        deposit: totalAmount,
      });

      if (res === "success") {
        successToast();
        reset();
      } else {
        errorToast();
      }
    } catch (error) {
      errorToast();
      console.log(error);
    }
  }


  const getTotal = async () => {
    const value = watch("recipient");
    const Data = value
      .reduce((total, { usd }) => total + parseFloat(usd), 0)
      .toFixed(3);
    if (Data && !isNaN(Data)) {
      setFees({ ...fees, gasFee: "0.02", total: Data });
    }
  };
 
  
  return (
    <>
      <Header />

      <div className="container mx-auto  w-full px-5 py-10   items-center">
        <div className="pb-10 ">
          <div className="pb-1  flex ">
            <h2 className="mx-auto text-lg font-semibold">
              Send token to Multiple addresses
            </h2>
          </div>

          <div className=" flex justify-center ">
            <p className="mx-auto  text-center">
              Empowered by NEAR Protocol's cutting-edge technology
            </p>
           </div>
        </div>

        <Card className=" lg:px-40  mx-auto xl:mx-36 justify-center py-5  bg-gray-50">
          {signedAccountId ? (
            isSubmitting ? (
              <div className="flex justify-center tems-center py-40">
                <Loading />
              </div>
            ) : (
              <>
              <div className="">

              {/* <p className="text-center">Wallet Balance</p>
              <h1 className="text-center font-semibold"></h1> */}
              </div>
              <Form {...form} className="">
                <form
                  onSubmit={form.handleSubmit(onSubmit)}
                  className="space-y-8 px-4"
                  onKeyPress={handleKeyPress}
                  >
                  <FormItem className="w-full">
                    <FormLabel>Token</FormLabel>
                    <Controller
                      control={control}
                      name={"selectedToken"}
                      render={({ field }) => (
                        <Select
                          onValueChange={(val) => {
                            form.setValue("selectedToken", val);
                          }}
                          defaultValue={field.value}
                        >
                          <FormControl>
                            <SelectTrigger>
                              <SelectValue
                                className=""
                                placeholder="Select a token"
                                />
                            </SelectTrigger>
                          </FormControl>
                          <SelectContent className="bg-white">
                            <SelectItem value="near">NEAR</SelectItem>
                          </SelectContent>
                        </Select>
                      )}
                      />

                    <FormMessage />
                  </FormItem>

                  {selectedToken ? (
                    <>
                      {fields.map((field, index) => (
                        <Card key={field.id} className=" bg-white  flex ">
                          <div className="md:flex md:ps-0 md:px-0 ps-10 px-3 py-4 mb-2 mt-3 ">
                            <FormField
                              className="inline"
                              // control={form.control}
                              name={`recipient[${index}].account_id`}
                              render={({ field }) => (
                                <FormItem className=" ms-auto ">
                                  <div className=" flex">
                                    <FormLabel className="">
                                      Account ID
                                    </FormLabel>
                                  </div>
                                  <div className="flex">
                                    <Input
                                      className="text-sm px-5"
                                      placeholder="Enter recipient account id"
                                      {...field}
                                      />
                                  </div>

                                  <FormMessage className="text-xm font-normal text-red-600" />
                                </FormItem>
                              )}
                            />

                            <FormItem className="my-5  md:my-0 md:w-1/2 mx-auto md:ms-auto ">
                              <div className=" flex">
                                <FormLabel className=" mx-auto  ">
                                  Amount
                                </FormLabel>
                              </div>

                              <div className="flex  ">
                                <FormField
                                  name={`recipient[${index}].amountfield`}
                                  render={() => (
                                    <FormItem>
                                      <Input
                                        id={`recipient[${index}].amount`}
                                        {...register(
                                          `recipient[${index}].amount`,
                                          {
                                            onChange: async (e) => {
                                              const usd = await convertToUsd(
                                                selectedToken,
                                                e.target.value
                                              );
                                              if (usd === null) {
                                                setError(
                                                  `recipient[${index}].error`,
                                                  {
                                                    type: "custom",
                                                    message:
                                                      "couldn't convert token",
                                                  }
                                                );
                                              }
                                              setValue(
                                                `recipient[${index}].usd`,
                                                usd,
                                                {
                                                  shouldTouch: true,
                                                  shouldDirty: true,
                                                }
                                              );
                                            },
                                          }
                                        )}
                                        placeholder={selectedToken.toUpperCase()}
                                      />
                                      <FormMessage className="text-xm font-normal text-red-600" />
                                    </FormItem>
                                  )}
                                />

                                <span className="px-4 my-auto ">
                                  <RefreshCcw size={18} />
                                </span>

                                <FormField
                                  name={`recipient[${index}].usdfeild`}
                                  render={() => (
                                    <FormItem>
                                      <Input
                                        id={`recipient[${index}].usd`}
                                        {...register(
                                          `recipient[${index}].usd`,
                                          {
                                            onChange: async (e) => {
                                              const token =
                                                await convertToToken(
                                                  selectedToken,
                                                  e.target.value
                                                );
                                              setValue(
                                                `recipient[${index}].amount`,
                                                token,
                                                {
                                                  shouldTouch: true,
                                                  shouldDirty: true,
                                                }
                                              );
                                            },
                                          }
                                        )}
                                        placeholder="USD"
                                      />

                                      <FormMessage className="text-xm font-normal text-red-600" />
                                    </FormItem>
                                  )}
                                  />
                              </div>
                            </FormItem>
                          </div>

                          <button
                            onClick={() => {
                              remove(index);
                            }}
                            className="flex  ml-auto items-start justify-center pe-2 mt-1.5 h-4  "
                            >
                            <X className=""></X>
                          </button>
                        </Card>
                      ))}
                    </>
                  ) : null}

                  <div className="flex  md:ps-0 ps-5 ">
                    <div className="font-semibold  md:text-base text-sm">
                      <p className="flex py-1">
                        Gas Fee{" "}
                        <span className="float-end px-5">${fees.gasFee}</span>
                      </p>

                      <p className=" flex py-1">
                        Total{" "}
                        <span className="float-end px-10">${fees.total}</span>
                      </p>
                    </div>

                    <Button
                      type="button"
                      onClick={addRecipient}
                      className="border rounded-md 
                      flex justify-center 
                      items-center ml-auto py-5 px-7"
                      >
                      <Plus className="" />
                    </Button>
                  </div>
                  <div className="mx-auto flex justify-center  ">
                    <div className="px-2  ">
                      <Button
                        className="bg-red-600    rounded-lg text-white px-12 "
                        type="button"
                        onClick={getTotal}
                        >
                        Show fees
                      </Button>
                    </div>

                    <div className="px-2 ">
                      <Button
                        type="submit"
                        className="bg-black  rounded-lg text-orange-600 px-12 py-2"
                      >
                        Multisend
                      </Button>
                    </div>
                  </div>
                </form>
              </Form>
                        </>
            )
          ) : (
            <div className="flex justify-center items-center  my-28">
              <button
                className="bg-black  my-auto rounded-3xl w-10/12 text-orange-600 px-8 py-1"
                onClick={action}
              >
                {label}
              </button>
            </div>
          )}
        </Card>
      </div>
    </>
  );
};

export default SendToken;
