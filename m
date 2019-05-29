Return-Path: <SRS0=s3ie=T5=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D51AC04AB3
	for <linux-clk@archiver.kernel.org>; Wed, 29 May 2019 08:21:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 53D1521019
	for <linux-clk@archiver.kernel.org>; Wed, 29 May 2019 08:21:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="ikQjOlnH"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726104AbfE2IV4 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 29 May 2019 04:21:56 -0400
Received: from hqemgate15.nvidia.com ([216.228.121.64]:1325 "EHLO
        hqemgate15.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725917AbfE2IVz (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 29 May 2019 04:21:55 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5cee411a0000>; Wed, 29 May 2019 01:21:46 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Wed, 29 May 2019 01:21:54 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Wed, 29 May 2019 01:21:54 -0700
Received: from HQMAIL104.nvidia.com (172.18.146.11) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 29 May
 2019 08:21:54 +0000
Received: from hqnvemgw02.nvidia.com (172.16.227.111) by HQMAIL104.nvidia.com
 (172.18.146.11) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Wed, 29 May 2019 08:21:54 +0000
Received: from josephl-linux.nvidia.com (Not Verified[10.19.108.132]) by hqnvemgw02.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5cee41200003>; Wed, 29 May 2019 01:21:54 -0700
From:   Joseph Lo <josephl@nvidia.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-tegra@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, Joseph Lo <josephl@nvidia.com>
Subject: [PATCH V4 2/8] clk: tegra: Add PLLP_UD and PLLMB_UD for Tegra210
Date:   Wed, 29 May 2019 16:21:33 +0800
Message-ID: <20190529082139.5581-3-josephl@nvidia.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190529082139.5581-1-josephl@nvidia.com>
References: <20190529082139.5581-1-josephl@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1559118106; bh=2LkLmmvl6fwEW9gxHSRE6zwrBwz0+9SHdHQ/WWaDBns=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:MIME-Version:X-NVConfidentiality:
         Content-Transfer-Encoding:Content-Type;
        b=ikQjOlnHNnJVSi5xV6DF6og+ahAd8sKRjgktuiR+C2CvK49GnsRVvF6yLz+YbwPri
         ihdRy9rUXY2XyvFiSLCfSTv8F0ZDSEV1Haz+zAA/N3KhyHcLifn7B23ABgN4DymK9B
         FMtCDr6p3uGB9jgYTr2gGjTRiaWYWbmmryWMDGWzTSTidcJoCSTr57KupZYm/40KCV
         lCj1nr1gZ41Y/edypf1XQXG3pIkmDgodu0Re7rOS7lT9tWKRb3Lqeopja9/uadIA5Y
         fOTw6p7KEumrn1roU1qhLmqnGSRS9nTbjkWxg8onWf8L+18L5uGfyv5xgkqQi1/tVv
         EP+d2ttx21L9g==
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Introduce the low jitter path of PLLP and PLLMB which can be used as EMC
clock source.

Signed-off-by: Joseph Lo <josephl@nvidia.com>
---
v4:
- no change
v3:
- split to 3 patches from the previous version
---
 drivers/clk/tegra/clk-tegra210.c         | 11 +++++++++++
 include/dt-bindings/clock/tegra210-car.h |  4 ++--
 2 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/tegra/clk-tegra210.c b/drivers/clk/tegra/clk-tegra=
210.c
index ed3c7df75d1e..a985faa4a3c1 100644
--- a/drivers/clk/tegra/clk-tegra210.c
+++ b/drivers/clk/tegra/clk-tegra210.c
@@ -3116,6 +3116,17 @@ static void __init tegra210_pll_init(void __iomem *c=
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
--=20
2.21.0

