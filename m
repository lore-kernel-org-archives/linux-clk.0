Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA9F1C433EF
	for <linux-clk@archiver.kernel.org>; Wed, 22 Sep 2021 23:54:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 83159611CA
	for <linux-clk@archiver.kernel.org>; Wed, 22 Sep 2021 23:54:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230414AbhIVX43 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 22 Sep 2021 19:56:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230412AbhIVX43 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 22 Sep 2021 19:56:29 -0400
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7CEBC061574
        for <linux-clk@vger.kernel.org>; Wed, 22 Sep 2021 16:54:58 -0700 (PDT)
Received: by mail-pl1-x636.google.com with SMTP id w11so2812796plz.13
        for <linux-clk@vger.kernel.org>; Wed, 22 Sep 2021 16:54:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kruvS2DIrqO7gxRcBxYzkKWpnQ+/wLF9ZBKVA3jfG/8=;
        b=Aip4GRtqMOgOHs5jcbWacRkFEbwKFzjoK4kZApNxUHvpj5PVviGig4sgSwZOrpzIn6
         vth8ILdfrj6dQzGzxL+1NeA/usN2N8Y8wF0eQV0+85FF32ZHiYL8SsHcZiC8Tvzu7f1C
         OGz4g4a5ZGJtOGmMpAy1YU0ZNton7qh4ZGe7TatGnARc0uD9xl4QGo33mRMKd7+VSRkU
         F2B7YDCZfOQHs2GKzkUHK0RxCPRrawNFlhlH4yacAO3N02DstAg6+l1J1o01v4eVdGMT
         xLd2RrBbPvS02Wv33t/SdBuo4K01S9lYoHjoE7ISy4R8a/ZUXECLlvY09kVMgXTRDiRI
         B/gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=kruvS2DIrqO7gxRcBxYzkKWpnQ+/wLF9ZBKVA3jfG/8=;
        b=OyL1pt2ekmU7cSxfvmiNu6jPfPcCaAW0Qp5V4j8CZ/QLPiA+W6zE9WTGFkuko8UFvR
         E1V6bWSw/NckP2kRuSCIknBBjoXLgbF5hMRUF7E/PK1/rR0DwFeEurWvPm3XrIFM4Thz
         JhJpfwOKs2S8FrS1zEe8Sgrzl7/mTzDoJzT05mTfEueahzaD4MtUwnDQeDuVNAWj3xhM
         l5VwdscyTu2C45noDAcKATy4GOOMuKcFGm2lTZbl/XMRMCqO0wDUNFZAEJiZFkPPuCjn
         1uo9WAnUxodWg5l+4qRGlSCTiiRzHtFfvSRgl2lhrMjxOIJd+5R0LbX8pTcCqWAJJmbP
         r72w==
X-Gm-Message-State: AOAM533FuiS4stK7xfYRRUC+vhRpkpa+QzljqXU8DNSbZSMVQldRNuCI
        hx3Ad3wMiipFtnzfOXk+UKc=
X-Google-Smtp-Source: ABdhPJxu+Ni2pvvC9cNISYXnsMiVxPfBexOrc+HFG2GnQ+r+gMOzM2r+1m+64GkBPabfoEwes5xaWA==
X-Received: by 2002:a17:90a:c485:: with SMTP id j5mr1858983pjt.109.1632354898052;
        Wed, 22 Sep 2021 16:54:58 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.19])
        by smtp.gmail.com with ESMTPSA id p2sm4036013pgd.84.2021.09.22.16.54.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Sep 2021 16:54:57 -0700 (PDT)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
From:   Joel Stanley <joel@jms.id.au>
To:     Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Eddie James <eajames@linux.ibm.com>, linux-clk@vger.kernel.org,
        linux-aspeed@lists.ozlabs.org, BMC-SW@aspeedtech.com
Subject: [PATCH] clk/ast2600: Fix soc revision for AHB
Date:   Thu, 23 Sep 2021 09:24:49 +0930
Message-Id: <20210922235449.213631-1-joel@jms.id.au>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Move the soc revision parsing to the initial probe, saving the driver
from parsing the register multiple times.

Use this variable to select the correct divisor table for the AHB clock.
Before this fix the A2 would have used the A0 table.

Fixes: 2d491066ccd4 ("clk: ast2600: Fix AHB clock divider for A1")
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 drivers/clk/clk-ast2600.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/clk-ast2600.c b/drivers/clk/clk-ast2600.c
index bc3be5f3eae1..24dab2312bc6 100644
--- a/drivers/clk/clk-ast2600.c
+++ b/drivers/clk/clk-ast2600.c
@@ -51,6 +51,8 @@ static DEFINE_SPINLOCK(aspeed_g6_clk_lock);
 static struct clk_hw_onecell_data *aspeed_g6_clk_data;
 
 static void __iomem *scu_g6_base;
+/* AST2600 revision: A0, A1, A2, etc */
+static u8 soc_rev;
 
 /*
  * Clocks marked with CLK_IS_CRITICAL:
@@ -191,9 +193,8 @@ static struct clk_hw *ast2600_calc_pll(const char *name, u32 val)
 static struct clk_hw *ast2600_calc_apll(const char *name, u32 val)
 {
 	unsigned int mult, div;
-	u32 chip_id = readl(scu_g6_base + ASPEED_G6_SILICON_REV);
 
-	if (((chip_id & CHIP_REVISION_ID) >> 16) >= 2) {
+	if (soc_rev >= 2) {
 		if (val & BIT(24)) {
 			/* Pass through mode */
 			mult = div = 1;
@@ -707,7 +708,7 @@ static const u32 ast2600_a1_axi_ahb200_tbl[] = {
 static void __init aspeed_g6_cc(struct regmap *map)
 {
 	struct clk_hw *hw;
-	u32 val, div, divbits, chip_id, axi_div, ahb_div;
+	u32 val, div, divbits, axi_div, ahb_div;
 
 	clk_hw_register_fixed_rate(NULL, "clkin", NULL, 0, 25000000);
 
@@ -738,8 +739,7 @@ static void __init aspeed_g6_cc(struct regmap *map)
 		axi_div = 2;
 
 	divbits = (val >> 11) & 0x3;
-	regmap_read(map, ASPEED_G6_SILICON_REV, &chip_id);
-	if (chip_id & BIT(16)) {
+	if (soc_rev >= 1) {
 		if (!divbits) {
 			ahb_div = ast2600_a1_axi_ahb200_tbl[(val >> 8) & 0x3];
 			if (val & BIT(16))
@@ -784,6 +784,8 @@ static void __init aspeed_g6_cc_init(struct device_node *np)
 	if (!scu_g6_base)
 		return;
 
+	soc_rev = (readl(scu_g6_base + ASPEED_G6_SILICON_REV) & CHIP_REVISION_ID) >> 16;
+
 	aspeed_g6_clk_data = kzalloc(struct_size(aspeed_g6_clk_data, hws,
 				      ASPEED_G6_NUM_CLKS), GFP_KERNEL);
 	if (!aspeed_g6_clk_data)
-- 
2.33.0

