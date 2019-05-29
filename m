Return-Path: <SRS0=s3ie=T5=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DAC7C04E84
	for <linux-clk@archiver.kernel.org>; Wed, 29 May 2019 08:22:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3752D20B7C
	for <linux-clk@archiver.kernel.org>; Wed, 29 May 2019 08:22:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="Fi78obL0"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726538AbfE2IWL (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 29 May 2019 04:22:11 -0400
Received: from hqemgate15.nvidia.com ([216.228.121.64]:1337 "EHLO
        hqemgate15.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726112AbfE2IWK (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 29 May 2019 04:22:10 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5cee41280000>; Wed, 29 May 2019 01:22:00 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Wed, 29 May 2019 01:22:08 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Wed, 29 May 2019 01:22:08 -0700
Received: from HQMAIL103.nvidia.com (172.20.187.11) by HQMAIL108.nvidia.com
 (172.18.146.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 29 May
 2019 08:22:08 +0000
Received: from hqnvemgw02.nvidia.com (172.16.227.111) by HQMAIL103.nvidia.com
 (172.20.187.11) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Wed, 29 May 2019 08:22:08 +0000
Received: from josephl-linux.nvidia.com (Not Verified[10.19.108.132]) by hqnvemgw02.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5cee412e0002>; Wed, 29 May 2019 01:22:08 -0700
From:   Joseph Lo <josephl@nvidia.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-tegra@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, Joseph Lo <josephl@nvidia.com>
Subject: [PATCH V4 7/8] clk: tegra: Remove the old emc_mux clock for Tegra210
Date:   Wed, 29 May 2019 16:21:38 +0800
Message-ID: <20190529082139.5581-8-josephl@nvidia.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190529082139.5581-1-josephl@nvidia.com>
References: <20190529082139.5581-1-josephl@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1559118120; bh=EY5mlT8ZlvKOnTYMN0loWZYtEz2EsBsQclJSzJbdsGM=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:MIME-Version:X-NVConfidentiality:
         Content-Transfer-Encoding:Content-Type;
        b=Fi78obL0SREI5MJySSZlbMKTPqgfO7oInVOMlgCyEl4n+1rTMCPus94jnBCHwYsFi
         l2zDkyxzPI3TTyHbybKLSsG0lWrjQUOCBzodntVZxb+lTGHEmuaDY28UbwpCt9ms3s
         C+9gorkqKCM2Z/1zFMpdVaLHRbes7l9n0KZWaJotrfDrTHxtcBaQB2V7FwJYnYhZmB
         aRtK1LmlM458gFpA56PyxUQIwhBZsS+WCP2zGTKz8idUd0cCwhE1WF66pYNLX7kn52
         Gl/FH1NVGZheNWjUNECyuLARjpy+G1Oep3qxb89S5EiwMieJbf1JLXaYMUoFJMVlR2
         h3IKBRNM0wXdg==
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Remove the old emc_mux clock and don't use the common EMC clock
definition. This will be replaced by a new clock defined in the
EMC driver.

Signed-off-by: Joseph Lo <josephl@nvidia.com>
---
v4:
- make sure the behavior is compatible with case if the kernel still
  uses the older DTB which doesn't have EMC node. And the MC and EMC
  clock can still be registered successuflly.
v3:
- split to 3 patches from the previous version
---
 drivers/clk/tegra/clk-tegra210.c | 42 ++++++++++++++++++++------------
 1 file changed, 27 insertions(+), 15 deletions(-)

diff --git a/drivers/clk/tegra/clk-tegra210.c b/drivers/clk/tegra/clk-tegra=
210.c
index 1d52354820ca..8b209e8b5eaf 100644
--- a/drivers/clk/tegra/clk-tegra210.c
+++ b/drivers/clk/tegra/clk-tegra210.c
@@ -28,6 +28,7 @@
 #include <dt-bindings/reset/tegra210-car.h>
 #include <linux/iopoll.h>
 #include <linux/sizes.h>
+#include <soc/tegra/emc.h>
 #include <soc/tegra/pmc.h>
=20
 #include "clk.h"
@@ -324,12 +325,6 @@ static unsigned long tegra210_input_freq[] =3D {
 	[8] =3D 12000000,
 };
=20
-static const char *mux_pllmcp_clkm[] =3D {
-	"pll_m", "pll_c", "pll_p", "clk_m", "pll_m_ud", "pll_mb", "pll_mb",
-	"pll_p",
-};
-#define mux_pllmcp_clkm_idx NULL
-
 #define PLL_ENABLE			(1 << 30)
=20
 #define PLLCX_MISC1_IDDQ		(1 << 27)
@@ -2346,7 +2341,6 @@ static struct tegra_clk tegra210_clks[tegra_clk_max] =
__initdata =3D {
 	[tegra_clk_i2c2] =3D { .dt_id =3D TEGRA210_CLK_I2C2, .present =3D true },
 	[tegra_clk_uartc_8] =3D { .dt_id =3D TEGRA210_CLK_UARTC, .present =3D tru=
e },
 	[tegra_clk_mipi_cal] =3D { .dt_id =3D TEGRA210_CLK_MIPI_CAL, .present =3D=
 true },
-	[tegra_clk_emc] =3D { .dt_id =3D TEGRA210_CLK_EMC, .present =3D true },
 	[tegra_clk_usb2] =3D { .dt_id =3D TEGRA210_CLK_USB2, .present =3D true },
 	[tegra_clk_bsev] =3D { .dt_id =3D TEGRA210_CLK_BSEV, .present =3D true },
 	[tegra_clk_uartd_8] =3D { .dt_id =3D TEGRA210_CLK_UARTD, .present =3D tru=
e },
@@ -2957,6 +2951,27 @@ static int tegra210_init_pllu(void)
 	return 0;
 }
=20
+static const struct clk_div_table mc_div_table_tegra210[] =3D {
+	{ .val =3D 0, .div =3D 2 },
+	{ .val =3D 1, .div =3D 4 },
+	{ .val =3D 2, .div =3D 1 },
+	{ .val =3D 3, .div =3D 2 },
+	{ .val =3D 0, .div =3D 0 },
+};
+
+static void tegra210_clk_register_mc(const char *name,
+				     const char *parent_name)
+{
+	struct clk *clk;
+
+	clk =3D clk_register_divider_table(NULL, name, parent_name,
+					 CLK_IS_CRITICAL,
+					 clk_base + CLK_SOURCE_EMC,
+					 15, 2, CLK_DIVIDER_READ_ONLY,
+					 mc_div_table_tegra210, &emc_lock);
+	clks[TEGRA210_CLK_MC] =3D clk;
+}
+
 static const char * const sor1_out_parents[] =3D {
 	/*
 	 * Bit 0 of the mux selects sor1_pad_clkout, irrespective of bit 1, so
@@ -3040,15 +3055,12 @@ static __init void tegra210_periph_clk_init(void __=
iomem *clk_base,
 			CLK_SOURCE_LA, 0);
 	clks[TEGRA210_CLK_LA] =3D clk;
=20
-	/* emc mux */
-	clk =3D clk_register_mux(NULL, "emc_mux", mux_pllmcp_clkm,
-			       ARRAY_SIZE(mux_pllmcp_clkm), 0,
-			       clk_base + CLK_SOURCE_EMC,
-			       29, 3, 0, &emc_lock);
+	/* emc */
+	clk =3D tegra210_clk_register_emc();
+	clks[TEGRA210_CLK_EMC] =3D clk;
=20
-	clk =3D tegra_clk_register_mc("mc", "emc_mux", clk_base + CLK_SOURCE_EMC,
-				    &emc_lock);
-	clks[TEGRA210_CLK_MC] =3D clk;
+	/* mc */
+	tegra210_clk_register_mc("mc", "emc");
=20
 	/* cml0 */
 	clk =3D clk_register_gate(NULL, "cml0", "pll_e", 0, clk_base + PLLE_AUX,
--=20
2.21.0

