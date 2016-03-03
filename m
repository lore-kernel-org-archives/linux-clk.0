Return-Path: <horms@vergenet.net>
From: Simon Horman <horms+renesas@verge.net.au>
To: Stephen Boyd <sboyd@codeaurora.org>,
	Mike Turquette <mturquette@baylibre.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH] clk: renesas: move drivers to renesas directory
Date: Thu,  3 Mar 2016 11:18:06 +0900
Message-Id: <1456971486-13761-1-git-send-email-horms+renesas@verge.net.au>
List-ID: <linux-clk.vger.kernel.org>

This is part of an ongoing process to migrate from ARCH_SHMOBILE to
ARCH_RENESAS the motivation for which being that RENESAS seems to be a more
appropriate name than SHMOBILE for the majority of Renesas ARM based SoCs.

Along with the above mentioned Kconfig changes it seems appropriate
to also rename directories that only hold drivers for such SoCs.

Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 drivers/clk/Makefile                                 | 2 +-
 drivers/clk/{shmobile => renesas}/Makefile           | 0
 drivers/clk/{shmobile => renesas}/clk-div6.c         | 0
 drivers/clk/{shmobile => renesas}/clk-div6.h         | 0
 drivers/clk/{shmobile => renesas}/clk-emev2.c        | 0
 drivers/clk/{shmobile => renesas}/clk-mstp.c         | 0
 drivers/clk/{shmobile => renesas}/clk-r8a73a4.c      | 0
 drivers/clk/{shmobile => renesas}/clk-r8a7740.c      | 0
 drivers/clk/{shmobile => renesas}/clk-r8a7778.c      | 0
 drivers/clk/{shmobile => renesas}/clk-r8a7779.c      | 0
 drivers/clk/{shmobile => renesas}/clk-rcar-gen2.c    | 0
 drivers/clk/{shmobile => renesas}/clk-rz.c           | 0
 drivers/clk/{shmobile => renesas}/clk-sh73a0.c       | 0
 drivers/clk/{shmobile => renesas}/r8a7795-cpg-mssr.c | 0
 drivers/clk/{shmobile => renesas}/renesas-cpg-mssr.c | 0
 drivers/clk/{shmobile => renesas}/renesas-cpg-mssr.h | 0
 16 files changed, 1 insertion(+), 1 deletion(-)
 rename drivers/clk/{shmobile => renesas}/Makefile (100%)
 rename drivers/clk/{shmobile => renesas}/clk-div6.c (100%)
 rename drivers/clk/{shmobile => renesas}/clk-div6.h (100%)
 rename drivers/clk/{shmobile => renesas}/clk-emev2.c (100%)
 rename drivers/clk/{shmobile => renesas}/clk-mstp.c (100%)
 rename drivers/clk/{shmobile => renesas}/clk-r8a73a4.c (100%)
 rename drivers/clk/{shmobile => renesas}/clk-r8a7740.c (100%)
 rename drivers/clk/{shmobile => renesas}/clk-r8a7778.c (100%)
 rename drivers/clk/{shmobile => renesas}/clk-r8a7779.c (100%)
 rename drivers/clk/{shmobile => renesas}/clk-rcar-gen2.c (100%)
 rename drivers/clk/{shmobile => renesas}/clk-rz.c (100%)
 rename drivers/clk/{shmobile => renesas}/clk-sh73a0.c (100%)
 rename drivers/clk/{shmobile => renesas}/r8a7795-cpg-mssr.c (100%)
 rename drivers/clk/{shmobile => renesas}/renesas-cpg-mssr.c (100%)
 rename drivers/clk/{shmobile => renesas}/renesas-cpg-mssr.h (100%)

 Based on clk-next

 Patch pruduced using git format-patch -M
 This produces a patch without the diff of each renamed file
 which results in a ~204K patch. Let me know if you would prefer that
 or a pull-request.

diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
index 08c0003a7254..46869d696e4d 100644
--- a/drivers/clk/Makefile
+++ b/drivers/clk/Makefile
@@ -70,7 +70,7 @@ obj-$(CONFIG_COMMON_CLK_PXA)		+= pxa/
 obj-$(CONFIG_COMMON_CLK_QCOM)		+= qcom/
 obj-$(CONFIG_ARCH_ROCKCHIP)		+= rockchip/
 obj-$(CONFIG_COMMON_CLK_SAMSUNG)	+= samsung/
