Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6755AC7EE2F
	for <linux-clk@archiver.kernel.org>; Tue, 30 May 2023 10:20:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229823AbjE3KUM (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 30 May 2023 06:20:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231324AbjE3KUK (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 30 May 2023 06:20:10 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E452AD9
        for <linux-clk@vger.kernel.org>; Tue, 30 May 2023 03:20:07 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-4f4f757d575so3098293e87.0
        for <linux-clk@vger.kernel.org>; Tue, 30 May 2023 03:20:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685442006; x=1688034006;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VvXpNIbHmqtd4lG8jcv7ZzbkoIqN9kOw2a/0JaApzvg=;
        b=nm8S0ICs/LpwJ5/vDr0fd5IwjPwej8X5egeLTLnaOEyL+sObY7zIlZUwD0wCwzw5Ra
         YMLO7XxpAo6jltNKhmLabdHmu+OOPDT0T8R4rB00vqaSSp0uO1sWQUfJbZUJeIoSkJGc
         c3qVoYHkIxs+oQMJ7crPlm3Mdp723q8c4aXdBTaggGPRZHyjYrAxVGYhTVuCzaTsYbcH
         chhgfNV626FRO8m8PFCEAHbrHIV6yFhCFGwsbX6uqdeICuonE6RsGUWNS0I2IDqCDfRy
         e+HrJA+TxU1iaLyJ6/ojVjBVrNmdltUSckZqayHVhOnEThXlKDweEPhUQ/7rHlzKnJc6
         ZXCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685442006; x=1688034006;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VvXpNIbHmqtd4lG8jcv7ZzbkoIqN9kOw2a/0JaApzvg=;
        b=FhMW87/4BXPkofRGx+4+KBjo9Ywjhp1riF1JF36L50xQF6M0NaxcDRyhEQTQlLOWJh
         MlYhhBF6ODS5zuNisPybpqpiTCIK1QSXZhA84v8ULUZ7z5N5S9dCOS0euNs7MvjMNFJj
         ROuvxVZsYm9E5C8jItLAaf0ah08MhgkOzKUKZ4rPed3m3oqpx3qTKhAxyRzR9UFnWsY4
         VQr4ox9K0TPGf/EUt7lgz0OMSpx76WoytkMA38er8u/sCEZa5VI3UGoa+qpszIksLdli
         L3kNQSjUhjsFLSqMjd1+u1WdkUGZ866qctBwFWuZjwdGPV8Hyl22sHomdD3ThYV+Jn2l
         ginw==
X-Gm-Message-State: AC+VfDwwYq5jKs1pJRXjy3u+FGH1V4/S2fzuwV/4E0s5uqK3tU/62MOK
        DEKMWfimIi/N0HhoaqdZNCQJZdDSLkKloQjqzy0=
X-Google-Smtp-Source: ACHHUZ5+zKi+lgYEbZ1esDpzoBfTLPxmkNqynE9WjjmRdGWq94hAmEPOF3K7nDXeSyVqyzjcalxqFg==
X-Received: by 2002:a05:6512:968:b0:4e8:487a:7c2e with SMTP id v8-20020a056512096800b004e8487a7c2emr501857lft.14.1685442006314;
        Tue, 30 May 2023 03:20:06 -0700 (PDT)
Received: from [192.168.1.101] (abyj77.neoplus.adsl.tpnet.pl. [83.9.29.77])
        by smtp.gmail.com with ESMTPSA id c25-20020ac24159000000b004cc8196a308sm290902lfi.98.2023.05.30.03.20.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 May 2023 03:20:06 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Tue, 30 May 2023 12:20:01 +0200
Subject: [PATCH 02/20] clk: qcom: smd-rpm: Move some RPM resources to the
 common header
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230526-topic-smd_icc-v1-2-1bf8e6663c4e@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1685442001; l=2376;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=ApK/VPfTmld07UKzNhGBat7UaI7zSF3PDIl2T4HqloY=;
 b=rSjHIbUA7ZHfYPhT2WvjHFRqSyeNfPKb8oZvSP/GEIX6r6PpXXzQLHMrQUZnUjUmiAQcskOnF
 GkrinvwTeNDD7nra0QIM6+AOf0Nu7SwerMpzW2LOHwnb0E4QHAWiNBa
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

In preparation for handling the bus clocks in the icc driver, carve out
some defines and a struct definition to the common rpm header.

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
2.40.1

