Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B380C7EE2E
	for <linux-clk@archiver.kernel.org>; Fri,  9 Jun 2023 20:20:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232115AbjFIUT7 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 9 Jun 2023 16:19:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231938AbjFIUTp (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 9 Jun 2023 16:19:45 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFE0930E3
        for <linux-clk@vger.kernel.org>; Fri,  9 Jun 2023 13:19:25 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-4f62b552751so2733192e87.3
        for <linux-clk@vger.kernel.org>; Fri, 09 Jun 2023 13:19:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686341964; x=1688933964;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6yqoaw1SJxAVA4zfoNJA8WPzYaF2aeMvPE6QC7WXXuk=;
        b=Kue55f1HrIY//vS2uD1QxfmeWRhNBHHGUe4PGho3Ex007ChMgT3W05Cixg0RP3YZh9
         Zkvxqw+9ryMD5SjbqvyiokTpTzF8CdqBLKSs8LE7vvQj1QzGmPlYonWcgvq7h5m83Ryx
         i7B+oQDlMyZ7mC5Mxo4QgF+tG4eqWKNnYNoyhpQ5cVLsGfN4lZe4SfTjM/ZirlxLPbnK
         9ze+Ax048qcb39cVmwH8LmGt0EewH8dwOl56FsyeKUcVazCNoXT5hsc6jR9EljxZhgOs
         WAfwOyZFhgtV0vmc1Ycv0rbdQUK6apPSQ8qSAWA53EckbQ5LPLxyS97FpFlImVnUVsUO
         HPJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686341964; x=1688933964;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6yqoaw1SJxAVA4zfoNJA8WPzYaF2aeMvPE6QC7WXXuk=;
        b=S0MzniLYb4BMv+HrOJoHVxwl7jQ2HSt+hiH4D8z/cn5PXbWlqdTYFwQZScm6r6KoHs
         A4J8+46pkCNUYy73LE8+kQRpjYVlOpNU1NWHbVxI0xXB4h5UujQLWhiubG5qv6je4jCg
         ybEHmbws4v6DEy5mZY7q+uM3TU9QupHiaTK7wYHdlMlx2Vrn6shb0/1RYaD5Fa4QnXJl
         ZG4XHXH8P9qh7MuQruwEetkC/qzDvcV0kFdJUxcTha2L55UjlfoDkwIzYTkyNVUsaq/C
         RNGWRjj1erJUwc1gkmxRK6SnPPX0E08BYYiuF71b00jumJeYPiYipOuWTkQhGZ8HAdf1
         RTgA==
X-Gm-Message-State: AC+VfDwF3rbXDktMS3yblG2V0XsA1WIGt45TYyXiO/ENpO6JBDQHaWdH
        7G33qsofWi9+LRut/1dOGnCc3g==
X-Google-Smtp-Source: ACHHUZ5qPcvl9o8olqmuNW+pSeTOFb4CL5y4S3BSwndVSbpbvOzA8U8h1EB+k0YkoXeYFqjACSQQ5Q==
X-Received: by 2002:a19:5e58:0:b0:4f3:aa74:2faf with SMTP id z24-20020a195e58000000b004f3aa742fafmr1527910lfi.6.1686341964241;
        Fri, 09 Jun 2023 13:19:24 -0700 (PDT)
Received: from [192.168.1.101] (abyj190.neoplus.adsl.tpnet.pl. [83.9.29.190])
        by smtp.gmail.com with ESMTPSA id b18-20020ac25632000000b004f628eb7884sm641349lff.232.2023.06.09.13.19.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jun 2023 13:19:23 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Fri, 09 Jun 2023 22:19:12 +0200
Subject: [PATCH v2 07/22] interconnect: qcom: Fold smd-rpm.h into icc-rpm.h
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230526-topic-smd_icc-v2-7-e5934b07d813@linaro.org>
References: <20230526-topic-smd_icc-v2-0-e5934b07d813@linaro.org>
In-Reply-To: <20230526-topic-smd_icc-v2-0-e5934b07d813@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Leo Yan <leo.yan@linaro.org>, Evan Green <evgreen@chromium.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-pm@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1686341953; l=5451;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=byYAlps9wH1OSJiblDOBqmeTnt9HlHHvwOPwDsuq8eU=;
 b=TNaoCQCvOGFaZOGxrOiTnZ9Mzo/7T2dJeHgUSmI0k6uRHFoQnWYtbc7RQyorpoJIyZbW61nyg
 MzTI5qdXtzWC6o5TXzTMl2jR3VZH1nISG1wEB6n2Mgmz1N6ANiS0wqO
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

smd-rpm.h is not very useful as-is and both files are always included
anyway.. Combine them.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/interconnect/qcom/icc-rpm.c |  1 -
 drivers/interconnect/qcom/icc-rpm.h |  5 +++++
 drivers/interconnect/qcom/msm8916.c |  1 -
 drivers/interconnect/qcom/msm8939.c |  1 -
 drivers/interconnect/qcom/msm8974.c |  2 +-
 drivers/interconnect/qcom/msm8996.c |  1 -
 drivers/interconnect/qcom/qcm2290.c |  1 -
 drivers/interconnect/qcom/qcs404.c  |  1 -
 drivers/interconnect/qcom/sdm660.c  |  1 -
 drivers/interconnect/qcom/smd-rpm.c |  2 +-
 drivers/interconnect/qcom/smd-rpm.h | 15 ---------------
 11 files changed, 7 insertions(+), 24 deletions(-)

diff --git a/drivers/interconnect/qcom/icc-rpm.c b/drivers/interconnect/qcom/icc-rpm.c
index 863e8ba1daa2..b8ecf9538ab9 100644
--- a/drivers/interconnect/qcom/icc-rpm.c
+++ b/drivers/interconnect/qcom/icc-rpm.c
@@ -14,7 +14,6 @@
 #include <linux/regmap.h>
 #include <linux/slab.h>
 
-#include "smd-rpm.h"
 #include "icc-common.h"
 #include "icc-rpm.h"
 
diff --git a/drivers/interconnect/qcom/icc-rpm.h b/drivers/interconnect/qcom/icc-rpm.h
index ba840a436cc0..9b4ea4e39b9f 100644
--- a/drivers/interconnect/qcom/icc-rpm.h
+++ b/drivers/interconnect/qcom/icc-rpm.h
@@ -6,6 +6,8 @@
 #ifndef __DRIVERS_INTERCONNECT_QCOM_ICC_RPM_H
 #define __DRIVERS_INTERCONNECT_QCOM_ICC_RPM_H
 
+#include <linux/soc/qcom/smd-rpm.h>
+
 #include <dt-bindings/interconnect/qcom,icc.h>
 
 #define RPM_BUS_MASTER_REQ	0x73616d62
@@ -121,4 +123,7 @@ enum qos_mode {
 int qnoc_probe(struct platform_device *pdev);
 int qnoc_remove(struct platform_device *pdev);
 
+bool qcom_icc_rpm_smd_available(void);
+int qcom_icc_rpm_smd_send(int ctx, int rsc_type, int id, u32 val);
+
 #endif
diff --git a/drivers/interconnect/qcom/msm8916.c b/drivers/interconnect/qcom/msm8916.c
index 5c4ba2f37c8e..196b05879896 100644
--- a/drivers/interconnect/qcom/msm8916.c
+++ b/drivers/interconnect/qcom/msm8916.c
@@ -15,7 +15,6 @@
 
 #include <dt-bindings/interconnect/qcom,msm8916.h>
 
-#include "smd-rpm.h"
 #include "icc-rpm.h"
 
 enum {
diff --git a/drivers/interconnect/qcom/msm8939.c b/drivers/interconnect/qcom/msm8939.c
index caf0aefad668..639566dce45a 100644
--- a/drivers/interconnect/qcom/msm8939.c
+++ b/drivers/interconnect/qcom/msm8939.c
@@ -16,7 +16,6 @@
 
 #include <dt-bindings/interconnect/qcom,msm8939.h>
 
-#include "smd-rpm.h"
 #include "icc-rpm.h"
 
 enum {
diff --git a/drivers/interconnect/qcom/msm8974.c b/drivers/interconnect/qcom/msm8974.c
index 1828deaca443..968162213d40 100644
--- a/drivers/interconnect/qcom/msm8974.c
+++ b/drivers/interconnect/qcom/msm8974.c
@@ -38,7 +38,7 @@
 #include <linux/platform_device.h>
 #include <linux/slab.h>
 
-#include "smd-rpm.h"
+#include "icc-rpm.h"
 
 enum {
 	MSM8974_BIMC_MAS_AMPSS_M0 = 1,
diff --git a/drivers/interconnect/qcom/msm8996.c b/drivers/interconnect/qcom/msm8996.c
index 20340fb62fe6..1f7e88a37acd 100644
--- a/drivers/interconnect/qcom/msm8996.c
+++ b/drivers/interconnect/qcom/msm8996.c
@@ -18,7 +18,6 @@
 #include <dt-bindings/interconnect/qcom,msm8996.h>
 
 #include "icc-rpm.h"
-#include "smd-rpm.h"
 #include "msm8996.h"
 
 static const char * const mm_intf_clocks[] = {
diff --git a/drivers/interconnect/qcom/qcm2290.c b/drivers/interconnect/qcom/qcm2290.c
index a29cdb4fac03..cb636e67a5a4 100644
--- a/drivers/interconnect/qcom/qcm2290.c
+++ b/drivers/interconnect/qcom/qcm2290.c
@@ -19,7 +19,6 @@
 #include <linux/slab.h>
 
 #include "icc-rpm.h"
-#include "smd-rpm.h"
 
 enum {
 	QCM2290_MASTER_APPSS_PROC = 1,
diff --git a/drivers/interconnect/qcom/qcs404.c b/drivers/interconnect/qcom/qcs404.c
index fae155344332..938283ddd0e3 100644
--- a/drivers/interconnect/qcom/qcs404.c
+++ b/drivers/interconnect/qcom/qcs404.c
@@ -13,7 +13,6 @@
 #include <linux/of_device.h>
 
 
-#include "smd-rpm.h"
 #include "icc-rpm.h"
 
 enum {
diff --git a/drivers/interconnect/qcom/sdm660.c b/drivers/interconnect/qcom/sdm660.c
index 7ffaf70d62d3..003fc7d110a7 100644
--- a/drivers/interconnect/qcom/sdm660.c
+++ b/drivers/interconnect/qcom/sdm660.c
@@ -17,7 +17,6 @@
 #include <linux/slab.h>
 
 #include "icc-rpm.h"
-#include "smd-rpm.h"
 
 enum {
 	SDM660_MASTER_IPA = 1,
diff --git a/drivers/interconnect/qcom/smd-rpm.c b/drivers/interconnect/qcom/smd-rpm.c
index dc8ff8d133a9..b0183262ba66 100644
--- a/drivers/interconnect/qcom/smd-rpm.c
+++ b/drivers/interconnect/qcom/smd-rpm.c
@@ -13,7 +13,7 @@
 #include <linux/platform_device.h>
 #include <linux/soc/qcom/smd-rpm.h>
 
-#include "smd-rpm.h"
+#include "icc-rpm.h"
 
 #define RPM_KEY_BW		0x00007762
 
diff --git a/drivers/interconnect/qcom/smd-rpm.h b/drivers/interconnect/qcom/smd-rpm.h
deleted file mode 100644
index ca9d0327b8ac..000000000000
--- a/drivers/interconnect/qcom/smd-rpm.h
+++ /dev/null
@@ -1,15 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*
- * Copyright (c) 2019, Linaro Ltd.
- * Author: Georgi Djakov <georgi.djakov@linaro.org>
- */
-
-#ifndef __DRIVERS_INTERCONNECT_QCOM_SMD_RPM_H
-#define __DRIVERS_INTERCONNECT_QCOM_SMD_RPM_H
-
-#include <linux/soc/qcom/smd-rpm.h>
-
-bool qcom_icc_rpm_smd_available(void);
-int qcom_icc_rpm_smd_send(int ctx, int rsc_type, int id, u32 val);
-
-#endif

-- 
2.41.0

