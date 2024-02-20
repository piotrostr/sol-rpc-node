# Solana RPC Node

## Resources Provisioning

Be sure to generate a service account for terraform with Compute Engine Editor
permissions and download the key

then

```sh
terraform init
```

and

```sh
GOOGLE_APPLICATION_CREDENTIALS=/path/to/cred.json terraform apply
```

Then, the VM could be accessed with ssh

```sh
gcloud compute ssh --zone us-central1-a sol-node-vm
```

or using any ssh client and the public IP, it will be outputted but can be re-grabbed with

```sh
terraform output
```

## Setup instructions

1. mount disk, create swap - `./hack/mount-disk.sh`
2. setup solana linux user - `./hack/setup-solana-linux-user.sh`
3. install solana toolchain - `./hack/install-sol.sh`
4. start tuner, up the default linux limits - `./hack/start-solana-tuner.sh`
5. re-log into the VM, ensure that the user is `solana`
6. setup validator account - `./hack/setup-validator-account.sh`
7. run node `./hack/run-node.sh`
8. check health with `./hack/check-health.sh`

## Production considerations

The security keys should be generated locally and scp'ied to the VM afterwards

Ideally the node would be ran as a system service, there should be two separate
mounts for the accounts and the ledger

In production environment, security should also be vetted; I would recommend
running this on k8s with side-car microservices for health-checks, automatic
restarts and additional authentication for non-peers