-obj-$(CONFIG_ARCH_RENESAS)		+= shmobile/
+obj-$(CONFIG_ARCH_RENESAS)		+= renesas/
 obj-$(CONFIG_ARCH_SIRF)			+= sirf/
 obj-$(CONFIG_ARCH_SOCFPGA)		+= socfpga/
 obj-$(CONFIG_PLAT_SPEAR)		+= spear/
diff --git a/drivers/clk/shmobile/Makefile b/drivers/clk/renesas/Makefile
similarity index 100%
rename from drivers/clk/shmobile/Makefile
rename to drivers/clk/renesas/Makefile
diff --git a/drivers/clk/shmobile/clk-div6.c b/drivers/clk/renesas/clk-div6.c
similarity index 100%
rename from drivers/clk/shmobile/clk-div6.c
rename to drivers/clk/renesas/clk-div6.c
diff --git a/drivers/clk/shmobile/clk-div6.h b/drivers/clk/renesas/clk-div6.h
similarity index 100%
rename from drivers/clk/shmobile/clk-div6.h
rename to drivers/clk/renesas/clk-div6.h
diff --git a/drivers/clk/shmobile/clk-emev2.c b/drivers/clk/renesas/clk-emev2.c
similarity index 100%
rename from drivers/clk/shmobile/clk-emev2.c
rename to drivers/clk/renesas/clk-emev2.c
diff --git a/drivers/clk/shmobile/clk-mstp.c b/drivers/clk/renesas/clk-mstp.c
similarity index 100%
rename from drivers/clk/shmobile/clk-mstp.c
rename to drivers/clk/renesas/clk-mstp.c
diff --git a/drivers/clk/shmobile/clk-r8a73a4.c b/drivers/clk/renesas/clk-r8a73a4.c
similarity index 100%
rename from drivers/clk/shmobile/clk-r8a73a4.c
rename to drivers/clk/renesas/clk-r8a73a4.c
diff --git a/drivers/clk/shmobile/clk-r8a7740.c b/drivers/clk/renesas/clk-r8a7740.c
similarity index 100%
rename from drivers/clk/shmobile/clk-r8a7740.c
rename to drivers/clk/renesas/clk-r8a7740.c
diff --git a/drivers/clk/shmobile/clk-r8a7778.c b/drivers/clk/renesas/clk-r8a7778.c
similarity index 100%
rename from drivers/clk/shmobile/clk-r8a7778.c
rename to drivers/clk/renesas/clk-r8a7778.c
diff --git a/drivers/clk/shmobile/clk-r8a7779.c b/drivers/clk/renesas/clk-r8a7779.c
similarity index 100%
rename from drivers/clk/shmobile/clk-r8a7779.c
rename to drivers/clk/renesas/clk-r8a7779.c
diff --git a/drivers/clk/shmobile/clk-rcar-gen2.c b/drivers/clk/renesas/clk-rcar-gen2.c
similarity index 100%
rename from drivers/clk/shmobile/clk-rcar-gen2.c
rename to drivers/clk/renesas/clk-rcar-gen2.c
diff --git a/drivers/clk/shmobile/clk-rz.c b/drivers/clk/renesas/clk-rz.c
similarity index 100%
rename from drivers/clk/shmobile/clk-rz.c
rename to drivers/clk/renesas/clk-rz.c
diff --git a/drivers/clk/shmobile/clk-sh73a0.c b/drivers/clk/renesas/clk-sh73a0.c
similarity index 100%
rename from drivers/clk/shmobile/clk-sh73a0.c
rename to drivers/clk/renesas/clk-sh73a0.c
diff --git a/drivers/clk/shmobile/r8a7795-cpg-mssr.c b/drivers/clk/renesas/r8a7795-cpg-mssr.c
similarity index 100%
rename from drivers/clk/shmobile/r8a7795-cpg-mssr.c
rename to drivers/clk/renesas/r8a7795-cpg-mssr.c
diff --git a/drivers/clk/shmobile/renesas-cpg-mssr.c b/drivers/clk/renesas/renesas-cpg-mssr.c
similarity index 100%
rename from drivers/clk/shmobile/renesas-cpg-mssr.c
rename to drivers/clk/renesas/renesas-cpg-mssr.c
diff --git a/drivers/clk/shmobile/renesas-cpg-mssr.h b/drivers/clk/renesas/renesas-cpg-mssr.h
similarity index 100%
rename from drivers/clk/shmobile/renesas-cpg-mssr.h
rename to drivers/clk/renesas/renesas-cpg-mssr.h
-- 
2.1.4
