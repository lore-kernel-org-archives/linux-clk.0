Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB5EEC433F5
	for <linux-clk@archiver.kernel.org>; Thu, 19 May 2022 21:42:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245230AbiESVmO (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 19 May 2022 17:42:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245293AbiESVmD (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 19 May 2022 17:42:03 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3663E5F8E0
        for <linux-clk@vger.kernel.org>; Thu, 19 May 2022 14:41:47 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id o22so7694117ljp.8
        for <linux-clk@vger.kernel.org>; Thu, 19 May 2022 14:41:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SJ+tGdbq8RU44C7gVKtqScfDOQ9GrdzS7rAPCoM+WdA=;
        b=WNYW7eotl0gBLOKLtJVHcWpiVpm3gSLGvtPUCinb7dEHiED5HCDd4AGhsmS84QHrnN
         sxjFksUIt8+Pke9g1JJSayLekDajhQe3+zMYQg1ffT8EVfwxSbNfPhjGno/aZGfym4Q3
         uAF5t6FAVnqjU7W8E1CyG0KacgT1dMkvI0aVOq+VUWUoS7ZAoJvvU9jw3eXo29iUySs3
         TZWh0yor4hfiqw9FbYdNmqI/WS3mnkAKfLcJAfjk3U94Ky6CzupNkSlJpcSrUuPy+k2m
         KxapcYGa3l0GpUjzTlilJrvYFx1uwGsktOB19RSwM4P3BEJmpO63qOwAep+IRarGsHm2
         4WJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SJ+tGdbq8RU44C7gVKtqScfDOQ9GrdzS7rAPCoM+WdA=;
        b=uTwdqZeuF1/iJw5Y6ZhEP1HHAB54dLk5WUiaaQ8mj9wTB2//XTSoqNic+1H/IiY1xH
         j1zPZlFrY755OZZ+Xl+4TMn9zeDO0apL7x4LZ6o7Xeh3ki/h2Tb+FdWw79yaayiKBG3s
         +akIXlFhIuIci+vuXiV1Jt4Em98Sn6Nnmm42zY9TiCgfg9yMrwOU4y0EWj6SIBQF6lOV
         7GX60YU8UnvuZ6vyepFu/w8q9VTgSF2VlfQspsdFAsty2SS8WWuwSBzR2BgMzI6XKV8s
         8V9dFBk+C4k2OX1UiEtGUXU7UZjLRh+S+g8WAxEoAdgfWH2gvdAhrjovh+j0uF5fH2Zb
         b4sw==
X-Gm-Message-State: AOAM530m/W+Tgca0cmQFnQhwoysIaME4a2oeA+iLrVYllAhfjtd2ekPh
        ERXWvqg2ZNXgeE7C4+0blGmHNg==
X-Google-Smtp-Source: ABdhPJwlb94xGzR8l/J5Wk+oWy+3ZZfTmudft90Vjgec7cRo9wipTejLACga05onFxd+NKaOKVaROw==
X-Received: by 2002:a05:651c:515:b0:250:6428:5c4c with SMTP id o21-20020a05651c051500b0025064285c4cmr3818047ljp.264.1652996505489;
        Thu, 19 May 2022 14:41:45 -0700 (PDT)
Received: from localhost.localdomain (mobile-access-b04822-211.dhcp.inet.fi. [176.72.34.211])
        by smtp.gmail.com with ESMTPSA id l12-20020a2e99cc000000b0024f3d1dae9dsm53576ljj.37.2022.05.19.14.41.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 May 2022 14:41:45 -0700 (PDT)
From:   Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Robert Foss <robert.foss@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH 2/2] clk: qcom: camcc-sm8250: Fix topology around titan_top power domain
Date:   Fri, 20 May 2022 00:41:33 +0300
Message-Id: <20220519214133.1728979-3-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220519214133.1728979-1-vladimir.zapolskiy@linaro.org>
References: <20220519214133.1728979-1-vladimir.zapolskiy@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On SM8250 two found VFE GDSC power domains shall not be operated, if
titan top is turned off, thus the former power domains will be set as
subdomains by a GDSC registration routine.

Fixes: 5d66ca79b58c ("clk: qcom: Add camera clock controller driver for SM8250")
Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 drivers/clk/qcom/camcc-sm8250.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/clk/qcom/camcc-sm8250.c b/drivers/clk/qcom/camcc-sm8250.c
index 439eaafdcc86..d68376077d51 100644
--- a/drivers/clk/qcom/camcc-sm8250.c
+++ b/drivers/clk/qcom/camcc-sm8250.c
@@ -2205,6 +2205,8 @@ static struct clk_branch cam_cc_sleep_clk = {
 	},
 };
 
+static struct gdsc titan_top_gdsc;
+
 static struct gdsc bps_gdsc = {
 	.gdscr = 0x7004,
 	.pd = {
@@ -2238,6 +2240,7 @@ static struct gdsc ife_0_gdsc = {
 		.name = "ife_0_gdsc",
 	},
 	.flags = POLL_CFG_GDSCR,
+	.parent = &titan_top_gdsc.pd,
 	.pwrsts = PWRSTS_OFF_ON,
 };
 
@@ -2247,6 +2250,7 @@ static struct gdsc ife_1_gdsc = {
 		.name = "ife_1_gdsc",
 	},
 	.flags = POLL_CFG_GDSCR,
+	.parent = &titan_top_gdsc.pd,
 	.pwrsts = PWRSTS_OFF_ON,
 };
 
-- 
2.33.0

