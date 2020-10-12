# ES2CSV


## Usage

### Starting container
```sh
docker run -it -v $PWD/configs:/es2csv/configs -v $PWD/data:/es2csv/data es2csv bash
```

### Running extraction
```sh
es2csv -u 'http://localhost:9200' -i 'index-pattern-*' -r -q @configs/query.json -o data/output.csv -s 10000
```

### Query example
```json
{
  "sort": { "@timestamp": "asc" },
  "query": {
    "bool": {
      "must": [
        {
          "range": {
            "@timestamp": {
              "format": "strict_date_optional_time",
              "gte": "2020-05-29T19:28:26.866Z",
              "lte": "2020-05-29T19:43:26.866Z"
            }
          }
        }
      ],
      "filter": [
        {
          "match_all": {}
        }
      ],
      "should": [],
      "must_not": [
        {
          "match_phrase": {
            "source": {
              "query": "nginx"
            }
          }
        },
      ]
    }
  }
}
```
