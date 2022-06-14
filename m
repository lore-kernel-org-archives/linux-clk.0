Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAEF6CCA47E
	for <linux-clk@archiver.kernel.org>; Tue, 14 Jun 2022 18:03:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232199AbiFNSDB (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 14 Jun 2022 14:03:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232240AbiFNSC6 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 14 Jun 2022 14:02:58 -0400
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 071F24477B
        for <linux-clk@vger.kernel.org>; Tue, 14 Jun 2022 11:02:54 -0700 (PDT)
Received: from tr.lan (ip-86-49-12-201.net.upcbroadband.cz [86.49.12.201])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id E0E14843C1;
        Tue, 14 Jun 2022 20:02:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1655229773;
        bh=cdxvvb+UL4F8dsRtkBAgbsLjwlzRd8Wjs1V6ChwEzm4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=EC1jrJalb20qY6Qkh4Kxj/HzsiM7dJGPXFjaatLlNT4NIKSJYGIBEwz58RNRaUjP2
         t9kabvIvJKlnyVDUmhVpZ5TkTyje3U8E+jTJeaAP6b/TybWccC+VMYJ86WmftLB+wM
         +VEU428iIeD3uh1C+2WOGUf5LNbeGn4HrEC6kxZFLflpbOOAPRHEZEGNiPtpxJaVuW
         8v8mI047IPrp97HXFNRMAa1OqR/klO0C+YLGyExWKDhZclR5FRW291eMG3739SzavL
         y3U+sJUuPd6N9sfzD0Tmam+40i45JTO0KHcs9+v7KUIwcl8nhxlhrG2zoZF3qScFWf
         rTh/dqjDyf5vQ==
From:   Marek Vasut <marex@denx.de>
To:     linux-clk@vger.kernel.org
Cc:     Marek Vasut <marex@denx.de>, Abel Vesa <abel.vesa@nxp.com>,
        Fabio Estevam <festevam@gmail.com>,
        Jacky Bai <ping.bai@nxp.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        Michael Turquette <mturquette@baylibre.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com
Subject: [PATCH v2 4/4] arm64: dts: imx8mp: Add analog audio output on i.MX8MP EVK
Date:   Tue, 14 Jun 2022 20:02:39 +0200
Message-Id: <20220614180239.778334-4-marex@denx.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220614180239.778334-1-marex@denx.de>
References: <20220614180239.778334-1-marex@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Enable SAI3 on i.MX8MP EVK, add WM8960 codec binding and regulator.
This is all that is needed to get analog audio output operational
on i.MX8MP EVK.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Abel Vesa <abel.vesa@nxp.com>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Jacky Bai <ping.bai@nxp.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Lucas Stach <l.stach@pengutronix.de>
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
To: linux-clk@vger.kernel.org
Cc: linux-imx@nxp.com
---
V2: No change
---
 arch/arm64/boot/dts/freescale/imx8mp-evk.dts | 60 ++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
index 668fe155051b7..75b3d2cf3a863 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
@@ -40,6 +40,16 @@ pcie0_refclk: pcie0-refclk {
 			clock-frequency = <100000000>;
 	};
 
+	reg_audio_pwr: regulator-audio-pwr {
+		compatible = "regulator-fixed";
+		regulator-name = "audio-pwr";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&gpio4 29 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		regulator-always-on;
+	};
+
 	reg_can1_stby: regulator-can1-stby {
 		compatible = "regulator-fixed";
 		regulator-name = "can1-stby";
@@ -83,6 +93,23 @@ reg_usdhc2_vmmc: regulator-usdhc2 {
 		gpio = <&gpio2 19 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
+
+	sound-wm8960 {
+		compatible = "fsl,imx-audio-wm8960";
+		model = "wm8960-audio";
+		audio-cpu = <&sai3>;
+		audio-codec = <&codec>;
+		audio-routing =
+			"Headphone Jack", "HP_L",
+			"Headphone Jack", "HP_R",
+			"Ext Spk", "SPK_LP",
+			"Ext Spk", "SPK_LN",
+			"Ext Spk", "SPK_RP",
+			"Ext Spk", "SPK_RN",
+			"LINPUT1", "Mic Jack",
+			"LINPUT3", "Mic Jack",
+			"Mic Jack", "MICB";
+	};
 };
 
 &A53_0 {
@@ -333,6 +360,17 @@ &i2c3 {
 	pinctrl-0 = <&pinctrl_i2c3>;
 	status = "okay";
 
+	codec: wm8960@1a {
+		compatible = "wlf,wm8960";
+		reg = <0x1a>;
+		clocks = <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_SAI3_MCLK1>;
+		clock-names = "mclk";
+		wlf,shared-lrclk;
+		wlf,hp-cfg = <3 2 3>;
+		wlf,gpio-cfg = <1 3>;
+		SPKVDD1-supply = <&reg_audio_pwr>;
+	};
+
 	pca6416: gpio@20 {
 		compatible = "ti,tca6416";
 		reg = <0x20>;
@@ -402,6 +440,16 @@ &pcie{
 	status = "okay";
 };
 
+&sai3 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_sai3>;
+	assigned-clocks = <&clk IMX8MP_CLK_SAI3>;
+	assigned-clock-parents = <&clk IMX8MP_AUDIO_PLL1_OUT>;
+	assigned-clock-rates = <12288000>;
+	fsl,sai-mclk-direction-output;
+	status = "okay";
+};
+
 &snvs_pwrkey {
 	status = "okay";
 };
@@ -594,6 +642,18 @@ MX8MP_IOMUXC_SD2_RESET_B__GPIO2_IO19	0x41
 		>;
 	};
 
+	pinctrl_sai3: sai3grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SAI3_TXFS__AUDIOMIX_SAI3_TX_SYNC	0xd6
+			MX8MP_IOMUXC_SAI3_TXC__AUDIOMIX_SAI3_TX_BCLK	0xd6
+			MX8MP_IOMUXC_SAI3_RXD__AUDIOMIX_SAI3_RX_DATA00	0xd6
+			MX8MP_IOMUXC_SAI3_TXD__AUDIOMIX_SAI3_TX_DATA00	0xd6
+			MX8MP_IOMUXC_SAI3_MCLK__AUDIOMIX_SAI3_MCLK	0xd6
+			MX8MP_IOMUXC_SAI3_RXFS__GPIO4_IO28		0xd6
+			MX8MP_IOMUXC_SAI3_RXC__GPIO4_IO29		0xd6
+		>;
+	};
+
 	pinctrl_uart2: uart2grp {
 		fsl,pins = <
 			MX8MP_IOMUXC_UART2_RXD__UART2_DCE_RX	0x49
-- 
2.35.1

