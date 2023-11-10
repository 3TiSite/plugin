-- 拆分邮件地址
local function split_mail(email)
  local at_pos = string.find(email, "@")
  if at_pos then
    local prefix = string.sub(email, 1, at_pos - 1)
    local domain = string.sub(email, at_pos + 1)
    return { prefix, domain }
  else
    return { email, "" }
  end
end

-- 用于存储或获取邮件地址组件的ID
local function store_or_retrieve_ids(prefix_key, domain_key, email)
  local prefix, domain = unpack(split_mail(email))

  -- 尝试获取前缀和域名在zset中的分数作为ID
  local prefix_id = redis.call("ZSCORE", prefix_key, prefix)
  local domain_id = redis.call("ZSCORE", domain_key, domain)

  -- 如果前缀不存在，添加它并获取新ID
  if not prefix_id then
    prefix_id = redis.call("ZCARD", prefix_key) + 1
    redis.call("ZADD", prefix_key, prefix_id, prefix)
  end

  -- 如果域名不存在，添加它并获取新ID
  if not domain_id then
    domain_id = redis.call("ZCARD", domain_key) + 1
    redis.call("ZADD", domain_key, domain_id, domain)
  end

  -- 返回前缀和域名的ID
  return { prefix_id, domain_id }
end
