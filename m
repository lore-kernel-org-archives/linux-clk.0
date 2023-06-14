Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C69B6C04FDF
	for <linux-clk@archiver.kernel.org>; Wed, 14 Jun 2023 18:05:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236660AbjFNSF0 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 14 Jun 2023 14:05:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240244AbjFNSE4 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 14 Jun 2023 14:04:56 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2776F2704
        for <linux-clk@vger.kernel.org>; Wed, 14 Jun 2023 11:04:51 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-4f7deee339dso339458e87.0
        for <linux-clk@vger.kernel.org>; Wed, 14 Jun 2023 11:04:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686765889; x=1689357889;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Hw4WRawxs1UeInGhZDq9K62HhD6piBeFrd3LBHFgURY=;
        b=pbYsJNTMQ3iR6kEkTpcBcb+UBfk2mkKoM/yYugH7xUPXJEwhTh7Mj944P7qIkVh2Hj
         jwA4zNW+QEx+j7jsn9nX7+iocdQNYq3EZDpPjzRhHEZ2r1G+0EERithXjVroBKrDOmnY
         Vss/IDYquOv1b9P1grInln+HdMGZZVL/2Z83SpoB7PJnBomb4h3v6avqvmmqD732E3rs
         +KzGIZyR21ttBKm5lfk9pnlAm0ct7splb3CaD44aGYUyBNlr8kQvwjxKMdbNZd/4OvZR
         XfujlS1i/h4rer0j2yUBbZ9jmKio5QcIhP96lrqeJ+94bRlqhRNALOLKNLPqe0Rq40ln
         xUcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686765889; x=1689357889;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Hw4WRawxs1UeInGhZDq9K62HhD6piBeFrd3LBHFgURY=;
        b=Ly9DR5E/vk4ZWF7jpytoeecGfwzojHEN0RqcXVE3Wlj574UIfNSKXsBpoAI750oLjQ
         09efoly9lkfFpDhytlIiZzHJW080AAOFHfAyV+05WotVczSO0k8M2KWRjs3GT4oloD5i
         PXpWm0Dn8Nyy+UcgYP+aW29TjW5dhruqAtCUefgkK7LtrJplA7PkMnUDwKqPMZbCiTm5
         9jT8afHlVWaxTNkrVxM3bjJUm11T4OPAmf1AhDUgOTNBkwQmKM61IaCRBt0wHcxxIVVz
         gq5WRCKWUKkXL8t286X6lL7NV6CP+LPzaceqGt4MHJOL3iDBnhjZ/r6x6CzxzYTlbVLN
         fozA==
X-Gm-Message-State: AC+VfDx9bALKjIvcw+0o3ObXNRgh6aPJHpGxhCpHNoRYW8WL8W9qnBkF
        Nii0fLRw5dghZ1Akx4RH0faPkA==
X-Google-Smtp-Source: ACHHUZ4Ekp2Lcrt3UErRaV3E+GtK91jn9iTGCcn673F2i/JPgjUmL8h96iN3MQA4xdjtTXvV/9YH9Q==
X-Received: by 2002:ac2:5b91:0:b0:4f6:14d1:5967 with SMTP id o17-20020ac25b91000000b004f614d15967mr7801175lfn.61.1686765889340;
        Wed, 14 Jun 2023 11:04:49 -0700 (PDT)
Received: from [192.168.1.101] (abyj190.neoplus.adsl.tpnet.pl. [83.9.29.190])
        by smtp.gmail.com with ESMTPSA id l18-20020a19c212000000b004eff1f7f206sm2224053lfc.9.2023.06.14.11.04.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jun 2023 11:04:49 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Wed, 14 Jun 2023 20:04:29 +0200
Subject: [PATCH v6 10/22] interconnect: qcom: Define RPM bus clocks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230526-topic-smd_icc-v6-10-263283111e66@linaro.org>
References: <20230526-topic-smd_icc-v6-0-263283111e66@linaro.org>
In-Reply-To: <20230526-topic-smd_icc-v6-0-263283111e66@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1686765872; l=4129;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=R3Hln5kTqJLo0KxW3WBSL1gR8+B0i+HAtxkzQwO6Pts=;
 b=ysKIixDFpTluliq5pwu676opWfqMJ2lADTjj2uk9IeIs2mDdxdvz460SAWAD4CaWPV29zQ0Wj
 xR7D6va7REuAlY7On5IrJj7ldldbDrj4dF3JD5OU9tInrgar5ovXoEy
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

