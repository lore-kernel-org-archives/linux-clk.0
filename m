Return-Path: <serveralex@gmail.com>
Return-Path: <serveralex@gmail.com>
From: =?UTF-8?q?Alexander=20M=C3=BCller?= <serveralex@gmail.com>
To: mturquette@baylibre.com,
	linux-clk@vger.kernel.org,
	linux-amlogic@lists.infradead.org
Subject: Re: [PATCH 1/7] clk: meson: Rename meson8b-clkc.c to reflect gxbb naming convention
Date: Tue,  5 Jul 2016 21:15:31 +0200
Message-Id: <1467746131-1865-1-git-send-email-serveralex@gmail.com>
In-Reply-To: <20160705185527.GA17348@localhost>
References: <20160705185527.GA17348@localhost>
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
index 197e401..1a66799 100644
--- a/drivers/clk/meson/Makefile
+++ b/drivers/clk/meson/Makefile
@@ -3,5 +3,5 @@
 #
 
 obj-$(CONFIG_COMMON_CLK_AMLOGIC) += clk-pll.o clk-cpu.o clk-mpll.o
-obj-$(CONFIG_COMMON_CLK_MESON8B) += meson8b-clkc.o
+obj-$(CONFIG_COMMON_CLK_MESON8B) += meson8b.o
 obj-$(CONFIG_COMMON_CLK_GXBB)	 += gxbb.o
diff --git a/drivers/clk/meson/meson8b-clkc.c b/drivers/clk/meson/meson8b.c
similarity index 100%
rename from drivers/clk/meson/meson8b-clkc.c
rename to drivers/clk/meson/meson8b.c
-- 
2.5.0
