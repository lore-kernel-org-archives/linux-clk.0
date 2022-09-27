Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CC2DC07E9D
	for <linux-clk@archiver.kernel.org>; Tue, 27 Sep 2022 14:06:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231708AbiI0OGs (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 27 Sep 2022 10:06:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230428AbiI0OGr (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 27 Sep 2022 10:06:47 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4537174E1E;
        Tue, 27 Sep 2022 07:06:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1664287605; x=1695823605;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=AHdQCG7UYP15dwdQ932w0yXhLV0rUNQi/QcnWo6xWHk=;
  b=VteeXjUQEvSPlTtlcSEHf3E4tILgMtRNFY4do9s0p7BaTmt3aSMjl5Lv
   y08FNXyvkLvWv6Bz4iLOAd6lILmEII3q9n05WHklWbB4B2AH93nfo87Li
   hAs6pOZOazJ5UyxVJGwIfhOrbe2Hs46vJcH4LVQZX3on/Mm5kIYPhFaaW
   tSVxuQxNkScdzMmFfphQcrZ9Bhhkphn7VMEJYcYSXRfpr9q/V5VRaqEdY
   1qzo1hJyz4AERsuYUXwaULdjNzcBdvMUMgZR0euQaadblCvn6a74VnrRQ
   f30Yp5mhB3ed2Pu1bB/+cwluLAI1qnrcO15IVqFS6/5ws/U+88m5ewD+6
   w==;
X-IronPort-AV: E=Sophos;i="5.93,349,1654552800"; 
   d="scan'208";a="26429605"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 27 Sep 2022 16:06:43 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Tue, 27 Sep 2022 16:06:43 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Tue, 27 Sep 2022 16:06:43 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1664287603; x=1695823603;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=AHdQCG7UYP15dwdQ932w0yXhLV0rUNQi/QcnWo6xWHk=;
  b=mbXQSS/TyPqHd2wUKW998OSD7Bo6mlXKIp37a5uw/F4qrhIQC9GgRwzQ
   4cTpKCbLLaZ0mF6DHeqGgi8213ySCJIAl1mAW10RB9on3BZdniMUcA+c5
   VbaZgUHOZLmk7JANP2DKXn8AG1aAey2/XpU9/BZsJFphbazCihpIZDZwY
   qU6qsC00Hyk/uARI7dU7AnHXi1Usq8FUI2vAXziEEwjDWbXTHh/RZd4NR
   JRmA+CK6J/LT9OryOHEuJQvMLzaE++E1/jOmu5ikooN9/sDyP1vAeNWCL
   XiIKtph5eidzM5pAGsTkdB7vRZAJs+SwntFDizZm2UGHoEWp8dlNVInB8
   w==;
X-IronPort-AV: E=Sophos;i="5.93,349,1654552800"; 
   d="scan'208";a="26429604"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 27 Sep 2022 16:06:43 +0200
Received: from steina-w.tq-net.de (unknown [10.123.49.11])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 0EE7A280056;
        Tue, 27 Sep 2022 16:06:43 +0200 (CEST)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org
Subject: [PATCH 1/2] arm64: dts: imx8mq: add hdmi phy 27m clock to clock-controller
Date:   Tue, 27 Sep 2022 16:06:37 +0200
Message-Id: <20220927140638.2759111-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Commit 5472b7df7c79 ("arm64: dts: imx8mq: add hdmi phy 27m clock") only
added a fixed clock, without adding it to the clock-controller.
This is a preparation for actually adding this as pll reference clock.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm64/boot/dts/freescale/imx8mq.dtsi | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mq.dtsi b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
index c486d66056a9..adf8d85526b8 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
@@ -645,10 +645,12 @@ clk: clock-controller@30380000 {
 				#clock-cells = <1>;
 				clocks = <&ckil>, <&osc_25m>, <&osc_27m>,
 				         <&clk_ext1>, <&clk_ext2>,
-				         <&clk_ext3>, <&clk_ext4>;
+				         <&clk_ext3>, <&clk_ext4>,
+					 <&hdmi_phy_27m>;
 				clock-names = "ckil", "osc_25m", "osc_27m",
 				              "clk_ext1", "clk_ext2",
-				              "clk_ext3", "clk_ext4";
+				              "clk_ext3", "clk_ext4",
+					      "hdmi_phy_27m";
 				assigned-clocks = <&clk IMX8MQ_CLK_A53_SRC>,
 						  <&clk IMX8MQ_CLK_A53_CORE>,
 						  <&clk IMX8MQ_CLK_NOC>,
-- 
2.25.1

