Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D39D4C433F5
	for <linux-clk@archiver.kernel.org>; Thu,  5 May 2022 12:13:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232954AbiEEMQ7 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 5 May 2022 08:16:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355895AbiEEMQ6 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 5 May 2022 08:16:58 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B7A365BE
        for <linux-clk@vger.kernel.org>; Thu,  5 May 2022 05:13:18 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id q130so5328846ljb.5
        for <linux-clk@vger.kernel.org>; Thu, 05 May 2022 05:13:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ju8qIcVxu8nKYNTamtJUWMRGDCG286a6Cxhr7ezIYWA=;
        b=iPZEkRw4cANYpzZSKcf0MjB2+jb1+GiE9rcWq2x4uy9Wj7+suHV2wEJkeG1cAX9kE0
         v4zM/obWqZi/L36Dnca1uf83qecwrppCepNn/6LcbSpj+jndxsYCl/gG9Tpe7p706Uu0
         6YLGokkSU9OajuJ8/k2r90jPSeDJc7Aoeab95hteMGqbUVaSX+dOO2dbxiZIt6tPj/vt
         b+8PF45o1cJSp5vYsO23PHVTG3u7anOIy/KzYoYlSENxKkVt6mnhxbd1KfQ6WurYBL/a
         1w7zpDCa9BhVae3xdB35CK88U7Lu9UQKZ5fRiVfS/rteomYT/wEmAhWz39bNqITvUUZV
         2wMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ju8qIcVxu8nKYNTamtJUWMRGDCG286a6Cxhr7ezIYWA=;
        b=YAl4uss5PfgeCdZeJ9Dk+Q2vfvjf5WawNoNUAWIgaoATLBxkVInr6D/LMMuOWEIgwF
         V8pb0ARUm851JQQJchnlOU8CjcJaTpZpMmapqDlw3uDRUJmXod2O9J/CllSC/Ro9hHLW
         +NKGEVA0tmTPZPMH6smdU1NQszTwaergpwrQOcjTZXLD5YqjKBrYH7yL8eGHLzQw/0zR
         liY867F8LHi7I4rfDaaSrIEhFOPV6+fEeH9NJpVcM8FVjW8dJLMGJ7GDuZbPbhmQ5Yt6
         y4zKnxfhK96lRbjLuzLkAJA+4a55LbmW72oswNOkX4ASPIwaV3Y4zgasDTcFqn/Cc0fq
         1C2A==
X-Gm-Message-State: AOAM533aPbPh673zhhcy1hc+UJOdpRvHRcqQpSRPBfaJn0j3sLAGG7Y0
        X7tMgXWCfEvaAouwxTfB1+pEBg==
X-Google-Smtp-Source: ABdhPJx02Mwod76TYs9SpDMNS6DnPUSLPt5cGYXLv9Ho4/lHzJn895Lq2i2Sx5fp4CbrjZnBsQUHOA==
X-Received: by 2002:a05:651c:2115:b0:24f:f52e:16a0 with SMTP id a21-20020a05651c211500b0024ff52e16a0mr12088112ljq.362.1651752796994;
        Thu, 05 May 2022 05:13:16 -0700 (PDT)
Received: from localhost.localdomain (mobile-access-5672eb-224.dhcp.inet.fi. [86.114.235.224])
        by smtp.gmail.com with ESMTPSA id b5-20020a056512304500b0047255d2115dsm193441lfb.140.2022.05.05.05.13.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 May 2022 05:13:16 -0700 (PDT)
From:   Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH v3 3/7] clk: qcom: clk-alpha-pll: fix clk_trion_pll_configure description
Date:   Thu,  5 May 2022 15:13:13 +0300
Message-Id: <20220505121313.4121829-1-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220505121213.4121802-1-vladimir.zapolskiy@linaro.org>
References: <20220505121213.4121802-1-vladimir.zapolskiy@linaro.org>
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

