Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EA9ECCA473
	for <linux-clk@archiver.kernel.org>; Thu,  9 Jun 2022 09:30:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233039AbiFIJ37 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 9 Jun 2022 05:29:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240527AbiFIJ3z (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 9 Jun 2022 05:29:55 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9F9126A92F
        for <linux-clk@vger.kernel.org>; Thu,  9 Jun 2022 02:29:52 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id n10so46305050ejk.5
        for <linux-clk@vger.kernel.org>; Thu, 09 Jun 2022 02:29:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Tk8xKk87g7KBs4W4kVam7IN5r8rBhn+IuNaPzOCvkIw=;
        b=MvqSF2C/gpuiIsR1eSf/uq4UboM18mebtjm1gBpJ5iOX/w4rxrtA83bZjtI+3/HuJ9
         KYpuNrbqgXjb/by+hio9F2JJ5FFH5+MaDGxzBiFkk8ygc/LJqku7HGTNjvWwOaDUP/Nr
         J6CFxYLVN5YqolZiESku49SJeTyrNetTd64UNzPwc6Ai5bVxlfkARV0LBFu/wkpS5klf
         F0/vw3gQ9KO1xmuiTVb9gYfLbSLdSl2PigW7yE7ZKPJ3In8+z/XKUMUAoDFCaBBsxUid
         CTfoX3+UGjpD/zllGo0iOafyyux1JDQkzo7RUywolWpQ0as681piWLWIYGyuqReaNpSQ
         MQqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Tk8xKk87g7KBs4W4kVam7IN5r8rBhn+IuNaPzOCvkIw=;
        b=fOvv6xWI59aqbBuW7C5GBVtZxzyE7VXdvaJgkH+wWzK0rnH+zf79ZDXOEZRZ/dmFV2
         /vPsGLo0bDdI+FQJed/jWh9Xsk8EWeRpojt5FN7tnglGFeMOhQOj3Lb9AaDkk44uV5P7
         eakc/50XzHADHa87cd2y9CxHyACCu7GPPpon4PqJv4tm0LO93a2VWqlIOjSldR5bGZWM
         mICNh7OOQmII9sasDhrLvhCc97+wjC1sIYXR6/t65IV+l+TEvLus+/55NTmrD2flfT/J
         k+4LWSE2D527EogQSy+osUtJVuh6nTpUTs6Pgz+X4c9wwpB0mV8vrEsuVXNwgNpJ2X+j
         UNXA==
X-Gm-Message-State: AOAM53249PWFzGN1l0Vp693we0HDmZi8AAGhYGMu6ijCcbmdHuzMXpfZ
        Fi0/Gs1h6ZroJvOdMxVizeZY/A==
X-Google-Smtp-Source: ABdhPJx40CklTvHnvZRbXzyT8+3O05/kofWZm+QaUbSdhNWpUItOQa9FbvmrnCaduxCob2rME6ki6Q==
X-Received: by 2002:a17:906:5d14:b0:6ff:4a45:11de with SMTP id g20-20020a1709065d1400b006ff4a4511demr34179801ejt.576.1654766991526;
        Thu, 09 Jun 2022 02:29:51 -0700 (PDT)
Received: from prec5560.. ([176.74.57.19])
        by smtp.gmail.com with ESMTPSA id l9-20020a50cbc9000000b0042ab87ea713sm8653417edi.22.2022.06.09.02.29.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jun 2022 02:29:50 -0700 (PDT)
From:   Robert Foss <robert.foss@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        krzk+dt@kernel.org, robert.foss@linaro.org, jonathan@marek.ca,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     Rob Herring <robh@kernel.org>
Subject: [PATCH v5 5/6] dt-bindings: clock: Add Qcom SM8350 DISPCC bindings
Date:   Thu,  9 Jun 2022 11:29:39 +0200
Message-Id: <20220609092940.304740-6-robert.foss@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220609092940.304740-1-robert.foss@linaro.org>
References: <20220609092940.304740-1-robert.foss@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add sm8350 DISPCC bindings, while these bindings are similar
to the sm8x50 bindings, the way clocks are represented has changed
in ABI incompatible ways.

Signed-off-by: Robert Foss <robert.foss@linaro.org>
Reviewed-by: Rob Herring <robh@kernel.org>
---

Changes since v2
 - Add my SoB - Bjorn

Changes since v3
 - Separate from qcom,dispcc-sm8x50
 - Remove clock-names
 - Make example sm8350 based
 - Changed author to me due to size of changes

Changes since v4
 - Add RB - Rob


 .../bindings/clock/qcom,dispcc-sm8350.yaml    | 104 ++++++++++++++++++
 .../bindings/clock/qcom,dispcc-sm8x50.yaml    |   4 +-
 .../dt-bindings/clock/qcom,dispcc-sm8350.h    |   1 +
 3 files changed, 107 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,dispcc-sm8350.yaml
 create mode 120000 include/dt-bindings/clock/qcom,dispcc-sm8350.h

diff --git a/Documentation/devicetree/bindings/clock/qcom,dispcc-sm8350.yaml b/Documentation/devicetree/bindings/clock/qcom,dispcc-sm8350.yaml
new file mode 100644
index 000000000000..d7e8739cab32
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,dispcc-sm8350.yaml
@@ -0,0 +1,104 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,dispcc-sm8350.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Display Clock & Reset Controller Binding for SM8350
+
+maintainers:
+  - Robert Foss <robert.foss@linaro.org>
+
+description: |
+  Qualcomm display clock control module which supports the clocks, resets and
+  power domains on SM8350.
+
+  See also:
+    dt-bindings/clock/qcom,dispcc-sm8350.h
+
+properties:
+  compatible:
+    enum:
+      - qcom,sm8350-dispcc
+
+  clocks:
+    items:
+      - description: Board XO source
+      - description: Link clock from DP PHY
+      - description: VCO DIV clock from DP PHY
+      - description: Link clock from DPTX1 PHY
+      - description: VCO DIV clock from DPTX1 PHY
+      - description: Link clock from DPTX2 PHY
+      - description: VCO DIV clock from DPTX2 PHY
+      - description: Byte clock from DSI PHY0
+      - description: Pixel clock from DSI PHY0
+      - description: Byte clock from DSI PHY1
+      - description: Pixel clock from DSI PHY1
+      - description: Link clock from EDP PHY
+      - description: VCO DIV clock from EDP PHY
+
+  '#clock-cells':
+    const: 1
+
+  '#reset-cells':
+    const: 1
+
+  '#power-domain-cells':
+    const: 1
+
+  reg:
+    maxItems: 1
+
+  power-domains:
+    description:
+      A phandle and PM domain specifier for the MMCX power domain.
+    maxItems: 1
+
+  required-opps:
+    description:
+      A phandle to an OPP node describing required MMCX performance point.
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - '#clock-cells'
+  - '#reset-cells'
+  - '#power-domain-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,rpmh.h>
+    #include <dt-bindings/power/qcom-rpmpd.h>
+    soc {
+      #address-cells = <2>;
+      #size-cells = <2>;
+
+      clock-controller@af00000 {
+          compatible = "qcom,sm8350-dispcc";
+          reg = <0 0x0af00000 0 0x10000>;
+          clocks = <&rpmhcc RPMH_CXO_CLK>,
+                   <&dp_phy 0>,
+                   <&dp_phy 1>,
+                   <&dptx1_phy 0>,
+                   <&dptx1_phy 1>,
+                   <&dptx2_phy 0>,
+                   <&dptx2_phy 1>,
+                   <&dsi0_phy 0>,
+                   <&dsi0_phy 1>,
+                   <&dsi1_phy 0>,
+                   <&dsi1_phy 1>,
+                   <&edp_phy 0>,
+                   <&edp_phy 1>;
+
+          #clock-cells = <1>;
+          #reset-cells = <1>;
+          #power-domain-cells = <1>;
+          power-domains = <&rpmhpd SM8350_MMCX>;
+          required-opps = <&rpmhpd_opp_low_svs>;
+        };
+    };
+...
diff --git a/Documentation/devicetree/bindings/clock/qcom,dispcc-sm8x50.yaml b/Documentation/devicetree/bindings/clock/qcom,dispcc-sm8x50.yaml
index 31497677e8de..951fe2ecb7a6 100644
--- a/Documentation/devicetree/bindings/clock/qcom,dispcc-sm8x50.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,dispcc-sm8x50.yaml
@@ -4,14 +4,14 @@
 $id: http://devicetree.org/schemas/clock/qcom,dispcc-sm8x50.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Qualcomm Display Clock & Reset Controller Binding for SM8150/SM8250
+title: Qualcomm Display Clock & Reset Controller Binding for SM8150/SM8250/SM8350
 
 maintainers:
   - Jonathan Marek <jonathan@marek.ca>
 
 description: |
   Qualcomm display clock control module which supports the clocks, resets and
-  power domains on SM8150 and SM8250.
+  power domains on SM8150/SM8250.
 
   See also:
     dt-bindings/clock/qcom,dispcc-sm8150.h
diff --git a/include/dt-bindings/clock/qcom,dispcc-sm8350.h b/include/dt-bindings/clock/qcom,dispcc-sm8350.h
new file mode 120000
index 000000000000..0312b4544acb
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,dispcc-sm8350.h
@@ -0,0 +1 @@
+qcom,dispcc-sm8250.h
\ No newline at end of file
-- 
2.34.1

