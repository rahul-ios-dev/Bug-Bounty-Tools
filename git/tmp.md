```
gh repo list paypal --limit 1000 --json nameWithOwner --jq '.[].nameWithOwner' > repo.txt
cat repo.txt | while read repo; do git clone "https://github.com/$repo.git"; done
scan_repo live.txt
```

| Program                    |      Github      | status |
| :------------------------- | :--------------: | ------ |
| axelspringerse/nmt         | axelspringer | done   |
| axelspringerse/nmt         |   spring-media   | done   |
| wpengine/wpenginebugbounty |     wpengine     | done   |
| datacamp/datacamp          |     datacamp     |        |
|                            |                  |        |
