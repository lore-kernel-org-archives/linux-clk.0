Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70300C4332F
	for <linux-clk@archiver.kernel.org>; Tue, 18 Jan 2022 20:30:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349231AbiARUaW (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 18 Jan 2022 15:30:22 -0500
Received: from phobos.denx.de ([85.214.62.61]:50856 "EHLO phobos.denx.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230264AbiARUaV (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 18 Jan 2022 15:30:21 -0500
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 231F283878;
        Tue, 18 Jan 2022 21:30:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1642537819;
        bh=544BxrUuj6LbHblbcR7osiHCm7h4aMKpTHRAZpU0RZc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=iFQX7wiE0F51PFeNxyzHScsIx9MvzkTYau8w4o7YxOgfvScWqfQ5heUJtnj/KVRFu
         oS1XeuIN4NM8FexfHUXs+nkwEOM0Juc+Kv+oRLXwn6PPx1v9UCShEcqkkyv25jnD1p
         vMREI/hunZgkTSj/MoXee50tPZPvNF9LxrXKDazZjmorwP9NOfapynG/fij3s8THNG
         vUHN+D9LTbIjOviTahJsfyY6q4kXNEdSGCFbfgd+Di/e5Tsrs8Xlzrfx6uDkwmyzMk
         B4RgtD6XUCjK7X8PDQSxhvyAZGuhcgI87rPz87efe4DclQHFkNo9fv6pArg6fClMXv
         92Ic/A+kECV3A==
From:   Marek Vasut <marex@denx.de>
To:     linux-arm-kernel@lists.infradead.org
Cc:     jneuhauser@dh-electronics.com, Marek Vasut <marex@denx.de>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Christophe Roullier <christophe.roullier@foss.st.com>,
        Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
        Patrice Chotard <patrice.chotard@foss.st.com>,
        Patrick Delaunay <patrick.delaunay@foss.st.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH 5/5] ARM: dts: stm32: Switch DWMAC RMII clock to MCO2 on DHCOM
Date:   Tue, 18 Jan 2022 21:29:58 +0100
Message-Id: <20220118202958.1840431-5-marex@denx.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220118202958.1840431-1-marex@denx.de>
References: <20220118202958.1840431-1-marex@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The DHCOM SoM has two options for supplying ETHRX clock to the DWMAC
block and PHY. Either (1) ETHCK_K generates 50 MHz clock on ETH_CLK
pad for the PHY and the same 50 MHz clock are fed back to ETHRX via
internal eth_clk_fb clock connection OR (2) ETH_CLK is not used at
all, MCO2 generates 50 MHz clock on MCO2 output pad for the PHY and
the same MCO2 clock are fed back into ETHRX via ETH_RX_CLK input pad
using external pad-to-pad connection.

Option (1) has two downsides. ETHCK_K is supplied directly from either
PLL3_Q or PLL4_P, hence the PLL output is limited to exactly 50 MHz and
since the same PLL output is also used to supply SDMMC blocks, the
performance of SD and eMMC access is affected. The second downside is
that using this option, the EMI of the SoM is higher.

Option (2) solves both of those problems, so implement it here. In this
case, the PLL4_P is no longer limited and can be operated faster, at
100 MHz, which improves SDMMC performance (read performance is improved
from ~41 MiB/s to ~57 MiB/s with dd if=/dev/mmcblk1 of=/dev/null bs=64M
count=1). The EMI interference also decreases.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Christophe Roullier <christophe.roullier@foss.st.com>
Cc: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
Cc: Patrice Chotard <patrice.chotard@foss.st.com>
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org
Cc: linux-stm32@st-md-mailman.stormreply.com
To: linux-arm-kernel@lists.infradead.org
---
 arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi | 22 ++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi b/arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi
index 8c41f819f7769..b091d9901e976 100644
--- a/arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi
+++ b/arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi
@@ -116,15 +116,29 @@ &dts {
 	status = "okay";
 };
 
+&rcc {
+	/* Connect MCO2 output to ETH_RX_CLK input via pad-pad connection */
+	clocks = <&rcc CK_MCO2>;
+	clock-names = "ETH_RX_CLK/ETH_REF_CLK";
+
+	/*
+	 * Set PLL4P output to 100 MHz to supply SDMMC with faster clock,
+	 * set MCO2 output to 50 MHz to supply ETHRX clock with PLL4P/2,
+	 * so that MCO2 behaves as a divider for the ETHRX clock here.
+	 */
+	assigned-clocks = <&rcc CK_MCO2>, <&rcc PLL4_P>;
+	assigned-clock-parents = <&rcc PLL4_P>;
+	assigned-clock-rates = <50000000>, <100000000>;
+};
+
 &ethernet0 {
 	status = "okay";
-	pinctrl-0 = <&ethernet0_rmii_pins_a>;
-	pinctrl-1 = <&ethernet0_rmii_sleep_pins_a>;
+	pinctrl-0 = <&ethernet0_rmii_pins_b &mco2_pins_a>;
+	pinctrl-1 = <&ethernet0_rmii_sleep_pins_b &mco2_sleep_pins_a>;
 	pinctrl-names = "default", "sleep";
 	phy-mode = "rmii";
 	max-speed = <100>;
 	phy-handle = <&phy0>;
-	st,eth-ref-clk-sel;
 
 	mdio0 {
 		#address-cells = <1>;
@@ -136,7 +150,7 @@ phy0: ethernet-phy@1 {
 			/* LAN8710Ai */
 			compatible = "ethernet-phy-id0007.c0f0",
 				     "ethernet-phy-ieee802.3-c22";
-			clocks = <&rcc ETHCK_K>;
+			clocks = <&rcc CK_MCO2>;
 			reset-gpios = <&gpioh 3 GPIO_ACTIVE_LOW>;
 			reset-assert-us = <500>;
 			reset-deassert-us = <500>;
-- 
2.34.1

