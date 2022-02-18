Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 006FDC4321E
	for <linux-clk@archiver.kernel.org>; Fri, 18 Feb 2022 18:12:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239031AbiBRSNI (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 18 Feb 2022 13:13:08 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:36306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238795AbiBRSNH (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 18 Feb 2022 13:13:07 -0500
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::227])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2237A36302;
        Fri, 18 Feb 2022 10:12:49 -0800 (PST)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id D5B1A20007;
        Fri, 18 Feb 2022 18:12:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1645207966;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=9DmvAJFX2U0qo86wiZbyP/58xIuEhZNsNjvYfvIL0Zw=;
        b=fXTIrpfk6ihAVCE7KFWybnOdSS6ItYmEU4QaNAGseyxApwFoy8+DrLW9qdXRGw/k+TtjVt
        MksSK4fQBIN34+DDaGatzQYxrlLS0tKUz0kzapVuiJFXr3H9bUYyb5DAkkkGCYSnkFzuOe
        LFf8eg3izI9lZl5/qEr9co0SYeYvTrzlijfAzvFf/DS1x5Ac49ppRcqB14n6QjmV+/280z
        gFtA3QOFomHR25ZozcbI7ozE6G6qgvQU15/EYbKEe1qP5LSfbnc19ZzThSw7dc2IjkmjaR
        WM93nCzFISLNB+MZAfHmkHeCdNJOTWLYBg2IOeHNp2har63SOYFprYtTVMVkvg==
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Viresh Kumar <vireshk@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Vinod Koul <vkoul@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Rob Herring <robh+dt@kernel.org>, <devicetree@vger.kernel.org>,
        dmaengine@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-clk@vger.kernel.org,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Milan Stevanovic <milan.stevanovic@se.com>,
        Jimmy Lalande <jimmy.lalande@se.com>,
        Laetitia MARIOTTINI <laetitia.mariottini@se.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH 8/8] ARM: dts: r9a06g032: Describe the DMA router
Date:   Fri, 18 Feb 2022 19:12:26 +0100
Message-Id: <20220218181226.431098-9-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220218181226.431098-1-miquel.raynal@bootlin.com>
References: <20220218181226.431098-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

There is a dmamux on this SoC which allows picking two different sources
for a single DMA request.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 arch/arm/boot/dts/r9a06g032.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/r9a06g032.dtsi b/arch/arm/boot/dts/r9a06g032.dtsi
index 640c3eb4bbcd..0eb12c3d9cfd 100644
--- a/arch/arm/boot/dts/r9a06g032.dtsi
+++ b/arch/arm/boot/dts/r9a06g032.dtsi
@@ -59,6 +59,13 @@ ext_rtc_clk: extrtcclk {
 		clock-frequency = <0>;
 	};
 
+	dmamux: dma-router {
+		compatible = "renesas,rzn1-dmamux";
+		#dma-cells = <6>;
+		dma-requests = <32>;
+		dma-masters = <&dma0 &dma1>;
+	};
+
 	soc {
 		compatible = "simple-bus";
 		#address-cells = <1>;
-- 
2.27.0

