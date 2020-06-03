local jwt = require "resty.jwt" 
local _M = {}

function ERR(self, code, message)
    ngx.status = code
    ngx.header.content_type = "application/json; charset=utf-8"
    ngx.say("{\"Error\": \""..message.."\"}")
    ngx.exit(code)
end

function OK(self)
    ngx.status = 200
    ngx.exit(ngx.HTTP_OK)
end

-- local tOKen = ngx.req.get_headers()["Jwt"]
-- local jwtObj = jwt:verify(ngx.var.jwtkey, tOKen)


-- if jwtObj["verified"] then
--    local userId = jwtObj["payload"]["userId"] 
--    if not userId then 
--        ERROR(ngx.HTTP_BAD_REQUEST, "User ID not found")
--    end

--   ngx.var.jwt_user_id = jwtObj["payload"]["userId"]
-- end

return {
    OK = OK, ERR = ERR
}


