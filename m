Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CFB3CA9EAB
	for <linux-clk@archiver.kernel.org>; Mon, 12 Jun 2023 18:31:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235111AbjFLSax (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 12 Jun 2023 14:30:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237674AbjFLSYq (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 12 Jun 2023 14:24:46 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B86F10C2
        for <linux-clk@vger.kernel.org>; Mon, 12 Jun 2023 11:24:45 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-4f62b512fe2so5755137e87.1
        for <linux-clk@vger.kernel.org>; Mon, 12 Jun 2023 11:24:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686594283; x=1689186283;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o4TG88G8lz+fAZ9zU8d6rxSrHlYur3wUM1VMDavTyKo=;
        b=loBipD48bZ404WlmVXrHE9OF0fwywsGH/JnBUa99Fda7L2FYBra2kMzYykhiYL74eh
         2OAmACB+Nt5QE4OXbVNpeV/2VOwd/Qr3kDkRjwifdpkmSghUHz1Nr5XOzLnOOc/jepf0
         vOVvn7pU8gqGnlgQWOhm+TVVQBwIc9QHsCwUY8DM+yzPXaeXHQBAaImt5LOMuj+D9KMR
         mHTLaUjvJv2uf0WTWubjOZ2pO6qGvmxIhit5PQrXJaby5vdElAjAP8snqdn7ai+A+Euu
         82uuyiUio/p9kjATJ09ue/fKVn6j0s/GeXR75nujCfDAga1QRA639M/Lx47/dMF2KKqq
         tZiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686594283; x=1689186283;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o4TG88G8lz+fAZ9zU8d6rxSrHlYur3wUM1VMDavTyKo=;
        b=DiXt39dSLCUqdSkt2VNfY24LY/pbZmFFFK6sAutZdqJMtfp6/4SilENUW6MAcXqMTK
         gCBc8Rj9+m20J4NjNiHsPMz6UbdYTusL60ueR8FO3GZUIrR9Rrtq3ExiesFeObPWhJob
         fjj/jZetBEOc4/ES7HxwqKuAwAHJiHO/+TjPc8uD6uSfNnlFMKyAxqXB79lt+3NQmG17
         QnQnCcemvBw0DS82XdLP2yvbaLrfG1YPkSo+ewY4Nyn/wc+Lc8alb/0JiNnvlJ5b/Vg6
         ecVNx9uJuh3r8wr73PPjXG2MoSpYO3KeGMRLx1t3gPfGmGtSVvoxl+QwPGTUMbVEkZ46
         zqoQ==
X-Gm-Message-State: AC+VfDx4RgY0kj27KlVtrj82gf5StIMORnSXRrv522N5gRWY+dNEZLq2
        sUNfLqlLIqCgJdmb5Qi0A9ZOsQ==
X-Google-Smtp-Source: ACHHUZ5/BWwu6sOkYx5RE/rkClGV95eeDtFMUyIDILZdFknNS8QETCM3gAleZueP/DBL7rxmVgR2NQ==
X-Received: by 2002:a19:914f:0:b0:4f3:a483:557 with SMTP id y15-20020a19914f000000b004f3a4830557mr4254666lfj.5.1686594283376;
        Mon, 12 Jun 2023 11:24:43 -0700 (PDT)
Received: from [192.168.1.101] (abyj190.neoplus.adsl.tpnet.pl. [83.9.29.190])
        by smtp.gmail.com with ESMTPSA id v24-20020ac25938000000b004f64073a252sm1502035lfi.96.2023.06.12.11.24.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jun 2023 11:24:43 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Mon, 12 Jun 2023 20:24:21 +0200
Subject: [PATCH v3 04/23] clk: qcom: smd-rpm: Move some RPM resources to
 the common header
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230526-topic-smd_icc-v3-4-5fb7d39b874f@linaro.org>
References: <20230526-topic-smd_icc-v3-0-5fb7d39b874f@linaro.org>
In-Reply-To: <20230526-topic-smd_icc-v3-0-5fb7d39b874f@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1686594276; l=2437;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=UU7GtjAFC9F3/14Sgtv72aSDwAe2u4JL+0KQToDCmwI=;
 b=iX5fHRl6tir/I7qMgS6vwBY+LdMrYMhq6DtPXkBDkzFQZbIfwPo0YpBIUEuqs0CTpvFej8BXE
 9XtHBB+AKhkA2PRGTSxGEoUTlRk8Yij5oLMWIEe2hJiV66hloeyZbpg
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

In preparation for handling the bus clocks in the icc driver, carve out
some defines and a struct definition to the common rpm header.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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

