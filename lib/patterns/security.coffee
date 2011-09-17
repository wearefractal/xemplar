module.exports =
  xss: [/((\%3C)|<)((\%2F)|\/)*[a-z0-9\%]+((\%3E)|>)/i, # Simple XSS
        /((\%3C)|<)((\%69)|i|(\%49))((\%6D)|m|(\%4D))((\%67)|g|(\%47))[^\n]+((\%3E)|>)/i, # IMG SRC XSS
        /((\%3C)|<)[^\n]+((\%3E)|>)/i] # Super paranoid XSS (this will flag a lot)
  
  lfi: [/\.\.\//i] # Basic LFI match
  
  sql: [/((\%3D)|(=))[^\n]*((\%27)|(\')|(\-\-)|(\%3B)|(;))/i, # SQL meta-characters
        /\w*((\%27)|(\'))((\%6F)|o|(\%4F))((\%72)|r|(\%52))/i, # Simple SQLi
        /((\%27)|(\'))union/i, # SQLi with UNION
        /exec(\s|\+)+(s|x)p\w+/i, # SQLi for MSSQL
        /UNION(?:\s+ALL)?\s+SELECT/i] # SQLi UNION SELECT
  
