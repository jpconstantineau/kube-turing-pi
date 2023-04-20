# kube-turing-pi
Kubernetes setup on Turing Pi 2


## Storage 

Keep it simple...

- Connect 1 TB SSD to SATA connector.
- format SSD as EXT4
- Share with NFS

Follow instructions provided by the Kubernetes example from [Turing PI](https://help.turingpi.com/hc/en-us/articles/8942972332061-Storage)

## Coral on Rasperry PI - Mini PCIe Accelerators

TLDR: doesnt work...

Since the Turing PI 2 has 2 PCIE connectors, each connected to node 1 and node 2, I had ordered 2 [Mini PCIe Accelerators](https://coral.ai/products/pcie-accelerator/) as soon as the Turing PI 2 kickstarter launched and my order was in.  They were backordered until about a month ago.  I installed them into the Turing PI and installed the drivers as per the docs [here](https://coral.ai/docs/m2/get-started/) and the modules still weren't detected using lspci.  This isn't much of a surprise as there were comments somewhere that the Raspberry PI CM4 weren't compatible/supported with the TPUs.  This is unfortunate as this would have been a great platform to use them. 