Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A8CAC46467
	for <linux-clk@archiver.kernel.org>; Mon, 14 Nov 2022 11:19:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236771AbiKNLSs (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 14 Nov 2022 06:18:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236458AbiKNLRn (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 14 Nov 2022 06:17:43 -0500
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::223])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DCA77642F;
        Mon, 14 Nov 2022 03:15:46 -0800 (PST)
Received: (Authenticated sender: herve.codina@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPA id 5B6656000C;
        Mon, 14 Nov 2022 11:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1668424545;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=qYstxmdNtV0DeBo1GgQhNnu+wwgOyx92wB5h3OanKjQ=;
        b=iYfs0GspcSL/oZR9hBwKvjRL/aofXnsZv0D8tL9PKvBAkedd3BP2tipjpYKZ8ZcqedIfPS
        ubAh2ow1hxzDi5bnQc9fAQefWcc/15okuV0tAlB86OUXSA8kjWdzoVHLQof8n15sMwNg/r
        aLqXwaBBop+rZYyOMeGtIqayHtOoMLQlcdQPznloln0Sur0EPS/oWNUZgOT8ahlwn7PHTl
        Kv+5CvNo4nAyhnfyUJu8UYyRlCWsQP/82TJiqmv00/TI8R7sr2EP8A2P0DZ2iISqn1VhEK
        51hZnSwM/CCdp/DTkonmbXtTbmciCSA1SBxjNXIBaCXg8Bi8N+qiMHNGFsXBCg==
From:   Herve Codina <herve.codina@bootlin.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Herve Codina <herve.codina@bootlin.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Gareth Williams <gareth.williams.jx@renesas.com>
Cc:     linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v2 6/7] ARM: dts: r9a06g032: Add the USBF controller node
Date:   Mon, 14 Nov 2022 12:15:12 +0100
Message-Id: <20221114111513.1436165-7-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221114111513.1436165-1-herve.codina@bootlin.com>
References: <20221114111513.1436165-1-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add the USBF controller available in the r9a06g032 SoC.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 arch/arm/boot/dts/r9a06g032.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm/boot/dts/r9a06g032.dtsi b/arch/arm/boot/dts/r9a06g032.dtsi
index 563024c9a4ae..a4bb069457a3 100644
--- a/arch/arm/boot/dts/r9a06g032.dtsi
+++ b/arch/arm/boot/dts/r9a06g032.dtsi
@@ -117,6 +117,18 @@ dmamux: dma-router@a0 {
 			};
 		};
 
+		udc: usb@4001e000 {
+			compatible = "renesas,r9a06g032-usbf", "renesas,rzn1-usbf";
+			reg = <0x4001e000 0x2000>;
+			interrupts = <GIC_SPI 77 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 78 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&sysctrl R9A06G032_HCLK_USBF>,
+				 <&sysctrl R9A06G032_HCLK_USBPM>;
+			clock-names = "hclkf", "hclkpm";
+			power-domains = <&sysctrl>;
+			status = "disabled";
+		};
+
 		pci_usb: pci@40030000 {
 			compatible = "renesas,pci-r9a06g032", "renesas,pci-rzn1";
 			device_type = "pci";
-- 
2.38.1

