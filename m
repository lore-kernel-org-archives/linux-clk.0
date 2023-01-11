Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7290C678D6
	for <linux-clk@archiver.kernel.org>; Wed, 11 Jan 2023 19:20:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236216AbjAKTUX (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 11 Jan 2023 14:20:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231510AbjAKTUO (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 11 Jan 2023 14:20:14 -0500
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1CCBE10B79
        for <linux-clk@vger.kernel.org>; Wed, 11 Jan 2023 11:20:13 -0800 (PST)
Received: by mail-lj1-x22b.google.com with SMTP id s25so17073754lji.2
        for <linux-clk@vger.kernel.org>; Wed, 11 Jan 2023 11:20:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lRtL6Eef4RVgyfHAkdoUF1I7EUT/FswJ9g5onTCIfoQ=;
        b=hhLFIE8mcq9jQntC6JKJYrzOWorc0tkPXXeghVqmKf+tK5KMecdQlacVW8jxqIPNXk
         Dcq7j5q602MMahelnW0Lb/bjS75CR/MCOZJSs5YbB8ARelab8Rn3I8AnW3IZXqJLkzM0
         aspaywfNlRnqT3laWvposvhfro0C+z8X7iMlXbR9IleaAMGKN4pZjIKK/fVPSuwYvrUL
         7P1ihnx2J5ECEnyPO/H/95tzaWN/ec5eABaXBtuZOTSM4RHdV4XxR1zje6xGJiUocJTG
         NUGf6U7A/Ywf9Uvb4DewL0FTdUQdWNUCfpWZuFqcfjkynNjmMO+PZNwEcMOGmvQ68M+V
         URtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lRtL6Eef4RVgyfHAkdoUF1I7EUT/FswJ9g5onTCIfoQ=;
        b=WhqCO7SaeNUdCveXvz9esuvkNrgIBzkT0/bMGzTJcd31g4FW1Et8u8evRkEEXNpOYM
         XssmUT4wVZt5XL+zSgkqT5DfXpcuQtUwBOwl1QezGkLwcfVgdN4guy0BoQQqg2O59FVt
         hc+9Tejm3oRZD3LxCV1YcAZlgFbc5B//qxiwt3mid8SL0TVnacUxze7dpsnpVUHmx96U
         e6hsOXRMy35vnAGPjhDXCA1hcroMyjIgYUtQ6KkuPyWoJbAb2/rJQFPqUHkPkXh2tXzz
         71AmDHq7mRRGxCUlvXrmPS55ZQt4vCq1z4UMdqx1gOdPjQ4FTZyGigTv7jlQ1oIfjgo5
         x3fg==
X-Gm-Message-State: AFqh2kqvET4Io5JHG6bQGvXvX6H3ywkJvrPI+ieBt7ML1AEaEBsu4rze
        +NvRO41Nn2lSVw9fIDMspA08tQ==
X-Google-Smtp-Source: AMrXdXvCBIkAEZGDbN/ZqLtvndgjBWGXqt3p/tDjEf4UH4lqYIbGvE+PTCzH+rfOp05DrRSehw+yfw==
X-Received: by 2002:a05:651c:2004:b0:27f:ff67:91cb with SMTP id s4-20020a05651c200400b0027fff6791cbmr6924851ljo.12.1673464811513;
        Wed, 11 Jan 2023 11:20:11 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id bj36-20020a2eaaa4000000b0027ff2fabcb5sm1807787ljb.104.2023.01.11.11.20.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jan 2023 11:20:11 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH 06/13] clk: qcom: cpu-8996: simplify the cpu_clk_notifier_cb
Date:   Wed, 11 Jan 2023 22:19:57 +0300
Message-Id: <20230111192004.2509750-7-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230111192004.2509750-1-dmitry.baryshkov@linaro.org>
References: <20230111192004.2509750-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

- Do not use the Alt PLL completely. Switch to smux when necessary to
  prevent overvolting
- Restore the parent in case the rate change aborts for some reason
- Do not duplicate resetting the parent in set_parent operation.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/clk-cpu-8996.c | 31 +++++++++++++++++++------------
 1 file changed, 19 insertions(+), 12 deletions(-)

diff --git a/drivers/clk/qcom/clk-cpu-8996.c b/drivers/clk/qcom/clk-cpu-8996.c
index 7e5246ca7e7f..ee7e18b37832 100644
--- a/drivers/clk/qcom/clk-cpu-8996.c
+++ b/drivers/clk/qcom/clk-cpu-8996.c
@@ -506,27 +506,34 @@ static int cpu_clk_notifier_cb(struct notifier_block *nb, unsigned long event,
 {
 	struct clk_cpu_8996_pmux *cpuclk = to_clk_cpu_8996_pmux_nb(nb);
 	struct clk_notifier_data *cnd = data;
-	int ret;
 
 	switch (event) {
 	case PRE_RATE_CHANGE:
-		ret = clk_cpu_8996_pmux_set_parent(&cpuclk->clkr.hw, ALT_INDEX);
 		qcom_cpu_clk_msm8996_acd_init(base);
+
+		/*
+		 * Avoid overvolting. clk_core_set_rate_nolock() walks from top
+		 * to bottom, so it will change the rate of the PLL before
+		 * chaging the parent of PMUX. This can result in pmux getting
+		 * clocked twice the expected rate.
+		 *
+		 * Manually switch to PLL/2 here.
+		 */
+		if (cnd->new_rate < DIV_2_THRESHOLD &&
+		    cnd->old_rate > DIV_2_THRESHOLD)
+			clk_cpu_8996_pmux_set_parent(&cpuclk->clkr.hw, SMUX_INDEX);
+
 		break;
-	case POST_RATE_CHANGE:
-		if (cnd->new_rate < DIV_2_THRESHOLD)
-			ret = clk_cpu_8996_pmux_set_parent(&cpuclk->clkr.hw,
-							   SMUX_INDEX);
-		else
-			ret = clk_cpu_8996_pmux_set_parent(&cpuclk->clkr.hw,
-							   ACD_INDEX);
-		break;
+	case ABORT_RATE_CHANGE:
+		/* Revert manual change */
+		if (cnd->new_rate < DIV_2_THRESHOLD &&
+		    cnd->old_rate > DIV_2_THRESHOLD)
+			clk_cpu_8996_pmux_set_parent(&cpuclk->clkr.hw, ACD_INDEX);
 	default:
-		ret = 0;
 		break;
 	}
 
-	return notifier_from_errno(ret);
+	return NOTIFY_OK;
 };
 
 static int qcom_cpu_clk_msm8996_driver_probe(struct platform_device *pdev)
-- 
2.30.2

