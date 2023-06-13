Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A6BCEB64DC
	for <linux-clk@archiver.kernel.org>; Tue, 13 Jun 2023 14:03:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242684AbjFMODY (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 13 Jun 2023 10:03:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242664AbjFMODV (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 13 Jun 2023 10:03:21 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D40010DF
        for <linux-clk@vger.kernel.org>; Tue, 13 Jun 2023 07:03:17 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-4f658a17aa4so6006450e87.0
        for <linux-clk@vger.kernel.org>; Tue, 13 Jun 2023 07:03:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686664996; x=1689256996;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=43WXKM//3PGv9o6RwF8pM2BvmgRQSkW/hfnQEDsAZP4=;
        b=puG9rP3lBrDBWZ7kXuBnplKEG8Zkv8KjvbRclFcaioO+6ERdz9ajgSy1483bA3hOmA
         UwDTivIe1Yv57in/1SzkqDPiJbmxBf/+xljLyX+sXP2OzI8gPAEcle7Icl4I0QiAueMc
         EItyQuLIFSCdCibwqRIIv5Z9AeBlZDEguXdLeYZWc5WKNla+8xrCLpyQXzGTMRQ2M32a
         knX3sM6H/2wdbYlzPWLWsr2QEpcU5tbSXF7hi8G2uPHq+XMmOv3TfrRucwCH3zfoTZQX
         pzwnXnaSEpGE6O325TV0GOSunjl5/3UF3Alf71+WKcf6LVAqIWBRuqXHfVvgHVdVEMZ2
         Mz0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686664996; x=1689256996;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=43WXKM//3PGv9o6RwF8pM2BvmgRQSkW/hfnQEDsAZP4=;
        b=UaqnM3wUM25wyNtq/NBHPQ5gbFAk2mZqfI+MepWCnd6wyhWLnCwh5T6DotrzQn6YMw
         lSXj0I8lc/q4T+/vgrXv/dF4SAn2ihP7281rrchLCg7nVKOnky0iiSIHGhBU41A/uZjn
         uUuYfKfpLQmFWRPKkqh/iRkZeV52iQXfccDRLYiTymoOh9SFgIJBGX7DGGqInHT3BCau
         0EZ6nXzr5TMz88ED6hshGiMEf9+1C7b4MYkOvaLw0lbLBByHt3FX2xLg9xnkd0Li8o7m
         +e8vlNSVM3YxFu3wM9EeS/fQHLQKRmPIjCWEgNiH2ftptLbX6dufdIQQmGOec4xBuE9x
         qZCw==
X-Gm-Message-State: AC+VfDxAYpDZJRUzVdYFubKvwb0ohmc2oPWmQR4aVk46WjjR1WZIQ7fm
        oxFzb2CmNH7nWITf9iekdtDQ+g==
X-Google-Smtp-Source: ACHHUZ4cRtljtNW0tgnszTxUx8y7UL4HzXcJVnZt95+0kiUkz/DM60Va6+EvjliUKz4P9GY9ZHwjpg==
X-Received: by 2002:a2e:b24d:0:b0:2b1:ed29:7c47 with SMTP id n13-20020a2eb24d000000b002b1ed297c47mr4462172ljm.8.1686664995631;
        Tue, 13 Jun 2023 07:03:15 -0700 (PDT)
Received: from [192.168.1.101] (abyj190.neoplus.adsl.tpnet.pl. [83.9.29.190])
        by smtp.gmail.com with ESMTPSA id a18-20020a05651c011200b002b32af2e9c6sm901490ljb.116.2023.06.13.07.03.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jun 2023 07:03:15 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Tue, 13 Jun 2023 16:03:04 +0200
Subject: [PATCH v4 04/22] clk: qcom: smd-rpm: Move some RPM resources to
 the common header
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230526-topic-smd_icc-v4-4-5ba82b6fbba2@linaro.org>
References: <20230526-topic-smd_icc-v4-0-5ba82b6fbba2@linaro.org>
In-Reply-To: <20230526-topic-smd_icc-v4-0-5ba82b6fbba2@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1686664985; l=2480;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=htdvXfCYU07v6+YNPv56ef+1cDlrbXu+3LbOKbiWsm8=;
 b=WpkWW1wQU4RzD4LRq0vfyw+EYfDWrXNL1nUK+Mh/5LYlyQyaMn0dBsqrjjnM8n2s/ZMh6U0nH
 FxjFx+54W3GC/Q5hmNR+PKU23IunD4cQAjvCQaNCM8ugkKwRRVZpN7e
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

In preparation for handling the bus clocks in the icc driver, carve out
some defines and a struct definition to the common rpm header.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Acked-by: Stephen Boyd <sboyd@kernel.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/clk/qcom/clk-smd-rpm.c   | 13 -------------
 include/linux/soc/qcom/smd-rpm.h | 15 +++++++++++++++
 2 files changed, 15 insertions(+), 13 deletions(-)

diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rpm.c
index e4de74b68797..937cb1515968 100644
--- a/drivers/clk/qcom/clk-smd-rpm.c
+++ b/drivers/clk/qcom/clk-smd-rpm.c
@@ -18,13 +18,6 @@
 
 #include <dt-bindings/clock/qcom,rpmcc.h>
 
-#define QCOM_RPM_KEY_SOFTWARE_ENABLE			0x6e657773
-#define QCOM_RPM_KEY_PIN_CTRL_CLK_BUFFER_ENABLE_KEY	0x62636370
-#define QCOM_RPM_SMD_KEY_RATE				0x007a484b
-#define QCOM_RPM_SMD_KEY_ENABLE				0x62616e45
-#define QCOM_RPM_SMD_KEY_STATE				0x54415453
-#define QCOM_RPM_SCALING_ENABLE_ID			0x2
-
 #define __DEFINE_CLK_SMD_RPM_PREFIX(_prefix, _name, _active,		      \
 				    type, r_id, key)			      \
 	static struct clk_smd_rpm clk_smd_rpm_##_prefix##_active;	      \
@@ -171,12 +164,6 @@ struct clk_smd_rpm {
 	unsigned long rate;
 };
 
-struct clk_smd_rpm_req {
-	__le32 key;
-	__le32 nbytes;
-	__le32 value;
-};
-
 struct rpm_smd_clk_desc {
 	struct clk_smd_rpm **clks;
 	size_t num_clks;
diff --git a/include/linux/soc/qcom/smd-rpm.h b/include/linux/soc/qcom/smd-rpm.h
index 99499e4b080e..8190878645f9 100644
--- a/include/linux/soc/qcom/smd-rpm.h
+++ b/include/linux/soc/qcom/smd-rpm.h
@@ -2,6 +2,8 @@
 #ifndef __QCOM_SMD_RPM_H__
 #define __QCOM_SMD_RPM_H__
 
+#include <linux/types.h>
+
 struct qcom_smd_rpm;
 
 #define QCOM_SMD_RPM_ACTIVE_STATE	0
@@ -45,6 +47,19 @@ struct qcom_smd_rpm;
 #define QCOM_SMD_RPM_PKA_CLK	0x616b70
 #define QCOM_SMD_RPM_MCFG_CLK	0x6766636d
 
+#define QCOM_RPM_KEY_SOFTWARE_ENABLE			0x6e657773
+#define QCOM_RPM_KEY_PIN_CTRL_CLK_BUFFER_ENABLE_KEY	0x62636370
+#define QCOM_RPM_SMD_KEY_RATE				0x007a484b
+#define QCOM_RPM_SMD_KEY_ENABLE				0x62616e45
+#define QCOM_RPM_SMD_KEY_STATE				0x54415453
+#define QCOM_RPM_SCALING_ENABLE_ID			0x2
+
+struct clk_smd_rpm_req {
+	__le32 key;
+	__le32 nbytes;
+	__le32 value;
+};
+
 int qcom_rpm_smd_write(struct qcom_smd_rpm *rpm,
 		       int state,
 		       u32 resource_type, u32 resource_id,

-- 
2.41.0

