function cstat --wraps='config status' --description 'alias cstat=config status'
  config status $argv; 
end
