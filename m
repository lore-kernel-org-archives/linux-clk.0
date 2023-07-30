Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F93FC00528
	for <linux-clk@archiver.kernel.org>; Sun, 30 Jul 2023 16:42:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229511AbjG3Ql7 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 30 Jul 2023 12:41:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229379AbjG3Ql6 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 30 Jul 2023 12:41:58 -0400
Received: from viti.kaiser.cx (viti.kaiser.cx [IPv6:2a01:238:43fe:e600:cd0c:bd4a:7a3:8e9f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04651170D;
        Sun, 30 Jul 2023 09:41:57 -0700 (PDT)
Received: from ipservice-092-217-095-237.092.217.pools.vodafone-ip.de ([92.217.95.237] helo=martin-debian-2.paytec.ch)
        by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <martin@kaiser.cx>)
        id 1qQ9UN-0003mQ-Lj; Sun, 30 Jul 2023 18:41:51 +0200
From:   Martin Kaiser <martin@kaiser.cx>
To:     Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Cc:     Shawn Guo <shawnguo@kernel.org>,
        Fabio Estevam <festevam@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH v6 1/2] clk: imx25: print silicon revision during init
Date:   Sun, 30 Jul 2023 18:39:27 +0200
Message-Id: <20230730163928.70637-2-martin@kaiser.cx>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230730163928.70637-1-martin@kaiser.cx>
References: <20220602080344.208702-1-martin@kaiser.cx>
 <20230730163928.70637-1-martin@kaiser.cx>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Print the imx25 silicon revision when the clocks are initialised.

Use the same mechanism as for imx27, i.e. call mx25_revision.
This function is unused at the moment.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
Reviewed-by: Fabio Estevam <festevam@gmail.com>
Acked-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/clk/imx/clk-imx25.c | 3 +++
 include/soc/imx/revision.h  | 1 +
 2 files changed, 4 insertions(+)

diff --git a/drivers/clk/imx/clk-imx25.c b/drivers/clk/imx/clk-imx25.c
index cc013b343e62..bee3da2e21e1 100644
--- a/drivers/clk/imx/clk-imx25.c
+++ b/drivers/clk/imx/clk-imx25.c
@@ -13,6 +13,7 @@
 #include <linux/of.h>
 #include <linux/of_address.h>
 #include <linux/of_irq.h>
+#include <soc/imx/revision.h>
 
 #include "clk.h"
 
@@ -220,6 +221,8 @@ static int __init __mx25_clocks_init(void __iomem *ccm_base)
 
 	imx_register_uart_clocks();
 
+	imx_print_silicon_rev("i.MX25", mx25_revision());
+
 	return 0;
 }
 
diff --git a/include/soc/imx/revision.h b/include/soc/imx/revision.h
index b2a55dafaf0a..b122d2fc8881 100644
--- a/include/soc/imx/revision.h
+++ b/include/soc/imx/revision.h
@@ -22,6 +22,7 @@
 #define IMX_CHIP_REVISION_3_3		0x33
 #define IMX_CHIP_REVISION_UNKNOWN	0xff
 
+int mx25_revision(void);
 int mx27_revision(void);
 int mx31_revision(void);
 int mx35_revision(void);
-- 
2.39.2

