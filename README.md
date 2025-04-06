
# Unit Testing:

### Install `luarocks` and `busted`: 
```
brew install luarocks
luarocks install busted
```
--- 

### Running Tests: 
```
busted 
```
- this will run all tests in the `spec/` directory with the suffix `..._spec.lua`

--- 
## Logging:
```
log:error("")
log:warn("")
log:info("")
log:debug("")
```
- Will log at-and-above the level set
