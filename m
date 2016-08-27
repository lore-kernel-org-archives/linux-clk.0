Return-Path: <serveralex@gmail.com>
Return-Path: <serveralex@gmail.com>
From: =?UTF-8?q?Alexander=20M=C3=BCller?= <serveralex@gmail.com>
To: mturquette@baylibre.com,
	linux-clk@vger.kernel.org,
	linux-amlogic@lists.infradead.org
Subject: [PATCH v5 1/6] clk: meson: Rename meson8b-clkc.c to reflect gxbb naming convention
Date: Sat, 27 Aug 2016 19:40:49 +0200
Message-Id: <1472319654-59048-2-git-send-email-serveralex@gmail.com>
In-Reply-To: <1472319654-59048-1-git-send-email-serveralex@gmail.com>
References: <1472319654-59048-1-git-send-email-serveralex@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

Signed-off-by: Alexander Müller <serveralex@gmail.com>
---
 drivers/clk/meson/Makefile                      | 2 +-
 drivers/clk/meson/{meson8b-clkc.c => meson8b.c} | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename drivers/clk/meson/{meson8b-clkc.c => meson8b.c} (100%)

diff --git a/drivers/clk/meson/Makefile b/drivers/clk/meson/Makefile
index d4cd4a3..3495834 100644
--- a/drivers/clk/meson/Makefile
+++ b/drivers/clk/meson/Makefile
@@ -3,5 +3,5 @@
 #
 
 obj-$(CONFIG_COMMON_CLK_AMLOGIC) += clk-pll.o clk-cpu.o clk-mpll.o
-obj-$(CONFIG_COMMON_CLK_MESON8B) += meson8b-clkc.o
+obj-$(CONFIG_COMMON_CLK_MESON8B) += meson8b.o
 obj-$(CONFIG_COMMON_CLK_GXBB)	 += gxbb.o gxbb-aoclk.o
diff --git a/drivers/clk/meson/meson8b-clkc.c b/drivers/clk/meson/meson8b.c
similarity index 100%
rename from drivers/clk/meson/meson8b-clkc.c
rename to drivers/clk/meson/meson8b.c
-- 
2.5.0
