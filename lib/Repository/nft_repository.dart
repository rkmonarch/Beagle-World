import 'dart:convert';

import 'package:Beagle_Community/models/claim_model.dart';
import 'package:Beagle_Community/models/nft.dart';
import 'package:Beagle_Community/resources/logger.dart';
import 'package:http/http.dart' as http;

Future<claim_model> claimNFT({required String walletAddress}) async {
  final response = await http.get(
    Uri.parse("http://192.168.0.102:5000/claim?address=${walletAddress}"),
  );
  logger.wtf(response.body);
  if (response.statusCode == 200) {
    return claim_model.fromJson(json.decode(response.body));
  }
  throw UnimplementedError();
}

Future<NFT_response> getNFT({required String contractAddress}) async {
  final response = await http.get(
      Uri.parse("http://192.168.0.102:5000/nft?address=${contractAddress}"));
  logger.wtf(response.body);

  if (response.statusCode == 200) {
    return NFT_response.fromJson(json.decode(response.body));
  }
  throw UnimplementedError();
}
