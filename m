Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBB60217F3E
	for <linux-clk@vger.kernel.org>; Thu, 19 Dec 2024 07:27:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734593273; cv=none; b=dxOqwGqH6FeDHi0A8eqD7W6cTp64uL7VVcQr2MgtlHIfGL7tA3wrlZzGl3VEs98Vk3MVM6JfiFWSOT0Yq77kE8pqZPo9B0g7Fm4dEEGATK3azCXKXHOtvz05pXs6otg3+a1gEndcKywtFcIfy8lXTuZQnN3JZySSS0UovjBDRI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734593273; c=relaxed/simple;
	bh=bOq4vfP9pnRIhBr4/qMTUr5myHhfaWjK6D4BQcam5D4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pc+HuxkulK6f/cPPsb1JivG4AnJViQiynCNsnS5n7HsjNKlM3Ok60ZXdM9DJ3Sp89G1YeaURxXvEcK1jgTDiEO43ocB8PP3QL0XE2b8IX+rRfgV9uYoh5HSvKiMQoH//U1IvnT6Ihm8O1KoJMZKrdUSMQGCGb+pzwfXuBXmCmrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1tOAwX-000729-N3; Thu, 19 Dec 2024 08:27:33 +0100
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1tOAwW-004AP9-1S;
	Thu, 19 Dec 2024 08:27:33 +0100
Received: from localhost ([::1] helo=dude05.red.stw.pengutronix.de)
	by dude05.red.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1tOAwX-00Gewn-0M;
	Thu, 19 Dec 2024 08:27:33 +0100
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
Date: Thu, 19 Dec 2024 08:27:35 +0100
Subject: [PATCH 4/6] arm64: dts: freescale: imx8mp-skov: fix LDB clock rate
 configuration
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241219-imx8m-clk-v1-4-cfaffa087da6@pengutronix.de>
References: <20241219-imx8m-clk-v1-0-cfaffa087da6@pengutronix.de>
In-Reply-To: <20241219-imx8m-clk-v1-0-cfaffa087da6@pengutronix.de>
To: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Abel Vesa <abel.vesa@linaro.org>, 
 Marek Vasut <marex@denx.de>
Cc: linux-clk@vger.kernel.org, imx@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Ahmad Fatoum <a.fatoum@pengutronix.de>
X-Mailer: b4 0.13-dev
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-clk@vger.kernel.org

When the imx8mp-skov-revb-mi1010ait-1cp1 device tree was first added, it
configured the minimum clock rate supported by the panel instead of
the typical clock rate:

  fsl-ldb 32ec0000.blk-ctrl:bridge@5c: Configured LDB clock
  (482300000 Hz) does not match requested LVDS clock: 490000000 Hz

Besides the warning, the display functioned normally though
This broke with commit ff06ea04e4cf ("clk: imx: clk-imx8mp: Allow
media_disp pixel clock reconfigure parent rate") as the reconfiguration
of the parent clocks removed setting the IMX8MP_VIDEO_PLL1 to 7 times
the display clock rate:

  fsl-ldb 32ec0000.blk-ctrl:bridge@5c: Configured LDB clock
  (70000000 Hz) does not match requested LVDS clock: 490000000 Hz

Fix this by configuring the typical rate instead and benefit from
the new commit by dropping the now unneeded assigned-clock-rates
in &media_blk_ctrl.

Fixes: ff06ea04e4cf ("clk: imx: clk-imx8mp: Allow media_disp pixel clock reconfigure parent rate")
Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
---
 .../dts/freescale/imx8mp-skov-revb-mi1010ait-1cp1.dts | 19 +++++--------------
 1 file changed, 5 insertions(+), 14 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-skov-revb-mi1010ait-1cp1.dts b/arch/arm64/boot/dts/freescale/imx8mp-skov-revb-mi1010ait-1cp1.dts
index 30962922b361..a13f6d76a495 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-skov-revb-mi1010ait-1cp1.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-skov-revb-mi1010ait-1cp1.dts
@@ -51,8 +51,11 @@ &lcdif2 {
 };
 
 &lvds_bridge {
-	/* IMX8MP_CLK_MEDIA_LDB = IMX8MP_CLK_MEDIA_DISP2_PIX * 7 */
-	assigned-clock-rates = <482300000>;
+	assigned-clocks = <&clk IMX8MP_CLK_MEDIA_LDB>,
+				 <&clk IMX8MP_VIDEO_PLL1>;
+	assigned-clock-parents = <&clk IMX8MP_VIDEO_PLL1_OUT>;
+	/* IMX8MP_VIDEO_PLL1 = IMX8MP_CLK_MEDIA_DISP2_PIX * 2 * 7 */
+	assigned-clock-rates = <0>, <980000000>;
 	status = "okay";
 
 	ports {
@@ -64,18 +67,6 @@ ldb_lvds_ch0: endpoint {
 	};
 };
 
-&media_blk_ctrl {
-	/* currently it is not possible to let display clocks confugure
-	 * automatically, so we need to set them manually
-	 */
-	assigned-clock-rates = <500000000>, <200000000>, <0>,
-		/* IMX8MP_CLK_MEDIA_DISP2_PIX = pixelclk of lvds panel */
-		<68900000>,
-		<500000000>,
-		/* IMX8MP_VIDEO_PLL1 = IMX8MP_CLK_MEDIA_LDB * 2 */
-		<964600000>;
-};
-
 &pwm4 {
 	status = "okay";
 };

-- 
2.39.5

