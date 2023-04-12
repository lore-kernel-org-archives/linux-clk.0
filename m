Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16C55C77B6E
	for <linux-clk@archiver.kernel.org>; Wed, 12 Apr 2023 06:19:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229459AbjDLGTb (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 12 Apr 2023 02:19:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229451AbjDLGTa (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 12 Apr 2023 02:19:30 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11742AC
        for <linux-clk@vger.kernel.org>; Tue, 11 Apr 2023 23:19:29 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id s2so6453128wra.7
        for <linux-clk@vger.kernel.org>; Tue, 11 Apr 2023 23:19:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681280367; x=1683872367;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TH7hSIF0/bvl8uuEHERdi7lhYGe/5eQs6pn3VT0zKsg=;
        b=nPdLFUab7+mYB6r6jB2RVEYM+pc/y9dcwYJHE/QnPL3+0T0TVXfxLW7dBucxBNkfCs
         5gKYyxo2HVV8PUthoDxox5X46D7yPeWoAlKBLZIx9APuO2dabGTyMLm2Hl889anbOAfO
         9h1DALKFZAfvcAA6aIjPR3Jzo1q60RLT37DQm4LjcSbA9xu0KMEZ84T++12gf7XIzvHd
         nR+a1K75NHC9iOaV9h0ftZxVf8ktJEYmMTUZVikOmLAXewDpEi9FhUMvUXGHrBwnQoFC
         i1zpQgA1iVysJ+0ynqygeaNqdZJ4gqMb1Y1s9wAMzGPHchNzldZWP9eXS0dUkRPATRg5
         tLRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681280367; x=1683872367;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TH7hSIF0/bvl8uuEHERdi7lhYGe/5eQs6pn3VT0zKsg=;
        b=snNofb9su6mhA6qNYnGySlJDMHu8qtYrgv0jT4pG1t1Q5LgK+1YdbduZn7eH2ATb/J
         l4k68lwpiOktIY7YOXXW/E5ZA7LSKBFb3ByAfJEWHTZGPzkaU3yCVkVDkLFq4jsr4Tlm
         W4Ie1neBYZhkBRpobABpOCwladCgWhHd3Chx8UW9T7yo0+9UisHuOwMdZp0ScfQGDaVA
         +9IOwcGgpF6YYPw6T4vcxGfSfvz/XVR5jpOHg9j9ALhMdKAgiqR4n85m9m0de4JZOO0h
         waK/mFUb6iwQDrmSf+cZUnuGDy4OCHr7RurrIe+2GSO8ZYzR1iKGcZ9wHeZmRENKP4g5
         t/hg==
X-Gm-Message-State: AAQBX9fKJyNfYTtmSw8vwZbzdvUgEKwKgBEjMRccevsox8WSi+l6N6ba
        i/xE1G/hVpoDe/5FHJ46VXA=
X-Google-Smtp-Source: AKy350aciW7ym+PKGOfbBhWyW1Nuz0SXyEAxhoVHWFfr9QhHfaME3o7vT2v0NDv6ex1Ua/XLaC3ZIg==
X-Received: by 2002:adf:e78c:0:b0:2c7:17a4:4ece with SMTP id n12-20020adfe78c000000b002c717a44ecemr3472523wrm.26.1681280367359;
        Tue, 11 Apr 2023 23:19:27 -0700 (PDT)
Received: from ?IPV6:2a02:3100:903d:3d00:7c9c:4093:e578:90cc? (dynamic-2a02-3100-903d-3d00-7c9c-4093-e578-90cc.310.pool.telefonica.de. [2a02:3100:903d:3d00:7c9c:4093:e578:90cc])
        by smtp.googlemail.com with ESMTPSA id a5-20020a5d4d45000000b002c3f81c51b6sm16272900wru.90.2023.04.11.23.19.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Apr 2023 23:19:26 -0700 (PDT)
Message-ID: <af85927b-0da3-3495-2ed4-64bda91cd239@gmail.com>
Date:   Wed, 12 Apr 2023 08:19:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Content-Language: en-US
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org
From:   Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH] clk: mux: let clk_mux_val_to_index return U8_MAX in the error
 case
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Currently this function may return a negative errno, but almost no
user checks for the error case. Only imx_clk_gpr_mux_get_parent()
does, but mentions in a comment that they'd prefer a dummy value.
Other users cast the negative errno to u8 instead, what may result
in unwanted results.
Let's deal with this by returning u8 and U8_MAX in the error case.
Then clk_core_get_parent_by_index() can detect that the index is
out of range.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/clk/clk-mux.c        | 8 ++++----
 include/linux/clk-provider.h | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/clk-mux.c b/drivers/clk/clk-mux.c
index fa817c317..be0f317ee 100644
--- a/drivers/clk/clk-mux.c
+++ b/drivers/clk/clk-mux.c
@@ -40,8 +40,8 @@ static inline void clk_mux_writel(struct clk_mux *mux, u32 val)
 		writel(val, mux->reg);
 }
 
-int clk_mux_val_to_index(struct clk_hw *hw, const u32 *table, unsigned int flags,
-			 unsigned int val)
+u8 clk_mux_val_to_index(struct clk_hw *hw, const u32 *table, unsigned int flags,
+			unsigned int val)
 {
 	int num_parents = clk_hw_get_num_parents(hw);
 
@@ -51,7 +51,7 @@ int clk_mux_val_to_index(struct clk_hw *hw, const u32 *table, unsigned int flags
 		for (i = 0; i < num_parents; i++)
 			if (table[i] == val)
 				return i;
-		return -EINVAL;
+		return U8_MAX;
 	}
 
 	if (val && (flags & CLK_MUX_INDEX_BIT))
@@ -61,7 +61,7 @@ int clk_mux_val_to_index(struct clk_hw *hw, const u32 *table, unsigned int flags
 		val--;
 
 	if (val >= num_parents)
-		return -EINVAL;
+		return U8_MAX;
 
 	return val;
 }
diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index faad3cdc1..62fb4118c 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -1069,8 +1069,8 @@ struct clk *clk_register_mux_table(struct device *dev, const char *name,
 			      NULL, (parent_data), (flags), (reg), (shift),   \
 			      BIT((width)) - 1, (clk_mux_flags), table, (lock))
 
-int clk_mux_val_to_index(struct clk_hw *hw, const u32 *table, unsigned int flags,
-			 unsigned int val);
+u8 clk_mux_val_to_index(struct clk_hw *hw, const u32 *table, unsigned int flags,
+			unsigned int val);
 unsigned int clk_mux_index_to_val(const u32 *table, unsigned int flags, u8 index);
 
 void clk_unregister_mux(struct clk *clk);
-- 
2.40.0

