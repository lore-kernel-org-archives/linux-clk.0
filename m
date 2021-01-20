Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 319F8C4321A
	for <linux-clk@archiver.kernel.org>; Wed, 20 Jan 2021 10:45:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 11B8723339
	for <linux-clk@archiver.kernel.org>; Wed, 20 Jan 2021 10:45:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733306AbhATKjh (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 20 Jan 2021 05:39:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731453AbhATJdw (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 20 Jan 2021 04:33:52 -0500
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6712EC061384
        for <linux-clk@vger.kernel.org>; Wed, 20 Jan 2021 01:31:07 -0800 (PST)
Received: by mail-wr1-x42d.google.com with SMTP id a1so1065272wrq.6
        for <linux-clk@vger.kernel.org>; Wed, 20 Jan 2021 01:31:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=a0eH26ZUBg4+GW3DVSJr3IUvZueqhdMA0PLfT85K6+E=;
        b=MjDM98OLBbyugGi5z9i8y3gcFvSTFvaDlzZxfuqFRWUxgSzmGg2bkwE84t92uYf3f6
         1YC5KMlqojalOqRujF0SHuZGdDwHrCiGwDMcBAg0Aj/mKmm/3KW0wRqSG/CC9X+EgW6V
         wgBJQjilcc/l3PCDgB58vftVv7zWvgFr+YarUsf0Ylf28g3UaeElmEhXEv4l+r2sPzlH
         xIhcd2qZxZ+ASJDUzSESYgjgs2SeT8Q/Y0JIbk9y2cI8JYvdm75jFkVj2RfMVFYjKxv7
         yDdPDIKrgozZvxl92hv7PGPi/lDZ9Bot2HwlsvP2CgSD5yzzRUqe3so1F0IZOk55caqh
         bJsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=a0eH26ZUBg4+GW3DVSJr3IUvZueqhdMA0PLfT85K6+E=;
        b=QL4eZ4ZIupxgTOksyf5K09LfjfEdGz3d70F01hbhnmv4VTlJp0NYBBTUyuuBMA+A15
         rygAf4BlCj8aP1xv21yczkNp6w2D1OTPf/hIfpBTI2XTUXHAUD/rVDf9aNuKTTs5y5M9
         AE75NSqc8uwL0GVK3KvlWRhLNsFRVHAdtK5iVHjYqMOk9jPRXWQ7OWgg9Cn4FwqMlMVF
         KuqYq4ym1U/LBkJ/T8Zr+lY57LknBMWrDxhs1Xq/RjeNLKL7gHLT563IktNtYE6WmWsL
         xWXBYCkF1nD4sJ1SwnVgY9jcSK6k8vHvos8IcQugrMJ94jN9sHl+oNEDNWqiQzxvXet4
         wvRQ==
X-Gm-Message-State: AOAM530NagXeidFCGJfdjqPFUwShy9H9rhSf8DEPYWm0+cuM8W6J9sY9
        D9bTebYI3sRedAshlw6sOaJsWw==
X-Google-Smtp-Source: ABdhPJx3ZjCpUjZVjx48wSf2aRSX7D5zkaVbcdktQcNjUP6AbBni3d5m+dVFFlpKQcmNFhyVo9XKgA==
X-Received: by 2002:a05:6000:1542:: with SMTP id 2mr8360962wry.356.1611135066213;
        Wed, 20 Jan 2021 01:31:06 -0800 (PST)
Received: from dell.default ([91.110.221.158])
        by smtp.gmail.com with ESMTPSA id z130sm2889201wmb.33.2021.01.20.01.31.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jan 2021 01:31:05 -0800 (PST)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Subject: [PATCH 19/20] clk: versatile: clk-icst: Fix worthy struct documentation block
Date:   Wed, 20 Jan 2021 09:30:39 +0000
Message-Id: <20210120093040.1719407-20-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210120093040.1719407-1-lee.jones@linaro.org>
References: <20210120093040.1719407-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Also demote non-worthy header to standard comment block.

Fixes the following W=1 kernel build warning(s):

 drivers/clk/versatile/clk-icst.c:53: warning: Function parameter or member 'map' not described in 'clk_icst'
 drivers/clk/versatile/clk-icst.c:53: warning: Function parameter or member 'vcoreg_off' not described in 'clk_icst'
 drivers/clk/versatile/clk-icst.c:53: warning: Function parameter or member 'lockreg_off' not described in 'clk_icst'
 drivers/clk/versatile/clk-icst.c:435: warning: cannot understand function prototype: 'const struct icst_params icst525_apcp_cm_params = '

Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-clk@vger.kernel.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/clk/versatile/clk-icst.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/versatile/clk-icst.c b/drivers/clk/versatile/clk-icst.c
index 692be2fd9261a..fdd6aa3cb1fc8 100644
--- a/drivers/clk/versatile/clk-icst.c
+++ b/drivers/clk/versatile/clk-icst.c
@@ -36,8 +36,9 @@
 /**
  * struct clk_icst - ICST VCO clock wrapper
  * @hw: corresponding clock hardware entry
- * @vcoreg: VCO register address
- * @lockreg: VCO lock register address
+ * @map: register map
+ * @vcoreg_off: VCO register address
+ * @lockreg_off: VCO lock register address
  * @params: parameters for this ICST instance
  * @rate: current rate
  * @ctype: the type of control register for the ICST
@@ -428,7 +429,7 @@ static const struct icst_params icst307_params = {
 	.idx2s		= icst307_idx2s,
 };
 
-/**
+/*
  * The core modules on the Integrator/AP and Integrator/CP have
  * especially crippled ICST525 control.
  */
-- 
2.25.1

