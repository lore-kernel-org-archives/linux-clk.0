Return-Path: <horms@vergenet.net>
From: Simon Horman <horms+renesas@verge.net.au>
To: Stephen Boyd <sboyd@codeaurora.org>,
	Mike Turquette <mturquette@baylibre.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH] clk: renesas: div6: use RENESAS for #define
Date: Tue,  8 Mar 2016 09:48:55 +0900
Message-Id: <1457398135-12320-1-git-send-email-horms+renesas@verge.net.au>
List-ID: <linux-clk.vger.kernel.org>

Name the #define guarding compilation of this header
__RENESAS_CLK_DIV6_H__ rather than __SHMOBILE_CLK_DIV6_H__.

This is a follow-up to renaming the directory in which this file lives from
shmobile to renesas which is in turn part of an ongoing process to migrate
from ARCH_SHMOBILE to ARCH_RENESAS the motivation for which being that
RENESAS seems to be a more appropriate name than SHMOBILE for the majority
of Renesas ARM based SoCs.

Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 drivers/clk/renesas/clk-div6.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/renesas/clk-div6.h b/drivers/clk/renesas/clk-div6.h
index 9a85a95188da..567b31d2bfa5 100644
--- a/drivers/clk/renesas/clk-div6.h
+++ b/drivers/clk/renesas/clk-div6.h
@@ -1,5 +1,5 @@
-#ifndef __SHMOBILE_CLK_DIV6_H__
-#define __SHMOBILE_CLK_DIV6_H__
+#ifndef __RENESAS_CLK_DIV6_H__
+#define __RENESAS_CLK_DIV6_H__
 
 struct clk *cpg_div6_register(const char *name, unsigned int num_parents,
 			      const char **parent_names, void __iomem *reg);
-- 
2.1.4
