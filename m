Return-Path: <SRS0=JHcd=TK=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1930C04A6B
	for <linux-clk@archiver.kernel.org>; Fri, 10 May 2019 08:47:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 75783206A3
	for <linux-clk@archiver.kernel.org>; Fri, 10 May 2019 08:47:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="UXKZTpST"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727146AbfEJIrr (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 10 May 2019 04:47:47 -0400
Received: from hqemgate16.nvidia.com ([216.228.121.65]:17211 "EHLO
        hqemgate16.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727145AbfEJIrr (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 10 May 2019 04:47:47 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5cd53aac0000>; Fri, 10 May 2019 01:47:41 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Fri, 10 May 2019 01:47:44 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Fri, 10 May 2019 01:47:44 -0700
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL104.nvidia.com
 (172.18.146.11) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 10 May
 2019 08:47:44 +0000
Received: from hqnvemgw02.nvidia.com (172.16.227.111) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Fri, 10 May 2019 08:47:44 +0000
Received: from josephl-linux.nvidia.com (Not Verified[10.19.108.132]) by hqnvemgw02.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5cd53aae0001>; Fri, 10 May 2019 01:47:44 -0700
From:   Joseph Lo <josephl@nvidia.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-tegra@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, Joseph Lo <josephl@nvidia.com>
Subject: [PATCH V3 7/8] clk: tegra: Remove the old emc_mux clock for Tegra210
Date:   Fri, 10 May 2019 16:47:18 +0800
Message-ID: <20190510084719.18902-8-josephl@nvidia.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190510084719.18902-1-josephl@nvidia.com>
References: <20190510084719.18902-1-josephl@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1557478061; bh=oH7JNAqp9Y7bL2LPKEu/bQAROOyk/GXZHEV/Uty9flU=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:MIME-Version:X-NVConfidentiality:
         Content-Transfer-Encoding:Content-Type;
        b=UXKZTpSTaQmhpgCLFTOBejS9epmGnciZaGZoQX4/OlqT6burIg6/W4qj4aZKg1MZK
         qbHvISwT/Z8nsMO6tPJBHQBjMQhiDPuQ/QOqxX7hls5naXip6/cRy2m9UN82fM2/uL
         5/2Y3Cu0NtIFyKBnfusdkZR8rEUURvPSh+jJyWvmlqOVX+Lt8H2FDiDGzU5jgxB+UF
         /1vdwSzYDxwKy6eRRoXhWc7hsoOBQ/0HspQYT8IT9mAlMqjJU72/a1G9gp3ZpNwRe/
         1BDEqu/BaOC9l97lOxyrcxte8ysM6+BndjCdFZ2qqYsjIU5gudO3+yQm4xWzEGJJvX
         ceMIid2O0Glgg==
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Remove the old emc_mux clock and don't use the common EMC clock
definition. This will be replaced by a new clock defined in the
EMC driver.

Signed-off-by: Joseph Lo <josephl@nvidia.com>
---
v3:
- split to 3 patches from the previous version
---
 drivers/clk/tegra/clk-tegra210.c | 38 ++++++++++++++++++--------------
 1 file changed, 22 insertions(+), 16 deletions(-)

diff --git a/drivers/clk/tegra/clk-tegra210.c b/drivers/clk/tegra/clk-tegra=
210.c
index 6d7bb53e9603..534bee95557b 100644
--- a/drivers/clk/tegra/clk-tegra210.c
+++ b/drivers/clk/tegra/clk-tegra210.c
@@ -324,12 +324,6 @@ static unsigned long tegra210_input_freq[] =3D {
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
@@ -2346,7 +2340,6 @@ static struct tegra_clk tegra210_clks[tegra_clk_max] =
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
@@ -2957,6 +2950,26 @@ static int tegra210_init_pllu(void)
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
+static void tegra_clk_register_mc_tegra210(const char *name,
+					   const char *parent_name)
+{
+	struct clk *clk;
+
+	clk =3D clk_register_divider_table(NULL, name, parent_name, 0,
+					 clk_base + CLK_SOURCE_EMC,
+					 15, 2, CLK_DIVIDER_READ_ONLY,
+					 mc_div_table_tegra210, &emc_lock);
+	clks[TEGRA210_CLK_MC] =3D clk;
+}
+
 static const char * const sor1_out_parents[] =3D {
 	/*
 	 * Bit 0 of the mux selects sor1_pad_clkout, irrespective of bit 1, so
@@ -3040,15 +3053,8 @@ static __init void tegra210_periph_clk_init(void __i=
omem *clk_base,
 			CLK_SOURCE_LA, 0);
 	clks[TEGRA210_CLK_LA] =3D clk;
=20
-	/* emc mux */
-	clk =3D clk_register_mux(NULL, "emc_mux", mux_pllmcp_clkm,
-			       ARRAY_SIZE(mux_pllmcp_clkm), 0,
-			       clk_base + CLK_SOURCE_EMC,
-			       29, 3, 0, &emc_lock);
-
-	clk =3D tegra_clk_register_mc("mc", "emc_mux", clk_base + CLK_SOURCE_EMC,
-				    &emc_lock);
-	clks[TEGRA210_CLK_MC] =3D clk;
+	/* mc */
+	tegra_clk_register_mc_tegra210("mc", "emc");
=20
 	/* cml0 */
 	clk =3D clk_register_gate(NULL, "cml0", "pll_e", 0, clk_base + PLLE_AUX,
--=20
2.21.0

