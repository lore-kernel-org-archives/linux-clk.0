Return-Path: <SRS0=daJW=WW=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41DBCC41514
	for <linux-clk@archiver.kernel.org>; Mon, 26 Aug 2019 16:45:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1B05C21872
	for <linux-clk@archiver.kernel.org>; Mon, 26 Aug 2019 16:45:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VTzy/+S+"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733018AbfHZQp1 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 26 Aug 2019 12:45:27 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:32823 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732968AbfHZQpT (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 26 Aug 2019 12:45:19 -0400
Received: by mail-wm1-f66.google.com with SMTP id p77so425757wme.0
        for <linux-clk@vger.kernel.org>; Mon, 26 Aug 2019 09:45:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=onetUiZPcKYw43ltVy2pax5WwMNPrRMe/eAwSVGynt4=;
        b=VTzy/+S+EG6NglyCNwJnyPj3v2a/38li9pyUxYKXw95aeoqEm9GPssQFRmUG5oI5c6
         EibgtBUP8JpXh9l/UOZyVKOalAwVOkPO8s9pNn7XDDPcxuydVS9l5FodOV0SUHXsMs/6
         a+ShgY60QQ25TmCk+KweofZi35NxEKp9vY/YYEGj1WvkEMsyEAO9pHrsoCjZkIfjqK7C
         NDsyahCeF26dySxYSNWqn5Sg+1TpbEPNIBwt+txXub1CsghTQ5+TdX76yEufnG9UVhgI
         w8Qbj+iA35AgTzxoF9TK2WruT0+7K0jCSVJp/6qNba2MXP71JyvQN8RXct+m5qD4Tufm
         2dAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=onetUiZPcKYw43ltVy2pax5WwMNPrRMe/eAwSVGynt4=;
        b=d2nfMaJRCxnHXXDTiA9ktskEkdePgXx2WhrSnqX7gxC9D+Pm3gFJPNiNjn9D98H+wU
         wuZis9xaETzfUMeXFqep23/eeFDqJwKLVRoz79T+pXo82ygQW0YxpG4veruOwzFp63nE
         MtV46bWwaG21ykkGsOpJn0tgaeozX7HhToG6vkvbJO8e00JS7v765g9CeaqsmB25aLMO
         1whaVeJOvVuqWCd3S0w+yw5Mldw1h7BKbZIGAgM8TjsmdWZiIXNG18h7DMrDkIee3JKA
         /6yBfssKVhzdGWyeBapEYW08Kz1g4OxdBpTLC61U4M1r15g+3JM2A5IFaNwV7IE8//S0
         vN8g==
X-Gm-Message-State: APjAAAXq7QEVwB8BGvpWW+/GINa0OoSFHKMrSHtgEFUa3OdPkyZ03DHm
        dcNt3y7tneRMySLF4Dmfj+RnrA==
X-Google-Smtp-Source: APXvYqz1ti6G8ykQXaSBWITNSJt9no2xf8IMdYAR5XEK+i92tzuI2ROTgl+pfgyiar++tcx9MbRJlQ==
X-Received: by 2002:a7b:c947:: with SMTP id i7mr23496677wml.77.1566837917375;
        Mon, 26 Aug 2019 09:45:17 -0700 (PDT)
Received: from localhost.localdomain (124.red-83-36-179.dynamicip.rima-tde.net. [83.36.179.124])
        by smtp.gmail.com with ESMTPSA id l62sm77872wml.13.2019.08.26.09.45.16
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Mon, 26 Aug 2019 09:45:16 -0700 (PDT)
From:   Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
To:     jorge.ramirez-ortiz@linaro.org, sboyd@kernel.org,
        agross@kernel.org, mturquette@baylibre.com
Cc:     bjorn.andersson@linaro.org, niklas.cassel@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 4/5] clk: qcom: hfpll: register as clock provider
Date:   Mon, 26 Aug 2019 18:45:09 +0200
Message-Id: <20190826164510.6425-4-jorge.ramirez-ortiz@linaro.org>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190826164510.6425-1-jorge.ramirez-ortiz@linaro.org>
References: <20190826164510.6425-1-jorge.ramirez-ortiz@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Make the output of the high frequency pll a clock provider.
On the QCS404 this PLL controls cpu frequency scaling.

Co-developed-by: Niklas Cassel <niklas.cassel@linaro.org>
Signed-off-by: Niklas Cassel <niklas.cassel@linaro.org>
Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Acked-by: Stephen Boyd <sboyd@kernel.org>
---
 drivers/clk/qcom/hfpll.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/hfpll.c b/drivers/clk/qcom/hfpll.c
index 87b7f46d27e0..0ffed0d41c50 100644
--- a/drivers/clk/qcom/hfpll.c
+++ b/drivers/clk/qcom/hfpll.c
@@ -53,6 +53,7 @@ static int qcom_hfpll_probe(struct platform_device *pdev)
 	struct regmap *regmap;
 	struct clk_hfpll *h;
 	struct clk *pclk;
+	int ret;
 	struct clk_init_data init = {
 		.parent_names = (const char *[]){ "xo" },
 		.num_parents = 1,
@@ -87,7 +88,14 @@ static int qcom_hfpll_probe(struct platform_device *pdev)
 	h->clkr.hw.init = &init;
 	spin_lock_init(&h->lock);
 
-	return devm_clk_register_regmap(&pdev->dev, &h->clkr);
+	ret = devm_clk_register_regmap(dev, &h->clkr);
+	if (ret) {
+		dev_err(dev, "failed to register regmap clock: %d\n", ret);
+		return ret;
+	}
+
+	return devm_of_clk_add_hw_provider(dev, of_clk_hw_simple_get,
+					   &h->clkr.hw);
 }
 
 static struct platform_driver qcom_hfpll_driver = {
-- 
2.22.0

