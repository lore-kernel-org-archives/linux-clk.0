Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6841DC7EE37
	for <linux-clk@archiver.kernel.org>; Tue, 30 May 2023 10:21:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231466AbjE3KVr (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 30 May 2023 06:21:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230416AbjE3KVG (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 30 May 2023 06:21:06 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7ED0AE47
        for <linux-clk@vger.kernel.org>; Tue, 30 May 2023 03:20:26 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-4f50470d77cso1929871e87.0
        for <linux-clk@vger.kernel.org>; Tue, 30 May 2023 03:20:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685442024; x=1688034024;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uPsObl2eYSl57hf5e5vm23MgLVAf+ptSP7UWMFS0yPo=;
        b=GCk1DfL2fR9t/b7umBJBdnOvjrJ/TffAQUWuIHBKjt/DjKcu112buWgxQ/LJqezHLg
         F46c/5aNA8YqUo2xe/0V8OWlIJwXxvgoOisTYJ+Uzbv/GCs1uY3h0GfJgP5LdyhhGyml
         Y+ZdhuaZZPZgnRrpEqT17+VWDqYxRSEphbkQHOnAT/dzR774ShybNVqr37UIkOIXeE4S
         +U9hlTTAcKgIwFvjOau/FV54KDT0ceqw5MDRnOKDiPoJ7kcM2dQq0JAlbzIk/g7+pTVI
         w2tlAjfp6aqPJKeuR+EqgYYiAJM2DqL435PKRDZ0Hy2FOCC4j3UTeuTXrVtMvSq5gXqI
         aSSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685442024; x=1688034024;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uPsObl2eYSl57hf5e5vm23MgLVAf+ptSP7UWMFS0yPo=;
        b=LkxzLDUfhXK0aF9UQeIgiPmtcFVha4EOs6UkSC95XMIBcQo2jBv7VJ8CnP5OVUJLhW
         eztdFOCiFLo60rPIGqCETnPf3ooO5VdixMK61xhWwVL0N17foo9aixaS/nSsHYgodh0W
         bwLb0Y3a8fgpQSK4QFYNA/kKzjLHOwx8Pf3eCJANzWGR9f5rSjb2U1QaclOSzSjJqnQL
         lonq2FGm7PPTiMSc0/I3fvS0b7SQVcXJwI5IggIJP2ye//1AWZX62BV2mmN0yLuh1zuJ
         UY6VAD7IVEQFU1RmKperc1XJzRxKTc1m9CXirz+cZGUhLzlurBvJ5PahqobyRWRHK6Sc
         33LQ==
X-Gm-Message-State: AC+VfDy2dby1rdylHp4tVOH3UZ1OEAfLZ8bY9xcLBF6ICV9wVbtQtHw/
        3vQHOsGtS5ivsXQ2l6elshq9Eg==
X-Google-Smtp-Source: ACHHUZ5lx5CViTuxeCcbtsZno9zIJuTRjy6vwdA0lVXdpg+inNfAo6L2vz5c7z7veiFVr/3l4uuDzA==
X-Received: by 2002:ac2:5ec8:0:b0:4f1:496a:de8e with SMTP id d8-20020ac25ec8000000b004f1496ade8emr545614lfq.27.1685442024386;
        Tue, 30 May 2023 03:20:24 -0700 (PDT)
Received: from [192.168.1.101] (abyj77.neoplus.adsl.tpnet.pl. [83.9.29.77])
        by smtp.gmail.com with ESMTPSA id c25-20020ac24159000000b004cc8196a308sm290902lfi.98.2023.05.30.03.20.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 May 2023 03:20:24 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Tue, 30 May 2023 12:20:15 +0200
Subject: [PATCH 16/20] interconnect: qcom: qcm2290: Hook up RPM bus clk
 definitions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230526-topic-smd_icc-v1-16-1bf8e6663c4e@linaro.org>
References: <20230526-topic-smd_icc-v1-0-1bf8e6663c4e@linaro.org>
In-Reply-To: <20230526-topic-smd_icc-v1-0-1bf8e6663c4e@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Leo Yan <leo.yan@linaro.org>, Evan Green <evgreen@chromium.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-pm@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1685442001; l=2327;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=AUnOBPS3NkcXCeAuiWAp3wlQXXz7ZJbGDI1WK0MkbBw=;
 b=mLVX0sFuQDPC2wh7J2YOL5ld7fn2UowkaahJmgkTbqaWoLJxCQZDC0Fla4quzPPDLOJp4TM90
 Y3vaMNbw5x6C1yknb9hhIeXRjjCD50gwSrF5PLDrDmqUwmqXl7BZQRK
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Assign the necessary definitions to migrate to the new bus clock
handling mechanism.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/interconnect/qcom/qcm2290.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/interconnect/qcom/qcm2290.c b/drivers/interconnect/qcom/qcm2290.c
index cb636e67a5a4..2c7a76fab83c 100644
--- a/drivers/interconnect/qcom/qcm2290.c
+++ b/drivers/interconnect/qcom/qcm2290.c
@@ -1196,6 +1196,7 @@ static const struct qcom_icc_desc qcm2290_bimc = {
 	.type = QCOM_ICC_BIMC,
 	.nodes = qcm2290_bimc_nodes,
 	.num_nodes = ARRAY_SIZE(qcm2290_bimc_nodes),
+	.bus_clk_desc = &bimc_clk,
 	.regmap_cfg = &qcm2290_bimc_regmap_config,
 	/* M_REG_BASE() in vendor msm_bus_bimc_adhoc driver */
 	.qos_offset = 0x8000,
@@ -1251,6 +1252,7 @@ static const struct qcom_icc_desc qcm2290_cnoc = {
 	.type = QCOM_ICC_NOC,
 	.nodes = qcm2290_cnoc_nodes,
 	.num_nodes = ARRAY_SIZE(qcm2290_cnoc_nodes),
+	.bus_clk_desc = &bus_1_clk,
 	.regmap_cfg = &qcm2290_cnoc_regmap_config,
 };
 
@@ -1292,6 +1294,7 @@ static const struct qcom_icc_desc qcm2290_snoc = {
 	.type = QCOM_ICC_QNOC,
 	.nodes = qcm2290_snoc_nodes,
 	.num_nodes = ARRAY_SIZE(qcm2290_snoc_nodes),
+	.bus_clk_desc = &bus_2_clk,
 	.regmap_cfg = &qcm2290_snoc_regmap_config,
 	/* Vendor DT node fab-sys_noc property 'qcom,base-offset' */
 	.qos_offset = 0x15000,
@@ -1306,6 +1309,7 @@ static const struct qcom_icc_desc qcm2290_qup_virt = {
 	.type = QCOM_ICC_QNOC,
 	.nodes = qcm2290_qup_virt_nodes,
 	.num_nodes = ARRAY_SIZE(qcm2290_qup_virt_nodes),
+	.bus_clk_desc = &qup_clk,
 };
 
 static struct qcom_icc_node * const qcm2290_mmnrt_virt_nodes[] = {
@@ -1319,6 +1323,7 @@ static const struct qcom_icc_desc qcm2290_mmnrt_virt = {
 	.type = QCOM_ICC_QNOC,
 	.nodes = qcm2290_mmnrt_virt_nodes,
 	.num_nodes = ARRAY_SIZE(qcm2290_mmnrt_virt_nodes),
+	.bus_clk_desc = &mmaxi_0_clk,
 	.regmap_cfg = &qcm2290_snoc_regmap_config,
 	.qos_offset = 0x15000,
 };
@@ -1333,6 +1338,7 @@ static const struct qcom_icc_desc qcm2290_mmrt_virt = {
 	.type = QCOM_ICC_QNOC,
 	.nodes = qcm2290_mmrt_virt_nodes,
 	.num_nodes = ARRAY_SIZE(qcm2290_mmrt_virt_nodes),
+	.bus_clk_desc = &mmaxi_1_clk,
 	.regmap_cfg = &qcm2290_snoc_regmap_config,
 	.qos_offset = 0x15000,
 };

-- 
2.40.1

