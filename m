Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB94AC43217
	for <linux-clk@archiver.kernel.org>; Fri,  4 Nov 2022 13:57:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229699AbiKDN5d (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 4 Nov 2022 09:57:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231857AbiKDN5O (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 4 Nov 2022 09:57:14 -0400
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1F892F650
        for <linux-clk@vger.kernel.org>; Fri,  4 Nov 2022 06:57:06 -0700 (PDT)
Received: by mail-pl1-x62d.google.com with SMTP id v17so4965510plo.1
        for <linux-clk@vger.kernel.org>; Fri, 04 Nov 2022 06:57:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aUmqfMirOXscpTm4z7KeYAbRwSxaLS1LCpAqzIugH4o=;
        b=eFXFoY//OFMqP6HSReO/W8MW+RQMgzamdcVyeG9A7zNIChv+0Da/f6kd5ZBVa+JgOF
         sqx8QNOHF8Iz3fjRKHGsiVn65gJms5N1Uh6g0EIJTCKtoxXEs6BITwDvAu1GMU0PHQN5
         HtdwShla/MTLqVq2kK6sGwV8+WKJNedmFYYQQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aUmqfMirOXscpTm4z7KeYAbRwSxaLS1LCpAqzIugH4o=;
        b=z+anMWr5E4N68Op3NtoyHQNPMwUte43hfbk1MEz5OSYU8RoPpTnbQMVsIgnh0RU7Re
         dMTNvMmIVHrFpaxye0vkveG3H6+SQzBlB4ZZCgpswIPAhuNCo4ZrDmHIvlNmiWZB5C+w
         wR5S2l+f4mUJa4W1l2ldle48qLJKg9sa/YNGGm/lFHe6MiurHNP1ynCcapaKp01dPEy1
         bfPitq56Ps0374BEFCKi6IRpoi9+E9b8+LO+otlPzaRHBGJj4ZKS7ZjtjjZ7AofZuAJi
         324XhAKeEXOMmuNmH5P04IReCvp+qJjBMC1WJ0qYsRBVawIamjHJ2ZyP0V0IPBhcsF8D
         8P2g==
X-Gm-Message-State: ACrzQf33HcAHpmnSZI8eXC6dik7rT3QJEN7zE9PgNra7fMj3ukZf8pnb
        dKK13vtc0fNcBI8BMcYxcjxzHg==
X-Google-Smtp-Source: AMsMyM6YOXj7u1WgsbjsDS1av6KmpteOVbK1rTWolai4sACAFuPp73MaXdq2vfAzhGY0OCEPUPJuAQ==
X-Received: by 2002:a17:903:41c3:b0:186:dfe6:f25 with SMTP id u3-20020a17090341c300b00186dfe60f25mr34810903ple.47.1667570226254;
        Fri, 04 Nov 2022 06:57:06 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:9d:2:5e74:f068:4840:3631])
        by smtp.gmail.com with ESMTPSA id m6-20020a62a206000000b0056bf29c9ba3sm2829367pff.146.2022.11.04.06.57.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Nov 2022 06:57:05 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Stephen Boyd <swboyd@chromium.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc:     Taniya Das <quic_tdas@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Judy Hsiao <judyhsiao@chromium.org>,
        Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>,
        Matthias Kaehlcke <mka@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] clk: qcom: lpass-sc7180: Avoid an extra "struct dev_pm_ops"
Date:   Fri,  4 Nov 2022 06:56:30 -0700
Message-Id: <20221104064055.3.I90ba14a47683a484f26531a08f7b46ace7f0a8a9@changeid>
X-Mailer: git-send-email 2.38.1.431.g37b22c650d-goog
In-Reply-To: <20221104064055.1.I00a0e4564a25489e85328ec41636497775627564@changeid>
References: <20221104064055.1.I00a0e4564a25489e85328ec41636497775627564@changeid>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The two devices managed by lpasscorecc-sc7180.c each had their own
"struct dev_pm_ops". This is not needed. They are exactly the same and
the structure is "static const" so it can't possible change. combine
the two. This matches what's done for sc7280.

This should be a noop other than saving a few bytes.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 drivers/clk/qcom/lpasscorecc-sc7180.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/qcom/lpasscorecc-sc7180.c b/drivers/clk/qcom/lpasscorecc-sc7180.c
index a5731994cbed..33ed91c67e1c 100644
--- a/drivers/clk/qcom/lpasscorecc-sc7180.c
+++ b/drivers/clk/qcom/lpasscorecc-sc7180.c
@@ -459,7 +459,7 @@ static const struct of_device_id lpass_core_cc_sc7180_match_table[] = {
 };
 MODULE_DEVICE_TABLE(of, lpass_core_cc_sc7180_match_table);
 
-static const struct dev_pm_ops lpass_core_cc_pm_ops = {
+static const struct dev_pm_ops lpass_pm_ops = {
 	SET_RUNTIME_PM_OPS(pm_clk_suspend, pm_clk_resume, NULL)
 };
 
@@ -468,20 +468,16 @@ static struct platform_driver lpass_core_cc_sc7180_driver = {
 	.driver = {
 		.name = "lpass_core_cc-sc7180",
 		.of_match_table = lpass_core_cc_sc7180_match_table,
-		.pm = &lpass_core_cc_pm_ops,
+		.pm = &lpass_pm_ops,
 	},
 };
 
-static const struct dev_pm_ops lpass_hm_pm_ops = {
-	SET_RUNTIME_PM_OPS(pm_clk_suspend, pm_clk_resume, NULL)
-};
-
 static struct platform_driver lpass_hm_sc7180_driver = {
 	.probe = lpass_hm_core_probe,
 	.driver = {
 		.name = "lpass_hm-sc7180",
 		.of_match_table = lpass_hm_sc7180_match_table,
-		.pm = &lpass_hm_pm_ops,
+		.pm = &lpass_pm_ops,
 	},
 };
 
-- 
2.38.1.431.g37b22c650d-goog

