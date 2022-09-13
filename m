Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DEBBC6FA89
	for <linux-clk@archiver.kernel.org>; Tue, 13 Sep 2022 10:22:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231527AbiIMKWF (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 13 Sep 2022 06:22:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231500AbiIMKWB (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 13 Sep 2022 06:22:01 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A589356BBE
        for <linux-clk@vger.kernel.org>; Tue, 13 Sep 2022 03:21:59 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1oY334-0002vq-U3; Tue, 13 Sep 2022 12:21:46 +0200
Received: from [2a0a:edc0:0:1101:1d::28] (helo=dude02.red.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <mfe@pengutronix.de>)
        id 1oY335-000TmL-JT; Tue, 13 Sep 2022 12:21:46 +0200
Received: from mfe by dude02.red.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <mfe@pengutronix.de>)
        id 1oY333-004psN-CI; Tue, 13 Sep 2022 12:21:45 +0200
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org,
        abelvesa@kernel.org, abel.vesa@linaro.org, mturquette@baylibre.com,
        sboyd@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
        kernel@pengutronix.de, festevam@gmail.com
Cc:     linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>,
        linux-imx@nxp.com, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org
Subject: [RFC PATCH 2/2] arm64: dts: imx8mm-evk: mark 32k pmic clock as always-on
Date:   Tue, 13 Sep 2022 12:21:41 +0200
Message-Id: <20220913102141.971148-3-m.felsch@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220913102141.971148-1-m.felsch@pengutronix.de>
References: <20220913102141.971148-1-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-clk@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

This clock is critical for the system since it supplies the 32k SoC
clock. Unfortunately the imx8mm.dtsi uses a fixed clock provider for the
32k SoC clock and not this one. If it would use this clock we would add
a cycle-dependency since the pmic driver depends on the i2c driver which
depends on the clock driver. Therefore use the new "clocks-always-on"
macro to mark the clock as critical, so it is never turned off by the
kernel.

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
 arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi
index 7d6317d95b13..0e950ef61900 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi
@@ -195,6 +195,7 @@ pmic@4b {
 		#clock-cells = <0>;
 		clocks = <&osc_32k 0>;
 		clock-output-names = "clk-32k-out";
+		clocks-always-on = "clk-32k-out";
 
 		regulators {
 			buck1_reg: BUCK1 {
-- 
2.30.2

