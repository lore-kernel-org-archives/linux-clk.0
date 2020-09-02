Return-Path: <SRS0=xpBS=CL=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA771C433E7
	for <linux-clk@archiver.kernel.org>; Wed,  2 Sep 2020 18:41:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CBBAA20C56
	for <linux-clk@archiver.kernel.org>; Wed,  2 Sep 2020 18:41:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=marek-ca.20150623.gappssmtp.com header.i=@marek-ca.20150623.gappssmtp.com header.b="eeubmQvu"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728296AbgIBSlC (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 2 Sep 2020 14:41:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728177AbgIBSkM (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 2 Sep 2020 14:40:12 -0400
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com [IPv6:2607:f8b0:4864:20::741])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CC70C061261
        for <linux-clk@vger.kernel.org>; Wed,  2 Sep 2020 11:40:07 -0700 (PDT)
Received: by mail-qk1-x741.google.com with SMTP id d20so677731qka.5
        for <linux-clk@vger.kernel.org>; Wed, 02 Sep 2020 11:40:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3b3qBolN08YGemrK8v4jSiFaYzQaq4OjQQvoyptMIv8=;
        b=eeubmQvuNrBhi0LAsHT0u1DkZdvfGu8AHwaJDUsV6NjSqz3iqkHR51PnU7cAKaRNSs
         s/d+YMsaXP47ZL7ZzWEUcsiNYZc6SCLcP5ShcvVuEKZ/6MYw2A1MQyBLbZkgHCoD6xds
         BPtbKk2q6BGL4+zdezvBUEU3VROeZJ50aMsyHZZW/DHE8elMpILGbtVIQjgpIby5jaZ6
         l7NSd6Jx/9/R9hZu7CxiRkhWUfDq7DupTiXr4LLB556+LBBwq+GvJA1CTX+L47CPVHCk
         29pG2tJ1zlqk9ETZNUgFbDT69C6My25p6V5jXvDg7CGf37svmi/wIUnOOnzK01bVGD+e
         dySA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3b3qBolN08YGemrK8v4jSiFaYzQaq4OjQQvoyptMIv8=;
        b=iN3oAkt4giyH71UGX5jZJfHJjY2pCsvxHDfqqSv6erPRV+chRtVJ/2VNiIEYbopMNH
         u3m5yl6REI4z0e17UiehqqPbaLZHU3WEzuL42NJxLQa2hxpkERkvF/LZA21dZOuK8HWI
         7j+nBzKxNlGcMYR9qEM8GjfXJGcMICL2ibHT6dWu+nPRJt0+8RSYSr+261zVrISah9J3
         9fYNQwAznUsxnoVWvLKLTOsuSEtZqfoNqZZfvZnY60CFX/P+SOJqlH7OtQi5/HS4TtJO
         W7Ulp7G/2Rv5SMNZ/lKd8buyzjIiJtSaSnXGHFtE3PBpmpHJwsMs2d5/OHuYnQ44E2Dv
         v4Tg==
X-Gm-Message-State: AOAM533WjkGOt6taVPH4qvgIFSKZ8SmsA+7p1t0BzTDComOhdzrFJP+I
        nQUow0V2CkA1UFfhbTi0cO9eTA==
X-Google-Smtp-Source: ABdhPJxK1aKs+fkclzvxnLy3qDF4MMk5uKdJN7S9Li9UaXNmVA9K40dlUSmMvBLeVgIe5QVSajvFvg==
X-Received: by 2002:a05:620a:a52:: with SMTP id j18mr7761145qka.445.1599072006061;
        Wed, 02 Sep 2020 11:40:06 -0700 (PDT)
Received: from localhost.localdomain ([147.253.86.153])
        by smtp.gmail.com with ESMTPSA id s47sm208004qtb.13.2020.09.02.11.40.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2020 11:40:05 -0700 (PDT)
From:   Jonathan Marek <jonathan@marek.ca>
To:     linux-arm-msm@vger.kernel.org
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Taniya Das <tdas@codeaurora.org>,
        linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
        devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 4/7] dt-bindings: clock: Introduce QCOM SM8150 display clock bindings
Date:   Wed,  2 Sep 2020 14:38:44 -0400
Message-Id: <20200902183852.14510-5-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200902183852.14510-1-jonathan@marek.ca>
References: <20200902183852.14510-1-jonathan@marek.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add device tree bindings for display clock controller for
Qualcomm Technology Inc's SM8150 SoCs.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 .../bindings/clock/qcom,dispcc.yaml           |  4 +-
 .../dt-bindings/clock/qcom,dispcc-sm8150.h    | 69 +++++++++++++++++++
 2 files changed, 72 insertions(+), 1 deletion(-)
 create mode 100644 include/dt-bindings/clock/qcom,dispcc-sm8150.h

diff --git a/Documentation/devicetree/bindings/clock/qcom,dispcc.yaml b/Documentation/devicetree/bindings/clock/qcom,dispcc.yaml
index 7c1c81cdc681..43efd451959a 100644
--- a/Documentation/devicetree/bindings/clock/qcom,dispcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,dispcc.yaml
@@ -11,17 +11,19 @@ maintainers:
 
 description: |
   Qualcomm display clock control module which supports the clocks, resets and
