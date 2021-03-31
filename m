Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C05CBC433ED
	for <linux-clk@archiver.kernel.org>; Wed, 31 Mar 2021 10:58:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9EF93619AB
	for <linux-clk@archiver.kernel.org>; Wed, 31 Mar 2021 10:58:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235118AbhCaK6D (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 31 Mar 2021 06:58:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235121AbhCaK5p (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 31 Mar 2021 06:57:45 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1359BC06174A
        for <linux-clk@vger.kernel.org>; Wed, 31 Mar 2021 03:57:45 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id d12so7434614lfv.11
        for <linux-clk@vger.kernel.org>; Wed, 31 Mar 2021 03:57:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=81aVn3cgKmJwkahVoYGBOYGXWnu3CXfAkBhhOdfG2tg=;
        b=dowG8r//ltSsk5+GxENoi2CH9y5XFUg1fBKh/cDzr7m7mvxVuq9jmTm5RWE/aMR+bK
         aP+hTg6AaPOiNyPCy0iOcU932h7ZulujBB1ejURrh2EaKTy+UHRGS8OrbCwT7505prsQ
         NQ3DuW+3exedbLIDbcMrjpMmYR2fuBRkbfkac5rN1rGgrK3PzNBGJNkN92kxOI9lVeUf
         Bj7l2sBVK4QeyAxbsUcsIhzDS5qczI/MLWEQGjCZEmCu3lDI83Lu+Vi1islbzINi5fZM
         QOE6/0VTC+Jkvs3v2wDWWMlacPKW5ob/z8NEwgOL6IZ+f+tEZ0T6MjLeQsV8KNelNcRm
         xoYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=81aVn3cgKmJwkahVoYGBOYGXWnu3CXfAkBhhOdfG2tg=;
        b=FUWY80s+QKOTOpZxa72b129Bq/UI0KeB99CO7n1EE2c/Vj7jdCm43VG4cJRUMiO5hg
         eOFauRKvs2InGp7keL1JSp6mpX125/CiNAabsTs0DqJT7fsbtpxM9asbhEBuWDWLREYs
         qS+ldBoFD/P3WTYQgJOaehw/mFrH1brt+dw68VTcfL+Bb39NAcKRcNldDAJ0UwZn61IC
         bVQAzUkwxzyR0qDWRsymwBthEm6CLfbPpf9yQvnyR/GS00tNww3B6kEnhwGSupbK83G/
         tngJe3qgzgHvREn8w8V+4mk81u2vCtN8yn5GruTa+aPGNfUGXtxrQJD4WXCLHQNFmVdd
         jG7Q==
X-Gm-Message-State: AOAM533YuLuBUoLPQzyShB9BYcRyYAjsg0Jd91KFBur1XKdZdD45gahn
        QscDcaUL5RwukYckNslrbSqNeg==
X-Google-Smtp-Source: ABdhPJzYPwkY1k+8eDMII6mlVm082SsnI1RnEiwqTWsJls8rtTQpyK22Nh1lAk5IN+wfm3h19AmW4Q==
X-Received: by 2002:a19:7dc5:: with SMTP id y188mr1911348lfc.309.1617188258457;
        Wed, 31 Mar 2021 03:57:38 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id h3sm184359ljc.67.2021.03.31.03.57.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Mar 2021 03:57:38 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     Stephen Boyd <sboyd@kernel.org>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-clk@vger.kernel.org
Subject: [PATCH v4 02/24] clk: divider: add devm_clk_hw_register_divider
Date:   Wed, 31 Mar 2021 13:57:13 +0300
Message-Id: <20210331105735.3690009-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210331105735.3690009-1-dmitry.baryshkov@linaro.org>
References: <20210331105735.3690009-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add devm_clk_hw_register_divider() - devres version of
clk_hw_register_divider().

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
Acked-by: Stephen Boyd <sboyd@kernel.org>
---
 include/linux/clk-provider.h | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index 9cf7ecc62f7c..6273a841f51f 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -785,6 +785,23 @@ struct clk *clk_register_divider_table(struct device *dev, const char *name,
 				  (parent_data), (flags), (reg), (shift),     \
 				  (width), (clk_divider_flags), (table),      \
 				  (lock))
+/**
+ * devm_clk_hw_register_divider - register a divider clock with the clock framework
+ * @dev: device registering this clock
+ * @name: name of this clock
+ * @parent_name: name of clock's parent
+ * @flags: framework-specific flags
+ * @reg: register address to adjust divider
+ * @shift: number of bits to shift the bitfield
+ * @width: width of the bitfield
+ * @clk_divider_flags: divider-specific flags for this clock
+ * @lock: shared register lock for this clock
+ */
+#define devm_clk_hw_register_divider(dev, name, parent_name, flags, reg, shift,    \
+				width, clk_divider_flags, lock)		      \
+	__devm_clk_hw_register_divider((dev), NULL, (name), (parent_name), NULL,   \
+				  NULL, (flags), (reg), (shift), (width),     \
+				  (clk_divider_flags), NULL, (lock))
 /**
  * devm_clk_hw_register_divider_table - register a table based divider clock
  * with the clock framework (devres variant)
-- 
2.30.2

