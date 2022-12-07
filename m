Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97B94C4708E
	for <linux-clk@archiver.kernel.org>; Wed,  7 Dec 2022 16:24:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229972AbiLGQYu (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 7 Dec 2022 11:24:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229762AbiLGQYs (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 7 Dec 2022 11:24:48 -0500
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26AC127CFA;
        Wed,  7 Dec 2022 08:24:47 -0800 (PST)
Received: (Authenticated sender: herve.codina@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPA id 500AA40009;
        Wed,  7 Dec 2022 16:24:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1670430285;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=9LRHjpfGj+HDdjJnVaxhTILYasE6yuBGE7Rp83TGivU=;
        b=jsmrA0urGZbj6X5VOvfY1CuMF2ZgHnn+6tnTV5YbB8b8sp3bTzIiqPQtQuuBZTWmuEKrgW
        y+zC4LqXixyAQQbmn8uJGov3bDSw4n2gEyMi8u4SX771zSbI0iEFnH9OImr05i5KBBBDPO
        9lt0DXAtou7NfHnTuTk5K7ShC1KrnL/tB8nMBwfkXJ6jEHXZAKa9FWLWO9TvydZD7fMiox
        o7xAlI1QV2oXYKthcV2beGLcHKz8EO5020WGCnISHY+OZB6egmif/FukTsyiNu3Wfa6+sE
        AuiBmOB6TTiw+xKMo9CAs+E18UVdC46nVwdlzz8Snim3HILF1fu1dpwL9rn0pA==
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
Subject: [PATCH v3 2/9] ARM: dts: r9a06g032: Add dependency to sysctrl in the PCI bridge
Date:   Wed,  7 Dec 2022 17:24:28 +0100
Message-Id: <20221207162435.1001782-3-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221207162435.1001782-1-herve.codina@bootlin.com>
References: <20221207162435.1001782-1-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

In r9a06g032 (RZ/N1 SoC family), the USB hosts are impacted by
the h2mode setting. This setting will be done at sysctrl level
and must not be done while USB hosts are running.

Express this dependency using 'depends-on' property.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 arch/arm/boot/dts/r9a06g032.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/r9a06g032.dtsi b/arch/arm/boot/dts/r9a06g032.dtsi
index 563024c9a4ae..401c88bcdd51 100644
--- a/arch/arm/boot/dts/r9a06g032.dtsi
+++ b/arch/arm/boot/dts/r9a06g032.dtsi
@@ -125,6 +125,7 @@ pci_usb: pci@40030000 {
 				 <&sysctrl R9A06G032_CLK_PCI_USB>;
 			clock-names = "hclkh", "hclkpm", "pciclk";
 			power-domains = <&sysctrl>;
+			depends-on = <&sysctrl>;
 			reg = <0x40030000 0xc00>,
 			      <0x40020000 0x1100>;
 			interrupts = <GIC_SPI 79 IRQ_TYPE_LEVEL_HIGH>;
-- 
2.38.1

