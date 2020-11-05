Return-Path: <SRS0=dIxE=EL=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80C5CC5517A
	for <linux-clk@archiver.kernel.org>; Thu,  5 Nov 2020 19:35:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 238A32078E
	for <linux-clk@archiver.kernel.org>; Thu,  5 Nov 2020 19:35:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=walle.cc header.i=@walle.cc header.b="PnuV2pg2"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732238AbgKETf1 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 5 Nov 2020 14:35:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732210AbgKETfZ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 5 Nov 2020 14:35:25 -0500
Received: from ssl.serverraum.org (ssl.serverraum.org [IPv6:2a01:4f8:151:8464::1:2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E26DC0613D3;
        Thu,  5 Nov 2020 11:35:25 -0800 (PST)
Received: from apollo.fritz.box (unknown [IPv6:2a02:810c:c200:2e91:6257:18ff:fec4:ca34])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by ssl.serverraum.org (Postfix) with ESMTPSA id 5280323E45;
        Thu,  5 Nov 2020 20:35:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2016061301;
        t=1604604923;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Ucz/4nF66ouu1r39hVjYEnRwtNvHWgDO+P7rFCmWSc0=;
        b=PnuV2pg2vv2rQroO86gWTrQnmefJJGPAq4xUmA+Uc9c9HFJNUVVM6qw36pYg+sLa5Ck8ec
        8EAQtcf3nfshxsxss0skCIfRyauZ227AyLfA0Ynwpsgc+hTTwYUvDAlw6baEj5C6QH8muM
        VXTkMxqANgivIx9fWg1nvS2P23RikXI=
From:   Michael Walle <michael@walle.cc>
To:     linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>,
        Michael Walle <michael@walle.cc>
Subject: [PATCH v2 4/5] arm64: dts: ls1028a: fix FlexSPI clock
Date:   Thu,  5 Nov 2020 20:35:11 +0100
Message-Id: <20201105193512.22388-5-michael@walle.cc>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201105193512.22388-1-michael@walle.cc>
References: <20201105193512.22388-1-michael@walle.cc>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Now that we have a proper driver for the FlexSPI interface use it. This
will fix SCK frequency switching on Layerscape SoCs.

This was tested on the Kontron sl28 board.

Signed-off-by: Michael Walle <michael@walle.cc>
---
Changes since v1:
 - none

 arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi
index ef413bae44cb..4c8b20e6312b 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi
@@ -204,9 +204,20 @@
 		};
 
 		dcfg: syscon@1e00000 {
-			compatible = "fsl,ls1028a-dcfg", "syscon";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			compatible = "fsl,ls1028a-dcfg", "syscon", "simple-mfd";
 			reg = <0x0 0x1e00000 0x0 0x10000>;
+			ranges = <0x0 0x0 0x1e00000 0x10000>;
 			little-endian;
+
+			fspi_clk: clock-controller@900 {
+				compatible = "fsl,ls1028a-flexspi-clk";
+				reg = <0x900 0x4>;
+				#clock-cells = <0>;
+				clocks = <&clockgen 4 0>;
+				clock-output-names = "fspi_clk";
+			};
 		};
 
 		rst: syscon@1e60000 {
@@ -316,7 +327,7 @@
 			      <0x0 0x20000000 0x0 0x10000000>;
 			reg-names = "fspi_base", "fspi_mmap";
 			interrupts = <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&clockgen 4 3>, <&clockgen 4 3>;
+			clocks = <&clockgen 4 3>, <&fspi_clk>;
 			clock-names = "fspi_en", "fspi";
 			status = "disabled";
 		};
-- 
2.20.1

