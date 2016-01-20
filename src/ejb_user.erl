-module(ejb_user).

-export([register/5,
         change_password/5,
         delete/3]).


register(UserName, Host, Password, Password2, #{url := Url}) ->
    ReqBody = <<"username=", UserName/binary ,
                "&host=", Host/binary ,
                "&password=", Password/binary,
                "&password2=", Password2/binary,
                "&register=Register">>,

    {ok, Status, Body} = send_request(post, <<Url/binary, "/register/new">>,
                                      ReqBody),
    response(Status, Body).


change_password(UserName, PasswordOld, NewPassword, NewPassword2, #{url := Url}) ->
    ReqBody = <<"username=", UserName/binary,
                "&passwordold=", PasswordOld/binary,
                "&password=", NewPassword/binary,
                "&password2=", NewPassword2/binary,
                "&changepass=Change Password">>,

    {ok, Status, Body} = send_request(post, <<Url/binary, "/register/change_password">>,
                                      ReqBody),
    response(Status, Body).


delete(UserName, Password, #{url := Url}) ->
    ReqBody = <<"username=", UserName/binary,
                "&password=", Password/binary,
                "&unregister=Unregister">>,
    {ok, Status, Body} = send_request(post, <<Url/binary, "/register/delete">>,
                                      ReqBody),
    response(Status, Body).


send_request(Method, Url, ReqBody) ->
    ReqHeaders = [{<<"Content-Type">>, <<"application/x-www-form-urlencoded">>}],
    {ok, Status, _Headers, Ref} = hackney:request(Method, Url, ReqHeaders, ReqBody),
    {ok, Body} = hackney:body(Ref),
    io:format("Resp: ~p~n~p~n", [Status, Body]),
    {ok, Status, Body}.


response(200, Resp) ->
    {ok, Resp};
response(404, Resp) ->
    {error, Resp}.


%% sample usage
%% register(<<"user3">>, <<"localhost">>, <<"kansi">>, <<"kansi">>, #{url => <<"http://localhost:5281">>})
%% change_password(<<"user3">>, <<"kansi">>, <<"kansi">>, <<"kansi">>, #{url => <<"http://localhost:5281">>})
%% delete(<<"user3">>, <<"kansi">>, #{url => <<"http://localhost:5281">>})
