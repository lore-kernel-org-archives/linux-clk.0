Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5C68C433FE
	for <linux-clk@archiver.kernel.org>; Thu, 19 May 2022 21:42:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245294AbiESVmS (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 19 May 2022 17:42:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245286AbiESVmC (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 19 May 2022 17:42:02 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1F4E5DBC0
        for <linux-clk@vger.kernel.org>; Thu, 19 May 2022 14:41:45 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id f4so11240500lfu.12
        for <linux-clk@vger.kernel.org>; Thu, 19 May 2022 14:41:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GwIzal5zCvbq2/Nx/4ZMhS9SQRC0VnO569u3ew8qRmI=;
        b=h/qH2ORI8drz1wJuLrVKvauqyS2lARWaJdQPDmKGSuD2qSG6owGgNwhcCtoMl5ouPN
         0hERz7BH5vxnKcuvdtENND2G+0lWjSVTTrBhlUWxefmurIwljMQJ+6LPZC9AMqcFO1nD
         VQ69lMOj3f3U4J+YKoGnMkjrSeMb/EV7ieSrpOvz2kLrZVIzeG6jhddlOo+JzpjocLWf
         641THBR7/IUUI7B8a7rKnPKd3mlVm++X9tk8Yb7TA2eyCUTzfs0dXAxEDCStTM1ZVc+h
         3s50+778HfF+E+QAAS3vtR8Zuu4y45ndBPwSTAXkPFkjc5PU31Snjye7PrjAWfgUKmZH
         CVnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GwIzal5zCvbq2/Nx/4ZMhS9SQRC0VnO569u3ew8qRmI=;
        b=RV1zjqQGDtzCIXptJpPEB9KRKhunNbm0TZ7irMiNJ1H63K+Rr4DYEnQ89NL1Fh0w2r
         mpfqaKfycCEb++9yfGYKZT/NOWhTs1Pny3SOM3CfEKIv0E4rDPfx/vTX8U/FutryemDo
         rRmz+PrQkJG7Mo40olucwbR1huvhsRXrWybssZ8hlW/uO+uqHfKolHhvAAZAYKRt0++U
         x47dG4+RzLZixuX0RooZtRabplOs/HZyXxyTFf1jZKYOMPwdMLMSA/UtBbLkGnHRfAR7
         oC4vEsrvhe8fgRrhX9oa2wvibk/9lk+9n19NO2ItUvQ+CcM6m3i1t9wEBvybIe30DBjF
         7qcg==
X-Gm-Message-State: AOAM533FXTbN45boGkTKPRkYgwiEvklqUIJWiAwgHhFQ4tc6vRWdRbnZ
        GTWIcsOiHZopvOjfkpPsR3Gj1A==
X-Google-Smtp-Source: ABdhPJw5780OEGQlcRK+r5COAw1rDrgKZ8PFIZd2mczv+PVaPvq/4f6L+M4rbcm51H1UrJsKUvAshg==
X-Received: by 2002:a05:6512:1382:b0:445:9536:903 with SMTP id p2-20020a056512138200b0044595360903mr4845926lfa.89.1652996504164;
        Thu, 19 May 2022 14:41:44 -0700 (PDT)
Received: from localhost.localdomain (mobile-access-b04822-211.dhcp.inet.fi. [176.72.34.211])
        by smtp.gmail.com with ESMTPSA id l12-20020a2e99cc000000b0024f3d1dae9dsm53576ljj.37.2022.05.19.14.41.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 May 2022 14:41:43 -0700 (PDT)
From:   Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Robert Foss <robert.foss@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH 1/2] clk: qcom: camcc-sdm845: Fix topology around titan_top power domain
Date:   Fri, 20 May 2022 00:41:32 +0300
Message-Id: <20220519214133.1728979-2-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220519214133.1728979-1-vladimir.zapolskiy@linaro.org>
References: <20220519214133.1728979-1-vladimir.zapolskiy@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On SDM845 two found VFE GDSC power domains shall not be operated, if
titan top is turned off, thus the former power domains will be set as
subdomains by a GDSC registration routine.

Fixes: 78412c262004 ("clk: qcom: Add camera clock controller driver for SDM845")
Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 drivers/clk/qcom/camcc-sdm845.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/clk/qcom/camcc-sdm845.c b/drivers/clk/qcom/camcc-sdm845.c
index be3f95326965..27d44188a7ab 100644
--- a/drivers/clk/qcom/camcc-sdm845.c
+++ b/drivers/clk/qcom/camcc-sdm845.c
@@ -1534,6 +1534,8 @@ static struct clk_branch cam_cc_sys_tmr_clk = {
 	},
 };
 
+static struct gdsc titan_top_gdsc;
+
 static struct gdsc bps_gdsc = {
 	.gdscr = 0x6004,
 	.pd = {
@@ -1567,6 +1569,7 @@ static struct gdsc ife_0_gdsc = {
 		.name = "ife_0_gdsc",
 	},
 	.flags = POLL_CFG_GDSCR,
+	.parent = &titan_top_gdsc.pd,
 	.pwrsts = PWRSTS_OFF_ON,
 };
 
@@ -1576,6 +1579,7 @@ static struct gdsc ife_1_gdsc = {
 		.name = "ife_1_gdsc",
 	},
 	.flags = POLL_CFG_GDSCR,
+	.parent = &titan_top_gdsc.pd,
 	.pwrsts = PWRSTS_OFF_ON,
 };
 
-- 
2.33.0

