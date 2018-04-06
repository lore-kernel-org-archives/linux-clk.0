Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Dinh Nguyen <dinguyen@kernel.org>
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <1521642012-9770-3-git-send-email-dinguyen@kernel.org>
Cc: mark.rutland@arm.com, catalin.marinas@arm.com, mturquette@baylibre.com,
 will.deacon@arm.com, dinguyen@kernel.org, robh+dt@kernel.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <1521642012-9770-1-git-send-email-dinguyen@kernel.org>
 <1521642012-9770-3-git-send-email-dinguyen@kernel.org>
Message-ID: <152303474801.143116.12893988829541761898@swboyd.mtv.corp.google.com>
Subject: Re: [PATCHv7 3/3] clk: socfpga: stratix10: add clock driver for Stratix10
 platform
Date: Fri, 06 Apr 2018 10:12:28 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Dinh Nguyen (2018-03-21 07:20:12)
> Add a clock driver for the Stratix10 SoC. The driver is similar to the
> Cyclone5/Arria10 platforms, with the exception that this driver only uses
> one single clock binding.
> =

> Signed-off-by: Dinh Nguyen <dinguyen@kernel.org>
> ---

Applied to clk-next but I made some fixes. Also, it would be nice if you
could follow up with using the platform driver APIs to map memory and
also make sure to implement a driver remove path or block it with the
suppress attribute.

diff --git a/drivers/clk/socfpga/clk-gate-s10.c b/drivers/clk/socfpga/clk-g=
ate-s10.c
index 71ca3c045a42..eee2d48ab656 100644
--- a/drivers/clk/socfpga/clk-gate-s10.c
+++ b/drivers/clk/socfpga/clk-gate-s10.c
@@ -4,6 +4,7 @@
  */
 #include <linux/clk-provider.h>
 #include <linux/slab.h>
+#include "stratix10-clk.h"
 #include "clk.h"
 =

 #define SOCFPGA_CS_PDBG_CLK	"cs_pdbg_clk"
@@ -63,7 +64,7 @@ static const struct clk_ops dbgclk_ops =3D {
 	.get_parent =3D socfpga_gate_get_parent,
 };
 =

-struct clk *s10_register_gate(char *name, const char *parent_name,
+struct clk *s10_register_gate(const char *name, const char *parent_name,
 			      const char * const *parent_names,
 			      u8 num_parents, unsigned long flags,
 			      void __iomem *regbase, unsigned long gate_reg,
diff --git a/drivers/clk/socfpga/clk-periph-s10.c b/drivers/clk/socfpga/clk=
-periph-s10.c
index 6021ac1b0667..568f59b58ddf 100644
--- a/drivers/clk/socfpga/clk-periph-s10.c
+++ b/drivers/clk/socfpga/clk-periph-s10.c
@@ -5,6 +5,7 @@
 #include <linux/slab.h>
 #include <linux/clk-provider.h>
 =

+#include "stratix10-clk.h"
 #include "clk.h"
 =

 #define CLK_MGR_FREE_SHIFT		16
@@ -71,7 +72,7 @@ static const struct clk_ops peri_cnt_clk_ops =3D {
 	.get_parent =3D clk_periclk_get_parent,
 };
 =

-struct clk *s10_register_periph(char *name, const char *parent_name,
+struct clk *s10_register_periph(const char *name, const char *parent_name,
 				const char * const *parent_names,
 				u8 num_parents, unsigned long flags,
 				void __iomem *reg, unsigned long offset)
@@ -103,7 +104,7 @@ struct clk *s10_register_periph(char *name, const char =
*parent_name,
 	return clk;
 }
 =

-struct clk *s10_register_cnt_periph(char *name, const char *parent_name,
+struct clk *s10_register_cnt_periph(const char *name, const char *parent_n=
ame,
 				    const char * const *parent_names,
 				    u8 num_parents, unsigned long flags,
 				    void __iomem *regbase, unsigned long offset,
diff --git a/drivers/clk/socfpga/clk-pll-s10.c b/drivers/clk/socfpga/clk-pl=
l-s10.c
index ef24ca7a0cc4..2d5d8b43727e 100644
--- a/drivers/clk/socfpga/clk-pll-s10.c
+++ b/drivers/clk/socfpga/clk-pll-s10.c
@@ -5,6 +5,7 @@
 #include <linux/slab.h>
 #include <linux/clk-provider.h>
 =

+#include "stratix10-clk.h"
 #include "clk.h"
 =

 /* Clock Manager offsets */
diff --git a/drivers/clk/socfpga/clk-s10.c b/drivers/clk/socfpga/clk-s10.c
index 27a08b3b30e6..3a11c382a663 100644
--- a/drivers/clk/socfpga/clk-s10.c
+++ b/drivers/clk/socfpga/clk-s10.c
@@ -48,11 +48,11 @@ static const struct stratix10_pll_clock s10_pll_clks[] =
=3D {
 };
 =

 static const struct stratix10_perip_c_clock s10_main_perip_c_clks[] =3D {
-	{ STRATIX10_MAIN_MPU_BASE_CLK, "main_mpu_base_clk", "main_pll", 0, 1, 0, =
0x84},
-	{ STRATIX10_MAIN_NOC_BASE_CLK, "main_noc_base_clk", "main_pll", 0, 1, 0, =
0x88},
-	{ STRATIX10_PERI_MPU_BASE_CLK, "peri_mpu_base_clk", "periph_pll", 0, 1, 0,
+	{ STRATIX10_MAIN_MPU_BASE_CLK, "main_mpu_base_clk", "main_pll", NULL, 1, =
0, 0x84},
+	{ STRATIX10_MAIN_NOC_BASE_CLK, "main_noc_base_clk", "main_pll", NULL, 1, =
0, 0x88},
+	{ STRATIX10_PERI_MPU_BASE_CLK, "peri_mpu_base_clk", "periph_pll", NULL, 1=
, 0,
 	  0xF4},
-	{ STRATIX10_PERI_NOC_BASE_CLK, "peri_noc_base_clk", "periph_pll", 0, 1, 0,
+	{ STRATIX10_PERI_NOC_BASE_CLK, "peri_noc_base_clk", "periph_pll", NULL, 1=
, 0,
 	  0xF8},
 };
 =

diff --git a/drivers/clk/socfpga/stratix10-clk.h b/drivers/clk/socfpga/stra=
tix10-clk.h
index f6c9291ed315..e8e121907952 100644
--- a/drivers/clk/socfpga/stratix10-clk.h
+++ b/drivers/clk/socfpga/stratix10-clk.h
@@ -76,5 +76,5 @@ struct clk *s10_register_gate(const char *, const char *,
 			      unsigned long, void __iomem *,
 			      unsigned long, unsigned long,
 			      unsigned long, unsigned long, u8,
-			      unsigned long, unsigned long, u8);
+			      unsigned long, u8, u8);
