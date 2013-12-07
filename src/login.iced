
kbpgp = require 'kbpgp'
{Base} = require './base'
{constants} = require './constants'
{bufeq_secure,unix_time} = kbpgp.util

#==========================================================================

exports.Login = class Login extends Base

  constructor : (obj) ->
    @nonce = obj.nonce
    super obj

  _type : () -> constants.sig_types.login

  _json : () -> 
    ret = super { expire_in : 24*60*60 }
    ret.body.nonce = if @nonce then @nonce.toString('hex') else null
    ret

#==========================================================================
