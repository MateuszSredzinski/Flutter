import 'package:flutter/material.dart';
import 'package:crypto_app_flutter/models/cryptocurrency.dart';

import '../models/category.dart';

import 'package:http/http.dart';

const CRYPTO_CATEGORIES = const [
  Category(
    id: 'c0',
    title: 'Proof of Work',
    color: Color.fromARGB(255, 210, 172, 216),
  ),
  Category(
    id: 'c1',
    title: 'Proof of Stake',
    color: Color.fromARGB(255, 161, 80, 175),
  ),
  Category(
    id: 'c2',
    title: 'Proof Of Authority',
    color: Colors.red,
  ),
  Category(
    id: 'c3',
    title: 'Proof of Space',
    color: Colors.orange,
  ),
  Category(
    id: 'c4',
    title: 'StableCoin',
    color: Color.fromARGB(255, 31, 202, 179),
  ),
  Category(
    id: 'c5',
    title: 'Other',
    color: Color.fromARGB(255, 157, 124, 25),
  ),
];

const CRYPTOCURRENCY_MODELS = const [
  CryptoCurrency(
    id: '1',
    categories: ['c0'],
    title: 'Bitcoin',
    imageUrl:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/4/46/Bitcoin.svg/252px-Bitcoin.svg.png',
    info: ['Bitcoin is the first decentralized digital currency.'],
    steps: [
      'Realese date 2009',
      'Supply limit ₿21,000,000',
      'Website: https://bitcoin.org/en/',
      'Code Repository: https://github.com/bitcoin/bitcoin'
    ],
    duration: 10,
    marketCapPlace: MarketCapPlace.High,
    affordability: Affordability.Low,
    isProofOfWork: true,
    isProofOfStake: false,
    isProofOfauthority: false,
    isStableCoins: false,
    isProofOfSpace: false,
  ),
  CryptoCurrency(
    id: '2',
    categories: ['c1'],
    title: 'Ethereum 2.0',
    imageUrl:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d0/Eth-diamond-rainbow.png/800px-Eth-diamond-rainbow.png',
    info: [
      'Ethereum is a decentralized, open-source blockchain with smart contract functionality. Among cryptocurrencies, ether is second only to bitcoin in market capitalization. Ethereum was conceived in 2013 by programmer Vitalik Buterin.'
    ],
    steps: [
      'Initial release	30 July 2015',
      'Website: https://ethereum.org/en/',
      'Backend API Libraries: https://ethereum.org/en/developers/docs/apis/backend/#available-libraries'
    ],
    duration: 3,
    marketCapPlace: MarketCapPlace.High,
    affordability: Affordability.Medium,
    isProofOfWork: false,
    isProofOfStake: true,
    isProofOfauthority: false,
    isStableCoins: false,
    isProofOfSpace: false,
  ),
  CryptoCurrency(
    id: '3',
    categories: ['c2'],
    title: 'Ripple',
    imageUrl:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/8/88/Ripple_logo.svg/1920px-Ripple_logo.svg.png',
    info: [
      'Ripple is a real-time gross settlement system, currency exchange and remittance network created by Ripple Labs Inc., a US-based technology company. Released in 2012, Ripple is built upon a distributed open source protocol, and supports tokens representing fiat currency, cryptocurrency, commodities, or other units of value such as frequent flier miles or mobile minutes. Ripple purports to enable "secure, instantly and nearly free global financial transactions of any size with no chargebacks". The ledger employs the native cryptocurrency known as XRP.'
    ],
    steps: [
      'Initial release	2012',
      'Code Repository: https://github.com/XRPLF/rippled',
      'Website: https://ripple.com/'
    ],
    duration: 2,
    marketCapPlace: MarketCapPlace.Medium,
    affordability: Affordability.High,
    isProofOfWork: false,
    isProofOfStake: false,
    isProofOfauthority: true,
    isStableCoins: false,
    isProofOfSpace: false,
  ),
  CryptoCurrency(
    id: '4',
    categories: ['c0'],
    title: 'Bitcoin Cash',
    imageUrl:
        'https://upload.wikimedia.org/wikipedia/commons/5/58/Bitcoin_Cash.png',
    info: [
      'Bitcoin Cash is a cryptocurrency that was created as a hard fork of Bitcoin.'
    ],
    steps: [
      'Bitcoin Cash is a spin-off or altcoin that was created in 2017. In November 2018, Bitcoin Cash split further into two cryptocurrencies: Bitcoin Cash and Bitcoin SV.',
      'Supply limit:	21,000,000',
      'Website: https://bitcoincash.org/'
    ],
    duration: 10,
    marketCapPlace: MarketCapPlace.Low,
    affordability: Affordability.Low,
    isProofOfWork: true,
    isProofOfStake: false,
    isProofOfauthority: false,
    isStableCoins: false,
    isProofOfSpace: false,
  ),
  CryptoCurrency(
    id: '5',
    categories: ['c0'],
    title: 'Litecoin',
    imageUrl:
        'https://upload.wikimedia.org/wikipedia/commons/3/32/Official_Litecoin_Logo_With_Text.png',
    info: [
      'Litecoin is a decentralized peer-to-peer cryptocurrency and open-source software project released under the MIT/X11 license. Inspired by Bitcoin, Litecoin was among the earliest altcoins, starting in October 2011. In technical details, the Litecoin main chain shares a slightly modified Bitcoin codebase. Litecoin is a cryptocurrency that enables instant payments.'
    ],
    steps: [
      'Initial release: 7 October 2011',
      'Code repository: https://github.com/litecoin-project/litecoin',
      'Website: https://litecoin.org/'
    ],
    duration: 3,
    marketCapPlace: MarketCapPlace.Low,
    affordability: Affordability.Medium,
    isProofOfWork: true,
    isProofOfStake: false,
    isProofOfauthority: false,
    isStableCoins: false,
    isProofOfSpace: false,
  ),
  CryptoCurrency(
    id: '6',
    categories: ['c4'],
    title: 'Tether',
    imageUrl:
        'https://theanchor.io/wp-content/uploads/2020/01/Tether-logo-1240x698.png',
    info: ['Tether is a stablecoin that is pegged to the US dollar.'],
    steps: [
      ' It was launched by the company Tether Limited Inc. in 2014',
      'Tether tokens have grown in popularity over the past few years, with a market cap of over US\$65 billion (as of September 2022). Tether tokens allow customers the ability to transact across different blockchains, without the inherent volatility and complexity typically associated with digital tokens.',
      'Website: https://tether.to/en/'
    ],
    duration: 0,
    marketCapPlace: MarketCapPlace.High,
    affordability: Affordability.High,
    isProofOfWork: false,
    isProofOfStake: false,
    isProofOfauthority: false,
    isStableCoins: true,
    isProofOfSpace: false,
  ),
  CryptoCurrency(
    id: '7',
    categories: ['c4'],
    title: 'Cardano',
    imageUrl:
        'https://upload.wikimedia.org/wikipedia/commons/c/c0/Cardano_Logo.jpg',
    info: [
      'Cardano is a public blockchain platform. It is open-source and decentralized, with consensus achieved using proof of stake. It can facilitate peer-to-peer transactions with its internal cryptocurrency, ADA. Cardano is a blockchain platform that is built on scientific philosophy.'
    ],
    steps: [
      'It\'s development began in 2015, led by Ethereum co-founder Charles Hoskinson. The project is overseen and supervized by the Cardano Foundation based in Zug, Switzerland. Initial release	27 September 2017',
      'Circulating supply 45 billion',
      'Website: https://cardano.org/'
    ],
    duration: 20,
    marketCapPlace: MarketCapPlace.Medium,
    affordability: Affordability.Medium,
    isProofOfWork: false,
    isProofOfStake: true,
    isProofOfauthority: false,
    isStableCoins: false,
    isProofOfSpace: false,
  ),
  CryptoCurrency(
    id: '8',
    categories: ['c0'],
    title: 'Dogecoin',
    imageUrl:
        'https://upload.wikimedia.org/wikipedia/en/d/d0/Dogecoin_Logo.png?20210427202550',
    info: ['Dogecoin is a cryptocurrency that was created as a joke.'],
    steps: [
      'It was introduced on December 8, 2013.',
      'Like in Bitcoin and Litecoin, in Dogecoin the public key cryptography is used, where a user generates a pair of cryptographic keys: a public one and a closed one. Only a closed key can decode the information encrypted with a public key; this is why the keys’ owner can freely publish the public key without worrying about the encrypted data.',
      'Website: https://dogecoin.com/'
    ],
    duration: 3,
    marketCapPlace: MarketCapPlace.Low,
    affordability: Affordability.High,
    isProofOfWork: true,
    isProofOfStake: false,
    isProofOfauthority: false,
    isStableCoins: false,
    isProofOfSpace: false,
  ),
  CryptoCurrency(
    id: '9',
    categories: ['c1'],
    title: 'Chainlink',
    imageUrl:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/1/15/Chainlink_Logo_Blue.svg/1280px-Chainlink_Logo_Blue.svg.png',
    info: [
      'Chainlink is a decentralized oracle network that connects blockchain-based smart contracts with real-world data.'
    ],
    steps: [
      'Sergey Nazarov is the cofounder of Chainlink. He cofounded SmartContract, which connected smart contracts to external data and widely accepted bank payments. He was also the cofounder and CEO of Secure Asset Exchange. The updated whitepaper, called Chainlink 2.0: Next Steps in the Evolution of Decentralized Oracle Networks, was released on April 15, 2021.',
      'The maximum supply of LINK tokens is 1,000,000,000. ',
      'Website: https://chain.link/'
    ],
    duration: 5,
    marketCapPlace: MarketCapPlace.High,
    affordability: Affordability.Low,
    isProofOfWork: false,
    isProofOfStake: true,
    isProofOfauthority: false,
    isStableCoins: false,
    isProofOfSpace: false,
  ),
  CryptoCurrency(
    id: '10',
    categories: ['c1'],
    title: 'Binance Coin',
    imageUrl:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/1/1c/BNB%2C_native_cryptocurrency_for_the_Binance_Smart_Chain.svg/1024px-BNB%2C_native_cryptocurrency_for_the_Binance_Smart_Chain.svg.png',
    info: [
      'Binance Coin is the native token of the Binance cryptocurrency exchange platform.'
    ],
    steps: [
      'Binance funded its initial operation through an initial coin offering (ICO), a crowdfunding mechanism where financers received BNB tokens. The team conducted the ICO in three phases from July 1 to July 21, 2017. Binance distributed 10% of the total BNB tokens to initial financers, 40% to founders, and the remaining 50% to the various participants through the ICO process.',
      'There were 200 million BNB tokens at genesis. According to the whitepaper, Binance aims to use 20% of profits to repurchase BNB from holders and burn each quarter. This continues until the network repurchases 50% of all BNBs. Eventually, 100 million BNBs would remain in circulation.',
      'Website: https://www.binance.com/en'
    ],
    duration: 2,
    marketCapPlace: MarketCapPlace.High,
    affordability: Affordability.Low,
    isProofOfWork: false,
    isProofOfStake: true,
    isProofOfauthority: false,
    isStableCoins: false,
    isProofOfSpace: false,
  ),
  CryptoCurrency(
    id: '11',
    categories: ['c2'],
    title: 'Polkadot',
    imageUrl:
        'https://upload.wikimedia.org/wikipedia/commons/d/df/Polkadot_Logo.png',
    info: [
      'Polkadot is a next-generation blockchain platform that enables interoperability between different blockchain networks.'
    ],
    steps: [
      'The protocol was created by the Ethereum co-founder Gavin Wood, Robert Havermeier and Peter Czaban, raising over \$144.3 million in its Initial coin offering in October 2017. Another private sale in 2019 raised an additional \$43 million. Gavin Wood is attributed in coining the term "Web3" in 2014. The white paper for Polkadot was published by Wood in 2016. The Web3 foundation was subsequently launched in 2017',
      'Code Repository: https://github.com/paritytech/polkadot',
      'Webiste: https://polkadot.network/'
    ],
    duration: 4,
    marketCapPlace: MarketCapPlace.High,
    affordability: Affordability.Low,
    isProofOfWork: false,
    isProofOfStake: true,
    isProofOfauthority: false,
    isStableCoins: false,
    isProofOfSpace: false,
  ),
  CryptoCurrency(
    id: '12',
    categories: ['c0'],
    title: 'Uniswap',
    imageUrl:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/5/5a/Uniswap_Logo_and_Wordmark.svg/1280px-Uniswap_Logo_and_Wordmark.svg.png',
    info: [
      'Uniswap is an open source protocol and non-custodial crypto exchange that allows you to securely exchange Ethereum (ETH) and ERC-20 tokens without using the traditional order book model..'
    ],
    steps: [
      'On July 6, 2017, Adams resigned from Siemens, where he worked as a mechanical engineer after graduating from college. Adams\’ friend Karl Flersh, who worked at the Ethereum Foundation, advised him to become a smart contract developer.',
      'The platform does not require registration and KYC and AML procedures. All you need is an Ethereum wallet like MetaMask. A hallmark of Uniswap is the use of a mechanism called the Constant Product Market Maker.',
      'Website: https://uniswap.org/'
    ],
    duration: 2,
    marketCapPlace: MarketCapPlace.High,
    affordability: Affordability.Medium,
    isProofOfWork: true,
    isProofOfStake: false,
    isProofOfauthority: false,
    isStableCoins: false,
    isProofOfSpace: false,
  ),
  CryptoCurrency(
    id: '13',
    categories: ['c5'],
    title: 'Aave',
    imageUrl: 'https://cryptologos.cc/logos/aave-aave-logo.png?v=024',
    info: [
      'Aave is a decentralized non-custodial money market protocol that enables users to earn interest on their deposits and borrow assets.'
    ],
    steps: [
      'Aave was launched in January 2017 by developer Stani Kulechov. He is a Finnish programmer and is currently the CEO of Aave. Stani graduated from the University of Helsinki in 2018 and is an entrepreneur with experience in crypto technology, fintech, and blockchain space.',
      'Website: https://aave.com/',
      'What is AAVE: https://crypto-wikipedia.com/what-is-aave/'
    ],
    duration: 5,
    marketCapPlace: MarketCapPlace.Medium,
    affordability: Affordability.Low,
    isProofOfWork: false,
    isProofOfStake: false,
    isProofOfauthority: false,
    isStableCoins: false,
    isProofOfSpace: false,
  ),
  CryptoCurrency(
    id: '14',
    categories: ['c5'],
    title: 'SushiSwap',
    imageUrl: 'https://cryptologos.cc/logos/sushiswap-sushi-logo.png?v=024',
    info: [
      'SushiSwap (SUSHI) is an Ethereum token that powers SushiSwap, a decentralized cryptocurrency exchange and automated market maker built on Ethereum. Holders of SUSHI can participate in community governance and stake their tokens to receive a portion of SushiSwap\’s transaction fees.'
    ],
    steps: [
      'Supply limit	250,000,000',
      'Sushi analytics: https://analytics.sushi.com/analytics',
      'Code repository: https://github.com/sushiswap',
      'Website: https://www.sushi.com/'
    ],
    duration: 4,
    marketCapPlace: MarketCapPlace.High,
    affordability: Affordability.Low,
    isProofOfWork: false,
    isProofOfStake: false,
    isProofOfauthority: false,
    isStableCoins: false,
    isProofOfSpace: false,
  ),
  CryptoCurrency(
    id: '15',
    categories: ['c2'],
    title: 'Crypto.com Coin',
    imageUrl:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Crypto.com_logo.svg/1280px-Crypto.com_logo.svg.png',
    info: [
      'Crypto.com Coin is the native token of the Crypto.com platform that offers a suite of financial services for cryptocurrencies. Crypto.com Chain is an Ethereum token that powers Crypto.com Pay, a service that aims to allow users to pay for goods and services with cryptocurrency while receiving cashback rewards.'
    ],
    steps: [
      'The company was cofounded by Kris Marszalek, Rafael Melo, Gary Or, and Bobby Bao in June 2016. The whitepaper of CRO was published on November 20, 2018.',
      'Website: https://crypto.org/',
      'Code repository: https://github.com/crypto-org-chain/chain-main'
    ],
    duration: 3,
    marketCapPlace: MarketCapPlace.High,
    affordability: Affordability.Medium,
    isProofOfWork: false,
    isProofOfStake: true,
    isProofOfauthority: false,
    isStableCoins: false,
    isProofOfSpace: false,
  ),
  CryptoCurrency(
    id: '16',
    categories: ['c1'],
    title: 'NANO',
    imageUrl: 'https://cryptologos.cc/logos/nano-xno-logo.png?v=024',
    info: [
      'NANO is a low-latency, high-throughput cryptocurrency that uses a unique blockchain architecture based on a block-lattice structure. This allows for near-instant transactions with zero fees.'
    ],
    steps: [
      'Initial release	4 October 2015',
      'Supply limit	133,248,297',
      'Website:	https://nano.org/en',
      'Code repository: https://github.com/nanocurrency'
    ],
    duration: 5,
    marketCapPlace: MarketCapPlace.High,
    affordability: Affordability.Low,
    isProofOfWork: false,
    isProofOfStake: true,
    isProofOfauthority: false,
    isStableCoins: false,
    isProofOfSpace: false,
  ),
  CryptoCurrency(
    id: '17',
    categories: ['c3'],
    title: 'Filecoin',
    imageUrl:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/4/4b/Filecoin.svg/1024px-Filecoin.svg.png',
    info: [
      'Filecoin (⨎) is an open-source, public cryptocurrency and digital payment system intended to be a blockchain-based cooperative digital storage and data retrieval method. It is made by Protocol Labs and shares some ideas from InterPlanetary File System[5] allowing users to rent unused hard drive space. A blockchain mechanism is used to register the deals. Filecoin is an open protocol and backed by a blockchain that records commitments made by the network\’s participants, with transactions made using FIL, the blockchain\'s native currency. The blockchain is based on both proof-of-replication and proof-of-spacetime.'
    ],
    steps: [
      'Initial release: 15 July 2014',
      'The project was launched in August 2017, and raised over \$200 million within 30 minutes.',
      'website: https://filecoin.io/',
      'Code repository: 	https://github.com/filecoin-project'
    ],
    duration: 5,
    marketCapPlace: MarketCapPlace.High,
    affordability: Affordability.Low,
    isProofOfWork: false,
    isProofOfStake: false,
    isProofOfauthority: false,
    isStableCoins: false,
    isProofOfSpace: true,
  ),
];
