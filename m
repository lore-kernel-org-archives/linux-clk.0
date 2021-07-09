Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BA33C11F6E
	for <linux-clk@archiver.kernel.org>; Fri,  9 Jul 2021 17:32:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 55777613D6
	for <linux-clk@archiver.kernel.org>; Fri,  9 Jul 2021 17:32:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230221AbhGIRe5 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 9 Jul 2021 13:34:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229707AbhGIRez (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 9 Jul 2021 13:34:55 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63D6AC0613DD
        for <linux-clk@vger.kernel.org>; Fri,  9 Jul 2021 10:32:11 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id p16so24794290lfc.5
        for <linux-clk@vger.kernel.org>; Fri, 09 Jul 2021 10:32:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OW6r9Ztak14Z94NLN85hpavnPWferFff+9qy6SUKk4g=;
        b=FrxLNPysWTbK6msNrS77oo1V4NLdNkri1hMORbbVvbWnWUfTditLVD1NZEyi+EIkhe
         Ytl9GL9s7p+GxeHZSa0K1KVSHbHt7Db+9PZoaOBAiMDhKNzGPF7vIz4gxe0bV3Ijw0fu
         KO1XVn5897fkEBOsj2zwZJvWih3RQDHTsVQgcr9nkNrpxaiWUBPlLL/DvWhDF9Lj/zad
         p1+qpPBsUSq6yG1B9o1K7uNG+flJ7Bl5oK8vUla4zQnjwj/A3nKVXsVHFuy6X8xNFf2C
         PKQldZcDzARyowiHBxpuxrTx2Vsr3ZnfqA/S3Wlh2aEHPN/3VRBjC+KyVGaNIBfaJJDm
         iodA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OW6r9Ztak14Z94NLN85hpavnPWferFff+9qy6SUKk4g=;
        b=toe7ZI8mGxKn4PxetreW5OgLL0VWFeXFiIeZqWa4PEou/ZlonIi3HchjV58eKzLGL1
         Wt2OdOvy2mW6MzmUzWoVyxjFwtPAEy5Fehpr00IhE4Rukg76MtwfVuC64m9lQYZPxIju
         doO4XTmqBsXZ6I8asXeO0wivf332cxuKYOepMTUsSz3CNFmBm/7nxOG8aChvwzh/gnuV
         UAHGUyHjaO9sH2LLU8yoCeGXB3b5LWffuiCJ2fgsudHzwTp/B7x8eCsB8pqd5lhnzyxy
         Gz7SXsnUQf1IbUw3dogTUJxsjVcv2XpgZulSClVf29z8O0rYlzZxPRMFI+4A6Alt93x3
         CfBA==
X-Gm-Message-State: AOAM530v71ty6TkUx8iU4cWwDcRW0Ifa1kJhUos+fEO+Jj/8eaLIMY9n
        JDgplsY7JjFaV1NTdNWGBYZV0A==
X-Google-Smtp-Source: ABdhPJxUjTJVOzCEta2wUHL7FVm04+6VVBlwN0yiMRnKs+nVtnq3uEoz/4a6MO5w5EjHJcZlqo9D2g==
X-Received: by 2002:ac2:48a9:: with SMTP id u9mr9304635lfg.277.1625851929692;
        Fri, 09 Jul 2021 10:32:09 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id b14sm511129lfb.132.2021.07.09.10.32.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jul 2021 10:32:09 -0700 (PDT)
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
Subject: [PATCH v3 7/7] clk: qcom: videocc-sm8250: stop using mmcx regulator
Date:   Fri,  9 Jul 2021 20:32:02 +0300
Message-Id: <20210709173202.667820-8-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210709173202.667820-1-dmitry.baryshkov@linaro.org>
References: <20210709173202.667820-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Now as the common qcom clock controller code has been taught about power
domains, stop mentioning mmcx supply as a way to power up the clock
controller's gdscs.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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

