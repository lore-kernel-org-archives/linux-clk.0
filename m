Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DDCBC10F14
	for <linux-clk@archiver.kernel.org>; Wed, 20 Jan 2021 10:45:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DDE6823332
	for <linux-clk@archiver.kernel.org>; Wed, 20 Jan 2021 10:45:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732999AbhATKdJ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 20 Jan 2021 05:33:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731403AbhATJcA (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 20 Jan 2021 04:32:00 -0500
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75356C06179C
        for <linux-clk@vger.kernel.org>; Wed, 20 Jan 2021 01:30:53 -0800 (PST)
Received: by mail-wr1-x432.google.com with SMTP id y17so22374429wrr.10
        for <linux-clk@vger.kernel.org>; Wed, 20 Jan 2021 01:30:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3zpDeTOsD2P7WN1NPJVgpjl7R+7fXK52sr/TrTLf7sk=;
        b=TZckWmIVkN9la2W25N7ghd/3t5LriuUBnVMaMg75aBQ2i9AcMnOJKMgCqJ+1HMhWVW
         DubqCpSoYLpwIzbGp/DbqA44ErDaScHCrx60lKcgaI3/lQ+djsTnXDHLTCzJhXgfhNN5
         2ruy4joVgMK6TIjwr5DUGhfwda3+XJayRxso4n/0lf/J8+ab9/Di8+8r7PGoyhA6YH9l
         m7+Hr9Gn4giYDEWpSAKIZ1XmXi+EetNXS9dnTJtpZFtJa5BLFR+Zxf7ToPGNfzGDhGNU
         deDlXxIITd4AlTUYXjWjnLIOPuDZXG8Vw/rKPCCjhekXmbFoj1WXi5pJHGO4CXR4VoXQ
         kYgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3zpDeTOsD2P7WN1NPJVgpjl7R+7fXK52sr/TrTLf7sk=;
        b=G0bI2XVoWeDaIUt7IrQdOojtuwzmJ8GIShYBqc8YliQG+ezxzdwQUdWlNLrExNUFWu
         kICtxpft9XkNE5cTr/Eb4DZgObtT7TzjB73Ks04f4pZGlKD4FF+CMeo7a7RCyM74Ao5l
         CBZRKC8TTPJmZD/9ZoS7bemy6KBuh8GvL6QZDhiRJ5RmuooOvZE/NqjLmftTF9+gv1S2
         JIZYq62q333zW/RatHeAurkneP8Ges19TdNSXEem71kHuu+7YgJO9AgV/4azKKrQ4Ds8
         u2/Y4jWz8fJ17+pSuYSj8j7DHikk4pb9yiS0SmKBTQb6sNNhmuH3eAU18fHE+UbG68C0
         btyw==
X-Gm-Message-State: AOAM530teb4oN1UJWm6BWFKZAmluLJ4/FPC/sQCcDGrYUi1aaZE9ZvCJ
        N9xhU0Kr15Fs1N8DFL/VLlMfzw==
X-Google-Smtp-Source: ABdhPJyd+2c72Z2W8MYn9ewofWd/BnR52BttYOgrM7aSaNTdNRx3Nyr23GgWLZxJ67da2cldjYhcsA==
X-Received: by 2002:a5d:6902:: with SMTP id t2mr8274810wru.214.1611135052283;
        Wed, 20 Jan 2021 01:30:52 -0800 (PST)
Received: from dell.default ([91.110.221.158])
        by smtp.gmail.com with ESMTPSA id z130sm2889201wmb.33.2021.01.20.01.30.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jan 2021 01:30:51 -0800 (PST)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Subject: [PATCH 07/20] clk: socfpga: clk-pll: Remove unused variable 'rc'
Date:   Wed, 20 Jan 2021 09:30:27 +0000
Message-Id: <20210120093040.1719407-8-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210120093040.1719407-1-lee.jones@linaro.org>
References: <20210120093040.1719407-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Fixes the following W=1 kernel build warning(s):

 drivers/clk/socfpga/clk-pll.c: In function ‘__socfpga_pll_init’:
 drivers/clk/socfpga/clk-pll.c:83:6: warning: variable ‘rc’ set but not used [-Wunused-but-set-variable]

Cc: Dinh Nguyen <dinguyen@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/clk/socfpga/clk-pll.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/clk/socfpga/clk-pll.c b/drivers/clk/socfpga/clk-pll.c
index e5fb786843f39..3cf99df7d0056 100644
--- a/drivers/clk/socfpga/clk-pll.c
+++ b/drivers/clk/socfpga/clk-pll.c
@@ -80,7 +80,6 @@ static __init struct clk *__socfpga_pll_init(struct device_node *node,
 	const char *parent_name[SOCFPGA_MAX_PARENTS];
 	struct clk_init_data init;
 	struct device_node *clkmgr_np;
-	int rc;
 
 	of_property_read_u32(node, "reg", &reg);
 
@@ -111,7 +110,7 @@ static __init struct clk *__socfpga_pll_init(struct device_node *node,
 		kfree(pll_clk);
 		return NULL;
 	}
-	rc = of_clk_add_provider(node, of_clk_src_simple_get, clk);
+	of_clk_add_provider(node, of_clk_src_simple_get, clk);
 	return clk;
 }
 
-- 
2.25.1

