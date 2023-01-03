Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C028AC53210
	for <linux-clk@archiver.kernel.org>; Tue,  3 Jan 2023 14:56:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238086AbjACO4C (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 3 Jan 2023 09:56:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238032AbjACOzq (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 3 Jan 2023 09:55:46 -0500
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B466210FF8
        for <linux-clk@vger.kernel.org>; Tue,  3 Jan 2023 06:55:36 -0800 (PST)
Received: by mail-lj1-x22c.google.com with SMTP id i19so19163616ljg.8
        for <linux-clk@vger.kernel.org>; Tue, 03 Jan 2023 06:55:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5PUHxikh6ixLObBbSQSvhLpdNZFpYsbA0B7Pmct7Lkg=;
        b=uuzV6YGdI/nFu0MJa9RiVYtwlAsWrxwij7AMGjAlo8213pjVDzEhvgjVZ+jCHmdm1r
         Wb5A9QDECKIENr/3WIyM7jTdFDespXtnpG0fj47I66xsrUTIsYOFC+lIdiZpmpImZ3N+
         z+UUHwlMEoPPH1hLXQxts8NnZa5m83jp47Cw5lvFzdzstETH+VZoKptWf3LHnv6bQvbT
         Zkw2lFe3rbPCCtsFa8j7DN2ZdNurR3t9fchYP3s/BUt27TTiBWdpKWL7hNnw52GgyB80
         9vlrzXdT1Rfx7GqRvLHN3iGAYKrwIzFKqIzKSXzrpreDioYCYOsbs4FU77ipWy7XgtLu
         IKgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5PUHxikh6ixLObBbSQSvhLpdNZFpYsbA0B7Pmct7Lkg=;
        b=DnA0aR3zX+FnbPPBRQhCvGR/6akgmdCGFEernzyrB8DgPPuZZixG4jiufLc0PhjJof
         fC4Apjm+VrnPKF6jdYdGQ9KssEABoZmxKUQGKB3BorFE67jcoDR3odZrkpUGv+zRF3N2
         dgKZWUrB/m3CmG1uJgVwfODMA+KuTAgCKw3pdVLQBE2gsH9fv6QJGGZf/3gOYSR9xmV0
         RcWYS1z8d4Sgrd45OfEaNGWPNL/2FvnNik3jK5slakwO3UwZzS2Lk2NvOPZdERqB/Va2
         EYv+yFvnZ2wrgKr6gnO6E0HEDBBeIiytgNApULSJWLrjl2YVxOVDaLhxTKg7s1ZknJdI
         sU7w==
X-Gm-Message-State: AFqh2kokErGrUBRSV10ScjrjZ4jB1fBmiYQbrAkSppCve+G5N/3ls33D
        YdY8jV2cnHz8egwuNMR9r7wQyQ==
X-Google-Smtp-Source: AMrXdXtg5Z9jsUeRUcJYDTPzlpCywVNNBeEiA8Zd3VF8SlHHxj5b+uumrSXdE2wBIYtKwfGZYs9Tyw==
X-Received: by 2002:a2e:9b9a:0:b0:27f:be4b:286a with SMTP id z26-20020a2e9b9a000000b0027fbe4b286amr8169876lji.42.1672757736305;
        Tue, 03 Jan 2023 06:55:36 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id s24-20020a2eb638000000b00279cbcfd7dbsm3544015ljn.30.2023.01.03.06.55.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jan 2023 06:55:35 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH 19/21] clk: qcom: dispcc-sm8450: switch to devm_pm_runtime_enable
Date:   Tue,  3 Jan 2023 16:55:13 +0200
Message-Id: <20230103145515.1164020-20-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230103145515.1164020-1-dmitry.baryshkov@linaro.org>
References: <20230103145515.1164020-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Switch to using the devm_pm_runtime_enable() instead of hand-coding
corresponding action to call pm_runtime_disable().

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/dispcc-sm8450.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/clk/qcom/dispcc-sm8450.c b/drivers/clk/qcom/dispcc-sm8450.c
index 40efa4682bed..adbfd30bfc96 100644
--- a/drivers/clk/qcom/dispcc-sm8450.c
+++ b/drivers/clk/qcom/dispcc-sm8450.c
@@ -1762,19 +1762,12 @@ static const struct of_device_id disp_cc_sm8450_match_table[] = {
 };
 MODULE_DEVICE_TABLE(of, disp_cc_sm8450_match_table);
 
-static void disp_cc_sm8450_pm_runtime_disable(void *data)
-{
-	pm_runtime_disable(data);
-}
-
 static int disp_cc_sm8450_probe(struct platform_device *pdev)
 {
 	struct regmap *regmap;
 	int ret;
 
-	pm_runtime_enable(&pdev->dev);
-
-	ret = devm_add_action_or_reset(&pdev->dev, disp_cc_sm8450_pm_runtime_disable, &pdev->dev);
+	ret = devm_pm_runtime_enable(&pdev->dev);
 	if (ret)
 		return ret;
 
-- 
2.39.0

