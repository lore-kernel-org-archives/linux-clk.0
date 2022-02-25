Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78A4CC433F5
	for <linux-clk@archiver.kernel.org>; Fri, 25 Feb 2022 11:24:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240073AbiBYLYz (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 25 Feb 2022 06:24:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240062AbiBYLYz (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 25 Feb 2022 06:24:55 -0500
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C562421EBBF;
        Fri, 25 Feb 2022 03:24:22 -0800 (PST)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id A8245FF80A;
        Fri, 25 Feb 2022 11:24:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1645788261;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=9DmvAJFX2U0qo86wiZbyP/58xIuEhZNsNjvYfvIL0Zw=;
        b=XUhlkgSpZSKwRwuiAHWutyIIxAVUTw7TtR7oD8sJ08p/H/VP1QBfFL+pThTCycV7jNr6Ht
        qj94LKBXG0VmQt/MwK23JSdL3dDE7ZzgVz6CcNAtKxsRfzHnd9WBFSnnYV2LtimuqAeG41
        tyS8uuVbi/PxeweBdm+J3fWyBcwPfgosurbnGggx1gJ8k1xEBMgKUp38I4bSL8xAv3GWQv
        4sUjswYRB9UGYZn90vjOnmdXtpKPdvKtADBpSbtPF93LRnCR0rBtbx3wrzwdJ+yUFcSn/f
        gDwmZYxDfTP++TJz4V8Vrg1qWwe4AoKbH9Fz5Tz8MHC/mVvQcTuzrmVElFFV1w==
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Vinod Koul <vkoul@kernel.org>, dmaengine@vger.kernel.org
Cc:     Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org,
        Milan Stevanovic <milan.stevanovic@se.com>,
        Jimmy Lalande <jimmy.lalande@se.com>,
        Pascal Eberhard <pascal.eberhard@se.com>,
        linux-renesas-soc@vger.kernel.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Gareth Williams <gareth.williams.jx@renesas.com>,
        Phil Edworthy <phil.edworthy@renesas.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v3 7/7] ARM: dts: r9a06g032: Describe the DMA router
Date:   Fri, 25 Feb 2022 12:24:02 +0100
Message-Id: <20220225112403.505562-8-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220225112403.505562-1-miquel.raynal@bootlin.com>
References: <20220225112403.505562-1-miquel.raynal@bootlin.com>
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

