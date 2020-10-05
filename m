Return-Path: <SRS0=hOJu=DM=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAD1DC47423
	for <linux-clk@archiver.kernel.org>; Mon,  5 Oct 2020 22:59:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A6656207BC
	for <linux-clk@archiver.kernel.org>; Mon,  5 Oct 2020 22:59:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xgC22HA4"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726987AbgJEW71 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 5 Oct 2020 18:59:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726973AbgJEW71 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 5 Oct 2020 18:59:27 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0247C0613A7
        for <linux-clk@vger.kernel.org>; Mon,  5 Oct 2020 15:59:26 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id a9so3466876lfc.7
        for <linux-clk@vger.kernel.org>; Mon, 05 Oct 2020 15:59:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=URbRbK8Q61G+2pVymEoBNgHS+ZaND/H3JCVWYbn/B1M=;
        b=xgC22HA42f1CdnNlzhyOnGP1kbLIKqQxFlsiNSzh8OjYBDdC04BJCGJO6Nc9L6sRfk
         De2E1xNL+UM4yeOVFC2U9RppMR5hhshKq+37HbdfDiKzP1edvf2zGTCO4DViezg54wnz
         z7C9dzdG65oS2FZum8I/dkdvs8Sxpk2l/n006VzSIc1ejC1TOJn29YMkqGvlHuW7WVSI
         JR7ifTzYhUoa7I3nsI8TznOVfKvc2vLUeQr9wMaKto9ECxXMrWfsZMIvKSZhYgFRaDsA
         Tfp8ER3a95KnuzvQrsenGaJM8IjicqN9xyhGnnh1KzvAJuu0BFepirpu5ws24zh5xFyD
         XZqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=URbRbK8Q61G+2pVymEoBNgHS+ZaND/H3JCVWYbn/B1M=;
        b=eascWki4u+oNlVzGvR8ifKfvt8hKwdbzh44zmzdVSdkRZPOCAc3xUr3b8TtTYxvKWG
         2x4hlAwB0Y15dqdWi1yKKyEYCP21y930noMkH4ELVGQ57NO89hUK2RIPkaxNuyClx/ju
         PUi9Wrkk55+HnAdRkmMszBi8xUWaA7oWIp6xtSRRJSvKw8T2tgOZD9doAo6O+k8WzOvL
         Tp3iI5a4S5+VxwZjKo8CA6lHYZA7kNGNSXNk1m4GUMgARuUQweEisizCIYlM0QAn2cM2
         7MXLUrOIAY+/pX0xqFD2E1Q/BWQqzofOGFDXBTCqSFp1B4Atzhzo4otF3tYW1Xo5yIMk
         crXg==
X-Gm-Message-State: AOAM533IGWz+V3ZbwROiCbEEJmQaE9peM9Lp8dmqkfaad8hMTLQ4ui8h
        624NUOiLTn3i8UxlE20LIzYCbQ==
X-Google-Smtp-Source: ABdhPJzxC1WKMZ4+d9UonYnhE7ac09yIhbmSlzrfCqlGQSkgDtYOHcjVMoz5wIqK8ms4fFgzNPrEUg==
X-Received: by 2002:a19:514:: with SMTP id 20mr502777lff.512.1601938765154;
        Mon, 05 Oct 2020 15:59:25 -0700 (PDT)
Received: from eriador.lan ([188.162.64.219])
        by smtp.gmail.com with ESMTPSA id x4sm353831ljc.80.2020.10.05.15.59.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2020 15:59:24 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-arm-msm@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH v1 3/3] clk: qcom: dispcc-sm8250: handle MMCX power domain
Date:   Tue,  6 Oct 2020 01:59:14 +0300
Message-Id: <20201005225914.315852-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201005225914.315852-1-dmitry.baryshkov@linaro.org>
References: <20201005225914.315852-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On SM8250 MMCX power domain is required to access MMDS_GDSC registers.
Enable using this power domain for the gdsc.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/dispcc-sm8250.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/qcom/dispcc-sm8250.c b/drivers/clk/qcom/dispcc-sm8250.c
index 07a98d3f882d..3941054a7b07 100644
--- a/drivers/clk/qcom/dispcc-sm8250.c
+++ b/drivers/clk/qcom/dispcc-sm8250.c
@@ -963,6 +963,8 @@ static struct gdsc mdss_gdsc = {
 	},
 	.pwrsts = PWRSTS_OFF_ON,
 	.flags = HW_CTRL,
+	.domain = "mmcx",
+	.perf_idx = 0,
 };
 
 static struct clk_regmap *disp_cc_sm8250_clocks[] = {
-- 
2.28.0

