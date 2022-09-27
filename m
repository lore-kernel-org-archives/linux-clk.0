Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E0DFC6FA83
	for <linux-clk@archiver.kernel.org>; Tue, 27 Sep 2022 14:06:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232237AbiI0OGt (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 27 Sep 2022 10:06:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230428AbiI0OGs (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 27 Sep 2022 10:06:48 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83730844CD;
        Tue, 27 Sep 2022 07:06:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1664287607; x=1695823607;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=EJD2YZgUmAt335tKHDPSaO3745w3AHIoRQ6NPXdMp0o=;
  b=L56DAlwMVPt/thbQT0xMk8aiXFYQ/oq+0kcT6rAZ1il6Hz9B+rixwwr1
   psFthvL8CqHmBO6jlLhIgyap2zGjeX5WqYK7sqjFWjS8kfhr4kulzA545
   HPWDqA05c01oN3nCCn5BQvVbtN5JsSoXuOcdd6uGUafJONYHHZyOPFs43
   P8pvHCsDS8/AGjjSaUq8JcGtbVkX1o3DmS6wotNUGHoPQDLlwNOKOXHCS
   nfcdU2bth/1g0/kRpEq/mWMqgZqHBQZNfc0YIprTL/rA4744SUSO8+wL0
   jXYJYRfZ3b7Kvo+lfLxod1/EikkXDih+7ViIniMnICkjyqMAkI94K1Hq0
   A==;
X-IronPort-AV: E=Sophos;i="5.93,349,1654552800"; 
   d="scan'208";a="26429607"
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
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=EJD2YZgUmAt335tKHDPSaO3745w3AHIoRQ6NPXdMp0o=;
  b=CJdyLca1j4fD28N9Y3hVN0EqMZryymNJG4KUXa2OZH9jhD+S014Iov5X
   qu2eh36AfbzTupIjAkPCCXzdDoYOxPtvJRaMTTp0kGk7E7k20KBTmOBjc
   xhDBRY5hlrVPB5OkjnhFpe0Yq6bsweiprAHMiQm4Yf8oJF7ziddRLJCdq
   Oi3HiWjYR6dlxLD9PBHIZmh4/cXibAKY3SV22ffdvtPK582XofE9onPZd
   I1+x+/SZp9iif8vPNsfZYOIaCd9v32skeSCrSDREETSGFw3n7jwEgZZQ0
   z/gP4fpfzKgvoxUCnsvFX1yU0ca2q2J2qkd3LrG8FMPcQ7j/jUhNkDDwh
   g==;
X-IronPort-AV: E=Sophos;i="5.93,349,1654552800"; 
   d="scan'208";a="26429606"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 27 Sep 2022 16:06:43 +0200
Received: from steina-w.tq-net.de (unknown [10.123.49.11])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 51E61280072;
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
Subject: [PATCH 2/2] clk: imx: imx8mq: Add hdmi phy 27m as proper hw clock
Date:   Tue, 27 Sep 2022 16:06:38 +0200
Message-Id: <20220927140638.2759111-2-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220927140638.2759111-1-alexander.stein@ew.tq-group.com>
References: <20220927140638.2759111-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

So it can be referenced by IMX8MQ_CLK_HDMI_PHY_27MHZ in device tree files.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 drivers/clk/imx/clk-imx8mq.c             | 1 +
 include/dt-bindings/clock/imx8mq-clock.h | 3 ++-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/imx/clk-imx8mq.c b/drivers/clk/imx/clk-imx8mq.c
index 783f98b05441..7cecb964cf1f 100644
--- a/drivers/clk/imx/clk-imx8mq.c
+++ b/drivers/clk/imx/clk-imx8mq.c
@@ -305,6 +305,7 @@ static int imx8mq_clocks_probe(struct platform_device *pdev)
 	hws[IMX8MQ_CLK_EXT2] = imx_obtain_fixed_clk_hw(np, "clk_ext2");
 	hws[IMX8MQ_CLK_EXT3] = imx_obtain_fixed_clk_hw(np, "clk_ext3");
 	hws[IMX8MQ_CLK_EXT4] = imx_obtain_fixed_clk_hw(np, "clk_ext4");
+	hws[IMX8MQ_CLK_HDMI_PHY_27MHZ] = imx_obtain_fixed_clk_hw(np, "hdmi_phy_27m");
 
 	np = of_find_compatible_node(NULL, NULL, "fsl,imx8mq-anatop");
 	base = of_iomap(np, 0);
diff --git a/include/dt-bindings/clock/imx8mq-clock.h b/include/dt-bindings/clock/imx8mq-clock.h
index afa74d7ba100..6401cc836c31 100644
--- a/include/dt-bindings/clock/imx8mq-clock.h
+++ b/include/dt-bindings/clock/imx8mq-clock.h
@@ -425,7 +425,8 @@
 #define IMX8MQ_CLK_MON_VIDEO_PLL2_DIV		300
 #define IMX8MQ_CLK_MON_SEL			301
 #define IMX8MQ_CLK_MON_CLK2_OUT			302
+#define IMX8MQ_CLK_HDMI_PHY_27MHZ		303
 
-#define IMX8MQ_CLK_END				303
+#define IMX8MQ_CLK_END				304
 
 #endif /* __DT_BINDINGS_CLOCK_IMX8MQ_H */
-- 
2.25.1

