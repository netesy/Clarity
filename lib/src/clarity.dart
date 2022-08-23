library clarity;

import 'dart:io';

import '../src/odoo_client.dart';
import '../src/odoo_exceptions.dart';

 class Clarity {
  var serverUrl;
  var databaseName;
  var login;
  var password;
  var model;
  var path;
  var fields = [];
  List args = [];
  String table = '';
  String method = '';
  var id =  [];
  var domain = [];
  int offsetNum = 0;
  int limitNum = 0;

  Clarity(this.serverUrl, this.databaseName, this.login, this.password);

  listDatabases(){
    this.path =  '/web/database/list';
    return this;
  }

  listModules(){
    this.path =  '/web/session/modules';
    return this;
  }

  select(List fields){
    this.method = 'search_read';
    this.path =  '/web/dataset/call_kw/" + this.model + "/" + "write';
    this.fields.addAll(fields);
    return this;
  }

  create(List data){
    this.args.addAll(data);
    this.method = 'create';
    this.path =  '/web/dataset/call_kw/" + this.model + "/" + "create';
    return this;
  }

  insert(List data){
    this.args.addAll(data);
    this.method = 'create';
    this.path =  '/web/dataset/call_kw/" + this.model + "/" + "write';
    return this;
  }

  delete(id){
    this.method = "unlink";
    this.id = id;
  }

  read(id){
    this.method = "read";
    this.id = id;
  }

  from(String table){
    this.table = table;
    return this;
  }

  count(List domain){
    this.method = "search_count";
    this.domain = domain;
    return this;
  }

  search(List domain){
    this.method = "delete";
    this.domain.addAll(domain);
    return this;
  }

  offset(int offsets){
    this.offsetNum = offsets;
  }

  limit(int limits){
    this.limitNum = limits;
  }

 list() async {
    final instance = OdooClient(serverUrl);
  try {
    await instance.authenticate(this.databaseName, this.login, this.password);
    final res = await instance.callRPC(this.path, 'call', {});
    return res.toString();
  } on OdooException catch (e) {
    print(e);
    instance.close();
    exit(-1);
  }
 }

get()
 {
  try{
  final instance = OdooClient(serverUrl);
  instance.callKw({
      'model': this.model,
      'method': this.method,
      'args': this.args,
      'kwargs': {
        'context': {'bin_size': true},
        'domain': this.domain,
        'fields': this.fields,
        'offset': this.offsetNum,
        'limit': this.limitNum,
      },
    });
    return instance;
  }on OdooException catch(e){
    print(e);
  }
 }



  }
}
