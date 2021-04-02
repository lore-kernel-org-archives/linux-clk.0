Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 745FBC433B4
	for <linux-clk@archiver.kernel.org>; Fri,  2 Apr 2021 02:21:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4556C61105
	for <linux-clk@archiver.kernel.org>; Fri,  2 Apr 2021 02:21:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234238AbhDBCVU (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 1 Apr 2021 22:21:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233915AbhDBCVS (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 1 Apr 2021 22:21:18 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3FABC061797
        for <linux-clk@vger.kernel.org>; Thu,  1 Apr 2021 19:21:17 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id o126so5720290lfa.0
        for <linux-clk@vger.kernel.org>; Thu, 01 Apr 2021 19:21:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1jU9us/3mI30guyXLRXo1PxXu6Cnze2Bw7/gT4xxmgc=;
        b=QtOXlY+wSUkiVsZOf40S8onRiH9hyGi8tkkWo1y75rCMAwIwHPCLJb6VQtyO27tJYP
         ljFF3UU8gJIp4MUwqJAVvJ70TlxAlURqyKSPSBebABfvUg3VIyA/6zlkF3QyXoNVMVZJ
         f6shvt4Yr2C5a2xtuJ/yii7yMmVgqW7GGXztmTxsvU1HsJ3lZNZ7f7eq1eEsymJDH1+2
         bi7KcXi8+nSDf1BplktoFN8V8WsnCD4q78P+qnLVvudowwDCL8O6jTl66nkvstFzvliW
         3Sd1y7S+2tLCzgm8njL82mdENiuA6Pi0wBln0FC6Y74HdklG/H2FoQeVcPBRa0cxnLBO
         apmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1jU9us/3mI30guyXLRXo1PxXu6Cnze2Bw7/gT4xxmgc=;
        b=mv2CFUMzj1Ca0Hwq0p58rtcknylDYJ+X5nO8pi/mHD3Vr6GzO+CA5dBR70Bwh0EQyx
         /zovfoSo3c+jMGSgChc00fN+OIzTcDrQKh7Ha0ZKEpqiAyimLBQLQFS5wqp4+vKoJqAq
         lIsQswq0+JiUx+EePDCF93GZGzD+I8j4itnl+CHBJ5Kc/Ns0VyN4rlHRmNk8iFa09wk/
         uZaWXPgxusqwOzS1Ipte35hC8np5iQM3IlywxG4x6r6R8OAUG9tZ717oQLLvQReM6OH0
         paEa4AoDiaY0bDQLI3wEryd6ZGMMYd6CniRPhTQpg3jeiMKLCypacpEIqBVgemnmI577
         zYpQ==
X-Gm-Message-State: AOAM532Y2zui82lnw0qKdp7UEd030l1QqOFIx23i6Z+iPsTRVmdnMQ1A
        HWIJQF/N5eGZMy8wU8GTDjdB/Q==
X-Google-Smtp-Source: ABdhPJwJySMSblipNIfpDsZR6WNF8j8uQ5wgtGfl9T81YHGSs0ncXXUXOMZ9Ob9y9pbSzh7llKxcsQ==
X-Received: by 2002:ac2:5f9b:: with SMTP id r27mr6905671lfe.607.1617330076134;
        Thu, 01 Apr 2021 19:21:16 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id x74sm713634lff.145.2021.04.01.19.21.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Apr 2021 19:21:15 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Taniya Das <tdas@codeaurora.org>
Subject: [PATCH v2 07/16] clk: qcom: gpucc-sm8250: drop unused enum entries
Date:   Fri,  2 Apr 2021 05:20:59 +0300
Message-Id: <20210402022108.4183114-8-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210402022108.4183114-1-dmitry.baryshkov@linaro.org>
References: <20210402022108.4183114-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Drop unused enum entries from the list of parent enums.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Taniya Das <tdas@codeaurora.org>
---
 drivers/clk/qcom/gpucc-sm8250.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/clk/qcom/gpucc-sm8250.c b/drivers/clk/qcom/gpucc-sm8250.c
index 3fa7d1f9ff98..67c136a77efb 100644
--- a/drivers/clk/qcom/gpucc-sm8250.c
+++ b/drivers/clk/qcom/gpucc-sm8250.c
@@ -26,7 +26,6 @@
 
 enum {
 	P_BI_TCXO,
-	P_CORE_BI_PLL_TEST_SE,
 	P_GPLL0_OUT_MAIN,
 	P_GPLL0_OUT_MAIN_DIV,
 	P_GPU_CC_PLL0_OUT_MAIN,
-- 
2.30.2

