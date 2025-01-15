For a json :
```json
$ aws kafka list-clusters-v2 | head
{
    "ClusterInfoList": [
        {
            "ClusterType": "PROVISIONED",
            "ClusterArn": "arn:aws:kafka:eu-west-1:905418222542:cluster/demo/7a7cab28-971e-4e80-99ff-8b347b0ff0b7-9",
            "ClusterName": "demo",
            "CreationTime": "2025-01-14T14:05:54.799000+00:00",
            "CurrentVersion": "K1IM4EOPHS76S7",
            "State": "ACTIVE",
            "Tags": {
```

To query this json object by the key `ClusterInfoList`

```
$ aws kafka list-clusters-v2 | jq '.ClusterInfoList'
```

Next, since the ClusterInfoList is an array, the output:
```json
$ aws kafka list-clusters-v2 | jq '.ClusterInfoList'
[
  {
    "ClusterType": "PROVISIONED",
    "ClusterArn": "arn:aws:kafka:eu-west-1:905418222542:cluster/demo/7a7cab28-971e-4e80-99ff-8b347b0ff0b7-9",
    "ClusterName": "demo",
    "CreationTime": "2025-01-14T14:05:54.799000+00:00",
    "CurrentVersion": "K1IM4EOPHS76S7",
    "State": "ACTIVE",
    "Tags": {
      "auto-delete": "no"
```

Lastly, if I want to get the `ClusterArn`:
```json
$ aws kafka list-clusters-v2 | jq '.ClusterInfoList[].ClusterArn'
"arn:aws:kafka:eu-west-1:905418222542:cluster/demo/7a7cab28-971e-4e80-99ff-8b347b0ff0b7-9"
```

## Get the all uniq paths

```
aws kafka list-clusters-v2 | jq 'paths(..) | join(".")' | uniq
```