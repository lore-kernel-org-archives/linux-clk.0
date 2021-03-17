Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C60E1C4321A
	for <linux-clk@archiver.kernel.org>; Wed, 17 Mar 2021 14:41:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9E90D64F79
	for <linux-clk@archiver.kernel.org>; Wed, 17 Mar 2021 14:41:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232000AbhCQOk4 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 17 Mar 2021 10:40:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232163AbhCQOkp (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 17 Mar 2021 10:40:45 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85541C061763
        for <linux-clk@vger.kernel.org>; Wed, 17 Mar 2021 07:40:44 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id t18so3352343lfl.3
        for <linux-clk@vger.kernel.org>; Wed, 17 Mar 2021 07:40:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PBXzeZeDyvQyLPoNa1KGeI/poAISjCxdb5q3SKcFJsU=;
        b=Jme4PgXEb5C26U3C0VZay05pzwR2f++881i12NWP9OmLS+yrpY+dGp+2SpnP/iYbiq
         WqL0tw3A38pYCKyhK7bRQLU/XXUtlz+gmQ4jxzec2xfTXIpXTPueAKMOjx8+SxqN9RrU
         KKhUJ44KvLwyytMJd9/j6Nq2xns2ECjn+WtQ9uoviLd0TsDRY1vbfMEnniuO8mOQ7XIf
         G5cwe27Rgq/1Z/cjdWdIWIFjUmtDkzUAKZGvD+b72Ggp/YuDhDAYW3qlKNCwFJGnPqNV
         fPWhf5kZRHi/O7pgB/WTfSdNWkh5/3jacaOMxqsqZHrTOVeyXKkqWTuTHxLO9Skf4f1z
         JrEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PBXzeZeDyvQyLPoNa1KGeI/poAISjCxdb5q3SKcFJsU=;
        b=QWNVdfSGc16UUACdrZc4Jf3M+vx3FkcT04S+jfdYI4BMsQHx6zrSZZTmipGIUG77fI
         XpZupacPjJVdO3XK0C2ZJyYsHhFB02WDgLoEs+WsAnnwWlA+SDz/mPZ6ZgjUWH1pUqey
         OFRYNu5aWNfCebQLhbgMGffXg0qnb6sRaXJGOQ7iv12RXD7Nb8+LxXVNlFVtaBgb1LT6
         4RBnTzQgQ5xKmzYD3g6vO0vfG14cMYwvn3x1O4hQpJU6zxs7iLYVas81rLG5KVP7yvED
         lqylYwGu9BdV7ueahT8Oa5HvAg0It/DZ+suq2Ii8CZY1sneGv6jQvq+74dXUrErcVlSu
         RZUA==
X-Gm-Message-State: AOAM531Ow70sax5nAZBp710fD6Y/kKyRH0pAfI09s13aMFFANRdjqIAr
        rfUDGjDLsT9QA+pjDPvbS6jVRw==
X-Google-Smtp-Source: ABdhPJy+ESHie2qqCcI7ASd44IVF06jPayvgNlXGLpeNNO7XiJ6dZX5kUUMb4jBIDhs8YOxjhW633g==
X-Received: by 2002:a05:6512:328f:: with SMTP id p15mr2543462lfe.628.1615992043074;
        Wed, 17 Mar 2021 07:40:43 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id q8sm1484309lfc.223.2021.03.17.07.40.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Mar 2021 07:40:42 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Jonathan Marek <jonathan@marek.ca>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     Stephen Boyd <sboyd@kernel.org>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-clk@vger.kernel.org
Subject: [PATCH v1 02/26] clk: divider: add devm_clk_hw_register_divider
Date:   Wed, 17 Mar 2021 17:40:15 +0300
Message-Id: <20210317144039.556409-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210317144039.556409-1-dmitry.baryshkov@linaro.org>
References: <20210317144039.556409-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add devm_clk_hw_register_divider() - devres version of
clk_hw_register_divider().

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 include/linux/clk-provider.h | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index 3eb15e0262f5..162a2e5546a3 100644
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

