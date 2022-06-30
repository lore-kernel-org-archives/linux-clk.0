Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BFAEC43334
	for <linux-clk@archiver.kernel.org>; Thu, 30 Jun 2022 08:20:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232473AbiF3IUM (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 30 Jun 2022 04:20:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233271AbiF3ITt (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 30 Jun 2022 04:19:49 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 007A912628
        for <linux-clk@vger.kernel.org>; Thu, 30 Jun 2022 01:18:22 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id e12so8073627lfr.6
        for <linux-clk@vger.kernel.org>; Thu, 30 Jun 2022 01:18:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=l6EdjGiFoq9x5XgLyuzPGFOxzXSJ/wp5JTwbkJCfw2g=;
        b=aQxO5VSv0l5GYk703aw3RZ8l9UZwV2XUHFS3zGjOpBlr3g4jfHa12IeQ5uNpLJBvni
         2Yxu9aJvu9qetClUZaZ+DSEV/eQ/BZDF7yZaeBanPM1om1DbS8ugtfQXSCCuvJTVpNwi
         L/K58sreHQ6qVtdyhl1PSSMD0rm6BnW2B+PUoiLw57NglCVGgUrBL54pefocbk1JQxuf
         W9E9cxbJC8LiFP7bTawJeYD+07yVEjn7QQf4Vj6I13vHPtCe33DPx/h/iZKXeeeLeBeb
         KZ3sF1lFUITKyawkdtBj1xsFNivYVIiisn2ZRaqJ4XMml/ElI5aCDG+X0nePFHYPVZRC
         LmFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=l6EdjGiFoq9x5XgLyuzPGFOxzXSJ/wp5JTwbkJCfw2g=;
        b=dfDzYMEdeFxWdKXmNFnqCXfrNLuj00SrQ/R2+2GJmM+JIh70WfkfXmNKX3pUYiGfTP
         ZanaLi+ODT1yeMmNYAMW4OBLc0Gl4rsDaLbmIqvAK1jDUGzIq1mG1fCup+leononZC/m
         UQx1ju+1UZbhlhLjXBlIcjuB1EFjaogHumi9ajWMgnA6VsrcQBrWq12dlUnd0xKq/FNo
         JgFrS58WWn6wD6H3wdk+fsbfit43sITGb9lHebDE6A1nsJoqXalizsoyd52BvkQxoZKN
         62/+lL1BtCmSdNhPYsmjAaQSce9PS3NFk2qaVBf5zdRHmy7MSBD/L8o1Grh63TCbshAu
         PteQ==
X-Gm-Message-State: AJIora9+At6yXLgJgINuxoe5QnioMBk1IPBdVef0Alg2dgKa8rrNOglO
        ek5LAW+FEkG17olvvaw6B1bc1g==
X-Google-Smtp-Source: AGRyM1ta7gDoJdeKHmDjOywkaWbny2+3hO5udiDdBRVMLi3w6bUMQf1nLWx/O1kDfR9+yaM9eOk93A==
X-Received: by 2002:a05:6512:31ca:b0:481:1319:a72b with SMTP id j10-20020a05651231ca00b004811319a72bmr4586773lfe.108.1656577101297;
        Thu, 30 Jun 2022 01:18:21 -0700 (PDT)
Received: from localhost.localdomain (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id c13-20020ac25f6d000000b0047f6c95f2cesm2975181lfc.145.2022.06.30.01.18.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jun 2022 01:18:20 -0700 (PDT)
From:   Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH v9 3/7] clk: qcom: clk-alpha-pll: fix clk_trion_pll_configure description
Date:   Thu, 30 Jun 2022 11:18:16 +0300
Message-Id: <20220630081816.2554031-1-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220630081742.2554006-1-vladimir.zapolskiy@linaro.org>
References: <20220630081742.2554006-1-vladimir.zapolskiy@linaro.org>
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
Changes from v1 to v9:
* none.

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

