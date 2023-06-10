```python
import addressbook_pb2
address_book = addressbook_pb2.AddressBook()
f = open("addressbook.data", "rb")
address_book.ParseFromString(f.read())
pprint(address_book)
```

---

```shell
xxd addressbook.data

cat addressbook.data | protoc --decode=tutorial.AddressBook addressbook.proto
```
