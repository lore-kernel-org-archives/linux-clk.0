Return-Path: <digetx@gmail.com>
Return-Path: <digetx@gmail.com>
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Peter De Schrijver <pdeschrijver@nvidia.com>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-tegra@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/4] Tegra DMA clocks addition / correction
Date: Wed,  4 Oct 2017 02:02:37 +0300
Message-Id: <cover.1507070638.git.digetx@gmail.com>
List-ID: <linux-clk.vger.kernel.org>

This patchset is factored out from the AHB DMA driver 'introduction' series
as per drivers/dma/ subsystem maintainer request.

Change log:

v2:
	- Added patch that corrects parent of the APB DMA clock gate in the
	  'common' clock gate definition.

	- Added patch that makes Tegra20 to utilize the 'common' APB DMA
	  clock gate definition.

Dmitry Osipenko (4):
  clk: tegra: Add AHB DMA clock entry
  clk: tegra: Correct parent of the APBDMA clock
  clk: tegra20: Use common definition of APBDMA clock gate
  clk: tegra20: Bump SCLK clock rate to 216MHz

 drivers/clk/tegra/clk-id.h           | 1 +
 drivers/clk/tegra/clk-tegra-periph.c | 3 ++-
 drivers/clk/tegra/clk-tegra20.c      | 9 +++------
 drivers/clk/tegra/clk-tegra30.c      | 1 +
 4 files changed, 7 insertions(+), 7 deletions(-)

-- 
2.14.1
