Return-Path: <valentinrothberg@gmail.com>
Return-Path: <valentinrothberg@gmail.com>
From: Valentin Rothberg <valentinrothberg@gmail.com>
To: krzk@kernel.org,
	s.nawrocki@samsung.com,
	cw00.choi@samsung.com,
	tomasz.figa@gmail.com,
	mturquette@baylibre.com,
	sboyd@codeaurora.org
Cc: linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Valentin Rothberg <valentinrothberg@gmail.com>,
	Valentin Rothberg <valetinrothberg@gmail.com>
Subject: [PATCH] ARM: Exynos4415: remove dead build rule
Date: Thu, 19 Jan 2017 10:11:53 +0100
Message-Id: <20170119091153.8439-1-valentinrothberg@gmail.com>
List-ID: <linux-clk.vger.kernel.org>

Commit 22dfab102cfa ("ARM: EXYNOS: Remove Exynos4415 arch code (SoC not
supported anymore)") removed the Kconfig option SOC_EXYNOS4415.  Thus,
we are safe to remove the last reference in the Makefile.

Signed-off-by: Valentin Rothberg <valetinrothberg@gmail.com>
---
Detected by using ./scripts/checkkconfigsymbols.py

 drivers/clk/samsung/Makefile | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/clk/samsung/Makefile b/drivers/clk/samsung/Makefile
index 57f4dc6dc447..7afc21dc374e 100644
--- a/drivers/clk/samsung/Makefile
+++ b/drivers/clk/samsung/Makefile
@@ -5,7 +5,6 @@
 obj-$(CONFIG_COMMON_CLK)	+= clk.o clk-pll.o clk-cpu.o
 obj-$(CONFIG_SOC_EXYNOS3250)	+= clk-exynos3250.o
 obj-$(CONFIG_ARCH_EXYNOS4)	+= clk-exynos4.o
-obj-$(CONFIG_SOC_EXYNOS4415)	+= clk-exynos4415.o
 obj-$(CONFIG_SOC_EXYNOS5250)	+= clk-exynos5250.o
 obj-$(CONFIG_SOC_EXYNOS5260)	+= clk-exynos5260.o
 obj-$(CONFIG_SOC_EXYNOS5410)	+= clk-exynos5410.o
-- 
2.11.0
