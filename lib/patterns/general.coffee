module.exports =
  non_blank: /\S/
  integer: /^\s*(\+|-)?\d+\s*$/
  whole_number: /^\s*\d+\s*$/
  decimal: /^\s*(\+|-)?((\d+(\.\d+)?)|(\.\d+))\s*$/
  trim: /(^\s*)|(\s*$)/g
  ltrim: /(^\s*)/g
  rtrim: /(\s*$)/g
  
