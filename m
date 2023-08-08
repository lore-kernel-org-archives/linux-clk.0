Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B265C001B0
	for <linux-clk@archiver.kernel.org>; Tue,  8 Aug 2023 20:48:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235102AbjHHUsM (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 8 Aug 2023 16:48:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231818AbjHHUsA (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 8 Aug 2023 16:48:00 -0400
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C059FF637
        for <linux-clk@vger.kernel.org>; Tue,  8 Aug 2023 09:41:17 -0700 (PDT)
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-3fe12820bffso49991405e9.3
        for <linux-clk@vger.kernel.org>; Tue, 08 Aug 2023 09:41:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691512870; x=1692117670;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gCx8RlEOFx8UDQtGNW/6cgXaxJHTs4rAU1l6hTQLDFk=;
        b=e7g/8GDj61ZhxtBwCw9TfQXWhzszcZ5L+bfAt389sLl5dTEizyxH2OZp02OkpbLIt2
         73AFattt9Oo8N5QJ5qUgB/os7okshVzroSnXtKUqR4qnb+rVVlyhzo7t27+8d04Q7jeu
         Oqv+bhjvAF1I7mqnLxHLLeGUhuKRPbD2zPMJFOtT5QZjwp4MOY/xZdT/5q8ZDkRuJJgK
         oXFmYce4hAazBIvGD3ovzh1PWs249IDT/4GFgHFBhSnniH7qtKZzQd0DunulnS5+gNvw
         UGkrdivUPCjV9eQ5pJ+ufRUCrbc1XIJCnZipOxkoWl3A/dNFCnmFFE2/QIKWAYjl5cwo
         surQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691512870; x=1692117670;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gCx8RlEOFx8UDQtGNW/6cgXaxJHTs4rAU1l6hTQLDFk=;
        b=DkzBl2g4qEqX7rr/iPPa+6cuf39RhUkrVbwU12QZAAv0MBY7zfhluZWMiO0gh7ZNWP
         SpLIxWZE6cbb+BwgXZ6SYtoIxEILz1to13NOaGC4Zln0O27477n0Mf9Jy6KkIShaVRwj
         qaOu1zjIGfZjWjC/3hX4zDSrxujDmZEefzgXFypG/BnXwWSMdZeyL3G3xFWtmkI3vhdd
         l70ildb0AinL9hrFluMCVN1XGOxMbBhTapj4GS8z4H/L07ZIkcMMtVL5cEPFrHvHZ983
         gBOLTXwQSVE25NV/CXWDfiZXqdRcPdJyKkpEubBrr5YCisx9tVs3h/uzRGGIG25H3y2J
         i7jg==
X-Gm-Message-State: AOJu0YwRhHKRUbhpLgVlKGbM2Rh9m+kga8ySmJ29ffiQzlUhPRBDD402
        AGLKvtjvGGysA1XY/xbjekIFe+c4th/pMjDjrcg=
X-Google-Smtp-Source: AGHT+IH+sPe9RaM9v5SJiPH9mGRNklcFtnmQjV71N3tInoFanoFMD5xKQLAj+RolMkFNtpIptv/IlA==
X-Received: by 2002:a05:6512:2e4:b0:4fe:cca:c6f7 with SMTP id m4-20020a05651202e400b004fe0ccac6f7mr7807040lfq.48.1691495022052;
        Tue, 08 Aug 2023 04:43:42 -0700 (PDT)
Received: from [192.168.1.101] (abxi185.neoplus.adsl.tpnet.pl. [83.9.2.185])
        by smtp.gmail.com with ESMTPSA id j20-20020ac253b4000000b004fbdba4b075sm1861679lfh.57.2023.08.08.04.43.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Aug 2023 04:43:41 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Tue, 08 Aug 2023 13:43:36 +0200
Subject: [PATCH v3 05/10] interconnect: qcom: qcm2290: Hook up
 MAS_APPS_PROC's bus clock
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230726-topic-icc_coeff-v3-5-dee684d6cdd2@linaro.org>
References: <20230726-topic-icc_coeff-v3-0-dee684d6cdd2@linaro.org>
In-Reply-To: <20230726-topic-icc_coeff-v3-0-dee684d6cdd2@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1691495013; l=2342;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=baltAV4RoHwcQRz0/eW44USFJNd7n+E9JFHsU6Sjt+4=;
 b=MAN7N0prQn1s1uUMDQ6ZtSNXTmx17gJ/z3RFDO/h4V4WTWklSZf/hJxh+ULsHiD442q2RovQ8
 KHxzAyUUWgKBUDESPgVueFeDu76mSu4J0AXSNzBnfLgjMfDWMV8ZgAD
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

This single node has its own clock which seems to be responsible for
transactions between CPUSS (CPU + some stuff) and the GNOC. See [1]
for reference.

Define it and hook it up.

[1] https://android.googlesource.com/kernel/msm-extra/devicetree/+/02f8c342b23c20a5cf967df649814be37a08227c%5E%21/#F0
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/interconnect/qcom/icc-rpm-clocks.c | 6 ++++++
 drivers/interconnect/qcom/icc-rpm.h        | 1 +
 drivers/interconnect/qcom/qcm2290.c        | 3 +++
 3 files changed, 10 insertions(+)

diff --git a/drivers/interconnect/qcom/icc-rpm-clocks.c b/drivers/interconnect/qcom/icc-rpm-clocks.c
index 63c82a91bbc7..ac1677de7dfd 100644
--- a/drivers/interconnect/qcom/icc-rpm-clocks.c
+++ b/drivers/interconnect/qcom/icc-rpm-clocks.c
@@ -25,6 +25,12 @@ const struct rpm_clk_resource bimc_clk = {
 };
 EXPORT_SYMBOL_GPL(bimc_clk);
 
+const struct rpm_clk_resource mem_1_clk = {
+	.resource_type = QCOM_SMD_RPM_MEM_CLK,
+	.clock_id = 1,
+};
+EXPORT_SYMBOL_GPL(mem_1_clk);
+
 const struct rpm_clk_resource bus_0_clk = {
 	.resource_type = QCOM_SMD_RPM_BUS_CLK,
 	.clock_id = 0,
diff --git a/drivers/interconnect/qcom/icc-rpm.h b/drivers/interconnect/qcom/icc-rpm.h
index 4abf99ce2690..a13768cfd231 100644
--- a/drivers/interconnect/qcom/icc-rpm.h
+++ b/drivers/interconnect/qcom/icc-rpm.h
@@ -152,6 +152,7 @@ extern const struct rpm_clk_resource bimc_clk;
 extern const struct rpm_clk_resource bus_0_clk;
 extern const struct rpm_clk_resource bus_1_clk;
 extern const struct rpm_clk_resource bus_2_clk;
+extern const struct rpm_clk_resource mem_1_clk;
 extern const struct rpm_clk_resource mmaxi_0_clk;
 extern const struct rpm_clk_resource mmaxi_1_clk;
 extern const struct rpm_clk_resource qup_clk;
diff --git a/drivers/interconnect/qcom/qcm2290.c b/drivers/interconnect/qcom/qcm2290.c
index 3c3b24264a5b..52a6eb32e832 100644
--- a/drivers/interconnect/qcom/qcm2290.c
+++ b/drivers/interconnect/qcom/qcm2290.c
@@ -112,6 +112,9 @@ static struct qcom_icc_node mas_appss_proc = {
 	.qos.qos_mode = NOC_QOS_MODE_FIXED,
 	.qos.prio_level = 0,
 	.qos.areq_prio = 0,
+	.bus_clk_desc = &mem_1_clk,
+	.ab_coeff = 159,
+	.ib_coeff = 96,
 	.mas_rpm_id = 0,
 	.slv_rpm_id = -1,
 	.num_links = ARRAY_SIZE(mas_appss_proc_links),

-- 
2.41.0

