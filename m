Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22909C54EBE
	for <linux-clk@archiver.kernel.org>; Fri, 13 Jan 2023 12:13:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231956AbjAMMNr (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 13 Jan 2023 07:13:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233015AbjAMMMx (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 13 Jan 2023 07:12:53 -0500
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4346A80628
        for <linux-clk@vger.kernel.org>; Fri, 13 Jan 2023 04:07:19 -0800 (PST)
Received: by mail-lf1-x12a.google.com with SMTP id o20so880039lfk.5
        for <linux-clk@vger.kernel.org>; Fri, 13 Jan 2023 04:07:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3EjEKvcykQA4uyk5ga1WESuVjINo+zSzb0UWVoBWmHk=;
        b=BZK4NU3eyNehga7ckN9Xxqkj1ewsyCp2fpv1yOaylwV2qg/EYlwE/IA4Aloy48XHQI
         sZ05KUCbD3imqgtQ/iTSzYpzgkMcTydvKcNp2ekzzpmjtVG7HhGpe+cxX1es56kCcHGp
         2hiGtlcU2KY1u+EClSTZk3CFtA/F3HUNNrV6Hk/ZnF1yeMhqWz4o5Zvr1DyMYuzuI6zX
         vtbER/pPXwKQIq7rFP0uWq1CSgtAY2gj+6TkoZJvq+E9F3mPmR3LN/0csE3oupvD/txP
         PhZ5/hCYX8kVv+jN0EvRdA1sffk/ib+VyNeryT/y5zaiWgOC4rby0gJ0I0OPZMp2vx7j
         VtZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3EjEKvcykQA4uyk5ga1WESuVjINo+zSzb0UWVoBWmHk=;
        b=ZBeCJ9M5nqPDLRgpKU+ts3d1xrxmddo+vULFG6rv9eX2Fukt806kaB4AR4wWMrOkCn
         NOSbMJjsY5GWEyP/Onp4kgnbEgkZIkuXt2g7c2+AXsOjZ6a/3nQWZhJPl4Nmz79+CSvp
         fJ0JzOaegcB5vYV1XzAArBym9rCZ9B4oyZeaaCRN+FUgi2MaomDK2fXR/7iQNsYv/qRn
         9sID2sCovNdp+O+afja+jC9/p4AQIOAGebsCjJjYLIa9DoKBZWj0crzL7atm2PtvMjoO
         hLYh1Ix3/pqXynm2q1hbO8z6jqkRCWGd0VO5ZQvIyNASmDqfKwBici/ZQj3UyuClUxIC
         aHOg==
X-Gm-Message-State: AFqh2krIa4oTQFZ7D63PvSVFji3l7VCes3MghNkqk0GsQ5nsAYXPu1CY
        ZWTzRrbjZaMZBL29IVVmKd+QPQ==
X-Google-Smtp-Source: AMrXdXvNNEWDF8QUVrckhJNBTbwfedEJq5e5lyrtj3Yb0fZDwYg+x3gwbklxezUkUHg67uW5e8tj5w==
X-Received: by 2002:a05:6512:3191:b0:4d0:90f0:f81f with SMTP id i17-20020a056512319100b004d090f0f81fmr723771lfe.31.1673611638820;
        Fri, 13 Jan 2023 04:07:18 -0800 (PST)
Received: from eriador.lumag.spb.ru ([188.170.82.205])
        by smtp.gmail.com with ESMTPSA id i7-20020ac25227000000b004ac6a444b26sm3806290lfl.141.2023.01.13.04.07.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jan 2023 04:07:18 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v3 11/14] clk: qcom: cpu-8996: fix ACD initialization
Date:   Fri, 13 Jan 2023 14:05:41 +0200
Message-Id: <20230113120544.59320-12-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230113120544.59320-1-dmitry.baryshkov@linaro.org>
References: <20230113120544.59320-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The vendor kernel applies different order while programming SSSCTL and
L2ACDCR registers on power and performance clusters. However it was
demonstrated that doing this upstream results in the board reset. Make
both clusters use the same sequence, which fixes the reset.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/clk-cpu-8996.c | 20 ++++++++------------
 1 file changed, 8 insertions(+), 12 deletions(-)

diff --git a/drivers/clk/qcom/clk-cpu-8996.c b/drivers/clk/qcom/clk-cpu-8996.c
index 07d59bca741e..c471c6836c63 100644
--- a/drivers/clk/qcom/clk-cpu-8996.c
+++ b/drivers/clk/qcom/clk-cpu-8996.c
@@ -475,9 +475,9 @@ static int qcom_cpu_clk_msm8996_register_clks(struct device *dev,
 	return ret;
 }
 
-#define CPU_AFINITY_MASK 0xFFF
-#define PWRCL_CPU_REG_MASK 0x3
-#define PERFCL_CPU_REG_MASK 0x103
+#define CPU_CLUSTER_AFFINITY_MASK 0xf00
+#define PWRCL_AFFINITY_MASK 0x000
+#define PERFCL_AFFINITY_MASK 0x100
 
 #define L2ACDCR_REG 0x580ULL
 #define L2ACDTD_REG 0x581ULL
@@ -498,21 +498,17 @@ static void qcom_cpu_clk_msm8996_acd_init(struct regmap *regmap)
 	if (val == 0x00006a11)
 		goto out;
 
-	hwid = read_cpuid_mpidr() & CPU_AFINITY_MASK;
-
 	kryo_l2_set_indirect_reg(L2ACDTD_REG, 0x00006a11);
 	kryo_l2_set_indirect_reg(L2ACDDVMRC_REG, 0x000e0f0f);
 	kryo_l2_set_indirect_reg(L2ACDSSCR_REG, 0x00000601);
 
-	if (PWRCL_CPU_REG_MASK == (hwid | PWRCL_CPU_REG_MASK)) {
-		regmap_write(regmap, PWRCL_REG_OFFSET + SSSCTL_OFFSET, 0xf);
-		kryo_l2_set_indirect_reg(L2ACDCR_REG, 0x002c5ffd);
-	}
+	kryo_l2_set_indirect_reg(L2ACDCR_REG, 0x002c5ffd);
 
-	if (PERFCL_CPU_REG_MASK == (hwid | PERFCL_CPU_REG_MASK)) {
-		kryo_l2_set_indirect_reg(L2ACDCR_REG, 0x002c5ffd);
+	hwid = read_cpuid_mpidr();
+	if ((hwid & CPU_CLUSTER_AFFINITY_MASK) == PWRCL_AFFINITY_MASK)
+		regmap_write(regmap, PWRCL_REG_OFFSET + SSSCTL_OFFSET, 0xf);
+	else
 		regmap_write(regmap, PERFCL_REG_OFFSET + SSSCTL_OFFSET, 0xf);
-	}
 
 out:
 	spin_unlock_irqrestore(&qcom_clk_acd_lock, flags);
-- 
2.39.0

