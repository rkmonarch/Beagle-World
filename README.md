# Beagle World

Beagle World is a flutter application that allows multiple users to get the access of an exclusive Beagle community. The user will learn the fun facts about Beagle and prove their interest by giving fun quiz. In reward, a Solana NFT will be dropped to the user address which allows access to the server and private channels. User don't have to pay anything to claim NFT, as NFT is already available in air drop.

## What we built

We have built mobile application using flutter. We have used Phantom Connect SDK to connect **Solana** Wallet (Phantom) with flutter app. To create airdrop on solana, we have used **thirdweb**. We have created a quiz which user has to give to prove their knowledge/interest for Beagle community. We have built our own API to claim NFT using **thirdweb SDK**. We have also used Collab.land which provides discord bot to verify asset from the user wallet.

## Integration resources

You can checkout our integration repos for instant plugin in your project. 
- [API configuration for Beagle World using thirdweb SDK](https://github.com/rkmonarch/Beagle-ThirdWeb)
- [Thirdweb API to claim and fetch Solana NFT](https://github.com/vrajdesai78/Solana-NFT-API)

This [API documentation](https://docs.phantom.app/integrating/deeplinks) contains a demo application written with Flutter that showcases Phantom's deep linking API.

Other resources to get you started with Beagle World.
- [Phantom Wallet](https://phantom.app)
- [thirdweb documentation](https://portal.thirdweb.com/solana)
- [Discord Server](https://support.discord.com/hc/en-us/articles/204849977-How-do-I-create-a-server-)
- [Collab.land bot](https://collabland.freshdesk.com/support/home)

### Required packages

Install the required packages: [solana: ^0.26.0](https://pub.dev/packages/solana), [url_launcher: ^6.1.5](https://pub.dev/packages/url_launcher), [uni_links: ^0.5.1](https://pub.dev/packages/uni_links), [pinenacl: ^0.5.1](https://pub.dev/packages/pinenacl), [bs58: ^1.0.2](https://pub.dev/packages/bs58), [logger: ^1.1.0](https://pub.dev/packages/logger)

```sh
flutter pub add solana url_launcher uni_links pinenacl bs58 logger
```

Here's the small demo of **Beagle World**. [YouTube Link](https://youtu.be/yiYGCQE8CZo)

Copyrights © 2022 Beagle World.