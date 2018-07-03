Return-Path: <sravanhome@gmail.com>
Return-Path: <sravanhome@gmail.com>
From: Saravanan Sekar <sravanhome@gmail.com>
To: afaerber@suse.de,
	sboyd@kernel.org,
	manivannan.sadhasivam@linaro.org
Cc: linux-arm-kernel@lists.infradead.org,
	mturquette@baylibre.com,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	robh+dt@kernel.org,
	mark.rutland@arm.com,
	catalin.marinas@arm.com,
	will.deacon@arm.com,
	devicetree@vger.kernel.org,
	support@cubietech.com,
	thomas.liau@actions-semi.com,
	jeff.chen@actions-semi.com,
	linux@cubietech.com,
	darren@cubietech.com,
	mp-cs@actions-semi.com,
	pn@denx.de,
	sravanhome@gmail.com
Subject: [PATCH v3 3/5] clk: actions: Add REGMAP as dependency
Date: Tue,  3 Jul 2018 11:25:22 +0200
Message-Id: <20180703092524.1697111-4-sravanhome@gmail.com>
In-Reply-To: <20180703092524.1697111-1-sravanhome@gmail.com>
References: <20180703092524.1697111-1-sravanhome@gmail.com>
List-ID: <linux-clk.vger.kernel.org>

Add REGMAP as dependency to avoid undefined reference to regmap symbol

Signed-off-by: Saravanan Sekar <sravanhome@gmail.com>
---
 drivers/clk/actions/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/actions/Kconfig b/drivers/clk/actions/Kconfig
index 5a2dad33769e..9066eb4709b1 100644
--- a/drivers/clk/actions/Kconfig
+++ b/drivers/clk/actions/Kconfig
@@ -1,6 +1,7 @@
 config CLK_ACTIONS
 	bool "Clock driver for Actions Semi SoCs"
 	depends on ARCH_ACTIONS || COMPILE_TEST
+	select REGMAP_MMIO
 	default ARCH_ACTIONS
 
 if CLK_ACTIONS
-- 
2.14.4
