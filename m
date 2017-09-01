Return-Path: <leo.yan@linaro.org>
Return-Path: <leo.yan@linaro.org>
From: Leo Yan <leo.yan@linaro.org>
To: Wei Xu <xuwei5@hisilicon.com>,
	Rob Herring <robh+dt@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Li Pengcheng <lipengcheng8@huawei.com>,
	Zhangfei Gao <zhangfei.gao@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Cc: Leo Yan <leo.yan@linaro.org>
Subject: [PATCH 0/2] Add support for Hi6220 coresight
Date: Fri,  1 Sep 2017 08:47:13 +0800
Message-Id: <1504226835-2115-1-git-send-email-leo.yan@linaro.org>
List-ID: <linux-clk.vger.kernel.org>

This patch series adds support for coresight on Hi6220; the first patch
is to fix coresight PLL so can avoid system hang after we enable
coresight, the second patch is to add DT binding according to coresight
topology.

The patch has been tested on Hikey; By using OpenCSD snapshot mode, it
can successfully decode ETF and ETB trace data.

Leo Yan (1):
  clk: hi6220: mark clock cs_atb_syspll as critical

Li Pengcheng (1):
  arm64: dts: hi6220: add coresight binding

 .../arm64/boot/dts/hisilicon/hi6220-coresight.dtsi | 379 +++++++++++++++++++++
 arch/arm64/boot/dts/hisilicon/hi6220.dtsi          |   2 +
 drivers/clk/hisilicon/clk-hi6220.c                 |   2 +-
 3 files changed, 382 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/boot/dts/hisilicon/hi6220-coresight.dtsi

-- 
2.7.4
