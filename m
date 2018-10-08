Return-Path: <SRS0=r4nj=MU=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 021EFC676C4
	for <linux-clk@archiver.kernel.org>; Mon,  8 Oct 2018 12:02:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A8B082075C
	for <linux-clk@archiver.kernel.org>; Mon,  8 Oct 2018 12:02:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A8B082075C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sntech.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727772AbeJHTOV (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 8 Oct 2018 15:14:21 -0400
Received: from gloria.sntech.de ([185.11.138.130]:33908 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726771AbeJHTOV (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 8 Oct 2018 15:14:21 -0400
Received: from wd0081.dip.tu-dresden.de ([141.76.108.81] helo=phil.dip.tu-dresden.de)
        by gloria.sntech.de with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <heiko@sntech.de>)
        id 1g9UFU-0002Im-AR; Mon, 08 Oct 2018 14:02:56 +0200
From:   Heiko Stuebner <heiko@sntech.de>
To:     linux-clk@vger.kernel.org
Cc:     linux-rockchip@lists.infradead.org, mturquette@baylibre.com,
        sboyd@kernel.org, Heiko Stuebner <heiko@sntech.de>
Subject: [PATCH 1/2] clk: rockchip: add clock-id for HCLK_HDMI on rk3066
Date:   Mon,  8 Oct 2018 14:02:46 +0200
Message-Id: <20181008120247.31242-1-heiko@sntech.de>
X-Mailer: git-send-email 2.18.0
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

RK3066 and RK3188 share most of the clock controller but the rk3066 does
have an internal hdmi encoder and associated clock. Therefore add a
clock-id so that this clock can be used.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 include/dt-bindings/clock/rk3188-cru-common.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/dt-bindings/clock/rk3188-cru-common.h b/include/dt-bindings/clock/rk3188-cru-common.h
index b9462b7d3dfe..dc2101a634be 100644
--- a/include/dt-bindings/clock/rk3188-cru-common.h
+++ b/include/dt-bindings/clock/rk3188-cru-common.h
@@ -139,8 +139,9 @@
 #define HCLK_CIF1		470
 #define HCLK_VEPU		471
 #define HCLK_VDPU		472
+#define HCLK_HDMI		473
 
-#define CLK_NR_CLKS		(HCLK_VDPU + 1)
+#define CLK_NR_CLKS		(HCLK_HDMI + 1)
 
 /* soft-reset indices */
 #define SRST_MCORE		2
-- 
2.18.0

