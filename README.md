# Clarity

A Odoo JSON_RPC connector with clarity of intentions.

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

## CODE

```dart
clarity = Clarity('address', 'username', 'password', 'table_name');
```

### List Modules

```dart
clarity.listModules().list(); 
```

### List Databases

```dart
clarity.listDatabases().list();
```

### Select Table

```dart
clarity.from('model_name').search('id').offset(0).limit(100).get();
```

### Select Fields

```dart
clarity.select(['name', 'country_id', 'comment']).from('res.partner').get();
```

### Read

```dart
 clarity.from('model_name').read('id').offset(0).limit(100).get();
```

### Offset

```dart
clarity.from('model_name').search('id').offset(0).limit(100).get();
```

### Limit

```dart
clarity.from('model_name').read('id').offset(0).limit(100).get();
```

### Search

```dart
clarity.from('model_name').search([]).get();
```

### Count

```dart
clarity.from('model_name').count([]).get();
```

### Delete

```dart
clarity.from('model_name').delete('id').get();
```

### Create

```dart
clarity.from('model_name').create([]).get();
```

### Update

```dart
clarity.from('model_name').insert([]).get();
```

## Todo

```
clarity.where('conditions').get();
clarity.save('');
clarity.update();
```

Documentation:
Please write me your feedback/issue on netesy@takadah.com
