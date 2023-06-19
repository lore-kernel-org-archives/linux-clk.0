Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07D86C001B3
	for <linux-clk@archiver.kernel.org>; Mon, 19 Jun 2023 13:05:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229696AbjFSNFN (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 19 Jun 2023 09:05:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231765AbjFSNE5 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 19 Jun 2023 09:04:57 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 014CA10E6
        for <linux-clk@vger.kernel.org>; Mon, 19 Jun 2023 06:04:48 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-4f8735ac3e3so1015470e87.2
        for <linux-clk@vger.kernel.org>; Mon, 19 Jun 2023 06:04:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687179887; x=1689771887;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Hw4WRawxs1UeInGhZDq9K62HhD6piBeFrd3LBHFgURY=;
        b=SGfZ+UU3K9z9M4kPDVoxXf4MMMNRy9EtszltHg6Nzf98yhSMD9KP0GGwgVVPwoOPHH
         A3W2JzvMaPnuoj8C4aj5uqfmNpu8EA0T9hTEZFdxZw+6dgdBS4d1c+Eso2U44ZpUAse8
         kCmjtue5/mZ+Ub4CSqWAxbyMmtwsuzYcg4Gsso2YvTwAwzgYxBkn6pFtPnts5t0u8ByS
         9/p5Y9h+kBrqXY8/PGg9g/oHS+BlP+kE9NHt9W9tyoeGx1a40F/vHF9myOBtqDq+7NnH
         DOShsgvWJ+yEdZimuv8B8+nNgGle9bLt5NidCuqe8ICg4nya8rs7lf9BA/AQEX9nAYmj
         CiTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687179887; x=1689771887;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Hw4WRawxs1UeInGhZDq9K62HhD6piBeFrd3LBHFgURY=;
        b=gMlIE7P7hH7SlmWHAR9cq0ltFEaxp41hz2WJevsLXRaiA528AInM8Xfof5I9GzTwZH
         /qBhQeEO5dZ9hHkfC4eX2bxl2UnNAUXdM8kV747klBbxQz+q3zsjWel5hn6SV+cca9Xc
         xrJSU8yc44nByGDcf5OyLVB1djxB0AwqGhkpaPtZp79kAlt4NiDJgzbOnA0YFIvtdIbS
         EjfJGXD/q9Y3GNZg6ctlracnxr3MdKmMDDErMFQgCtyqoTkv7t3IpRKbg4L2KWMIv1RR
         dqNIkhVICdUdIbtIqDJgRaBe4IbB5QNOTdytMjHtf9/xQ0hmeVqiH9KK/SEU5CWMWKBN
         kvCw==
X-Gm-Message-State: AC+VfDwvIaKefrwUU7gsN8ELhSh9FCXeprdIzyUyLtZx4n5jKiZujpXY
        BTWHfcnQ0rx/Jer734/YRTuMIA==
X-Google-Smtp-Source: ACHHUZ4pxzPb9fxN7xflEdMWy5yYR4339d4okbGfGwa9R81sp5wrQXRJCvLqVvIDOmFV3c0cZlX0tg==
X-Received: by 2002:a19:d611:0:b0:4f6:2d98:2985 with SMTP id n17-20020a19d611000000b004f62d982985mr4712347lfg.14.1687179887162;
        Mon, 19 Jun 2023 06:04:47 -0700 (PDT)
Received: from [192.168.1.101] (abyl242.neoplus.adsl.tpnet.pl. [83.9.31.242])
        by smtp.gmail.com with ESMTPSA id q28-20020ac25a1c000000b004f643664882sm4256489lfn.147.2023.06.19.06.04.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jun 2023 06:04:46 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Mon, 19 Jun 2023 15:04:35 +0200
Subject: [PATCH v7 10/22] interconnect: qcom: Define RPM bus clocks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230526-topic-smd_icc-v7-10-09c78c175546@linaro.org>
References: <20230526-topic-smd_icc-v7-0-09c78c175546@linaro.org>
In-Reply-To: <20230526-topic-smd_icc-v7-0-09c78c175546@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Leo Yan <leo.yan@linaro.org>,
        Evan Green <evgreen@chromium.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1687179869; l=4129;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=R3Hln5kTqJLo0KxW3WBSL1gR8+B0i+HAtxkzQwO6Pts=;
 b=NKzLFhjvGk8w4lJiPybSxe8UNxwP497zpJ77GtXsmVlL6YdmsOLGbD1E+Tg+ucXZ/g91uomjr
 OZTONPyHcKfDmoHEGdQz5ig9cxTJwcgG/a2rz1JWmpXOv114Z5QsDwj
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add the definitions for RPM bus clocks that will be used by many
different platforms.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/interconnect/qcom/Makefile         |  2 +-
 drivers/interconnect/qcom/icc-rpm-clocks.c | 77 ++++++++++++++++++++++++++++++
 drivers/interconnect/qcom/icc-rpm.h        | 13 +++++
 3 files changed, 91 insertions(+), 1 deletion(-)

diff --git a/drivers/interconnect/qcom/Makefile b/drivers/interconnect/qcom/Makefile
index ab988926433c..80d9d2da95d1 100644
--- a/drivers/interconnect/qcom/Makefile
+++ b/drivers/interconnect/qcom/Makefile
@@ -29,7 +29,7 @@ qnoc-sm8250-objs			:= sm8250.o
 qnoc-sm8350-objs			:= sm8350.o
 qnoc-sm8450-objs			:= sm8450.o
 qnoc-sm8550-objs			:= sm8550.o
-icc-smd-rpm-objs			:= smd-rpm.o icc-rpm.o
+icc-smd-rpm-objs			:= smd-rpm.o icc-rpm.o icc-rpm-clocks.o
 
 obj-$(CONFIG_INTERCONNECT_QCOM_BCM_VOTER) += icc-bcm-voter.o
 obj-$(CONFIG_INTERCONNECT_QCOM_MSM8916) += qnoc-msm8916.o
diff --git a/drivers/interconnect/qcom/icc-rpm-clocks.c b/drivers/interconnect/qcom/icc-rpm-clocks.c
new file mode 100644
index 000000000000..63c82a91bbc7
--- /dev/null
+++ b/drivers/interconnect/qcom/icc-rpm-clocks.c
@@ -0,0 +1,77 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2023 Linaro Ltd
+ */
+
+#include <linux/soc/qcom/smd-rpm.h>
+
+#include "icc-rpm.h"
+
+const struct rpm_clk_resource aggre1_clk = {
+	.resource_type = QCOM_SMD_RPM_AGGR_CLK,
+	.clock_id = 1,
+};
+EXPORT_SYMBOL_GPL(aggre1_clk);
+
+const struct rpm_clk_resource aggre2_clk = {
+	.resource_type = QCOM_SMD_RPM_AGGR_CLK,
+	.clock_id = 2,
+};
+EXPORT_SYMBOL_GPL(aggre2_clk);
+
+const struct rpm_clk_resource bimc_clk = {
+	.resource_type = QCOM_SMD_RPM_MEM_CLK,
+	.clock_id = 0,
+};
+EXPORT_SYMBOL_GPL(bimc_clk);
+
+const struct rpm_clk_resource bus_0_clk = {
+	.resource_type = QCOM_SMD_RPM_BUS_CLK,
+	.clock_id = 0,
+};
+EXPORT_SYMBOL_GPL(bus_0_clk);
+
+const struct rpm_clk_resource bus_1_clk = {
+	.resource_type = QCOM_SMD_RPM_BUS_CLK,
+	.clock_id = 1,
+};
+EXPORT_SYMBOL_GPL(bus_1_clk);
+
+const struct rpm_clk_resource bus_2_clk = {
+	.resource_type = QCOM_SMD_RPM_BUS_CLK,
+	.clock_id = 2,
+};
+EXPORT_SYMBOL_GPL(bus_2_clk);
+
+const struct rpm_clk_resource mmaxi_0_clk = {
+	.resource_type = QCOM_SMD_RPM_MMAXI_CLK,
+	.clock_id = 0,
+};
+EXPORT_SYMBOL_GPL(mmaxi_0_clk);
+
+const struct rpm_clk_resource mmaxi_1_clk = {
+	.resource_type = QCOM_SMD_RPM_MMAXI_CLK,
+	.clock_id = 1,
+};
+EXPORT_SYMBOL_GPL(mmaxi_1_clk);
+
+const struct rpm_clk_resource qup_clk = {
+	.resource_type = QCOM_SMD_RPM_QUP_CLK,
+	.clock_id = 0,
+};
+EXPORT_SYMBOL_GPL(qup_clk);
+
+/* Branch clocks */
+const struct rpm_clk_resource aggre1_branch_clk = {
+	.resource_type = QCOM_SMD_RPM_AGGR_CLK,
+	.clock_id = 1,
+	.branch = true,
+};
+EXPORT_SYMBOL_GPL(aggre1_branch_clk);
+
+const struct rpm_clk_resource aggre2_branch_clk = {
+	.resource_type = QCOM_SMD_RPM_AGGR_CLK,
+	.clock_id = 2,
+	.branch = true,
+};
+EXPORT_SYMBOL_GPL(aggre2_branch_clk);
diff --git a/drivers/interconnect/qcom/icc-rpm.h b/drivers/interconnect/qcom/icc-rpm.h
index 5c43a8023ffa..ecd6104335a7 100644
--- a/drivers/interconnect/qcom/icc-rpm.h
+++ b/drivers/interconnect/qcom/icc-rpm.h
@@ -137,6 +137,19 @@ enum qos_mode {
 	NOC_QOS_MODE_BYPASS,
 };
 
+extern const struct rpm_clk_resource aggre1_clk;
+extern const struct rpm_clk_resource aggre2_clk;
+extern const struct rpm_clk_resource bimc_clk;
+extern const struct rpm_clk_resource bus_0_clk;
+extern const struct rpm_clk_resource bus_1_clk;
+extern const struct rpm_clk_resource bus_2_clk;
+extern const struct rpm_clk_resource mmaxi_0_clk;
+extern const struct rpm_clk_resource mmaxi_1_clk;
+extern const struct rpm_clk_resource qup_clk;
+
+extern const struct rpm_clk_resource aggre1_branch_clk;
+extern const struct rpm_clk_resource aggre2_branch_clk;
+
 int qnoc_probe(struct platform_device *pdev);
 int qnoc_remove(struct platform_device *pdev);
 

-- 
2.41.0

