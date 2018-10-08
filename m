Return-Path: <SRS0=r4nj=MU=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A268C65C20
	for <linux-clk@archiver.kernel.org>; Mon,  8 Oct 2018 12:02:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id EED502085B
	for <linux-clk@archiver.kernel.org>; Mon,  8 Oct 2018 12:02:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EED502085B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sntech.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726771AbeJHTOW (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 8 Oct 2018 15:14:22 -0400
Received: from gloria.sntech.de ([185.11.138.130]:33912 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727769AbeJHTOW (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 8 Oct 2018 15:14:22 -0400
Received: from wd0081.dip.tu-dresden.de ([141.76.108.81] helo=phil.dip.tu-dresden.de)
        by gloria.sntech.de with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <heiko@sntech.de>)
        id 1g9UFU-0002Im-Ga; Mon, 08 Oct 2018 14:02:56 +0200
From:   Heiko Stuebner <heiko@sntech.de>
To:     linux-clk@vger.kernel.org
Cc:     linux-rockchip@lists.infradead.org, mturquette@baylibre.com,
        sboyd@kernel.org, Heiko Stuebner <heiko@sntech.de>
Subject: [PATCH 2/2] clk: rockchip: use the newly added clock-id for hdmi on RK3066
Date:   Mon,  8 Oct 2018 14:02:47 +0200
Message-Id: <20181008120247.31242-2-heiko@sntech.de>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20181008120247.31242-1-heiko@sntech.de>
References: <20181008120247.31242-1-heiko@sntech.de>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Export the clock for devicetree usage via the newly added id.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 drivers/clk/rockchip/clk-rk3188.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/rockchip/clk-rk3188.c b/drivers/clk/rockchip/clk-rk3188.c
index 67e73fd71f09..fa25e35ce7d5 100644
--- a/drivers/clk/rockchip/clk-rk3188.c
+++ b/drivers/clk/rockchip/clk-rk3188.c
@@ -645,7 +645,7 @@ static struct rockchip_clk_branch rk3066a_clk_branches[] __initdata = {
 	GATE(HCLK_I2S1, "hclk_i2s1", "hclk_cpu", 0, RK2928_CLKGATE_CON(7), 3, GFLAGS),
 	GATE(HCLK_I2S2, "hclk_i2s2", "hclk_cpu", 0, RK2928_CLKGATE_CON(7), 4, GFLAGS),
 	GATE(HCLK_CIF1, "hclk_cif1", "hclk_cpu", 0, RK2928_CLKGATE_CON(6), 6, GFLAGS),
-	GATE(0, "hclk_hdmi", "hclk_cpu", 0, RK2928_CLKGATE_CON(4), 14, GFLAGS),
+	GATE(HCLK_HDMI, "hclk_hdmi", "hclk_cpu", 0, RK2928_CLKGATE_CON(4), 14, GFLAGS),
 
 	GATE(HCLK_OTG1, "hclk_usbotg1", "hclk_peri", CLK_IGNORE_UNUSED,
 			RK2928_CLKGATE_CON(5), 14, GFLAGS),
-- 
2.18.0

