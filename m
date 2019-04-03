Return-Path: <SRS0=fESv=SF=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58F3EC4360F
	for <linux-clk@archiver.kernel.org>; Wed,  3 Apr 2019 09:29:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1D8A921473
	for <linux-clk@archiver.kernel.org>; Wed,  3 Apr 2019 09:29:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1554283799;
	bh=zGUF1m3WA3VUPWVAWSmHHzvHP1squaALr8SRgKwuNRU=;
	h=From:To:Cc:Subject:Date:List-ID:From;
	b=HCd7Zgd1UzhPnmlLBDHXc/G6nst+cJSHz5r8B7zQlMXBz192qf9jC8selTxd4SmGx
	 0FP0v6YsXw2YUXCuNghqlIbxnRDlqryZAhty56f1B8ZayHlArx0oMb6pw6WxCAHV9K
	 PYiSkMOX8EMOupnb5WPCs+WDctb8rvVqn+HxbCmc=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726167AbfDCJ36 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 3 Apr 2019 05:29:58 -0400
Received: from mail.kernel.org ([198.145.29.99]:40260 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725956AbfDCJ36 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 3 Apr 2019 05:29:58 -0400
Received: from X250.imgcgcw.net (unknown [147.50.13.10])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 679BF2082C;
        Wed,  3 Apr 2019 09:29:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1554283798;
        bh=zGUF1m3WA3VUPWVAWSmHHzvHP1squaALr8SRgKwuNRU=;
        h=From:To:Cc:Subject:Date:From;
        b=abRYNAEDodhdBstF0uB08QLPaqyBW6gw68TFmTDeRcczNQPk62FiX+0SjqwfGCDi1
         J9LFV5v68RA2HWrSDsR5Ddzl1PKB8X7Jjd72d+V5XlAzYaBJA2hBzlBjlTcVfp74VU
         S3XytVS/QBiwcVUrWv4/ywCzz6nOqv0wMCg1pb+8=
From:   Shawn Guo <shawnguo@kernel.org>
To:     linux-clk@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org,
        Stephen Boyd <sboyd@kernel.org>,
        Fabio Estevam <festevam@gmail.com>, kernel@pengutronix.de,
        linux-imx@nxp.com, Shawn Guo <shawnguo@kernel.org>
Subject: [PATCH] clk: imx: rename clk-imx51-imx53.c to clk-imx5.c
Date:   Wed,  3 Apr 2019 16:29:48 +0700
Message-Id: <20190403092948.26186-1-shawnguo@kernel.org>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

As the driver is handling all i.MX5 series SoCs inlcuding i.MX50, rather
than just i.MX51 and i.MX53, let's rename it to clk-imx5.c.

Signed-off-by: Shawn Guo <shawnguo@kernel.org>
---
 drivers/clk/imx/Makefile                          | 2 +-
 drivers/clk/imx/{clk-imx51-imx53.c => clk-imx5.c} | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename drivers/clk/imx/{clk-imx51-imx53.c => clk-imx5.c} (100%)

diff --git a/drivers/clk/imx/Makefile b/drivers/clk/imx/Makefile
index 0d5180fbe988..05641c64b317 100644
--- a/drivers/clk/imx/Makefile
+++ b/drivers/clk/imx/Makefile
@@ -35,7 +35,7 @@ obj-$(CONFIG_SOC_IMX25)  += clk-imx25.o
 obj-$(CONFIG_SOC_IMX27)  += clk-imx27.o
 obj-$(CONFIG_SOC_IMX31)  += clk-imx31.o
 obj-$(CONFIG_SOC_IMX35)  += clk-imx35.o
-obj-$(CONFIG_SOC_IMX5)   += clk-imx51-imx53.o
+obj-$(CONFIG_SOC_IMX5)   += clk-imx5.o
 obj-$(CONFIG_SOC_IMX6Q)  += clk-imx6q.o
 obj-$(CONFIG_SOC_IMX6SL) += clk-imx6sl.o
 obj-$(CONFIG_SOC_IMX6SLL) += clk-imx6sll.o
diff --git a/drivers/clk/imx/clk-imx51-imx53.c b/drivers/clk/imx/clk-imx5.c
similarity index 100%
rename from drivers/clk/imx/clk-imx51-imx53.c
rename to drivers/clk/imx/clk-imx5.c
-- 
2.19.1

