Return-Path: <SRS0=KEZg=WY=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FADDC3A5A4
	for <linux-clk@archiver.kernel.org>; Wed, 28 Aug 2019 10:20:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2E942208CB
	for <linux-clk@archiver.kernel.org>; Wed, 28 Aug 2019 10:20:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="EOBsAWbx"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726669AbfH1KUe (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 28 Aug 2019 06:20:34 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:46572 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726593AbfH1KUe (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 28 Aug 2019 06:20:34 -0400
Received: by mail-wr1-f67.google.com with SMTP id z1so1880202wru.13
        for <linux-clk@vger.kernel.org>; Wed, 28 Aug 2019 03:20:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=F0qQvPpJpkJVaai8sKPKeZtYOu/uVntaHAenMVAh+ik=;
        b=EOBsAWbxBCjr2yftIFF8ACnoDqRrrCp9J9X2TQU8a3zsnwejfsiiu/2x8AxzfLbhOc
         na8Jg4Td3gNFYKnMui8kLlxoc4RZROhVzyZI4VzbCVUE2X2e83hN8kOhz5kKNypAimis
         QWenbuRx519+o3P5uljTyG51TLBDzQz3wp0GHOagOf8RWiWwVTuqTPISTCYWzVcvBmKI
         mSzVj1qOKPHiKU1SErDvVdhrNsN0OD5Nnp8RZ6sA2SemiZ0FU6CpPICNCgf01LQMB13m
         Uhcw2+zFuEqw3cV7iQVLXjJ2iWT4PeGNdSGdex5jpX1MWYhlcXQDtcFDWSqIV0Kb9Vwe
         9c0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=F0qQvPpJpkJVaai8sKPKeZtYOu/uVntaHAenMVAh+ik=;
        b=mmFoHOcIiEUBI8mKx632flirUovRPlbKqlw7C66UDdv9C3CYd9gbCx7COoiNAUsIoc
         ApBakouNf4z4BmC+LGijdjVSRq4pLcrIBYZVs7zFqwbrrbeo6jyQuXivRzLkf4/+66Bt
         cNILpSs9W4YYFK7uYAAP6dkqm4R9q2Ug1XBwex1L3c/PE7Kus4nhRup2KugzJh5eLdkS
         cYam7ZEssgsWlL/CjZVdO8Lq1NKd1cQ2BjaI9wNecA/tJ/hPS0GnzB+G0+0UJN6Z8S2h
         nxz9cQHpBCIiiVTjPQr+rRgg7EUPDsQJONGrcqns6Q0uhqRISxh+CsT+atcM7Nu8nNm9
         G3UA==
X-Gm-Message-State: APjAAAXKB87Zs/YaBJwr76IcwYCoARzNJbBaoYg0vzMnTX25ETU3oPob
        9EoyjpFNr88RXPEfUBfy6GDoGQ==
X-Google-Smtp-Source: APXvYqxTvUu+Q5RiMdk/QHCzMrXu5uS4eSLVbFmJQE9j7hOSx6VDsiJdIAYTXDT93v/cPRKYZC3uoQ==
X-Received: by 2002:a5d:4a4e:: with SMTP id v14mr3530836wrs.200.1566987631683;
        Wed, 28 Aug 2019 03:20:31 -0700 (PDT)
Received: from starbuck.baylibre.local (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id k9sm2583522wrq.15.2019.08.28.03.20.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Aug 2019 03:20:31 -0700 (PDT)
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Jerome Brunet <jbrunet@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>, linux-clk@vger.kernel.org
Subject: [PATCH RFC 5/5] clk: meson: sclk-div: use runtime data
Date:   Wed, 28 Aug 2019 12:20:12 +0200
Message-Id: <20190828102012.4493-6-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190828102012.4493-1-jbrunet@baylibre.com>
References: <20190828102012.4493-1-jbrunet@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Remove the sclk-div runtime data from the clock description structure
and use the per clock placeholder to save the these runtime data.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/meson/sclk-div.c | 68 ++++++++++++++++++++++++++----------
 drivers/clk/meson/sclk-div.h |  2 --
 2 files changed, 49 insertions(+), 21 deletions(-)

diff --git a/drivers/clk/meson/sclk-div.c b/drivers/clk/meson/sclk-div.c
index 76d31c0a3342..32d488086437 100644
--- a/drivers/clk/meson/sclk-div.c
+++ b/drivers/clk/meson/sclk-div.c
@@ -18,10 +18,16 @@
 
 #include <linux/clk-provider.h>
 #include <linux/module.h>
+#include <linux/slab.h>
 
 #include "clk-regmap.h"
 #include "sclk-div.h"
 
+struct sclk_div_runtime {
+	unsigned int div;
+	struct clk_duty duty;
+};
+
 static inline struct meson_sclk_div_data *
 meson_sclk_div_data(struct clk_regmap *clk)
 {
@@ -109,11 +115,12 @@ static long sclk_div_round_rate(struct clk_hw *hw, unsigned long rate,
 }
 
 static void sclk_apply_ratio(struct clk_regmap *clk,
-			     struct meson_sclk_div_data *sclk)
+			     struct meson_sclk_div_data *sclk,
+			     struct sclk_div_runtime *runtime)
 {
-	unsigned int hi = DIV_ROUND_CLOSEST(sclk->cached_div *
-					    sclk->cached_duty.num,
-					    sclk->cached_duty.den);
+	unsigned int hi = DIV_ROUND_CLOSEST(runtime->div *
+					    runtime->duty.num,
+					    runtime->duty.den);
 
 	if (hi)
 		hi -= 1;
@@ -126,10 +133,12 @@ static int sclk_div_set_duty_cycle(struct clk_hw *hw,
 {
 	struct clk_regmap *clk = to_clk_regmap(hw);
 	struct meson_sclk_div_data *sclk = meson_sclk_div_data(clk);
+	struct sclk_div_runtime *runtime =
+		(struct sclk_div_runtime *) clk_hw_get_data(hw);
 
 	if (MESON_PARM_APPLICABLE(&sclk->hi)) {
-		memcpy(&sclk->cached_duty, duty, sizeof(*duty));
-		sclk_apply_ratio(clk, sclk);
+		memcpy(&runtime->duty, duty, sizeof(*duty));
+		sclk_apply_ratio(clk, sclk, runtime);
 	}
 
 	return 0;
@@ -140,6 +149,8 @@ static int sclk_div_get_duty_cycle(struct clk_hw *hw,
 {
 	struct clk_regmap *clk = to_clk_regmap(hw);
 	struct meson_sclk_div_data *sclk = meson_sclk_div_data(clk);
+	struct sclk_div_runtime *runtime =
+		(struct sclk_div_runtime *) clk_hw_get_data(hw);
 	int hi;
 
 	if (!MESON_PARM_APPLICABLE(&sclk->hi)) {
@@ -150,17 +161,18 @@ static int sclk_div_get_duty_cycle(struct clk_hw *hw,
 
 	hi = meson_parm_read(clk->map, &sclk->hi);
 	duty->num = hi + 1;
-	duty->den = sclk->cached_div;
+	duty->den = runtime->div;
 	return 0;
 }
 
 static void sclk_apply_divider(struct clk_regmap *clk,
-			       struct meson_sclk_div_data *sclk)
+			       struct meson_sclk_div_data *sclk,
+			       struct sclk_div_runtime *runtime)
 {
 	if (MESON_PARM_APPLICABLE(&sclk->hi))
-		sclk_apply_ratio(clk, sclk);
+		sclk_apply_ratio(clk, sclk, runtime);
 
-	meson_parm_write(clk->map, &sclk->div, sclk->cached_div - 1);
+	meson_parm_write(clk->map, &sclk->div, runtime->div - 1);
 }
 
 static int sclk_div_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -168,12 +180,14 @@ static int sclk_div_set_rate(struct clk_hw *hw, unsigned long rate,
 {
 	struct clk_regmap *clk = to_clk_regmap(hw);
 	struct meson_sclk_div_data *sclk = meson_sclk_div_data(clk);
+	struct sclk_div_runtime *runtime =
+		(struct sclk_div_runtime *) clk_hw_get_data(hw);
 	unsigned long maxdiv = sclk_div_maxdiv(sclk);
 
-	sclk->cached_div = sclk_div_getdiv(hw, rate, prate, maxdiv);
+	runtime->div = sclk_div_getdiv(hw, rate, prate, maxdiv);
 
 	if (clk_hw_is_enabled(hw))
-		sclk_apply_divider(clk, sclk);
+		sclk_apply_divider(clk, sclk, runtime);
 
 	return 0;
 }
@@ -181,18 +195,20 @@ static int sclk_div_set_rate(struct clk_hw *hw, unsigned long rate,
 static unsigned long sclk_div_recalc_rate(struct clk_hw *hw,
 					  unsigned long prate)
 {
-	struct clk_regmap *clk = to_clk_regmap(hw);
-	struct meson_sclk_div_data *sclk = meson_sclk_div_data(clk);
+	struct sclk_div_runtime *runtime =
+		(struct sclk_div_runtime *) clk_hw_get_data(hw);
 
-	return DIV_ROUND_UP_ULL((u64)prate, sclk->cached_div);
+	return DIV_ROUND_UP_ULL((u64)prate, runtime->div);
 }
 
 static int sclk_div_enable(struct clk_hw *hw)
 {
 	struct clk_regmap *clk = to_clk_regmap(hw);
 	struct meson_sclk_div_data *sclk = meson_sclk_div_data(clk);
+	struct sclk_div_runtime *runtime =
+		(struct sclk_div_runtime *) clk_hw_get_data(hw);
 
-	sclk_apply_divider(clk, sclk);
+	sclk_apply_divider(clk, sclk, runtime);
 
 	return 0;
 }
@@ -220,21 +236,34 @@ static int sclk_div_init(struct clk_hw *hw)
 {
 	struct clk_regmap *clk = to_clk_regmap(hw);
 	struct meson_sclk_div_data *sclk = meson_sclk_div_data(clk);
+	struct sclk_div_runtime *runtime;
 	unsigned int val;
 
+	runtime = kzalloc(sizeof(*runtime), GFP_KERNEL);
+	if (!runtime)
+		return -ENOMEM;
+
 	val = meson_parm_read(clk->map, &sclk->div);
 
 	/* if the divider is initially disabled, assume max */
 	if (!val)
-		sclk->cached_div = sclk_div_maxdiv(sclk);
+		runtime->div = sclk_div_maxdiv(sclk);
 	else
-		sclk->cached_div = val + 1;
+		runtime->div = val + 1;
 
-	sclk_div_get_duty_cycle(hw, &sclk->cached_duty);
+	sclk_div_get_duty_cycle(hw, &runtime->duty);
 
 	return 0;
 }
 
+static void sclk_div_terminate(struct clk_hw *hw)
+{
+	struct sclk_div_runtime *runtime =
+		(struct sclk_div_runtime *) clk_hw_get_data(hw);
+
+	kfree(runtime);
+}
+
 const struct clk_ops meson_sclk_div_ops = {
 	.recalc_rate	= sclk_div_recalc_rate,
 	.round_rate	= sclk_div_round_rate,
@@ -245,6 +274,7 @@ const struct clk_ops meson_sclk_div_ops = {
 	.get_duty_cycle	= sclk_div_get_duty_cycle,
 	.set_duty_cycle = sclk_div_set_duty_cycle,
 	.init		= sclk_div_init,
+	.terminate	= sclk_div_terminate,
 };
 EXPORT_SYMBOL_GPL(meson_sclk_div_ops);
 
diff --git a/drivers/clk/meson/sclk-div.h b/drivers/clk/meson/sclk-div.h
index b64b2a32005f..d03bbd78f47b 100644
--- a/drivers/clk/meson/sclk-div.h
+++ b/drivers/clk/meson/sclk-div.h
@@ -13,8 +13,6 @@
 struct meson_sclk_div_data {
 	struct parm div;
 	struct parm hi;
-	unsigned int cached_div;
-	struct clk_duty cached_duty;
 };
 
 extern const struct clk_ops meson_sclk_div_ops;
-- 
2.21.0

