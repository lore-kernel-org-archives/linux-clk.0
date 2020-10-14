Return-Path: <SRS0=IVDQ=DW=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B600EC4363A
	for <linux-clk@archiver.kernel.org>; Thu, 15 Oct 2020 01:59:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6CDE52225C
	for <linux-clk@archiver.kernel.org>; Thu, 15 Oct 2020 01:59:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="oVDjvWnu"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389004AbgJOB7m (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 14 Oct 2020 21:59:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388315AbgJOB7i (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 14 Oct 2020 21:59:38 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5767C0613E7
        for <linux-clk@vger.kernel.org>; Wed, 14 Oct 2020 14:13:33 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id o9so361381plx.10
        for <linux-clk@vger.kernel.org>; Wed, 14 Oct 2020 14:13:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UCnQG1cBhMq8sAEfp9YHwGGr20fDNSgoS19LMKh/BP8=;
        b=oVDjvWnuq1U6NeeWwlpTVoVBHcOhNPJwfmQuSij8FuzR03FnSwtAezNIrY+JS2xK5K
         vIb0Io2w7OqoXINqo7E/25Yms26wCE/zJN/L2M5fDt9uyO2JDS5vEbtJl75H4FMnamKt
         Asoyph0LcVWoPqpHLQfb/wtylUabh0MDV14NU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UCnQG1cBhMq8sAEfp9YHwGGr20fDNSgoS19LMKh/BP8=;
        b=o+rGyDRiSblO6vMAMf/R6b4wNWfHy7Dr0UM+N5cOXOEASo4JPlkvKdHa9G6Q4dwM/m
         839ZlR8NZZo/b2HVghIg/Ma4QEvXXeWGFoeyeIAnMWcp5+P8c+5fqbuImf5Kfuf7VUjG
         ycaLCsa9TPoZZZQT0R5YLJn15wF0uAarqsET/uZrM9H0moINI93vOGwDajZHFNhKsgZN
         LWMGIEmVPZIdApM03IhW1uMW3R69xVGzjYlpUGqBNWwdoCg800Yf8mEPZG+ikJoTQpo1
         Uswh7BBTpBgEp14ALwY0yDI83aAJ/pwuetDUtJ8nocSKmm7SHElErPZT18kBIb9gphN6
         JcsA==
X-Gm-Message-State: AOAM533yl/rH1bKgsgvLjv7VymoVdS6+BBpVDK0xOSs9ZTy7B5Ipj2qq
        0gW/sRng2ACDS3bK7WOj+LqHXQ==
X-Google-Smtp-Source: ABdhPJzmnhmXwPmAM9QvkGG3hYxCXL8UxTqQTC8Zzu5uRBiRSDcAniSEJ0ogn4kjvYagyoaJx+ixeQ==
X-Received: by 2002:a17:90b:128f:: with SMTP id fw15mr1013609pjb.107.1602710013501;
        Wed, 14 Oct 2020 14:13:33 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:42b0:34ff:fe3d:58e6])
        by smtp.gmail.com with ESMTPSA id p19sm517713pfn.204.2020.10.14.14.13.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2020 14:13:32 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Taniya Das <tdas@codeaurora.org>, linux-soc@vger.kernel.org,
        David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/3] clk: qcom: lpasscc-sc7180: Re-configure the PLL in case lost
Date:   Wed, 14 Oct 2020 14:05:23 -0700
Message-Id: <20201014140507.v3.3.Id0cc5d859e2422082a29a7909658932c857f5a81@changeid>
X-Mailer: git-send-email 2.28.0.1011.ga647a8990f-goog
In-Reply-To: <20201014140507.v3.1.I4567b5e7e17bbb15ef063d447cb83fd43746cb18@changeid>
References: <20201014140507.v3.1.I4567b5e7e17bbb15ef063d447cb83fd43746cb18@changeid>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Taniya Das <tdas@codeaurora.org>

In the case where the PLL configuration is lost, then the pm runtime
resume will reconfigure before usage.

Fixes: edab812d802d ("clk: qcom: lpass: Add support for LPASS clock controller for SC7180")
Signed-off-by: Taniya Das <tdas@codeaurora.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v3:
- Now based on a series which disentangles the two clock devices.
- Use dev_get_regmap().
- Better comment about reading PLL_L_VAL.

Changes in v2:
- Don't needlessly have a 2nd copy of dev_pm_ops and jam it in.
- Check the return value of pm_clk_resume()
- l_val should be unsigned int.

 drivers/clk/qcom/lpasscorecc-sc7180.c | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/lpasscorecc-sc7180.c b/drivers/clk/qcom/lpasscorecc-sc7180.c
index 48d370e2108e..e12d4c2b1b70 100644
--- a/drivers/clk/qcom/lpasscorecc-sc7180.c
+++ b/drivers/clk/qcom/lpasscorecc-sc7180.c
@@ -388,6 +388,25 @@ static int lpass_create_pm_clks(struct platform_device *pdev)
 	return ret;
 }
 
+static int lpass_core_cc_pm_clk_resume(struct device *dev)
+{
+	struct regmap *regmap = dev_get_regmap(dev, "lpass_core_cc");
+	unsigned int l_val;
+	int ret;
+
+	ret = pm_clk_resume(dev);
+	if (ret)
+		return ret;
+
+	/* If PLL_L_VAL was cleared then we should re-init the whole PLL */
+	regmap_read(regmap, 0x1004, &l_val);
+	if (!l_val)
+		clk_fabia_pll_configure(&lpass_lpaaudio_dig_pll, regmap,
+				&lpass_lpaaudio_dig_pll_config);
+
+	return 0;
+}
+
 static int lpass_core_cc_sc7180_probe(struct platform_device *pdev)
 {
 	const struct qcom_cc_desc *desc;
@@ -457,7 +476,7 @@ static const struct of_device_id lpass_core_cc_sc7180_match_table[] = {
 MODULE_DEVICE_TABLE(of, lpass_core_cc_sc7180_match_table);
 
 static const struct dev_pm_ops lpass_core_cc_pm_ops = {
-	SET_RUNTIME_PM_OPS(pm_clk_suspend, pm_clk_resume, NULL)
+	SET_RUNTIME_PM_OPS(pm_clk_suspend, lpass_core_cc_pm_clk_resume, NULL)
 };
 
 static struct platform_driver lpass_core_cc_sc7180_driver = {
-- 
2.28.0.1011.ga647a8990f-goog

