Return-Path: <SRS0=MD/5=PB=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_MUTT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 060D3C43387
	for <linux-clk@archiver.kernel.org>; Mon, 24 Dec 2018 06:39:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AD82E2173B
	for <linux-clk@archiver.kernel.org>; Mon, 24 Dec 2018 06:39:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725927AbeLXGjz (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 24 Dec 2018 01:39:55 -0500
Received: from gateway33.websitewelcome.com ([192.185.145.216]:23939 "EHLO
        gateway33.websitewelcome.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725922AbeLXGjz (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 24 Dec 2018 01:39:55 -0500
X-Greylist: delayed 1500 seconds by postgrey-1.27 at vger.kernel.org; Mon, 24 Dec 2018 01:39:54 EST
Received: from cm17.websitewelcome.com (cm17.websitewelcome.com [100.42.49.20])
        by gateway33.websitewelcome.com (Postfix) with ESMTP id 430DE2EC229
        for <linux-clk@vger.kernel.org>; Sun, 23 Dec 2018 23:51:05 -0600 (CST)
Received: from gator4166.hostgator.com ([108.167.133.22])
        by cmsmtp with SMTP
        id bJ8rgy4cw90onbJ8rgVIng; Sun, 23 Dec 2018 23:51:05 -0600
X-Authority-Reason: nr=8
Received: from [189.250.106.44] (port=49820 helo=embeddedor)
        by gator4166.hostgator.com with esmtpa (Exim 4.91)
        (envelope-from <gustavo@embeddedor.com>)
        id 1gbJ8q-00478n-9u; Sun, 23 Dec 2018 23:51:04 -0600
Date:   Sun, 23 Dec 2018 23:50:58 -0600
From:   "Gustavo A. R. Silva" <gustavo@embeddedor.com>
To:     Jolly Shah <jolly.shah@xilinx.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Michal Simek <michal.simek@xilinx.com>
Cc:     linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: [PATCH] clk: zynqmp: Fix memory allocation in zynqmp_clk_setup
Message-ID: <20181224055058.GA23947@embeddedor.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 189.250.106.44
X-Source-L: No
X-Exim-ID: 1gbJ8q-00478n-9u
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: (embeddedor) [189.250.106.44]:49820
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 10
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Fix memory allocation and use struct_size() in kzalloc().

Fixes: 3fde0e16d016 ("drivers: clk: Add ZynqMP clock driver")
Cc: stable@vger.kernel.org
Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
---
 drivers/clk/zynqmp/clkc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/zynqmp/clkc.c b/drivers/clk/zynqmp/clkc.c
index f65cc0ff76ab..b0908ec62f73 100644
--- a/drivers/clk/zynqmp/clkc.c
+++ b/drivers/clk/zynqmp/clkc.c
@@ -669,8 +669,8 @@ static int zynqmp_clk_setup(struct device_node *np)
 	if (ret)
 		return ret;
 
-	zynqmp_data = kzalloc(sizeof(*zynqmp_data) + sizeof(*zynqmp_data) *
-						clock_max_idx, GFP_KERNEL);
+	zynqmp_data = kzalloc(struct_size(zynqmp_data, hws, clock_max_idx),
+			      GFP_KERNEL);
 	if (!zynqmp_data)
 		return -ENOMEM;
 
-- 
2.17.0

