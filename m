Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFE58CDB46E
	for <linux-clk@archiver.kernel.org>; Thu, 12 Oct 2023 08:31:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235431AbjJLIbc (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 12 Oct 2023 04:31:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235438AbjJLIbc (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 12 Oct 2023 04:31:32 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8E8198;
        Thu, 12 Oct 2023 01:31:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1697099489; x=1728635489;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=zWWVIxPGPN7/kPjQt8tis4KlrabHRamgrq1QMSJJnsE=;
  b=SNZb6ZMWXRkiLvtg3/ARc9U5Kkwy2UehZOhzUw+LUbQsckXsvV8czhCm
   SJ1nZKNeWLFZKfB/1qIwiYzBhonJYjl68Kmi/GXgBBqCa3n0wjtcIqhuF
   BNRQhYnbA3e3PGEME8rXSeagOo7VUCA/qmYVhG3hx/LfiAZztWbpR1BOP
   ODFKA3DbLgvAKVMMaiaGmWA6yls2iULOo1++6Chf2WIZ+k5CxnMS7RJA5
   xwxmJS7s7gizJJ1LJEnqvuNrlSqJL6F5J2RxRY39OLgZpE+5mLyBsmVpG
   fDydu76eTGT5iW84m5G5Suqo60vl/yDvMRuOWfagPAp9x6X+0GlWcPq3V
   g==;
X-IronPort-AV: E=Sophos;i="6.03,218,1694728800"; 
   d="scan'208";a="33423944"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 12 Oct 2023 10:31:24 +0200
Received: from steina-w.tq-net.de (steina-w.tq-net.de [10.123.53.18])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id E07B3280082;
        Thu, 12 Oct 2023 10:31:23 +0200 (CEST)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
Cc:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 2/3] arm64: dts: imx8mn: Add CCM interrupts
Date:   Thu, 12 Oct 2023 10:31:22 +0200
Message-Id: <20231012083123.2729494-3-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231012083123.2729494-1-alexander.stein@ew.tq-group.com>
References: <20231012083123.2729494-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add both CCM interrupts as mentioned in RM.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm64/boot/dts/freescale/imx8mn.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn.dtsi b/arch/arm64/boot/dts/freescale/imx8mn.dtsi
index 1bb1d0c1bae4d..136e75c51251a 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mn.dtsi
@@ -637,6 +637,8 @@ snvs_pwrkey: snvs-powerkey {
 			clk: clock-controller@30380000 {
 				compatible = "fsl,imx8mn-ccm";
 				reg = <0x30380000 0x10000>;
+				interrupts = <GIC_SPI 85 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
 				#clock-cells = <1>;
 				clocks = <&osc_32k>, <&osc_24m>, <&clk_ext1>, <&clk_ext2>,
 					 <&clk_ext3>, <&clk_ext4>;
-- 
2.34.1

