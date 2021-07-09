Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D0C8C11F76
	for <linux-clk@archiver.kernel.org>; Fri,  9 Jul 2021 01:31:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2B4C661469
	for <linux-clk@archiver.kernel.org>; Fri,  9 Jul 2021 01:31:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230389AbhGIBdx (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 8 Jul 2021 21:33:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230209AbhGIBdh (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 8 Jul 2021 21:33:37 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0BE52C061762
        for <linux-clk@vger.kernel.org>; Thu,  8 Jul 2021 18:30:54 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id 8so8238362lfp.9
        for <linux-clk@vger.kernel.org>; Thu, 08 Jul 2021 18:30:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=f0ldkE5j34OXHAqh3I/xyyl0k1n40wAos/+0qzuAEic=;
        b=nm/hroiuWo+iD98b1WyHvUy5UayywXgtAa9rZPMVCVjmNl3WMEkz8+2uF+ZJJyM2hs
         U9Qqx5chOha+qv+IGYUDu+moP9I72CV2Sf0u521YC2O9cx1SN9KzhufbSV9CDHripyfq
         qokUVOMeGAxjdSy2u1YKov0IIv8pFGAW18pA2VgnE84WZM8RhrQBLz1aJmd3YZKSGU6J
         wH/pjxt7XTHJCmyG9Kr2Kpqpt2zxPb2wMuZm2oOzLbPeNJid6rPg7P+rI/NAa8zvC9Ey
         vKhOuiIu5rtV8TXErMket3WTCmTL87hGzHqKvjMWweNIVC4h0Bg+4LsCP9qks22uxkJ/
         7Dtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=f0ldkE5j34OXHAqh3I/xyyl0k1n40wAos/+0qzuAEic=;
        b=DWsjUGWkIEw69oSiM5yKoxfwRjl8/dhMw71Ha5b/BBYPrd+QXaqlsu4Se7k760bFtr
         hBwCpfhsMSmPNr/AOQiBUQjWCrET7GKos14EjdLuy8g2/uRn1DSCy6EM7ubONCDiDZtJ
         yNuplff2gAzomXIPa67k/KYklD2Rx0iIb3JBBTVt2VqWWyEGQlR4TeAMKvk/VoIifx/P
         xahic8kwAmmGB2n7cQM+XuZc8tuwjHxy6M2/NxJ12m3e8hSOmyvWZdLuMWgqltcLJfna
         jV7GtiYjNBiOR28o2IQyj0EvLwhR2GzUDnAa7clU1788LDP8sMjPC3YoJaAQkUq4e/aW
         yuBQ==
X-Gm-Message-State: AOAM530x3IJ54u3/KQrEqqKb95sUD9BvfPHpRDlF6xc/KvlC+foZSoV8
        7HyDYj8ZUxcgoJeGxhMdhQqAYA==
X-Google-Smtp-Source: ABdhPJwm8y8f9o7ZuXL20FeOwS87K82eZxq23U5WHj1AX4Q+KvbhAkPrkGXvcIG2EvrQImcfNFkmBw==
X-Received: by 2002:a05:6512:3d0a:: with SMTP id d10mr26656661lfv.143.1625794252428;
        Thu, 08 Jul 2021 18:30:52 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id u16sm405637ljj.113.2021.07.08.18.30.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jul 2021 18:30:51 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Taniya Das <tdas@codeaurora.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 6/7] clk: qcom: dispcc-sm8250: stop using mmcx regulator
Date:   Fri,  9 Jul 2021 04:30:42 +0300
Message-Id: <20210709013043.495233-7-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210709013043.495233-1-dmitry.baryshkov@linaro.org>
References: <20210709013043.495233-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Now as the common qcom clock controller code has been taught about power
domains, stop mentioning mmcx supply as a way to power up the clock
controller's gdsc.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/dispcc-sm8250.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/clk/qcom/dispcc-sm8250.c b/drivers/clk/qcom/dispcc-sm8250.c
index de09cd5c209f..dfbfe64b12f6 100644
--- a/drivers/clk/qcom/dispcc-sm8250.c
+++ b/drivers/clk/qcom/dispcc-sm8250.c
@@ -955,7 +955,6 @@ static struct gdsc mdss_gdsc = {
 	},
 	.pwrsts = PWRSTS_OFF_ON,
 	.flags = HW_CTRL,
-	.supply = "mmcx",
 };
 
 static struct clk_regmap *disp_cc_sm8250_clocks[] = {
-- 
2.30.2

