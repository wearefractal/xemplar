module.exports =
  xss: 
    simple: /((\%3C)|<)((\%2F)|\/)*[a-z0-9\%]+((\%3E)|>)/i
    img: /((\%3C)|<)((\%69)|i|(\%49))((\%6D)|m|(\%4D))((\%67)|g|(\%47))[^\n]+((\%3E)|>)/i
    paranoid: /((\%3C)|<)[^\n]+((\%3E)|>)/i
  
  lfi: /\.\.\//i
  
  sql: 
    meta: /((\%3D)|(=))[^\n]*((\%27)|(\')|(\-\-)|(\%3B)|(;))/i
    simple: /\w*((\%27)|(\'))((\%6F)|o|(\%4F))((\%72)|r|(\%52))/i
    union: /((\%27)|(\'))union/i
    mssql: /exec(\s|\+)+(s|x)p\w+/i
    unionselect: /UNION(?:\s+ALL)?\s+SELECT/i
