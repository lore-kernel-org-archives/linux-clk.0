Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E686DC4332F
	for <linux-clk@archiver.kernel.org>; Thu,  8 Dec 2022 14:40:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229824AbiLHOj4 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 8 Dec 2022 09:39:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229890AbiLHOjt (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 8 Dec 2022 09:39:49 -0500
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6EE5F4299F
        for <linux-clk@vger.kernel.org>; Thu,  8 Dec 2022 06:39:48 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id x28so2347406lfn.6
        for <linux-clk@vger.kernel.org>; Thu, 08 Dec 2022 06:39:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iuZU6ZomwdEh8W1Uuo9g2ASEzurguKGrErnitMPuxT0=;
        b=jTjD+wZ2A9vQjLvPH/ypfuEhl366Qq5tb/UlCf0nxmEJta29gwULXM+aLZSYrLhlv/
         WcMSKOcVlFV3Pa4ULMNpPBWb4wakbR8XxPD0m5LVdY8r+Vgw2aS04ftQsAk1Ks4Vbj7g
         kKqvUs78MhRRZRaTALkEFGOXviLN7hasLgUvC7X7FzZo2OIIHbrnishm8fViDGbvGziJ
         NNnORdQGiUvFtHLF2PNQo19aWbmbakNmZOKdXZXO3exTGfaq/yB7fWF3kjI2vPi8iDnS
         bfwjyclRZzAP0aRsCzu7i27jSRZ+C3YaF9tfmzhp3+xmwCjV1i35a7XPIEW+34cSLc8Y
         FxnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iuZU6ZomwdEh8W1Uuo9g2ASEzurguKGrErnitMPuxT0=;
        b=1v9Bnqbs3GmLkHctocqCFuEY8KLsuQGiR8gKt8ktBGfQvN8wbYl6vv7jaEulBsitwp
         /tXEkMH3iZfEoQfaumEbDkZzbajZOmlz+U/YOJigJmNIvy7GUNsRxJE44IFzImJkZ6QR
         a10KCEk9a4to2Yn6DLF++wewH2dD5ZlTA6BzlDnTSttptYYyzCjJs3kIgUKYj7Jq4e67
         uaoDpNvyoe1wZr5+yiDxCpR0Q8BavCEZu02vXHgtC0z6Zj0gK1Ah1La4evxk1F5ksu+/
         ep9Aj4dpJQKxLVXHrYajuw0C/OPtFx6zzkBt5aQuXXhuB+pifprNqSDUryIovyaG0gk6
         sOOg==
X-Gm-Message-State: ANoB5plWAPds5jb/651Rz6N6qbBqLYACbDsw2OAmSYfgxAf8BvfPQzCO
        1+SuYWVCwsuEyyf/AU09y1BzgA==
X-Google-Smtp-Source: AA0mqf5knspU5+D9Xmqc9+5ROCb+ILBKnaQ+35+buAO8KwKj8K96ojC0qTIp2OpOXM7XBIG3QnLAFA==
X-Received: by 2002:a05:6512:3ba6:b0:4a2:2bd7:d4fd with SMTP id g38-20020a0565123ba600b004a22bd7d4fdmr29457686lfv.613.1670510386749;
        Thu, 08 Dec 2022 06:39:46 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id q9-20020ac25fc9000000b004b40f5e7336sm3354213lfg.199.2022.12.08.06.39.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Dec 2022 06:39:46 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH] clk: qcom: clk-spmi-pmic-div: convert to use parent_data
Date:   Thu,  8 Dec 2022 17:39:45 +0300
Message-Id: <20221208143945.50279-1-dmitry.baryshkov@linaro.org>
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
 drivers/clk/qcom/clk-spmi-pmic-div.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/qcom/clk-spmi-pmic-div.c b/drivers/clk/qcom/clk-spmi-pmic-div.c
index f2cf55cee2fd..aa015c51ab4f 100644
--- a/drivers/clk/qcom/clk-spmi-pmic-div.c
+++ b/drivers/clk/qcom/clk-spmi-pmic-div.c
@@ -175,6 +175,10 @@ static const struct clk_ops clk_spmi_pmic_div_ops = {
 	.round_rate = clk_spmi_pmic_div_round_rate,
 };
 
+static const struct clk_parent_data clk_spmi_pmic_parent_data = {
+	.index = 0,
+};
+
 struct spmi_pmic_div_clk_cc {
 	int		nclks;
 	struct clkdiv	clks[];
@@ -204,7 +208,6 @@ static int spmi_pmic_clkdiv_probe(struct platform_device *pdev)
 	struct regmap *regmap;
 	struct device *dev = &pdev->dev;
 	struct device_node *of_node = dev->of_node;
-	const char *parent_name;
 	int nclks, i, ret, cxo_hz;
 	char name[20];
 	u32 start;
@@ -246,14 +249,8 @@ static int spmi_pmic_clkdiv_probe(struct platform_device *pdev)
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
+	init.parent_data = &clk_spmi_pmic_parent_data;
 	init.num_parents = 1;
 	init.ops = &clk_spmi_pmic_div_ops;
 
-- 
2.30.2

