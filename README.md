# FluentOdoo

A Odoo JSON-RPC Connector library for Flutter In an Eloquent.

This package contains set of method to call Odoo API with JSON-RPC using a Laravel Elequent Fluent Interface. You can call any odoo methods,
controllers some of the information as below.

1. Version Information
2. Session information
3. Authenticate user
4. Database listing
5. Create/Update/Unlink records
6. Read records with fields for given ids of model
7. Search and read based on domain filters.
8. CallKW method for calling any model level methods with arguments.
9. Calling json controller with params.

clarity = Clarity('address', 'username', 'password', 'table_name');
List Modules
clarity.listModules().list();
List Databases:
clarity.listDatabases().list();
Select Table:
clarity.from('model_name').search('id').offset(0).limit(100).get();
Select Fields:
clarity.select(['name', 'country_id', 'comment']).from('res.partner').get();
Read:
clarity.from('model_name').read('id').offset(0).limit(100).get();
Offset:
clarity.from('model_name').search('id').offset(0).limit(100).get();
Limit:
clarity.from('model_name').read('id').offset(0).limit(100).get();
Search:
clarity.from('model_name').search([]).get();
Count:
clarity.from('model_name').count([]).get();
Delete:
clarity.from('model_name').delete('id').get();
Create:
clarity.from('model_name').create([]).get();
Update:
clarity.from('model_name').insert([]).get();
<!-- clarity.where('conditions').get()
clarity.save('')
clarity.update() -->


Documentation:
Please write me your feedback/issue on netesy@takadah.com
