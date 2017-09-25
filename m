Return-Path: <digetx@gmail.com>
Return-Path: <digetx@gmail.com>
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Laxman Dewangan <ldewangan@nvidia.com>,
	Peter De Schrijver <pdeschrijver@nvidia.com>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Rob Herring <robh+dt@kernel.org>,
	Vinod Koul <vinod.koul@intel.com>
Cc: linux-tegra@vger.kernel.org,
	devicetree@vger.kernel.org,
	dmaengine@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/5] NVIDIA Tegra AHB DMA controller driver
Date: Tue, 26 Sep 2017 02:22:01 +0300
Message-Id: <cover.1506380746.git.digetx@gmail.com>
List-ID: <linux-clk.vger.kernel.org>

NVIDIA Tegra20/30 SoC's have AHB DMA controller. It has 4 DMA channels,
supports AHB <-> Memory and Memory <-> Memory transfers, slave / master
modes. This driver is primarily supposed to be used by gpu/host1x in a
master mode, performing 3D HW context stores.

Dmitry Osipenko (5):
  clk: tegra: Add AHB DMA clock entry
  clk: tegra: Bump SCLK clock rate to 216MHz on Tegra20
  dt-bindings: Add DT bindings for NVIDIA Tegra AHB DMA controller
  dmaengine: Add driver for NVIDIA Tegra AHB DMA controller
  ARM: dts: tegra: Add AHB DMA controller nodes

 .../bindings/dma/nvidia,tegra20-ahbdma.txt         |  23 +
 arch/arm/boot/dts/tegra20.dtsi                     |   9 +
 arch/arm/boot/dts/tegra30.dtsi                     |   9 +
 drivers/clk/tegra/clk-id.h                         |   1 +
 drivers/clk/tegra/clk-tegra-periph.c               |   1 +
 drivers/clk/tegra/clk-tegra20.c                    |   8 +-
 drivers/clk/tegra/clk-tegra30.c                    |   2 +
 drivers/dma/Kconfig                                |   9 +
 drivers/dma/Makefile                               |   1 +
 drivers/dma/tegra20-ahb-dma.c                      | 679 +++++++++++++++++++++
 10 files changed, 741 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/dma/nvidia,tegra20-ahbdma.txt
 create mode 100644 drivers/dma/tegra20-ahb-dma.c

-- 
2.14.1
