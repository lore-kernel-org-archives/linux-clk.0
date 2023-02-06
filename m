Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33B61C6379F
	for <linux-clk@archiver.kernel.org>; Mon,  6 Feb 2023 00:27:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229596AbjBFA1m (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 5 Feb 2023 19:27:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229478AbjBFA1m (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 5 Feb 2023 19:27:42 -0500
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53A9518143
        for <linux-clk@vger.kernel.org>; Sun,  5 Feb 2023 16:27:40 -0800 (PST)
Received: by mail-ej1-x636.google.com with SMTP id hx15so29771828ejc.11
        for <linux-clk@vger.kernel.org>; Sun, 05 Feb 2023 16:27:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lWJTTVfePORcPPcH6H13Fd3H36Ls8G0fdQpwh+iYVeU=;
        b=HULpsXVGKRFy+h69lzY/L1ZYutzwew53C7+pgIYNEeIeDJsMUY7bxZbtbW01I3baTm
         eFNmrrTrOWe/9b+8D95YsVYZ4LvuQMDB73UuEJsliTFpr3MKqN12u+Cx3WQUZ8vcshPj
         SMjbZlG+thtWRa7UJIYEvTTOGPiyfb2JWO1vpXVe/doVRSBsjs2XOqNr2zVZ3criO9ne
         gPNN+z9aDBbZq4G/6wf7RTf9A71lEV/N88bsJBWprpj21HKGQEIUp+BasEeOzvKW4JTC
         tct1SmqhCI2LRdyun9JwmN7Pb8MNkAzhqkX6z+c6HJvXTSTry+f9CYHGbJE6AFoGLLXA
         zxRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lWJTTVfePORcPPcH6H13Fd3H36Ls8G0fdQpwh+iYVeU=;
        b=glPymAUXoPjQObOQLE+Nzy6LWqZDpc6xFpJ9lkjgDrcTZm7iDzfn2V9JILSlYcvQxQ
         0Ha/QNElsVA9jBCNhar6ZL20GCyL7XJ0TyTLp/FaKmp9KUXkrNaEJIZRiwsjA534FCs8
         yppFWwhDmVQgFQrhTZg6EE0x/qwf+i+i/C4Gs1QOg78Ey+6bJumCYn/fg920yTsgDrhT
         aZOgQ0j7bBJ7AA/bgTRB7COjJvqg8iGRbSt1vNbahbJb9beOA2rKAV5NQPdLLDtKLb1c
         YKi0iAAtLbrhueLWPMgw7D+5GRzqdiwO/zCzlkPostcieM3JVDBnWP6tXpUk7KedSgB0
         zwDg==
X-Gm-Message-State: AO0yUKXHwE5iBxSm0erM6stSjKWeMNdrOw6ahOEUInugH8gd70Yb3aoX
        T/wtno7azPGVrusFQyPUVDYvvw==
X-Google-Smtp-Source: AK7set/n2hRRJljwHkVMRXSMpZMx6IoxKU6T9qwpJCv1uTh2yARMMOvKgJD+paX8nsKxzTILG6UZEg==
X-Received: by 2002:a17:906:4fc7:b0:87b:1be:a8c2 with SMTP id i7-20020a1709064fc700b0087b01bea8c2mr23061840ejw.73.1675643258870;
        Sun, 05 Feb 2023 16:27:38 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id y18-20020a1709063a9200b00878b89075adsm4716085ejd.51.2023.02.05.16.27.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Feb 2023 16:27:38 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, freedreno@lists.freedesktop.org,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org
Subject: [PATCH 1/8] dt-bindings: clock: Merge qcom,gpucc-sm8350 into qcom,gpucc.yaml
Date:   Mon,  6 Feb 2023 02:27:27 +0200
Message-Id: <20230206002735.2736935-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230206002735.2736935-1-dmitry.baryshkov@linaro.org>
References: <20230206002735.2736935-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The GPU clock controller bindings for the Qualcomm sm8350 platform are
not correct. The driver uses .fw_name instead of using indices to bind
parent clocks, thus demanding the clock-names usage. With the proper
clock-names in place, the bindings becomes equal to the bindings defined
by qcom,gpucc.yaml, so it is impractical to keep them in a separate
file.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../bindings/clock/qcom,gpucc-sm8350.yaml     | 71 -------------------
 .../devicetree/bindings/clock/qcom,gpucc.yaml |  2 +
 2 files changed, 2 insertions(+), 71 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/clock/qcom,gpucc-sm8350.yaml

diff --git a/Documentation/devicetree/bindings/clock/qcom,gpucc-sm8350.yaml b/Documentation/devicetree/bindings/clock/qcom,gpucc-sm8350.yaml
deleted file mode 100644
index fb7ae3d18503..000000000000
--- a/Documentation/devicetree/bindings/clock/qcom,gpucc-sm8350.yaml
+++ /dev/null
@@ -1,71 +0,0 @@
-# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
-%YAML 1.2
----
-$id: http://devicetree.org/schemas/clock/qcom,gpucc-sm8350.yaml#
-$schema: http://devicetree.org/meta-schemas/core.yaml#
-
-title: Qualcomm Graphics Clock & Reset Controller on SM8350
-
-maintainers:
-  - Robert Foss <robert.foss@linaro.org>
-
-description: |
-  Qualcomm graphics clock control module provides the clocks, resets and power
-  domains on Qualcomm SoCs.
-
-  See also:: include/dt-bindings/clock/qcom,gpucc-sm8350.h
-
-properties:
-  compatible:
-    enum:
-      - qcom,sm8350-gpucc
-
-  clocks:
-    items:
-      - description: Board XO source
-      - description: GPLL0 main branch source
-      - description: GPLL0 div branch source
-
-  '#clock-cells':
-    const: 1
-
-  '#reset-cells':
-    const: 1
-
-  '#power-domain-cells':
-    const: 1
-
-  reg:
-    maxItems: 1
-
-required:
-  - compatible
-  - reg
-  - clocks
-  - '#clock-cells'
-  - '#reset-cells'
-  - '#power-domain-cells'
-
-additionalProperties: false
-
-examples:
-  - |
-    #include <dt-bindings/clock/qcom,gcc-sm8350.h>
-    #include <dt-bindings/clock/qcom,rpmh.h>
-
-    soc {
-        #address-cells = <2>;
-        #size-cells = <2>;
-
-        clock-controller@3d90000 {
-            compatible = "qcom,sm8350-gpucc";
-            reg = <0 0x03d90000 0 0x9000>;
-            clocks = <&rpmhcc RPMH_CXO_CLK>,
-                     <&gcc GCC_GPU_GPLL0_CLK_SRC>,
-                     <&gcc GCC_GPU_GPLL0_DIV_CLK_SRC>;
-            #clock-cells = <1>;
-            #reset-cells = <1>;
-            #power-domain-cells = <1>;
-        };
-    };
-...
diff --git a/Documentation/devicetree/bindings/clock/qcom,gpucc.yaml b/Documentation/devicetree/bindings/clock/qcom,gpucc.yaml
index 7256c438a4cf..db53eb288995 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gpucc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gpucc.yaml
@@ -21,6 +21,7 @@ description: |
     include/dt-bindings/clock/qcom,gpucc-sm6350.h
     include/dt-bindings/clock/qcom,gpucc-sm8150.h
     include/dt-bindings/clock/qcom,gpucc-sm8250.h
+    include/dt-bindings/clock/qcom,gpucc-sm8350.h
 
 properties:
   compatible:
@@ -33,6 +34,7 @@ properties:
       - qcom,sm6350-gpucc
       - qcom,sm8150-gpucc
       - qcom,sm8250-gpucc
+      - qcom,sm8350-gpucc
 
   clocks:
     items:
-- 
2.39.1

