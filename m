Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D51DEB64DD
	for <linux-clk@archiver.kernel.org>; Sat,  5 Aug 2023 06:48:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229436AbjHEGsi (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 5 Aug 2023 02:48:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229570AbjHEGsh (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 5 Aug 2023 02:48:37 -0400
Received: from SHSQR01.spreadtrum.com (mx1.unisoc.com [222.66.158.135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D3D944B0
        for <linux-clk@vger.kernel.org>; Fri,  4 Aug 2023 23:48:34 -0700 (PDT)
Received: from dlp.unisoc.com ([10.29.3.86])
        by SHSQR01.spreadtrum.com with ESMTP id 3756mPhO000242;
        Sat, 5 Aug 2023 14:48:25 +0800 (+08)
        (envelope-from zhifeng.tang@unisoc.com)
Received: from SHDLP.spreadtrum.com (shmbx04.spreadtrum.com [10.0.1.214])
        by dlp.unisoc.com (SkyGuard) with ESMTPS id 4RHtR10WMGz2MxJxw;
        Sat,  5 Aug 2023 14:46:37 +0800 (CST)
Received: from xm9614pcu.spreadtrum.com (10.13.2.29) by shmbx04.spreadtrum.com
 (10.0.1.214) with Microsoft SMTP Server (TLS) id 15.0.1497.23; Sat, 5 Aug
 2023 14:48:24 +0800
From:   Zhifeng Tang <zhifeng.tang@unisoc.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        Zhifeng Tang <zhifeng.tang@unisoc.com>,
        Cixi Geng <cixi.geng1@unisoc.com>
CC:     <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Zhifeng Tang <zhifeng.tang23@gmail.com>,
        Wenming Wu <wenming.wu@unisoc.com>
Subject: [PATCH] clk: sprd: Fix thm_parents incorrect configuration
Date:   Sat, 5 Aug 2023 14:48:20 +0800
Message-ID: <20230805064820.30305-1-zhifeng.tang@unisoc.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.13.2.29]
X-ClientProxiedBy: SHCAS03.spreadtrum.com (10.0.1.207) To
 shmbx04.spreadtrum.com (10.0.1.214)
X-MAIL: SHSQR01.spreadtrum.com 3756mPhO000242
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The thm*_clk have two clock sources 32k and 250k,excluding 32m.

Signed-off-by: Zhifeng Tang <zhifeng.tang@unisoc.com>
---
 drivers/clk/sprd/ums512-clk.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/sprd/ums512-clk.c b/drivers/clk/sprd/ums512-clk.c
index fc25bdd85e4e..f43bb10bd5ae 100644
--- a/drivers/clk/sprd/ums512-clk.c
+++ b/drivers/clk/sprd/ums512-clk.c
@@ -800,7 +800,7 @@ static SPRD_MUX_CLK_DATA(uart1_clk, "uart1-clk", uart_parents,
 			 0x250, 0, 3, UMS512_MUX_FLAG);
 
 static const struct clk_parent_data thm_parents[] = {
-	{ .fw_name = "ext-32m" },
+	{ .fw_name = "ext-32k" },
 	{ .hw = &clk_250k.hw  },
 };
 static SPRD_MUX_CLK_DATA(thm0_clk, "thm0-clk", thm_parents,
-- 
2.17.1

