Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2357BC4332F
	for <linux-clk@archiver.kernel.org>; Sat, 10 Dec 2022 19:10:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229876AbiLJTKS (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 10 Dec 2022 14:10:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229563AbiLJTKR (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 10 Dec 2022 14:10:17 -0500
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38B5913FA7
        for <linux-clk@vger.kernel.org>; Sat, 10 Dec 2022 11:10:16 -0800 (PST)
Received: by mail-lj1-x233.google.com with SMTP id n1so8392620ljg.3
        for <linux-clk@vger.kernel.org>; Sat, 10 Dec 2022 11:10:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bEEgpwN+DNywz5DhvEe3UzNuFnhw17KrrTPns7zTSqQ=;
        b=bCqPhNhSoh1kzEB4gmTmGzrZhJSD+pMBXArbBHZMWZNCYxHW1sc21kM64ESZsnE/eg
         7J6lM05DGhfQe/uC1YABiy4ZMwKKomsbq1I7f+v3sRdo1hE1sBrL5yh+QbwHxm5mtzdi
         CbretvUK6mwRuVwCAjeFtevA+tiMHh+InmqwJp3SUSah1bqmhdbLhsRuDPNs/Iqtm4g7
         sBt+/fUiO21QN0MZUxU+9Lc2PpDgz0a5on4c1X72ce3h4KzW1L0kzdwM5jOvATg/AuKe
         G7kQVKc+25qqeN+MUyNEDEOe8KYcdOJfk+Y7y17lZXxH/6RNERWEoTAGMRkX24EV/T+l
         WJfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bEEgpwN+DNywz5DhvEe3UzNuFnhw17KrrTPns7zTSqQ=;
        b=5EaeN1jZffjhyDVXrG7QlWnKT2lrhUi2uvpRGX+fcz6kgQlDzhqWd2cLh1w2Vae73+
         F04XKKlRSa0BIg2Kl1Fb/NjBs0HRKq39WE5oU8MQaCN3TnS3LW91wtfihKRXsm53GyR+
         CQ5pZB3EVavijar9kjNkXkiUxiYcKKo1AvPz+QjvzXce+ptAueQjMcv0BfYesmuehvYK
         0qYydvhN2ZJVehcItbS3DVcfHGaX3PGdlxnNeTRBPfR2ow1U1Q37gAi4zFBswqeDYp2M
         +MDSgPXHssELgxdoynLpQnhRgy+nJYUzZjC6tWTdBX8yIwisCw7Nemd6hL5LkWpLON7k
         FSNw==
X-Gm-Message-State: ANoB5pkKTABDxV7IerYqIu2NvPTbFuMilPAn+F19eIg+o8XkLEo6AiRj
        Tlzn3uLQsqxRkxatZnCLr+lPgw==
X-Google-Smtp-Source: AA0mqf54GBfYkEVtwG5KiU7s6ks5/k3r9/nr7RGKxwhXM584eS0sxMZDMzHJtqGkEoqhWQqs2710rg==
X-Received: by 2002:a2e:a305:0:b0:27a:31cc:c88 with SMTP id l5-20020a2ea305000000b0027a31cc0c88mr2368335lje.51.1670699414628;
        Sat, 10 Dec 2022 11:10:14 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id v11-20020a2ea60b000000b0027966a022c9sm711414ljp.5.2022.12.10.11.10.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Dec 2022 11:10:14 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH v2] clk: qcom: clk-spmi-pmic-div: convert to use parent_data
Date:   Sat, 10 Dec 2022 22:10:13 +0300
Message-Id: <20221210191013.453040-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The clk-spmi-pmic-div driver gets the parent name from the first (and
the only) clock parent. So, use parent data, index 0 to setup the clock.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---

Changes since v1:
- Moved parent_data to be the onstack var.

---
 drivers/clk/qcom/clk-spmi-pmic-div.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/qcom/clk-spmi-pmic-div.c b/drivers/clk/qcom/clk-spmi-pmic-div.c
index f2cf55cee2fd..f846be285f51 100644
--- a/drivers/clk/qcom/clk-spmi-pmic-div.c
+++ b/drivers/clk/qcom/clk-spmi-pmic-div.c
@@ -204,7 +204,7 @@ static int spmi_pmic_clkdiv_probe(struct platform_device *pdev)
 	struct regmap *regmap;
 	struct device *dev = &pdev->dev;
 	struct device_node *of_node = dev->of_node;
-	const char *parent_name;
+	struct clk_parent_data parent_data = { .index = 0, };
 	int nclks, i, ret, cxo_hz;
 	char name[20];
 	u32 start;
@@ -246,14 +246,8 @@ static int spmi_pmic_clkdiv_probe(struct platform_device *pdev)
 	cxo_hz = clk_get_rate(cxo);
 	clk_put(cxo);
 
-	parent_name = of_clk_get_parent_name(of_node, 0);
-	if (!parent_name) {
-		dev_err(dev, "missing parent clock\n");
-		return -ENODEV;
-	}
-
 	init.name = name;
-	init.parent_names = &parent_name;
+	init.parent_data = &parent_data;
 	init.num_parents = 1;
 	init.ops = &clk_spmi_pmic_div_ops;
 
-- 
2.30.2

