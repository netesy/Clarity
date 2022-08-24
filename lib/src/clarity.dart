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
  var id = [];
  var domain = [];
  int offsetNum = 0;
  int limitNum = 0;

  Clarity(this.serverUrl, this.databaseName, this.login, this.password);

  /// List the databases installed on this Server
  listDatabases() {
    this.path = '/web/database/list';
    return this;
  }

  /// List all modules installed on this Server
  listModules() {
    this.path = '/web/session/modules';
    return this;
  }

  /// Select this [fields] from the Database Table
  select(List fields) {
    this.method = 'search_read';
    this.path = '/web/dataset/call_kw/" + this.model + "/" + "search_read';
    this.fields.addAll(fields);
    return this;
  }

  /// Create a new record in the Table using this [data]
  create(List data) {
    this.args.addAll(data);
    this.method = 'create';
    this.path = '/web/dataset/call_kw/" + this.model + "/" + "create';
    return this;
  }

  /// Update the record in the table based on this [data]
  insert(List data) {
    this.args.addAll(data);
    this.method = 'create';
    this.path = '/web/dataset/call_kw/" + this.model + "/" + "write';
    return this;
  }

  /// Delete this [id] record  from the table
  delete(id) {
    this.method = "unlink";
    this.id = id;
  }

  /// Read this [id] record  from the table
  read(id) {
    this.method = "read";
    this.id = id;
  }

  /// Select the table [table] that will be used in this instance
  from(String table) {
    this.table = table;
    return this;
  }

  /// Count this [domain] record  from the table
  count(List domain) {
    this.method = "search_count";
    this.domain = domain;
    return this;
  }

  /// Search this [domain] record  from the table
  search(List domain) {
    this.method = "delete";
    this.domain.addAll(domain);
    return this;
  }

  /// Starts the database records results from this [id] for this table
  offset(int offsets) {
    this.offsetNum = offsets;
  }

  /// Limits the databse record to this [id]  from this table
  limit(int limits) {
    this.limitNum = limits;
  }

  /// Gets The list from the Database
  ///
  /// Actually used for low level calls
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

  /// Performs the call to the database instance
  get() {
    try {
      final instance = OdooClient(serverUrl);
      instance.authenticate(this.databaseName, this.login, this.password);
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
    } on OdooException catch (e) {
      print(e);
    }
  }
}
