Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7226EB64DD
	for <linux-clk@archiver.kernel.org>; Fri,  4 Aug 2023 03:01:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232413AbjHDDBF (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 3 Aug 2023 23:01:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232787AbjHDDAz (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 3 Aug 2023 23:00:55 -0400
X-Greylist: delayed 574 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 03 Aug 2023 20:00:45 PDT
Received: from mail-m12739.qiye.163.com (mail-m12739.qiye.163.com [115.236.127.39])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B7E44234;
        Thu,  3 Aug 2023 20:00:39 -0700 (PDT)
Received: from localhost.localdomain (unknown [58.22.7.114])
        by mail-m12739.qiye.163.com (Hmail) with ESMTPA id 073064A018F;
        Fri,  4 Aug 2023 10:51:03 +0800 (CST)
From:   Elaine Zhang <zhangqing@rock-chips.com>
To:     mturquette@baylibre.com, sboyd@kernel.org,
        kever.yang@rock-chips.com, zhangqing@rock-chips.com,
        heiko@sntech.de, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-kernel@vger.kernel.org, huangtao@rock-chips.com
Subject: [RESEND PATCH v3 3/4] dt-bindings: clock: rk3588: export PCLK_VO1GRF clk id
Date:   Fri,  4 Aug 2023 10:51:01 +0800
Message-Id: <20230804025101.28438-1-zhangqing@rock-chips.com>
X-Mailer: git-send-email 2.17.1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
        tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGRgeS1YaGUhNTU8eQ08ZSUJVEwETFh
        oSFyQUDg9ZV1kYEgtZQVlOQ1VJSVVMVUpKT1lXWRYaDxIVHRRZQVlPS0hVSk1PSU5JVUpLS1VKQl
        kG
X-HM-Tid: 0a89be74a732b212kuuu073064a018f
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6NiI6Eww*HD1ICi4eEjoeNR1J
        H04aCipVSlVKTUJKSkpMT01IQ0JJVTMWGhIXVQETGhUcChIVHDsJFBgQVhgTEgsIVRgUFkVZV1kS
        C1lBWU5DVUlJVUxVSkpPWVdZCAFZQUpCQk83Bg++
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

