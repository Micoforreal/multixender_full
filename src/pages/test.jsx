// const nearAPI = require("near-api-js");

// const { connect, keyStores } = nearAPI;

// async function getGasPriceAndCalculateFee() {
//     // Set up connection to NEAR (testnet configuration)
//     const config = {
//         networkId: "testnet", // Use "mainnet" for mainnet
//         keyStore: new keyStores.InMemoryKeyStore(),
//         nodeUrl: "https://rpc.testnet.near.org", // Mainnet: https://rpc.mainnet.near.org
//     };

//     const near = await connect(config);

//     // Fetch the latest block
//     const latestBlock = await near.connection.provider.block({ finality: "final" });

//     // Get the gas price for the block
//     const gasPriceResponse = await near.connection.provider.gasPrice(latestBlock.header.hash);
//     const gasPrice = gasPriceResponse.gas_price; // Gas price in yoctoNEAR (10^-24 NEAR)

//     console.log(`Gas Price (yoctoNEAR): ${gasPrice}`);

//     // Assume estimated gas usage (e.g., from a prior transaction or benchmark)
//     const estimatedGasUnits = 300_000_000_000; // Example gas units

//     // Calculate total fee
//     const feeYoctoNEAR = BigInt(gasPrice) * BigInt(estimatedGasUnits); // Gas price × gas units
//     const feeNEAR = nearAPI.utils.format.formatNearAmount(feeYoctoNEAR.toString());

//     console.log(`Estimated Gas Fee: ${feeNEAR} NEAR`);
// }

// getGasPriceAndCalculateFee().catch(console.error);
