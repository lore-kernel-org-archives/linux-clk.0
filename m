Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76BC1C04A6A
	for <linux-clk@archiver.kernel.org>; Fri, 28 Jul 2023 02:08:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232128AbjG1CIT (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 27 Jul 2023 22:08:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229939AbjG1CIS (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 27 Jul 2023 22:08:18 -0400
Received: from mail-m12739.qiye.163.com (mail-m12739.qiye.163.com [115.236.127.39])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A7412696;
        Thu, 27 Jul 2023 19:08:16 -0700 (PDT)
Received: from localhost.localdomain (unknown [58.22.7.114])
        by mail-m12739.qiye.163.com (Hmail) with ESMTPA id 683504A01BE;
        Fri, 28 Jul 2023 10:08:14 +0800 (CST)
From:   Elaine Zhang <zhangqing@rock-chips.com>
To:     mturquette@baylibre.com, sboyd@kernel.org,
        kever.yang@rock-chips.com, zhangqing@rock-chips.com,
        heiko@sntech.de
Cc:     linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        huangtao@rock-chips.com
Subject: [PATCH v2 2/3] dt-bindings: clock: rk3588: export PCLK_VO1GRF clk id
Date:   Fri, 28 Jul 2023 10:08:09 +0800
Message-Id: <20230728020810.29732-3-zhangqing@rock-chips.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230728020810.29732-1-zhangqing@rock-chips.com>
References: <20230728020810.29732-1-zhangqing@rock-chips.com>
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
        tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGUIeQlZPQk1OT08aSk4aSUJVEwETFh
        oSFyQUDg9ZV1kYEgtZQVlOQ1VJSVVMVUpKT1lXWRYaDxIVHRRZQVlPS0hVSk5MSUpJVUpLS1VKQl
        kG
X-HM-Tid: 0a899a40f0f9b212kuuu683504a01be
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6ORA6Cjo5Kj1JHjg5MzIhCVEj
        TxoaC0hVSlVKTUJLTkpLS0JOSU9KVTMWGhIXVQETGhUcChIVHDsJFBgQVhgTEgsIVRgUFkVZV1kS
        C1lBWU5DVUlJVUxVSkpPWVdZCAFZQUpDSEw3Bg++
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

add PCLK_VO1GRF clk id.

Signed-off-by: Elaine Zhang <zhangqing@rock-chips.com>
---
 include/dt-bindings/clock/rockchip,rk3588-cru.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/dt-bindings/clock/rockchip,rk3588-cru.h b/include/dt-bindings/clock/rockchip,rk3588-cru.h
index b5616bca7b44..864a321ab362 100644
--- a/include/dt-bindings/clock/rockchip,rk3588-cru.h
+++ b/include/dt-bindings/clock/rockchip,rk3588-cru.h
@@ -733,8 +733,9 @@
 #define ACLK_AV1_PRE			718
 #define PCLK_AV1_PRE			719
 #define HCLK_SDIO_PRE			720
+#define PCLK_VO1GRF			721
 
-#define CLK_NR_CLKS			(HCLK_SDIO_PRE + 1)
+#define CLK_NR_CLKS			(PCLK_VO1GRF + 1)
 
 /* scmi-clocks indices */
 
-- 
2.17.1

