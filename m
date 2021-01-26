Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EE69C433DB
	for <linux-clk@archiver.kernel.org>; Tue, 26 Jan 2021 13:09:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 539E023109
	for <linux-clk@archiver.kernel.org>; Tue, 26 Jan 2021 13:09:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391958AbhAZNJU (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 26 Jan 2021 08:09:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2403941AbhAZMsq (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 26 Jan 2021 07:48:46 -0500
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A2B1C03542C
        for <linux-clk@vger.kernel.org>; Tue, 26 Jan 2021 04:46:06 -0800 (PST)
Received: by mail-wr1-x433.google.com with SMTP id h9so6071572wrr.9
        for <linux-clk@vger.kernel.org>; Tue, 26 Jan 2021 04:46:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=995rP6SFts07/SvvHeFqqlY/SqCHBsfm6ya+Esw8I8M=;
        b=N2pTVZZmJN4uinBZl9xENNGOHve5i9eUD8+RnxP3LdL9D6vMmow8TXoYXxwhlIWJyt
         p08XZLz9O3Jypul8pU3IKA7eyIxCqy0VB0VVsZuL21XZVihIURjKjqcWOA3AOvYjk128
         YH45w98UvW2RPMed6OxTVkd+t+HaL6MaZrsgEijZxAsjg6LJFq/fBzjxeXAjKSGjeeZC
         wzDLJUS952ZBrdn6+Q6Nn2xSJnOocJFwka8GbO4cbM0vd8y9O36aLHN8fcRB2KGOe7TQ
         OvyYDPqO7SWz7wVBSu8BCQ/BCHHOTkKnopWdXGbIlRQuSOoS2FW5h9ME/A9YVn8ZvwDP
         P5xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=995rP6SFts07/SvvHeFqqlY/SqCHBsfm6ya+Esw8I8M=;
        b=ljwkqGE6prOKXkqzP7JXPQIN6VKLt5wzK+wY6XExrHzGfox05qOdM/rluqhTOJ4zZy
         zcwdIur0tjTg6CadYkk0AnD6RlZmvVijMwKSg5Q8zS8k23J1z6XrCkfoQoAHHIjpX4Gl
         +8qTThj6aW08EhZMW9M2pkdkGHXJNGg3tnoAU2QDc2z7EMsSgbFUbgqoGWqo+DToN5mn
         Rp28BOQLp0QqvfmLfF4L6Kij1ijQt02YuGeynM0rVkdAi55sJBoKtFotY6ou+vldp/n5
         rGrCFb/BjR8z6xjuXCaYAPDccYYlaywQ2RuXxIry3CRzhRNsUAhIM8gaTQJ57kDxd9oh
         R5DQ==
X-Gm-Message-State: AOAM530qUqkADs8FWxA7MyVxJP2+y6HESMi32YEzwegv/6yFleTuF4A0
        fC2oYEhHcaCUt9kysq+TQUdyMg==
X-Google-Smtp-Source: ABdhPJxFlwssEpZKCZXVFe6JJUQNnpJ5ZXpj8QSRW0OaQrtBZE2bkPYh1gT/A5Bto1xapUFtcl9w7g==
X-Received: by 2002:a5d:434d:: with SMTP id u13mr5975442wrr.6.1611665164897;
        Tue, 26 Jan 2021 04:46:04 -0800 (PST)
Received: from dell.default ([91.110.221.188])
        by smtp.gmail.com with ESMTPSA id i131sm3263073wmi.25.2021.01.26.04.46.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jan 2021 04:46:04 -0800 (PST)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Loc Ho <lho@apm.com>,
        linux-clk@vger.kernel.org
Subject: [PATCH 17/21] clk: clk-xgene: Add description for 'mask' and fix formatting for 'flags'
Date:   Tue, 26 Jan 2021 12:45:36 +0000
Message-Id: <20210126124540.3320214-18-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210126124540.3320214-1-lee.jones@linaro.org>
References: <20210126124540.3320214-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Fixes the following W=1 kernel build warning(s):

 drivers/clk/clk-xgene.c:229: warning: Function parameter or member 'mask' not described in 'xgene_clk_pmd'
 drivers/clk/clk-xgene.c:229: warning: Function parameter or member 'flags' not described in 'xgene_clk_pmd'

Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: Loc Ho <lho@apm.com>
Cc: linux-clk@vger.kernel.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/clk/clk-xgene.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/clk-xgene.c b/drivers/clk/clk-xgene.c
index 3fd53057c01fe..857217cbcef87 100644
--- a/drivers/clk/clk-xgene.c
+++ b/drivers/clk/clk-xgene.c
@@ -206,17 +206,16 @@ static void xgene_pcppllclk_init(struct device_node *np)
  * @hw:		handle between common and hardware-specific interfaces
  * @reg:	register containing the fractional scale multiplier (scaler)
  * @shift:	shift to the unit bit field
+ * @mask:	mask to the unit bit field
  * @denom:	1/denominator unit
  * @lock:	register lock
- * Flags:
- * XGENE_CLK_PMD_SCALE_INVERTED - By default the scaler is the value read
+ * @flags: XGENE_CLK_PMD_SCALE_INVERTED - By default the scaler is the value read
  *	from the register plus one. For example,
  *		0 for (0 + 1) / denom,
  *		1 for (1 + 1) / denom and etc.
  *	If this flag is set, it is
  *		0 for (denom - 0) / denom,
  *		1 for (denom - 1) / denom and etc.
- *
  */
 struct xgene_clk_pmd {
 	struct clk_hw	hw;
-- 
2.25.1

