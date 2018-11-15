Return-Path: <SRS0=YASP=N2=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12E44C43441
	for <linux-clk@archiver.kernel.org>; Thu, 15 Nov 2018 14:38:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B45A52086B
	for <linux-clk@archiver.kernel.org>; Thu, 15 Nov 2018 14:38:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B45A52086B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sntech.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387833AbeKPAqh (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 15 Nov 2018 19:46:37 -0500
Received: from gloria.sntech.de ([185.11.138.130]:42586 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729034AbeKPAqh (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 15 Nov 2018 19:46:37 -0500
Received: from we0660.dip.tu-dresden.de ([141.76.178.148] helo=phil.dip.tu-dresden.de)
        by gloria.sntech.de with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <heiko@sntech.de>)
        id 1gNImi-0004z9-53; Thu, 15 Nov 2018 15:38:20 +0100
From:   Heiko Stuebner <heiko@sntech.de>
To:     linux-clk@vger.kernel.org
Cc:     linux-rockchip@lists.infradead.org, mturquette@baylibre.com,
        sboyd@kernel.org, Mark Yao <mark.yao@rock-chips.com>,
        Heiko Stuebner <heiko@sntech.de>
Subject: [PATCH] clk: rockchip: make rk3188 hclk_vio_bus critical
Date:   Thu, 15 Nov 2018 15:38:15 +0100
Message-Id: <20181115143815.23717-1-heiko@sntech.de>
X-Mailer: git-send-email 2.18.0
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Mark Yao <mark.yao@rock-chips.com>

Vop register access request hclk_vio_bus.

Signed-off-by: Mark Yao <mark.yao@rock-chips.com>
Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
Picked from the vendor kernel and already applied, as I also
needed that to make my rk3188 tablet's display work.

 drivers/clk/rockchip/clk-rk3188.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/rockchip/clk-rk3188.c b/drivers/clk/rockchip/clk-rk3188.c
index 7c6af8e25b0c..7ea20341e870 100644
--- a/drivers/clk/rockchip/clk-rk3188.c
+++ b/drivers/clk/rockchip/clk-rk3188.c
@@ -757,7 +757,8 @@ static const char *const rk3188_critical_clocks[] __initconst = {
 	"hclk_peri",
 	"pclk_cpu",
 	"pclk_peri",
-	"hclk_cpubus"
+	"hclk_cpubus",
+	"hclk_vio_bus",
 };
 
 static struct rockchip_clk_provider *__init rk3188_common_clk_init(struct device_node *np)
-- 
2.18.0

