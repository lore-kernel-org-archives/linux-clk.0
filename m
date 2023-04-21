Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC4BEC7618E
	for <linux-clk@archiver.kernel.org>; Fri, 21 Apr 2023 11:55:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229575AbjDULz2 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 21 Apr 2023 07:55:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230253AbjDULz1 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 21 Apr 2023 07:55:27 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 547E95251
        for <linux-clk@vger.kernel.org>; Fri, 21 Apr 2023 04:55:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1682078125; x=1713614125;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=S4ws0FzPH8SjDdWPwT3no8KmZrz65JddDqUiUhrKLr8=;
  b=qQqQkLQ4QVRaOcjik2DVHnA0koWgEKBWIZNl54wdGcleFfJ9jYv4Upm8
   4nA5c0VnNSQDvLuFpMkT1IlWDtmgzG4rO3rxypJ28H2EZTfH02k/Am8yi
   ay9UzGQAfvowmyss1hmYztmVC406agnv47IgBvtha39nl042TcW2d8m2x
   MhlEzOeBtjJAiySmL3ODJK1flM7DLmkbOuw/Vy8Ble8iLcgtADHCiL+Jl
   bKcPPQqQmZEpGUPjVrzG+dWZJFeynvf3uTbDeoeIG1Gvs1mx64T25Q3CW
   R3z5X1q0svkEjq2e7QC0SLwSDA4DvTX9tDqRKtAh8nm0NNyh+DB2sW1OX
   A==;
X-IronPort-AV: E=Sophos;i="5.99,214,1677538800"; 
   d="scan'208";a="30482432"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 21 Apr 2023 13:55:23 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Fri, 21 Apr 2023 13:55:23 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Fri, 21 Apr 2023 13:55:23 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1682078123; x=1713614123;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=S4ws0FzPH8SjDdWPwT3no8KmZrz65JddDqUiUhrKLr8=;
  b=K8RqZZzo1uwi9WKzxDgaP1j+eZvk/RXbSfWyK5Irw3WHOQQPE1PvHBOp
   umBUXpYN2jUCwiyYtQ5W5mDq1LqABaeyeLMokPBnUO9BnvSlecVv/E6KX
   fAKfsTOGEso013q3A6o+5uTLv7NVBIhmpu1MLf1wWokoVzfe5PDc5wtRs
   +8TZWhyWGFxFSu55iOD0zJ/r0CpETNz1xWwqirvYHL9ffxIyegZJAbjGU
   zf0wyWyNNvKA7A1Ts90jYOtwkUJBfRQXA99XcGlw4Ed2EalDVuAmFvdE4
   c1Tjma80eqDOp4AedxoDLltnFEzb4QtP04p51L7uguh6yiDIeG6PK38CG
   w==;
X-IronPort-AV: E=Sophos;i="5.99,214,1677538800"; 
   d="scan'208";a="30482431"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 21 Apr 2023 13:55:23 +0200
Received: from steina-w.tq-net.de (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 3916A280056;
        Fri, 21 Apr 2023 13:55:22 +0200 (CEST)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
Cc:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 1/1] clk: imx6ul: retain early UART clocks during kernel init
Date:   Fri, 21 Apr 2023 13:55:17 +0200
Message-Id: <20230421115517.1940990-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Make sure to keep UART clocks enabled during kernel init if
earlyprintk or earlycon are active.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
Changes in v2:
* Rebased to next-20230420

Apparently i.MX6UL was missed in commit 0822f933735c ("clk: imx6: retain
early UART clocks during kernel init"). But as commit 379c9a24cc23 ("clk:
imx: Fix reparenting of UARTs not associated with stdout") changes the
calling signature it's not warranting a Fixes for the old commit.

 drivers/clk/imx/clk-imx6ul.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/imx/clk-imx6ul.c b/drivers/clk/imx/clk-imx6ul.c
index e3696a88b5a3..f9394e94f69d 100644
--- a/drivers/clk/imx/clk-imx6ul.c
+++ b/drivers/clk/imx/clk-imx6ul.c
@@ -544,6 +544,8 @@ static void __init imx6ul_clocks_init(struct device_node *ccm_node)
 
 	clk_set_parent(hws[IMX6UL_CLK_ENET1_REF_SEL]->clk, hws[IMX6UL_CLK_ENET_REF]->clk);
 	clk_set_parent(hws[IMX6UL_CLK_ENET2_REF_SEL]->clk, hws[IMX6UL_CLK_ENET2_REF]->clk);
+
+	imx_register_uart_clocks();
 }
 
 CLK_OF_DECLARE(imx6ul, "fsl,imx6ul-ccm", imx6ul_clocks_init);
-- 
2.34.1

