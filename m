Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88463C4167E
	for <linux-clk@archiver.kernel.org>; Mon,  9 May 2022 09:38:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238509AbiEIJji (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 9 May 2022 05:39:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237251AbiEIJF7 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 9 May 2022 05:05:59 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6EECA1C15D4
        for <linux-clk@vger.kernel.org>; Mon,  9 May 2022 02:01:53 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id u23so16920775lfc.1
        for <linux-clk@vger.kernel.org>; Mon, 09 May 2022 02:01:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ju8qIcVxu8nKYNTamtJUWMRGDCG286a6Cxhr7ezIYWA=;
        b=eJ8v2bs8NMeZ/LD29Kud2zd8sWHamaOEjf7hmouo1LWfTyhIw3DIJEPlgUS1bIucSA
         ePPaakbn+QERzc8aTw1F9CACNUTrGUD+36rl8TLcMrw5SgAkvxmhnqAcxPXLSalwdFy6
         yRp5SpregPpY/SXdAnlRL+caa0zrIx/LCVzDVlRqhqBNpqWR4TBih/ovV7tNHGqJ2So2
         yf56HHEjVGukq7D15sPd1lF4rVpksQiuswyUdBtF2H/id26mLyvBkLfIKaX7LQpGvEwG
         lDzC9eAC8OnEKQ4uaL++u0ljmK1ADVtfesFAT7Va0CCjsyTUc4ziu7jo7UrHDULfWFsn
         z+ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ju8qIcVxu8nKYNTamtJUWMRGDCG286a6Cxhr7ezIYWA=;
        b=CrWEb3vYGzDjZ0vo0gs+0HfjWPnIjw2HSgaX3WXXGxU2R5i9bFQzQBMnOE7ldGNRiq
         D5YzlTe642P8lduNWQwwCgulj3zal91HOjln6DdtdVQKPoCBwDRrLSQPFE6Dpt+WfsDC
         4gVzKhAJR6OUWiCGECCAyclr8zWHsnlqDm4S4ieF4FwNUQFdF8MXji3WxULPzjU6aKqx
         +l398L3EZVyt8XXRljQ7nmTHHLXRvqVjk0uBRSdJmw7gYab/UYLbj1b55YtS5txf1rSv
         dY7yIfFkQ/yOJl9YCjN95JUTYBEjHBad4Mo87C8V9mlwD/cGWLh+mDdSzJlrngjqMEEZ
         JnkA==
X-Gm-Message-State: AOAM533hd4HNDZ+kyO9poKVIPpOovQzQhyNzPsNhrvDZbqeU4N0jxaTd
        LJx1p6qc3bqQgok9Nx3Zf2Pu6Za6TWOqcg==
X-Google-Smtp-Source: ABdhPJzoW3UTtoYpzMe/y/xA99p84CYwQq9S9lx8sgiU7+e3mU3SyD3T77LesLgTmuo0hmLAm+k7lg==
X-Received: by 2002:ac2:58db:0:b0:473:f40c:5858 with SMTP id u27-20020ac258db000000b00473f40c5858mr10828992lfo.414.1652086908359;
        Mon, 09 May 2022 02:01:48 -0700 (PDT)
Received: from localhost.localdomain (mobile-access-5672eb-224.dhcp.inet.fi. [86.114.235.224])
        by smtp.gmail.com with ESMTPSA id m5-20020a196145000000b0047255d21135sm1873219lfk.100.2022.05.09.02.01.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 May 2022 02:01:47 -0700 (PDT)
From:   Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH v5 3/7] clk: qcom: clk-alpha-pll: fix clk_trion_pll_configure description
Date:   Mon,  9 May 2022 12:01:43 +0300
Message-Id: <20220509090143.4140999-1-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220509090059.4140941-1-vladimir.zapolskiy@linaro.org>
References: <20220509090059.4140941-1-vladimir.zapolskiy@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

After merging lucid and trion pll functions in commit 0b01489475c6
("clk: qcom: clk-alpha-pll: same regs and ops for trion and lucid")
the function clk_trion_pll_configure() is left with an old description
header, which results in a W=2 compile time warning, fix it.

Acked-by: Stephen Boyd <sboyd@kernel.org>
Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 drivers/clk/qcom/clk-alpha-pll.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
index 4406cf609aae..288692f0ea39 100644
--- a/drivers/clk/qcom/clk-alpha-pll.c
+++ b/drivers/clk/qcom/clk-alpha-pll.c
@@ -1439,7 +1439,7 @@ const struct clk_ops clk_alpha_pll_postdiv_fabia_ops = {
 EXPORT_SYMBOL_GPL(clk_alpha_pll_postdiv_fabia_ops);
 
 /**
- * clk_lucid_pll_configure - configure the lucid pll
+ * clk_trion_pll_configure - configure the trion pll
  *
  * @pll: clk alpha pll
  * @regmap: register map
-- 
2.33.0

