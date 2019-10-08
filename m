Return-Path: <SRS0=oEB3=YB=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 137CDC4360C
	for <linux-clk@archiver.kernel.org>; Tue,  8 Oct 2019 07:41:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D90FA21721
	for <linux-clk@archiver.kernel.org>; Tue,  8 Oct 2019 07:41:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kkseK9Vv"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730177AbfJHHl4 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 8 Oct 2019 03:41:56 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:45261 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729740AbfJHHl4 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 8 Oct 2019 03:41:56 -0400
Received: by mail-pf1-f196.google.com with SMTP id y72so10265257pfb.12
        for <linux-clk@vger.kernel.org>; Tue, 08 Oct 2019 00:41:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=WTWm04ar4+VkLYYNXw2JS14xdDugNow5AHMpBwOh98U=;
        b=kkseK9Vv/63Pcw3Emd7eqBn53F3b4We5nz6/fDgoQNdiN3fgUkxvOKFHoT2YFXZ4tq
         yloarZHbOjJV0z8lMzK2iJYo/2s27a19LC/k1SZEAuz6JeeHWY7cXtGGH268aqlI96Cd
         GPZ9Qp8MBZhZbPHx2EaaIQSLcO52SfdzquSdT67ZUgsfbxg0Y3uMQvG8jCAcPkrqis69
         ET6BfuZJl1+S8Z8YxMfqE6TcltUE50uZqna8+CBaJx7a7QCw4Sw1sQi89JfO9fo7YKsq
         D95B/g8SkqPm8/Fpl+hpPui8bm141HHbMtC5fjXxHsu+w5eYB8X/6k2AMpsPRsu9GrdX
         aEkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=WTWm04ar4+VkLYYNXw2JS14xdDugNow5AHMpBwOh98U=;
        b=UWeRUBIZfYZ8PmDh6FAc89HXSQsBDdRjlbCKMpIs9X8NB3pki+mRIg917lqagVV+Om
         bJP/uSwhI6QsE78yuc7OHIN2MHN6NpCi3LbarJS+Z+jQPaMq2RwC6FlLmRN+fywdGmSm
         AW5Q1aWIbOW9mutIFvHt2OHJXbxPS3wke3uppirg71onfjfOh5HNijsfXiiZ7gh7pP+J
         85OOpKNHkpCrIWc/Z0/JVTKCknqw6ywiDjUPZ/xHL7Evs8tZlXDGNpkCirc35phK6oVw
         RBoSyKp6DMI84wcU/0bgfKSvTZdl+aPdoOcV66XFENVYLbJUJHVn3Xma3oI+v5BkpWpy
         56lQ==
X-Gm-Message-State: APjAAAV6C+IvLxuN/yeeboyUfkcCsUaUBO7VfVp2/+1XazcgA/ZfSCcX
        N0+hft64MDdOm23pfdd76b/mBA==
X-Google-Smtp-Source: APXvYqwASYWwYOQfFYehr5RojrWBRZDWtlku7FUHwl7oUX0ZGAYD7Q1pRY66aoJa85L8+Ww750zZPg==
X-Received: by 2002:a63:e54b:: with SMTP id z11mr34734641pgj.226.1570520515806;
        Tue, 08 Oct 2019 00:41:55 -0700 (PDT)
Received: from baolinwangubtpc.spreadtrum.com ([117.18.48.82])
        by smtp.gmail.com with ESMTPSA id y8sm18231363pge.21.2019.10.08.00.41.52
        (version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Tue, 08 Oct 2019 00:41:54 -0700 (PDT)
From:   Baolin Wang <baolin.wang@linaro.org>
To:     mturquette@baylibre.com, sboyd@kernel.org
Cc:     orsonzhai@gmail.com, baolin.wang@linaro.org, zhang.lyra@gmail.com,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] clk: sprd: Use IS_ERR() to validate the return value of syscon_regmap_lookup_by_phandle()
Date:   Tue,  8 Oct 2019 15:41:38 +0800
Message-Id: <1995139bee5248ff3e9d46dc715968f212cfc4cc.1570520268.git.baolin.wang@linaro.org>
X-Mailer: git-send-email 1.7.9.5
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The syscon_regmap_lookup_by_phandle() will never return NULL, thus use
IS_ERR() to validate the return value instead of IS_ERR_OR_NULL().

Fixes: d41f59fd92f2 ("clk: sprd: Add common infrastructure")
Signed-off-by: Baolin Wang <baolin.wang@linaro.org>
---
Changes from v1:
 - Add fixes tag.
---
 drivers/clk/sprd/common.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/sprd/common.c b/drivers/clk/sprd/common.c
index 9d56eac..7ad5ba2 100644
--- a/drivers/clk/sprd/common.c
+++ b/drivers/clk/sprd/common.c
@@ -46,7 +46,7 @@ int sprd_clk_regmap_init(struct platform_device *pdev,
 
 	if (of_find_property(node, "sprd,syscon", NULL)) {
 		regmap = syscon_regmap_lookup_by_phandle(node, "sprd,syscon");
-		if (IS_ERR_OR_NULL(regmap)) {
+		if (IS_ERR(regmap)) {
 			pr_err("%s: failed to get syscon regmap\n", __func__);
 			return PTR_ERR(regmap);
 		}
-- 
1.7.9.5

