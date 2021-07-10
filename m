Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EC33C11F69
	for <linux-clk@archiver.kernel.org>; Sat, 10 Jul 2021 01:33:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EDDD6613D9
	for <linux-clk@archiver.kernel.org>; Sat, 10 Jul 2021 01:33:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231778AbhGJBfu (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 9 Jul 2021 21:35:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231702AbhGJBfp (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 9 Jul 2021 21:35:45 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 839A6C0613EE
        for <linux-clk@vger.kernel.org>; Fri,  9 Jul 2021 18:33:01 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id h19so17210ljl.4
        for <linux-clk@vger.kernel.org>; Fri, 09 Jul 2021 18:33:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=s/A7UPTK4i/YxYWo+py1ZfWr+92yU5mUYYeUPHiFkEg=;
        b=lrVwstQAI1v5pb4k+3c+P83tiywljkXeskO28iiu/PzggOC3pkpID/AbcckRBATRY+
         4uhSyNM/2umDKActyEtPS5GXvrFOk0tfPOtky9y3L7opDou9xxts8f+rNDrQD5KHOdJU
         XjlFq99cDfEv5fmSfewu5NGVOlIrGIY9kZx93cMvMsB62ci051Fq5Hhd0EMNZ1m7Rmwx
         C3zanel+aChq5lzIBbjTxDoSxdkiGx1tbJOY6QLyfnqDth687uFIPUn8KoLcLfFQ89RH
         12maxKtryyowubP1QWGY7kIrWOKGq6UReDPUXGmR3H4CKKePA4+cSZuwS5gUYF5eE6C9
         t6RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=s/A7UPTK4i/YxYWo+py1ZfWr+92yU5mUYYeUPHiFkEg=;
        b=G36BV/X11lK763v32H+AfsXQUYmTX+Al/kb5yF7nnniWHYpaKIB3r/xfsjYk+YX070
         RdIQUb0H6uG+o4qyevMsMTiO7ibPOfThX3XLBkzUh2tSHBuoW2pnxRjAz05TBa5w18r9
         Mwp3fEM7RaUSABwjvoHgd1ndqumWm6lt2Qd5Br0n5dWx7lUaKVbCPLRCECR5btnbFL5C
         RP3nMwFRmUGQ+d1rOu6Np+eAlk0dUCCaMg+EfSbRUQAKkQh85j4/LNvR4PQd9aVg0vqW
         60sG+AVz9gpRYD9EOtVIvHJj3mEEnSAelE9HO2HLkMUTkswzVpJ0QDncilA3/Z1eZEpU
         9/RA==
X-Gm-Message-State: AOAM530jVpYPV8J/gI4YYOjwkZ6/krSeO57LqgtrfFKZuuNojphehhY5
        /tEgFkj7VOvgM+TTMw1p1hhclQ==
X-Google-Smtp-Source: ABdhPJyU6jh3ZTKOA1TAcFOaxn3VIMjw3SCnYqLIb5j9ObLW0rPylTCZIMci2OG3NfOhp+qjl44Iww==
X-Received: by 2002:a2e:a54a:: with SMTP id e10mr31836469ljn.120.1625880779935;
        Fri, 09 Jul 2021 18:32:59 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id p13sm588788lfh.206.2021.07.09.18.32.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jul 2021 18:32:59 -0700 (PDT)
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
Subject: [PATCH v4 6/6] clk: qcom: videocc-sm8250: stop using mmcx regulator
Date:   Sat, 10 Jul 2021 04:32:53 +0300
Message-Id: <20210710013253.1134341-7-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210710013253.1134341-1-dmitry.baryshkov@linaro.org>
References: <20210710013253.1134341-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Now as the common qcom clock controller code has been taught about power
domains, stop mentioning mmcx supply as a way to power up the clock
controller's gdscs.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/clk/qcom/videocc-sm8250.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/clk/qcom/videocc-sm8250.c b/drivers/clk/qcom/videocc-sm8250.c
index 7b435a1c2c4b..eedef85d90e5 100644
--- a/drivers/clk/qcom/videocc-sm8250.c
+++ b/drivers/clk/qcom/videocc-sm8250.c
@@ -276,7 +276,6 @@ static struct gdsc mvs0c_gdsc = {
 	},
 	.flags = 0,
 	.pwrsts = PWRSTS_OFF_ON,
-	.supply = "mmcx",
 };
 
 static struct gdsc mvs1c_gdsc = {
@@ -286,7 +285,6 @@ static struct gdsc mvs1c_gdsc = {
 	},
 	.flags = 0,
 	.pwrsts = PWRSTS_OFF_ON,
-	.supply = "mmcx",
 };
 
 static struct gdsc mvs0_gdsc = {
@@ -296,7 +294,6 @@ static struct gdsc mvs0_gdsc = {
 	},
 	.flags = HW_CTRL,
 	.pwrsts = PWRSTS_OFF_ON,
-	.supply = "mmcx",
 };
 
 static struct gdsc mvs1_gdsc = {
@@ -306,7 +303,6 @@ static struct gdsc mvs1_gdsc = {
 	},
 	.flags = HW_CTRL,
 	.pwrsts = PWRSTS_OFF_ON,
-	.supply = "mmcx",
 };
 
 static struct clk_regmap *video_cc_sm8250_clocks[] = {
-- 
2.30.2

