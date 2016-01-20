# Ejabberd user lib

Ejabberd allows user registeration using http i.e.  `mod_register_web.erl`. 
The requests sent for user operation has been abscracted out to this code.


## Usage

```erlang
    1> ejb_user:register(<<"user3">>, <<"localhost">>, <<"kansi">>, <<"kansi">>, #{url => <<"http://localhost:5281">>}).
    2> ejb_user:change_password(<<"user3">>, <<"kansi">>, <<"kansi">>, <<"kansi">>, #{url => <<"http://localhost:5281">>}).
    3> ejb_user:delete(<<"user3">>, <<"kansi">>, #{url => <<"http://localhost:5281">>}).
```
