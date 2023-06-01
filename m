Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDC68C7EE33
	for <linux-clk@archiver.kernel.org>; Thu,  1 Jun 2023 10:17:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232774AbjFAKRO (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 1 Jun 2023 06:17:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233404AbjFAKQs (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 1 Jun 2023 06:16:48 -0400
X-Greylist: delayed 663 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 01 Jun 2023 03:14:09 PDT
Received: from mail-m11880.qiye.163.com (mail-m11880.qiye.163.com [115.236.118.80])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4CD80E7B;
        Thu,  1 Jun 2023 03:14:08 -0700 (PDT)
Received: from localhost.localdomain (unknown [58.22.7.114])
        by mail-m11880.qiye.163.com (Hmail) with ESMTPA id 49C1420476;
        Thu,  1 Jun 2023 17:55:13 +0800 (CST)
From:   Elaine Zhang <zhangqing@rock-chips.com>
To:     mturquette@baylibre.com, sboyd@kernel.org,
        kever.yang@rock-chips.com, zhangqing@rock-chips.com,
        heiko@sntech.de
Cc:     linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        huangtao@rock-chips.com
Subject: [PATCH v1] clk: clk-fractional-divider: Export clk_fractional_divider_general_approximation API
Date:   Thu,  1 Jun 2023 17:55:12 +0800
Message-Id: <20230601095512.18029-1-zhangqing@rock-chips.com>
X-Mailer: git-send-email 2.17.1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
        tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQ01MS1ZJSxpJHR4eHU1OGBhVEwETFh
        oSFyQUDg9ZV1kYEgtZQVlOQ1VJSVVMVUpKT1lXWRYaDxIVHRRZQVlPS0hVSk5NQkhOVUpLS1VLWQ
        Y+
X-HM-Tid: 0a887661fdb52eb6kusn49c1420476
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Pwg6Tio*Dj1PDD8NNUktC0MD
        CE5PCxVVSlVKTUNOTUpISEpPSkpKVTMWGhIXVQETGhUcChIVHDsJFBgQVhgTEgsIVRgUFkVZV1kS
        C1lBWU5DVUlJVUxVSkpPWVdZCAFZQUpMTkw3Bg++
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

This is used by the Rockchip clk driver, export it to allow that
driver to be compiled as a module.

Signed-off-by: Elaine Zhang <zhangqing@rock-chips.com>
---
 drivers/clk/clk-fractional-divider.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/clk-fractional-divider.c b/drivers/clk/clk-fractional-divider.c
index 479297763e70..44bf21c97034 100644
--- a/drivers/clk/clk-fractional-divider.c
+++ b/drivers/clk/clk-fractional-divider.c
@@ -142,6 +142,7 @@ void clk_fractional_divider_general_approximation(struct clk_hw *hw,
 			GENMASK(fd->mwidth - 1, 0), GENMASK(fd->nwidth - 1, 0),
 			m, n);
 }
+EXPORT_SYMBOL_GPL(clk_fractional_divider_general_approximation);
 
 static long clk_fd_round_rate(struct clk_hw *hw, unsigned long rate,
 			      unsigned long *parent_rate)
-- 
2.17.1