-  power domains on SDM845/SC7180.
+  power domains on SDM845/SC7180/SM8150.
 
   See also:
     dt-bindings/clock/qcom,dispcc-sdm845.h
     dt-bindings/clock/qcom,dispcc-sc7180.h
+    dt-bindings/clock/qcom,dispcc-sm8150.h
 
 properties:
   compatible:
     enum:
       - qcom,sdm845-dispcc
       - qcom,sc7180-dispcc
+      - qcom,sm8150-dispcc
 
   # NOTE: sdm845.dtsi existed for quite some time and specified no clocks.
   # The code had to use hardcoded mechanisms to find the input clocks.
diff --git a/include/dt-bindings/clock/qcom,dispcc-sm8150.h b/include/dt-bindings/clock/qcom,dispcc-sm8150.h
new file mode 100644
index 000000000000..2b96b0b4fe97
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,dispcc-sm8150.h
@@ -0,0 +1,69 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2017-2020, The Linux Foundation. All rights reserved.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_DISP_CC_SM8150_H
+#define _DT_BINDINGS_CLK_QCOM_DISP_CC_SM8150_H
+
+/* DISP_CC clock registers */
+#define DISP_CC_MDSS_AHB_CLK			0
+#define DISP_CC_MDSS_AHB_CLK_SRC		1
+#define DISP_CC_MDSS_BYTE0_CLK			2
+#define DISP_CC_MDSS_BYTE0_CLK_SRC		3
+#define DISP_CC_MDSS_BYTE0_DIV_CLK_SRC		4
+#define DISP_CC_MDSS_BYTE0_INTF_CLK		5
+#define DISP_CC_MDSS_BYTE1_CLK			6
+#define DISP_CC_MDSS_BYTE1_CLK_SRC		7
+#define DISP_CC_MDSS_BYTE1_DIV_CLK_SRC		8
+#define DISP_CC_MDSS_BYTE1_INTF_CLK		9
+#define DISP_CC_MDSS_DP_AUX1_CLK		10
+#define DISP_CC_MDSS_DP_AUX1_CLK_SRC		11
+#define DISP_CC_MDSS_DP_AUX_CLK			12
+#define DISP_CC_MDSS_DP_AUX_CLK_SRC		13
+#define DISP_CC_MDSS_DP_CRYPTO1_CLK		14
+#define DISP_CC_MDSS_DP_CRYPTO1_CLK_SRC		15
+#define DISP_CC_MDSS_DP_CRYPTO_CLK		16
+#define DISP_CC_MDSS_DP_CRYPTO_CLK_SRC		17
+#define DISP_CC_MDSS_DP_LINK1_CLK		18
+#define DISP_CC_MDSS_DP_LINK1_CLK_SRC		19
+#define DISP_CC_MDSS_DP_LINK1_INTF_CLK		20
+#define DISP_CC_MDSS_DP_LINK_CLK		21
+#define DISP_CC_MDSS_DP_LINK_CLK_SRC		22
+#define DISP_CC_MDSS_DP_LINK_INTF_CLK		23
+#define DISP_CC_MDSS_DP_PIXEL1_CLK		24
+#define DISP_CC_MDSS_DP_PIXEL1_CLK_SRC		25
+#define DISP_CC_MDSS_DP_PIXEL2_CLK		26
+#define DISP_CC_MDSS_DP_PIXEL2_CLK_SRC		27
+#define DISP_CC_MDSS_DP_PIXEL_CLK		28
+#define DISP_CC_MDSS_DP_PIXEL_CLK_SRC		29
+#define DISP_CC_MDSS_ESC0_CLK			30
+#define DISP_CC_MDSS_ESC0_CLK_SRC		31
+#define DISP_CC_MDSS_ESC1_CLK			32
+#define DISP_CC_MDSS_ESC1_CLK_SRC		33
+#define DISP_CC_MDSS_MDP_CLK			34
+#define DISP_CC_MDSS_MDP_CLK_SRC		35
+#define DISP_CC_MDSS_MDP_LUT_CLK		36
+#define DISP_CC_MDSS_NON_GDSC_AHB_CLK		37
+#define DISP_CC_MDSS_PCLK0_CLK			38
+#define DISP_CC_MDSS_PCLK0_CLK_SRC		39
+#define DISP_CC_MDSS_PCLK1_CLK			40
+#define DISP_CC_MDSS_PCLK1_CLK_SRC		41
+#define DISP_CC_MDSS_ROT_CLK			42
+#define DISP_CC_MDSS_ROT_CLK_SRC		43
+#define DISP_CC_MDSS_RSCC_AHB_CLK		44
+#define DISP_CC_MDSS_RSCC_VSYNC_CLK		45
+#define DISP_CC_MDSS_VSYNC_CLK			46
+#define DISP_CC_MDSS_VSYNC_CLK_SRC		47
+#define DISP_CC_PLL0				48
+#define DISP_CC_PLL1				49
+
+/* DISP_CC Reset */
+#define DISP_CC_MDSS_CORE_BCR			0
+#define DISP_CC_MDSS_RSCC_BCR			1
+#define DISP_CC_MDSS_SPDM_BCR			2
+
+/* DISP_CC GDSCR */
+#define MDSS_GDSC				0
+
+#endif
-- 
2.26.1

