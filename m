Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E09F74B5AB
	for <linux-clk@vger.kernel.org>; Mon, 18 Dec 2023 12:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="J3zhnZrb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1702902252; x=1734438252;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ToOt4P2B0ODGTYqjSjPUqb73atpJL6NLa9znBxTbgJc=;
  b=J3zhnZrbqFcRcnRpzaKau72rCAD5O+gnOGZ1sUOc878Ru7TLsiQ/cTYe
   Yp4/EESu6romcFzzGdyVjZQw/UcgXH20npKaiRYnhlwhG5TM617Z8WzZt
   RsLj1GD5kxpy+jUBUm56oOuCo216EmMvrM/ueWI0s/RnsW1okc+Wwjkdw
   FW/fm+jSXDFB9+QTYk3OYvqvr7Lbqc53deKaOmeRYDJcAf8V0kTKenUoe
   ltKZm97nTkZR8IWModC33LMTxetOW+GB6ETPVdfnO2xUzvi2owqSSPlnT
   UeDZlIkRoVmYtYoN9aou+2i+6uft4JpM2QINkghV7eE4lvnPt8OhL70cC
   g==;
X-IronPort-AV: E=Sophos;i="6.04,285,1695679200"; 
   d="scan'208";a="34561861"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 18 Dec 2023 13:24:09 +0100
Received: from steina-w.tq-net.de (steina-w.tq-net.de [10.123.53.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id E4343280075;
	Mon, 18 Dec 2023 13:24:08 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	NXP Linux Team <linux-imx@nxp.com>,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	"Oliver F . Brown" <oliver.brown@oss.nxp.com>,
	Ranjani Vaidyanathan <ranjani.vaidyanathan@nxp.com>
Subject: [PATCH 1/1] clk: imx: clk-imx8qxp: fix LVDS bypass, pixel and phy clocks
Date: Mon, 18 Dec 2023 13:24:07 +0100
Message-Id: <20231218122407.2757175-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

To be compatibel with SCU firmware based on 1.15 a different clock
routing for LVDS is needed.

Signed-off-by: Oliver F. Brown <oliver.brown@oss.nxp.com>
Signed-off-by: Ranjani Vaidyanathan <ranjani.vaidyanathan@nxp.com>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
This patch originates from the downstream kernel squashing patches [1] and [2]
as suggested by the commit message.
I adjusted the commit so that the name stays the same as before.

I am somewhat unsure about the From: tag, as both commits have different
authors.

Best regards,
Alexander

[1] https://github.com/Freescale/linux-fslc/commit/05b5fd0eebd0
[2] https://github.com/Freescale/linux-fslc/commit/0a202c564e5f
 drivers/clk/imx/clk-imx8qxp.c | 24 ++++++++++++++++++++----
 1 file changed, 20 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/imx/clk-imx8qxp.c b/drivers/clk/imx/clk-imx8qxp.c
index 41f0a45aa162..7d8883916cac 100644
--- a/drivers/clk/imx/clk-imx8qxp.c
+++ b/drivers/clk/imx/clk-imx8qxp.c
@@ -66,6 +66,22 @@ static const char * const lcd_pxl_sels[] = {
 	"lcd_pxl_bypass_div_clk",
 };
 
+static const char *const lvds0_sels[] = {
+	"clk_dummy",
+	"clk_dummy",
+	"clk_dummy",
+	"clk_dummy",
+	"mipi0_lvds_bypass_clk",
+};
+
+static const char *const lvds1_sels[] = {
+	"clk_dummy",
+	"clk_dummy",
+	"clk_dummy",
+	"clk_dummy",
+	"mipi1_lvds_bypass_clk",
+};
+
 static const char * const mipi_sels[] = {
 	"clk_dummy",
 	"clk_dummy",
@@ -207,9 +223,9 @@ static int imx8qxp_clk_probe(struct platform_device *pdev)
 	/* MIPI-LVDS SS */
 	imx_clk_scu("mipi0_bypass_clk", IMX_SC_R_MIPI_0, IMX_SC_PM_CLK_BYPASS);
 	imx_clk_scu("mipi0_pixel_clk", IMX_SC_R_MIPI_0, IMX_SC_PM_CLK_PER);
-	imx_clk_scu("mipi0_lvds_pixel_clk", IMX_SC_R_LVDS_0, IMX_SC_PM_CLK_MISC2);
 	imx_clk_scu("mipi0_lvds_bypass_clk", IMX_SC_R_LVDS_0, IMX_SC_PM_CLK_BYPASS);
-	imx_clk_scu("mipi0_lvds_phy_clk", IMX_SC_R_LVDS_0, IMX_SC_PM_CLK_MISC3);
+	imx_clk_scu2("mipi0_lvds_pixel_clk", lvds0_sels, ARRAY_SIZE(lvds0_sels), IMX_SC_R_LVDS_0, IMX_SC_PM_CLK_MISC2);
+	imx_clk_scu2("mipi0_lvds_phy_clk", lvds0_sels, ARRAY_SIZE(lvds0_sels), IMX_SC_R_LVDS_0, IMX_SC_PM_CLK_MISC3);
 	imx_clk_scu2("mipi0_dsi_tx_esc_clk", mipi_sels, ARRAY_SIZE(mipi_sels), IMX_SC_R_MIPI_0, IMX_SC_PM_CLK_MST_BUS);
 	imx_clk_scu2("mipi0_dsi_rx_esc_clk", mipi_sels, ARRAY_SIZE(mipi_sels), IMX_SC_R_MIPI_0, IMX_SC_PM_CLK_SLV_BUS);
 	imx_clk_scu2("mipi0_dsi_phy_clk", mipi_sels, ARRAY_SIZE(mipi_sels), IMX_SC_R_MIPI_0, IMX_SC_PM_CLK_PHY);
@@ -219,9 +235,9 @@ static int imx8qxp_clk_probe(struct platform_device *pdev)
 
 	imx_clk_scu("mipi1_bypass_clk", IMX_SC_R_MIPI_1, IMX_SC_PM_CLK_BYPASS);
 	imx_clk_scu("mipi1_pixel_clk", IMX_SC_R_MIPI_1, IMX_SC_PM_CLK_PER);
-	imx_clk_scu("mipi1_lvds_pixel_clk", IMX_SC_R_LVDS_1, IMX_SC_PM_CLK_MISC2);
 	imx_clk_scu("mipi1_lvds_bypass_clk", IMX_SC_R_LVDS_1, IMX_SC_PM_CLK_BYPASS);
-	imx_clk_scu("mipi1_lvds_phy_clk", IMX_SC_R_LVDS_1, IMX_SC_PM_CLK_MISC3);
+	imx_clk_scu2("mipi1_lvds_pixel_clk", lvds1_sels, ARRAY_SIZE(lvds1_sels), IMX_SC_R_LVDS_1, IMX_SC_PM_CLK_MISC2);
+	imx_clk_scu2("mipi1_lvds_phy_clk", lvds1_sels, ARRAY_SIZE(lvds1_sels), IMX_SC_R_LVDS_1, IMX_SC_PM_CLK_MISC3);
 
 	imx_clk_scu2("mipi1_dsi_tx_esc_clk", mipi_sels, ARRAY_SIZE(mipi_sels), IMX_SC_R_MIPI_1, IMX_SC_PM_CLK_MST_BUS);
 	imx_clk_scu2("mipi1_dsi_rx_esc_clk", mipi_sels, ARRAY_SIZE(mipi_sels), IMX_SC_R_MIPI_1, IMX_SC_PM_CLK_SLV_BUS);
-- 
2.34.1

