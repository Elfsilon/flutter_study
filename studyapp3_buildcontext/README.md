# Summing up the results

## Common

- Try flutter create with --platforms flag

## StreamBuilder

1. Stream is an async generator
2. StreamBuilder connects to the stream and listens it data
3. builder method of the StreamBuilder provide place where logic may be implemented. Main goal of it is to return a Widget based on current snapshot.

StreamBuilder is a cool instrument to handle the async data flow. It can be useful when some widgets must be rerendered or turned off in depend of stream state (for example when user log in, state changes and current screen must be automatically changed by this event) 
