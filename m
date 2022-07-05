Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DAECC433EF
	for <linux-clk@archiver.kernel.org>; Tue,  5 Jul 2022 11:27:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230030AbiGEL1j (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 5 Jul 2022 07:27:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229457AbiGEL1j (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 5 Jul 2022 07:27:39 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB8D915FEC
        for <linux-clk@vger.kernel.org>; Tue,  5 Jul 2022 04:27:37 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id bx13so14128124ljb.1
        for <linux-clk@vger.kernel.org>; Tue, 05 Jul 2022 04:27:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=B+D+YTDarzK7BrEYLxeiU5uQ8xZ8B5qdXL7zv9BsOTY=;
        b=LOfuMXhYFNPV/ywD9MsSd553vHxEJl2PBELwo5mB5LhCschnWAI2ezvCvitQ8bkGzx
         5vsWaK0RQBo8lnGITxt24nyx/05yn63MmSKzXwC+/eowWFFi5I2iez7EEfzZmUqBYuIa
         eQXapcmC/Aqo/NOihcdeTVfXC5Z5CH/FNCm4fKHRARLVPkP6tFSo8jUKAuMeGs0fxoDt
         frNbMJqOaHb3aDBdFyKEc34XzYGvm3TRA+tcWR9HPeN6VNIA5+vClV2IROTuO1baRlTA
         Zl2N2AIYPlonBaJhroWIdFTpsLN+HkjAdf0TgCQELMOeWvge8iQZ/yWSaNjwqUuBoR3e
         q1Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=B+D+YTDarzK7BrEYLxeiU5uQ8xZ8B5qdXL7zv9BsOTY=;
        b=3cbryHP+ewqDofC5SPLoWGyG07nwoPnOHxGB1p/r0qIKZ1pHqyf5dCoM/Up5xnwQlj
         /lbsxLSRO6OJnkOXIUCJFWOKxlBVUt0cO4ouZVMXOaKyhVDzHXTkCXeM0UacU5jJKk7t
         z+0+Sm6hpJLBKC5DjKR216+zq6FQ/uU+lReWXGrdA47pTO1t5v2VzLo4OQmoxAe3h29P
         rzYtoM5217cVSEKWQaKLkXRDSuPvYkcPfOyJBzpGMU5l/Y3prTBOrdbmhpfTT+vXsXpF
         umqFhziBnfZN7uhWokQ5F4zHvbb1zUVr5e4IuMQMBgyPfWW3nwetkkoj8qzqc0rmim/Q
         gw0g==
X-Gm-Message-State: AJIora9G718aQxNg7gQt7Okxv4Za9SZZxSA+iqiyKIEcC8PXHkTQNPl1
        mCd5h8idNcj+JFiJZ0ek+SA0Dw==
X-Google-Smtp-Source: AGRyM1vu8Vw2EJjVeBT8F0+v7efZg+czGWWIjooMsxgutHakiWFeo89UUTf9Su3s3ADYG6PyMZf6dA==
X-Received: by 2002:a05:651c:19ac:b0:25b:db26:55c3 with SMTP id bx44-20020a05651c19ac00b0025bdb2655c3mr20204329ljb.457.1657020456187;
        Tue, 05 Jul 2022 04:27:36 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id k26-20020a05651c10ba00b0025a736f5a41sm5525449ljn.9.2022.07.05.04.27.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jul 2022 04:27:35 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v2 1/2] dt-bindings: clock: qcom,mmcc: fix clocks/clock-names definitions
Date:   Tue,  5 Jul 2022 14:27:33 +0300
Message-Id: <20220705112734.1323355-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220705112734.1323355-1-dmitry.baryshkov@linaro.org>
References: <20220705112734.1323355-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Rather than defining (incorrect) global clocks and clock-names lists,
define them per platform using conditionals. Also, while we are at it,
mark these properties as required for all platforms for which DT files
contained clocks/clock-names for the MMCC nodes from the beginning (in
addition to existing MSM8998 this adds MSM8994, SDM630 and SDM660).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../devicetree/bindings/clock/qcom,mmcc.yaml  | 149 ++++++++++++++----
 1 file changed, 117 insertions(+), 32 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,mmcc.yaml b/Documentation/devicetree/bindings/clock/qcom,mmcc.yaml
index 32e87014bb55..6b831730a914 100644
--- a/Documentation/devicetree/bindings/clock/qcom,mmcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,mmcc.yaml
@@ -31,30 +31,12 @@ properties:
       - qcom,mmcc-sdm660
 
   clocks:
-    items:
-      - description: Board XO source
-      - description: Board sleep source
-      - description: Global PLL 0 clock
-      - description: DSI phy instance 0 dsi clock
-      - description: DSI phy instance 0 byte clock
-      - description: DSI phy instance 1 dsi clock
-      - description: DSI phy instance 1 byte clock
-      - description: HDMI phy PLL clock
-      - description: DisplayPort phy PLL vco clock
-      - description: DisplayPort phy PLL link clock
+    minItems: 9
+    maxItems: 10
 
   clock-names:
-    items:
-      - const: xo
-      - const: sleep
-      - const: gpll0
-      - const: dsi0dsi
-      - const: dsi0byte
-      - const: dsi1dsi
-      - const: dsi1byte
-      - const: hdmipll
-      - const: dpvco
-      - const: dplink
+    minItems: 9
+    maxItems: 10
 
   '#clock-cells':
     const: 1
@@ -85,16 +67,119 @@ required:
 
 additionalProperties: false
 
-if:
-  properties:
-    compatible:
-      contains:
-        const: qcom,mmcc-msm8998
-
-then:
-  required:
-    - clocks
-    - clock-names
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,mmcc-msm8994
+              - qcom,mmcc-msm8998
+              - qcom,mmcc-sdm630
+              - qcom,mmcc-sdm660
+    then:
+      required:
+        - clocks
+        - clock-names
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,mmcc-msm8994
+    then:
+      properties:
+        clocks:
+          items:
+            - description: Board XO source
+            - description: Global PLL 0 clock
+            - description: MMSS NoC AHB clock
+            - description: GFX3D clock
+            - description: DSI phy instance 0 dsi clock
+            - description: DSI phy instance 0 byte clock
+            - description: DSI phy instance 1 dsi clock
+            - description: DSI phy instance 1 byte clock
+            - description: HDMI phy PLL clock
+
+        clock-names:
+          items:
+            - const: xo
+            - const: gpll0
+            - const: mmssnoc_ahb
+            - const: oxili_gfx3d_clk_src
+            - const: dsi0pll
+            - const: dsi0pllbyte
+            - const: dsi1pll
+            - const: dsi1pllbyte
+            - const: hdmipll
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,mmcc-msm8998
+    then:
+      properties:
+        clocks:
+          items:
+            - description: Board XO source
+            - description: Global PLL 0 clock
+            - description: DSI phy instance 0 dsi clock
+            - description: DSI phy instance 0 byte clock
+            - description: DSI phy instance 1 dsi clock
+            - description: DSI phy instance 1 byte clock
+            - description: HDMI phy PLL clock
+            - description: DisplayPort phy PLL link clock
+            - description: DisplayPort phy PLL vco clock
+            - description: Test clock
+
+        clock-names:
+          items:
+            - const: xo
+            - const: gpll0
+            - const: dsi0dsi
+            - const: dsi0byte
+            - const: dsi1dsi
+            - const: dsi1byte
+            - const: hdmipll
+            - const: dplink
+            - const: dpvco
+            - const: core_bi_pll_test_se
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,mmcc-sdm630
+              - qcom,mmcc-sdm660
+    then:
+      properties:
+        clocks:
+          items:
+            - description: Board XO source
+            - description: Board sleep source
+            - description: Global PLL 0 clock
+            - description: Global PLL 0 DIV clock
+            - description: DSI phy instance 0 dsi clock
+            - description: DSI phy instance 0 byte clock
+            - description: DSI phy instance 1 dsi clock
+            - description: DSI phy instance 1 byte clock
+            - description: DisplayPort phy PLL link clock
+            - description: DisplayPort phy PLL vco clock
+
+        clock-names:
+          items:
+            - const: xo
+            - const: sleep_clk
+            - const: gpll0
+            - const: gpll0_div
+            - const: dsi0pll
+            - const: dsi0pllbyte
+            - const: dsi1pll
+            - const: dsi1pllbyte
+            - const: dp_link_2x_clk_divsel_five
+            - const: dp_vco_divided_clk_src_mux
 
 examples:
   # Example for MMCC for MSM8960:
-- 
2.35.1

