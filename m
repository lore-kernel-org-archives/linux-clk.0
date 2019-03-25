Return-Path: <SRS0=mYc5=R4=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53887C43381
	for <linux-clk@archiver.kernel.org>; Mon, 25 Mar 2019 07:45:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1AE8E20879
	for <linux-clk@archiver.kernel.org>; Mon, 25 Mar 2019 07:45:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="CgYxVSPS"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729864AbfCYHpj (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 25 Mar 2019 03:45:39 -0400
Received: from hqemgate16.nvidia.com ([216.228.121.65]:16688 "EHLO
        hqemgate16.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729720AbfCYHpj (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 25 Mar 2019 03:45:39 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5c98871f0000>; Mon, 25 Mar 2019 00:45:35 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Mon, 25 Mar 2019 00:45:37 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Mon, 25 Mar 2019 00:45:37 -0700
Received: from HQMAIL106.nvidia.com (172.18.146.12) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 25 Mar
 2019 07:45:36 +0000
Received: from hqnvemgw02.nvidia.com (172.16.227.111) by HQMAIL106.nvidia.com
 (172.18.146.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Mon, 25 Mar 2019 07:45:36 +0000
Received: from josephl-linux.nvidia.com (Not Verified[10.19.108.132]) by hqnvemgw02.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5c98871e0004>; Mon, 25 Mar 2019 00:45:36 -0700
From:   Joseph Lo <josephl@nvidia.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-tegra@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, Joseph Lo <josephl@nvidia.com>
Subject: [PATCH 2/8] clk: tegra: clock changes for emc scaling support on Tegra210
Date:   Mon, 25 Mar 2019 15:45:17 +0800
Message-ID: <20190325074523.26456-3-josephl@nvidia.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190325074523.26456-1-josephl@nvidia.com>
References: <20190325074523.26456-1-josephl@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1553499935; bh=BzDDDA23/Zn1WOx9ldzLxdKFuZzancCCO7uLbaA7/l0=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:MIME-Version:X-NVConfidentiality:
         Content-Transfer-Encoding:Content-Type;
        b=CgYxVSPSxjmZJE0KI3PE0RihrGxlviBfy6L0DHdyV/CCmHZsfSuCRxtacTvJ0lG2u
         KzZif0eE+XAsOvYtij5QtohTFUmjPdYKPL8W4w8Sq1/BcyHtbPLDVFF2XfBnOXDDcO
         /KB2JeNvpjTRsRBHzQKViBrQbWC7BrplVuE5fmFDfjvH7bl7jhJ5O3VyKlmlvmhshA
         NHYGj2BluQ8zO7s/HcztUgIEKgQVTmHBuRxi+9K/ldlDqpqKhTnBqLcxo+Et0lZJrD
         3flV/5oarpIH1Kb9/rklSPhXyAc1pFyiH2rC2djm0gXHgSZ6/G6DrvfWSFuQnPCjlg
         R/xuVoiRzB2Fw==
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

1) Introduce low jitter paths for pllp and pll_mb used by the EMC driver.
2) Remove the old emc_mux clock and don't use the common EMC clock
   definition. This will be replaced by a new clock defined in the EMC
   driver.
3) Export functions to allow accessing the CAR register required for EMC
   clock scaling. These functions will be used to access the CAR register
   as part of the scaling sequence.

Based on the work of Peter De Schrijver <pdeschrijver@nvidia.com>.

Signed-off-by: Joseph Lo <josephl@nvidia.com>
---
 drivers/clk/tegra/clk-tegra210.c         | 112 +++++++++++++++++++----
 include/dt-bindings/clock/tegra210-car.h |   4 +-
 include/linux/clk/tegra.h                |   5 +
 3 files changed, 103 insertions(+), 18 deletions(-)

diff --git a/drivers/clk/tegra/clk-tegra210.c b/drivers/clk/tegra/clk-tegra=
210.c
index 7545af763d7a..e17b5279ea69 100644
--- a/drivers/clk/tegra/clk-tegra210.c
+++ b/drivers/clk/tegra/clk-tegra210.c
@@ -47,6 +47,7 @@
 #define CLK_SOURCE_LA 0x1f8
 #define CLK_SOURCE_SDMMC2 0x154
 #define CLK_SOURCE_SDMMC4 0x164
+#define CLK_SOURCE_EMC_DLL 0x664
=20
 #define PLLC_BASE 0x80
 #define PLLC_OUT 0x84
@@ -234,6 +235,10 @@
 #define RST_DFLL_DVCO 0x2f4
 #define DVFS_DFLL_RESET_SHIFT 0
=20
+#define CLK_RST_CONTROLLER_CLK_OUT_ENB_X_SET	0x284
+#define CLK_RST_CONTROLLER_CLK_OUT_ENB_X_CLR	0x288
+#define CLK_OUT_ENB_X_CLK_ENB_EMC_DLL		BIT(14)
+
 #define CLK_RST_CONTROLLER_RST_DEV_Y_SET 0x2a8
 #define CLK_RST_CONTROLLER_RST_DEV_Y_CLR 0x2ac
=20
@@ -319,12 +324,6 @@ static unsigned long tegra210_input_freq[] =3D {
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
@@ -2310,7 +2309,7 @@ static struct tegra_clk tegra210_clks[tegra_clk_max] =
__initdata =3D {
 	[tegra_clk_i2c2] =3D { .dt_id =3D TEGRA210_CLK_I2C2, .present =3D true },
 	[tegra_clk_uartc_8] =3D { .dt_id =3D TEGRA210_CLK_UARTC, .present =3D tru=
e },
 	[tegra_clk_mipi_cal] =3D { .dt_id =3D TEGRA210_CLK_MIPI_CAL, .present =3D=
 true },
-	[tegra_clk_emc] =3D { .dt_id =3D TEGRA210_CLK_EMC, .present =3D true },
+	[tegra_clk_emc] =3D { .dt_id =3D TEGRA210_CLK_EMC, .present =3D false },
 	[tegra_clk_usb2] =3D { .dt_id =3D TEGRA210_CLK_USB2, .present =3D true },
 	[tegra_clk_bsev] =3D { .dt_id =3D TEGRA210_CLK_BSEV, .present =3D true },
 	[tegra_clk_uartd_8] =3D { .dt_id =3D TEGRA210_CLK_UARTD, .present =3D tru=
e },
@@ -2921,6 +2920,82 @@ static int tegra210_init_pllu(void)
 	return 0;
 }
=20
+void tegra210_clk_emc_dll_enable(bool flag)
+{
+	unsigned long flags =3D 0;
+	u32 offset =3D flag ? CLK_RST_CONTROLLER_CLK_OUT_ENB_X_SET :
+		     CLK_RST_CONTROLLER_CLK_OUT_ENB_X_CLR;
+
+	spin_lock_irqsave(&emc_lock, flags);
+
+	writel_relaxed(CLK_OUT_ENB_X_CLK_ENB_EMC_DLL, clk_base + offset);
+	readl(clk_base + offset);
+
+	spin_unlock_irqrestore(&emc_lock, flags);
+}
+EXPORT_SYMBOL_GPL(tegra210_clk_emc_dll_enable);
+
+void tegra210_clk_emc_dll_update_setting(u32 emc_dll_src_value)
+{
+	unsigned long flags =3D 0;
+
+	spin_lock_irqsave(&emc_lock, flags);
+
+	writel_relaxed(emc_dll_src_value, clk_base + CLK_SOURCE_EMC_DLL);
+	readl(clk_base + CLK_SOURCE_EMC_DLL);
+
+	spin_unlock_irqrestore(&emc_lock, flags);
+}
+EXPORT_SYMBOL_GPL(tegra210_clk_emc_dll_update_setting);
+
+void tegra210_clk_emc_update_setting(u32 emc_src_value)
+{
+	unsigned long flags =3D 0;
+
+	spin_lock_irqsave(&emc_lock, flags);
+
+	writel_relaxed(emc_src_value, clk_base + CLK_SOURCE_EMC);
+	readl(clk_base + CLK_SOURCE_EMC);
+
+	spin_unlock_irqrestore(&emc_lock, flags);
+}
+EXPORT_SYMBOL_GPL(tegra210_clk_emc_update_setting);
+
+u32 tegra210_clk_emc_get_setting(void)
+{
+	unsigned long flags =3D 0;
+	u32 val;
+
+	spin_lock_irqsave(&emc_lock, flags);
+
+	val =3D readl_relaxed(clk_base + CLK_SOURCE_EMC);
+
+	spin_unlock_irqrestore(&emc_lock, flags);
+
+	return val;
+}
+EXPORT_SYMBOL_GPL(tegra210_clk_emc_get_setting);
+
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
@@ -3004,15 +3079,8 @@ static __init void tegra210_periph_clk_init(void __i=
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
@@ -3116,6 +3184,18 @@ static void __init tegra210_pll_init(void __iomem *c=
lk_base,
 	clk_register_clkdev(clk, "pll_m_ud", NULL);
 	clks[TEGRA210_CLK_PLL_M_UD] =3D clk;
=20
+	/* PLLMB_UD */
+	clk =3D clk_register_fixed_factor(NULL, "pll_mb_ud", "pll_mb",
+					CLK_SET_RATE_PARENT, 1, 1);
+	clk_register_clkdev(clk, "pll_mb_ud", NULL);
+	clks[TEGRA210_CLK_PLL_MB_UD] =3D clk;
+
+	/* PLLP_UD */
+	clk =3D clk_register_fixed_factor(NULL, "pll_p_ud", "pll_p",
+					0, 1, 1);
+	clks[TEGRA210_CLK_PLL_P_UD] =3D clk;
+
+
 	/* PLLU_VCO */
 	if (!tegra210_init_pllu()) {
 		clk =3D clk_register_fixed_rate(NULL, "pll_u_vco", "pll_ref", 0,
diff --git a/include/dt-bindings/clock/tegra210-car.h b/include/dt-bindings=
/clock/tegra210-car.h
index 6b77e721f6b1..832a89788525 100644
--- a/include/dt-bindings/clock/tegra210-car.h
+++ b/include/dt-bindings/clock/tegra210-car.h
@@ -349,8 +349,8 @@
 #define TEGRA210_CLK_PLL_P_OUT_XUSB 317
 #define TEGRA210_CLK_XUSB_SSP_SRC 318
 #define TEGRA210_CLK_PLL_RE_OUT1 319
-/* 320 */
-/* 321 */
+#define TEGRA210_CLK_PLL_MB_UD 320
+#define TEGRA210_CLK_PLL_P_UD 321
 #define TEGRA210_CLK_ISP 322
 #define TEGRA210_CLK_PLL_A_OUT_ADSP 323
 #define TEGRA210_CLK_PLL_A_OUT0_OUT_ADSP 324
diff --git a/include/linux/clk/tegra.h b/include/linux/clk/tegra.h
index afb9edfa5d58..7018afb1990e 100644
--- a/include/linux/clk/tegra.h
+++ b/include/linux/clk/tegra.h
@@ -130,4 +130,9 @@ extern void tegra210_put_utmipll_in_iddq(void);
 extern void tegra210_put_utmipll_out_iddq(void);
 extern int tegra210_clk_handle_mbist_war(unsigned int id);
=20
+void tegra210_clk_emc_dll_enable(bool flag);
+void tegra210_clk_emc_dll_update_setting(u32 emc_dll_src_value);
+void tegra210_clk_emc_update_setting(u32 emc_src_value);
+u32 tegra210_clk_emc_get_setting(void);
+
 #endif /* __LINUX_CLK_TEGRA_H_ */
--=20
2.21.0

