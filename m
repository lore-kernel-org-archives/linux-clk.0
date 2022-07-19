Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13A37C43334
	for <linux-clk@archiver.kernel.org>; Tue, 19 Jul 2022 10:12:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230163AbiGSKMv (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 19 Jul 2022 06:12:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229785AbiGSKMu (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 19 Jul 2022 06:12:50 -0400
Received: from www381.your-server.de (www381.your-server.de [78.46.137.84])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD45EDF17
        for <linux-clk@vger.kernel.org>; Tue, 19 Jul 2022 03:12:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=metafoo.de;
         s=default2002; h=Content-Transfer-Encoding:MIME-Version:References:
        In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID;
        bh=T3nSt2JFrrXefy+RgJNclWrx5CCUCPmVjlqT25Wrvrs=; b=ZobxGW+pErcdfphoJkluvTat6O
        mtzMIqjKoOyB8g76pH8Zedk1TV/F4JEMS1PPFFFGT9Yv3txYMAamKIOFDvg/OHKgOLBocTQOVC0O0
        VKt7hXJf5aiolWNRAiir5sdGqrUe2jAD3JYckWkZVNnNde6c8lsWLwW4ShVZfharcM9KIz6yQkPQw
        sBAGml4GgaoEmkzXQYuPJ2HZ7n9yz41avg3RyEYGrZXN7EJaFraBNCeGOZVB3MJL7ys+Loi0e70x4
        t+34uZHo4pezPanDsaTknoZsxYn++jZS51/1bviCG80s+f4nFgcamTSLNzkonzS7m7N96jhbOhXSd
        c0KzJRfQ==;
Received: from sslproxy05.your-server.de ([78.46.172.2])
        by www381.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
        (Exim 4.92.3)
        (envelope-from <lars@metafoo.de>)
        id 1oDjoc-00017S-JF; Tue, 19 Jul 2022 11:46:54 +0200
Received: from [2001:a61:2a04:b01:9e5c:8eff:fe01:8578] (helo=lars-desktop.fritz.box)
        by sslproxy05.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <lars@metafoo.de>)
        id 1oDjoc-000Dq4-DY; Tue, 19 Jul 2022 11:46:54 +0200
From:   Lars-Peter Clausen <lars@metafoo.de>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Luca Ceresoli <luca@lucaceresoli.net>
Cc:     linux-clk@vger.kernel.org, Lars-Peter Clausen <lars@metafoo.de>
Subject: [PATCH 2/2] clk: vc5: Use regmap_{set,clear}_bits() where appropriate
Date:   Tue, 19 Jul 2022 11:46:37 +0200
Message-Id: <20220719094637.844946-2-lars@metafoo.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220719094637.844946-1-lars@metafoo.de>
References: <20220719094637.844946-1-lars@metafoo.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authenticated-Sender: lars@metafoo.de
X-Virus-Scanned: Clear (ClamAV 0.103.6/26606/Tue Jul 19 09:57:30 2022)
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

regmap_set_bits() and regmap_clear_bits() are variations of
regmap_update_bits() that can be used if all bits of the mask have to be
set to either 1 or 0 respectively.

Update the versaclk driver to use regmap_set_bits() and regmap_clear_bits()
where appropriate. This results in slightly more compact code and also
makes the intention of the code clearer which can help with review.

Signed-off-by: Lars-Peter Clausen <lars@metafoo.de>
---
 drivers/clk/clk-versaclock5.c | 35 +++++++++++++++--------------------
 1 file changed, 15 insertions(+), 20 deletions(-)

diff --git a/drivers/clk/clk-versaclock5.c b/drivers/clk/clk-versaclock5.c
index e83148eb2c24..681006884097 100644
--- a/drivers/clk/clk-versaclock5.c
+++ b/drivers/clk/clk-versaclock5.c
@@ -392,9 +392,8 @@ static int vc5_pfd_set_rate(struct clk_hw *hw, unsigned long rate,
 
 	/* CLKIN within range of PLL input, feed directly to PLL. */
 	if (parent_rate <= 50000000) {
-		ret = regmap_update_bits(vc5->regmap, VC5_VCO_CTRL_AND_PREDIV,
-					 VC5_VCO_CTRL_AND_PREDIV_BYPASS_PREDIV,
-					 VC5_VCO_CTRL_AND_PREDIV_BYPASS_PREDIV);
+		ret = regmap_set_bits(vc5->regmap, VC5_VCO_CTRL_AND_PREDIV,
+				      VC5_VCO_CTRL_AND_PREDIV_BYPASS_PREDIV);
 		if (ret)
 			return ret;
 
@@ -413,8 +412,8 @@ static int vc5_pfd_set_rate(struct clk_hw *hw, unsigned long rate,
 	if (ret)
 		return ret;
 
-	return regmap_update_bits(vc5->regmap, VC5_VCO_CTRL_AND_PREDIV,
-				  VC5_VCO_CTRL_AND_PREDIV_BYPASS_PREDIV, 0);
+	return regmap_clear_bits(vc5->regmap, VC5_VCO_CTRL_AND_PREDIV,
+				 VC5_VCO_CTRL_AND_PREDIV_BYPASS_PREDIV);
 }
 
 static const struct clk_ops vc5_pfd_ops = {
@@ -579,14 +578,13 @@ static int vc5_fod_set_rate(struct clk_hw *hw, unsigned long rate,
 	 * datasheet somewhat implies this is needed, but the register
 	 * and the bit is not documented.
 	 */
-	ret = regmap_update_bits(vc5->regmap, VC5_GLOBAL_REGISTER,
-				 VC5_GLOBAL_REGISTER_GLOBAL_RESET, 0);
+	ret = regmap_clear_bits(vc5->regmap, VC5_GLOBAL_REGISTER,
+				VC5_GLOBAL_REGISTER_GLOBAL_RESET);
 	if (ret)
 		return ret;
 
-	return regmap_update_bits(vc5->regmap, VC5_GLOBAL_REGISTER,
-				  VC5_GLOBAL_REGISTER_GLOBAL_RESET,
-				  VC5_GLOBAL_REGISTER_GLOBAL_RESET);
+	return regmap_set_bits(vc5->regmap, VC5_GLOBAL_REGISTER,
+			       VC5_GLOBAL_REGISTER_GLOBAL_RESET);
 }
 
 static const struct clk_ops vc5_fod_ops = {
@@ -614,10 +612,9 @@ static int vc5_clk_out_prepare(struct clk_hw *hw)
 	 * registers.
 	 */
 	if (vc5->chip_info->flags & VC5_HAS_BYPASS_SYNC_BIT) {
-		ret = regmap_update_bits(vc5->regmap,
-					 VC5_RESERVED_X0(hwdata->num),
-					 VC5_RESERVED_X0_BYPASS_SYNC,
-					 VC5_RESERVED_X0_BYPASS_SYNC);
+		ret = regmap_set_bits(vc5->regmap,
+				      VC5_RESERVED_X0(hwdata->num),
+				      VC5_RESERVED_X0_BYPASS_SYNC);
 		if (ret)
 			return ret;
 	}
@@ -640,10 +637,8 @@ static int vc5_clk_out_prepare(struct clk_hw *hw)
 	}
 
 	/* Enable the clock buffer */
-	ret = regmap_update_bits(vc5->regmap,
-				 VC5_CLK_OUTPUT_CFG(hwdata->num, 1),
-				 VC5_CLK_OUTPUT_CFG1_EN_CLKBUF,
-				 VC5_CLK_OUTPUT_CFG1_EN_CLKBUF);
+	ret = regmap_set_bits(vc5->regmap, VC5_CLK_OUTPUT_CFG(hwdata->num, 1),
+			      VC5_CLK_OUTPUT_CFG1_EN_CLKBUF);
 	if (ret)
 		return ret;
 
@@ -669,8 +664,8 @@ static void vc5_clk_out_unprepare(struct clk_hw *hw)
 	struct vc5_driver_data *vc5 = hwdata->vc5;
 
 	/* Disable the clock buffer */
-	regmap_update_bits(vc5->regmap, VC5_CLK_OUTPUT_CFG(hwdata->num, 1),
-			   VC5_CLK_OUTPUT_CFG1_EN_CLKBUF, 0);
+	regmap_clear_bits(vc5->regmap, VC5_CLK_OUTPUT_CFG(hwdata->num, 1),
+			  VC5_CLK_OUTPUT_CFG1_EN_CLKBUF);
 }
 
 static unsigned char vc5_clk_out_get_parent(struct clk_hw *hw)
-- 
2.30.2

