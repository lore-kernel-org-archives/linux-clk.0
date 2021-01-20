Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71050C4332E
	for <linux-clk@archiver.kernel.org>; Wed, 20 Jan 2021 10:45:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 228A023332
	for <linux-clk@archiver.kernel.org>; Wed, 20 Jan 2021 10:45:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733122AbhATKgR (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 20 Jan 2021 05:36:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729869AbhATJc1 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 20 Jan 2021 04:32:27 -0500
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E7CEC06179F
        for <linux-clk@vger.kernel.org>; Wed, 20 Jan 2021 01:30:54 -0800 (PST)
Received: by mail-wm1-x329.google.com with SMTP id v184so2192024wma.1
        for <linux-clk@vger.kernel.org>; Wed, 20 Jan 2021 01:30:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2s0WTD1P6C9PUp9361FQ7s9ERQBew8D3q3YSn9pwKqI=;
        b=EwiGDSqWbaqynOyMryHhUvnCtaaJBgXO4kzsWemCVeNRpdGUDQf9Jk2+67lSJ5WOOq
         dHypUe5DQleFurSr+O7+zbe1lB1oNoXnunzN/lvTRvfVJt+2CQ511YUX3ng7QJuoY8Ht
         GuzRzc5T4JZUXEbLmivtfef95Gwe5rSspNIBtWgTfDYRtGkgzV9QK3gsindIkrEoXOob
         oMEqIhnbJ82vsdncXYrrCDNVcIfVsjLaTAiy/DPQD/MxvwW++ugIy7VGUI3mnQ9mPL/v
         6z5A25iPAdo93UurZqrDgDwvvqEZwrRhby28nwA0N98tQA0XHVRJOc/XIjQUW2VVabx9
         7Mnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2s0WTD1P6C9PUp9361FQ7s9ERQBew8D3q3YSn9pwKqI=;
        b=Y2kqxtIkScmd5gZL4K2Z7kWxqdUwZg/8JfMHSmDzMNE2oYPBWkdr0GT3fF5RY+hkNj
         MBWNFgWiEM49bdcxSfkwUcr4WnE9+vx+P7h5HUATPB+ASqTcNIKTAqMe/szony71ItNg
         adGQNaXgLPJDLMINKrosVtQACJpuwlgroyYUF6/7rCu8sBpCitS/lyC63mFY+aZ0TzUN
         hxbi0PCNa7MF9f4mg30cpNF8bSmpQKFjTqeixtTkGXkGATJQW7vyP7PloO6pRn/PFXuj
         6D7xH5GWljB6eYSS968Xvblfu43Jx3BARBR6xZOrgu7IDKkLUWnbB+VrVISMbSlBklEC
         MfXA==
X-Gm-Message-State: AOAM530zsVeSlG8OBT0Ox+0qQX76TLb9tFmjXsIAu9DOK9iB/c92t7gr
        lm7mzVAHI6lmg/0u3jQP683vGRy4qoRlVNK+
X-Google-Smtp-Source: ABdhPJxaoyGMT0Wu5KmcpicqSgm3Rl9iH+ncRNwslwS1hSErnZ9AZR+Byl6PVvDX9k3baTtfBnUHVw==
X-Received: by 2002:a7b:c24c:: with SMTP id b12mr3374861wmj.167.1611135053433;
        Wed, 20 Jan 2021 01:30:53 -0800 (PST)
Received: from dell.default ([91.110.221.158])
        by smtp.gmail.com with ESMTPSA id z130sm2889201wmb.33.2021.01.20.01.30.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jan 2021 01:30:52 -0800 (PST)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Subject: [PATCH 08/20] clk: socfpga: clk-pll-a10: Remove set but unused variable 'rc'
Date:   Wed, 20 Jan 2021 09:30:28 +0000
Message-Id: <20210120093040.1719407-9-lee.jones@linaro.org>
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

 drivers/clk/socfpga/clk-pll-a10.c: In function ‘__socfpga_pll_init’:
 drivers/clk/socfpga/clk-pll-a10.c:76:6: warning: variable ‘rc’ set but not used [-Wunused-but-set-variable]

Cc: Dinh Nguyen <dinguyen@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/clk/socfpga/clk-pll-a10.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/clk/socfpga/clk-pll-a10.c b/drivers/clk/socfpga/clk-pll-a10.c
index db54f7d806a09..3338f054fe98c 100644
--- a/drivers/clk/socfpga/clk-pll-a10.c
+++ b/drivers/clk/socfpga/clk-pll-a10.c
@@ -73,7 +73,6 @@ static struct clk * __init __socfpga_pll_init(struct device_node *node,
 	const char *parent_name[SOCFGPA_MAX_PARENTS];
 	struct clk_init_data init;
 	struct device_node *clkmgr_np;
-	int rc;
 	int i = 0;
 
 	of_property_read_u32(node, "reg", &reg);
@@ -108,7 +107,7 @@ static struct clk * __init __socfpga_pll_init(struct device_node *node,
 		kfree(pll_clk);
 		return NULL;
 	}
-	rc = of_clk_add_provider(node, of_clk_src_simple_get, clk);
+	of_clk_add_provider(node, of_clk_src_simple_get, clk);
 	return clk;
 }
 
-- 
2.25.1

