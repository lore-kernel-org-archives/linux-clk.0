Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A84AAC6FD1D
	for <linux-clk@archiver.kernel.org>; Tue, 21 Mar 2023 13:55:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231317AbjCUNzz (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 21 Mar 2023 09:55:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231244AbjCUNzv (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 21 Mar 2023 09:55:51 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41D684FA92
        for <linux-clk@vger.kernel.org>; Tue, 21 Mar 2023 06:55:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1679406924; x=1710942924;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=rHSsFFLzvJOIk/IC2B/yzNA5kF3fMYLm3qlpsB04MMo=;
  b=T1tY7MPF/3JKJcNFCbmcY7UBgHNHwpG7P76t0Zrpn5TAxkr1FkYUxl7j
   1oI/iTk4pOGndjEExPtsjJ8QayDH8SIyeS5wpXLkYpWrJcvLRUgaAnoRg
   cCPmzeCPGb0+1iGiARWUGP/3FNQdlpK7xDAKoq7+JCsTramTeatIkoppm
   pjZZjyFKAF0uoyEwgX7rat4esxDgTRwnAzhrDLq77IkECm5uFBfwp97t5
   40MTyZBc5Z/yYnAfwmuhKaOyOxA5OQbQZuHWQqaamQgD2RP9BFzYCvDUs
   KUuFjSHWmoQ6AYwLarjoASBxb+E6OItuRXb3XhtuIiM3tyik1z9dQ99ko
   Q==;
X-IronPort-AV: E=Sophos;i="5.98,279,1673910000"; 
   d="scan'208";a="29834292"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 21 Mar 2023 14:54:16 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Tue, 21 Mar 2023 14:54:16 +0100
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Tue, 21 Mar 2023 14:54:16 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1679406856; x=1710942856;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=rHSsFFLzvJOIk/IC2B/yzNA5kF3fMYLm3qlpsB04MMo=;
  b=DHfjHV4YPQB9XJBNW4NTcKRgp6OYlqNTCxuB3qjwfgMKPHwkdo/u+XGK
   PsbXqp87vNvG+FYZPqWwkBU5mTkpuFe2T2DOiQERDRqpprH3fDd0yEU0I
   Jcy2O+gSJvbe4aA/pdYqt4IiD3jLTxmUsqJVW59brNufVCrv0ZpKuQnoK
   re5+OxQpN1XNzLhPBB20XWR2Cs+9sBrE8yryf5Brw5v7QvaxXinrmQayh
   DW7BOVRrnX56ar0xozzuB1fcZRkeULICci9W3c8rP1JL5EdXKdDMNCUz2
   xMAswpZ1zQemor9dtcx3zrJD/LTOcry9lYFR3Ux7Es9CWAvA5bhEHR4oi
   Q==;
X-IronPort-AV: E=Sophos;i="5.98,279,1673910000"; 
   d="scan'208";a="29834291"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 21 Mar 2023 14:54:16 +0100
Received: from steina-w.tq-net.de (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id D313D280056;
        Tue, 21 Mar 2023 14:54:15 +0100 (CET)
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
Subject: [PATCH 1/1] clk: imx6ul: retain early UART clocks during kernel init
Date:   Tue, 21 Mar 2023 14:53:24 +0100
Message-Id: <20230321135324.1286359-1-alexander.stein@ew.tq-group.com>
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
Apparently i.MX6UL was missed in commit 0822f933735c ("clk: imx6: retain
early UART clocks during kernel init"). But as commit 379c9a24cc23 ("clk:
imx: Fix reparenting of UARTs not associated with stdout") changes the
calling signature it's not warranting a Fixes for the old commit.

 drivers/clk/imx/clk-imx6ul.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/imx/clk-imx6ul.c b/drivers/clk/imx/clk-imx6ul.c
index 206e4c43f68f..26578e407d3e 100644
--- a/drivers/clk/imx/clk-imx6ul.c
+++ b/drivers/clk/imx/clk-imx6ul.c
@@ -510,6 +510,8 @@ static void __init imx6ul_clocks_init(struct device_node *ccm_node)
 		clk_set_parent(hws[IMX6ULL_CLK_EPDC_PRE_SEL]->clk, hws[IMX6UL_CLK_PLL3_PFD2]->clk);
 
 	clk_set_parent(hws[IMX6UL_CLK_ENFC_SEL]->clk, hws[IMX6UL_CLK_PLL2_PFD2]->clk);
+
+	imx_register_uart_clocks(2);
 }
 
 CLK_OF_DECLARE(imx6ul, "fsl,imx6ul-ccm", imx6ul_clocks_init);
-- 
2.34.1

