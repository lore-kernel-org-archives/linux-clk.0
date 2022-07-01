Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15E8DC43334
	for <linux-clk@archiver.kernel.org>; Fri,  1 Jul 2022 06:27:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234766AbiGAG13 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 1 Jul 2022 02:27:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234798AbiGAG1W (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 1 Jul 2022 02:27:22 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 117F945534
        for <linux-clk@vger.kernel.org>; Thu, 30 Jun 2022 23:27:22 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id z21so2108008lfb.12
        for <linux-clk@vger.kernel.org>; Thu, 30 Jun 2022 23:27:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=j+qS+yJC33eGuGiqDConhkC5ge78SDrTaviIxdaaPXQ=;
        b=OtOixz4TFThQZKKAHuG5ev3Zls4Zbhbz0dyxi3cv59q7jY+Fz5gbFjU3QkRB7CnfY7
         vhWzUVtT8oREuppu4QOBkLyLsOnxpXHvpWA1JM1QfREMS5lZvsmoN15Vmp+DM2O8ImWU
         EbwudVRwcPzee1ZHEJMGBx6Wmd9parCuEF2UFmycioyDrFgNOcHzg1jrSkuL5vmg6HFv
         QXwYZdNVKhPVZen0muthO4Og+oS6snDY2YNGqkvz1PL/PfF5EgqjJRiDE/0ea4eLFk3m
         ukk26z8nEWKmKS+p6MT7bxLHo8gqHDPTTJYweOcLxwbZbvVfkjjnG4pzz9jcpLHiDLaF
         ReJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=j+qS+yJC33eGuGiqDConhkC5ge78SDrTaviIxdaaPXQ=;
        b=x9K/vsfG5JXwVaoaOgjgGIqmk5wmb16gnTXL1wsnJh1QdlzvdSZEFo4PxWVX42Sbkv
         jfbwqJaP1+Fq25cA9qsqiUKBmM6BMK5yYB+CrQXHrZp/kWZZ/Ygmwg0Vo3+wEfnGS80Y
         erqZvwvuPP+0t1KAD/b/CbLMKkvmmrXQr8vjC7ZUI7ewGHOeXFzNHywAYIZxNujGWekt
         zoj95tvPSxZf6VpZpQsXWnR0YQqz2HDoRX3GT2g5vjL2AOWO2XaerJZYJ9QbB+GcJ7PX
         ywEBO0kbK8Dy29aT1LVhvgssTXYdvZ7L3vac/5+AlL9z3/sQJfcxEBWrp6ib1m2a0SoZ
         fZqw==
X-Gm-Message-State: AJIora/TKOGwt9gIYHwAStBPeEmzS+R7/Iv7XLQ9rD/U+8JqtwDf0GwV
        vqGMHIkbqFNalK1y/cPmuUnC+NbJp1rDfg==
X-Google-Smtp-Source: AGRyM1vkPfYKIOYOjWMNPvO+PYzrObW9YTjl6eek61yvFPOuuUfzIhx6a6yC/yHfDQ5ZC0o41yJGOw==
X-Received: by 2002:a05:6512:16a2:b0:47f:3f22:c349 with SMTP id bu34-20020a05651216a200b0047f3f22c349mr8342637lfb.8.1656656840326;
        Thu, 30 Jun 2022 23:27:20 -0700 (PDT)
Received: from localhost.localdomain (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id bt10-20020a056512260a00b0047255d210e0sm3480569lfb.15.2022.06.30.23.27.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jun 2022 23:27:20 -0700 (PDT)
From:   Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Vinod Koul <vkoul@kernel.org>
Subject: [PATCH v10 3/7] clk: qcom: clk-alpha-pll: fix clk_trion_pll_configure description
Date:   Fri,  1 Jul 2022 09:27:11 +0300
Message-Id: <20220701062711.2757855-1-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220701062622.2757831-1-vladimir.zapolskiy@linaro.org>
References: <20220701062622.2757831-1-vladimir.zapolskiy@linaro.org>
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
Reviewed-by: Vinod Koul <vkoul@kernel.org>
Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
Changes from v9 to v10:
* added reviewed tag by Vinod.

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

