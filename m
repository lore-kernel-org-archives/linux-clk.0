Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84A58C25B6F
	for <linux-clk@archiver.kernel.org>; Thu, 26 Oct 2023 10:53:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230285AbjJZKx7 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 26 Oct 2023 06:53:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344687AbjJZKxz (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 26 Oct 2023 06:53:55 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 395931A7
        for <linux-clk@vger.kernel.org>; Thu, 26 Oct 2023 03:53:51 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-40842752c6eso6061215e9.1
        for <linux-clk@vger.kernel.org>; Thu, 26 Oct 2023 03:53:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698317629; x=1698922429; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BDj7JS/KJD1xRdPBFzxvlUHQ3OGRor14p4p7hBbICLs=;
        b=YSV/gM/FcGPN2t6Yi0liGDQpWU7g50BgrQ5/Jgr7rVEZ6dx+jdUB2yvxog2scQ5Lt+
         r5LSDryDEglwNCbbWfvimqih0efTIY4YKUOTqKcglHxln8LPk1IsoTmVomwsfwOOdPDX
         2sWNtBKWTx2VOFnWjEzq5sZzNAhG7mEJY2aswEK+w8JD1agbHk7/eq2Oegv6krtVtL8o
         ytLi/Cvp4nnyL/sMZeiwgM4TDvwNBdsHv/NGqUnwNyfe/1mV6oqt2fuWp5PvCbjFatsa
         6+InZvp7AR03TxRxx+146qMY+IpSEDyQhQxM8/AlmkB3PKb5cDx+PKkFBulOk/EXnLrr
         8UDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698317629; x=1698922429;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BDj7JS/KJD1xRdPBFzxvlUHQ3OGRor14p4p7hBbICLs=;
        b=UIzGCmuKAbr4MYk+W6rKa9IoTDX68r7bI9EBUkC+IHN9uN8VDdBGZ0L1QAGh6kAwlU
         3NKuaBRXlWgaPwECzlbJ72hI8vlq18+r4/3eJK1qbh3GTwyMLZx+AGaBdYvRLOezlRvJ
         5Z1SBtJAEdSYlbTYCNRBSvCbVgzNdOMWvri1W22fnXKXfyy3rPCwsQDli2e4n7ihhGZg
         Z6qTHlz0//t87l3jMLMXeJd/CJMasunD88T9jR3I/M1h4zDQIuqUWh36fXHBi0lg8nqf
         EAX0yHAgt+ee8MqUyKpi7LiMbhaNQfqlh8raM/caLc63hYDMAQI2wG49noOZsGQ0XZmA
         cGdA==
X-Gm-Message-State: AOJu0Yyq+yDoMllecgErpSrpQ/rTl8ll6WFXJyUS+5yNlMLPlqtwfD0l
        nmb4dBVZQN2WBM9YOV052kWCAQ==
X-Google-Smtp-Source: AGHT+IHg86AqIDR3iWFEr0ApFxGrIU4Olk5tVVMANvLAAQcNM3Xo1BxG42iyimObE20CH3iy12686w==
X-Received: by 2002:a05:600c:a01:b0:406:53c0:3c71 with SMTP id z1-20020a05600c0a0100b0040653c03c71mr14626167wmp.37.1698317629647;
        Thu, 26 Oct 2023 03:53:49 -0700 (PDT)
Received: from x13s-linux.nxsw.local ([37.228.218.3])
        by smtp.gmail.com with ESMTPSA id y9-20020a7bcd89000000b00407efbc4361sm2239465wmj.9.2023.10.26.03.53.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Oct 2023 03:53:49 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     andersson@kernel.org, agross@kernel.org, konrad.dybcio@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org,
        dmitry.baryshkov@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        jonathan@marek.ca, quic_tdas@quicinc.com,
        vladimir.zapolskiy@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        bryan.odonoghue@linaro.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [RESEND PATCH v4 1/4] dt-bindings: clock: Use gcc.yaml for common clock properties
Date:   Thu, 26 Oct 2023 11:53:42 +0100
Message-Id: <20231026105345.3376-2-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231026105345.3376-1-bryan.odonoghue@linaro.org>
References: <20231026105345.3376-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Various of the camcc bindings are repeated serially. We can use
qcom,gcc.yaml to encapsulate the generic repeated patterns.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/clock/qcom,camcc-sm8250.yaml      | 18 ++++--------------
 .../bindings/clock/qcom,sc7180-camcc.yaml      | 18 ++++--------------
 .../bindings/clock/qcom,sc7280-camcc.yaml      | 18 ++++--------------
 .../bindings/clock/qcom,sdm845-camcc.yaml      | 18 ++++--------------
 .../bindings/clock/qcom,sm8450-camcc.yaml      | 18 ++++--------------
 5 files changed, 20 insertions(+), 70 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,camcc-sm8250.yaml b/Documentation/devicetree/bindings/clock/qcom,camcc-sm8250.yaml
index 426335a2841c..3fd3dc1069fb 100644
--- a/Documentation/devicetree/bindings/clock/qcom,camcc-sm8250.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,camcc-sm8250.yaml
@@ -15,6 +15,9 @@ description: |
 
   See also:: include/dt-bindings/clock/qcom,camcc-sm8250.h
 
+allOf:
+  - $ref: qcom,gcc.yaml#
+
 properties:
   compatible:
     const: qcom,sm8250-camcc
@@ -33,15 +36,6 @@ properties:
       - const: bi_tcxo_ao
       - const: sleep_clk
 
-  '#clock-cells':
-    const: 1
-
-  '#reset-cells':
-    const: 1
-
-  '#power-domain-cells':
-    const: 1
-
   power-domains:
     items:
       - description: MMCX power domain
@@ -56,14 +50,10 @@ properties:
 
 required:
   - compatible
-  - reg
   - clocks
   - clock-names
-  - '#clock-cells'
-  - '#reset-cells'
-  - '#power-domain-cells'
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/clock/qcom,sc7180-camcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sc7180-camcc.yaml
index 2dfc2a4f1918..c7fe6400ea13 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sc7180-camcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sc7180-camcc.yaml
@@ -15,6 +15,9 @@ description: |
 
   See also:: include/dt-bindings/clock/qcom,camcc-sc7180.h
 
+allOf:
+  - $ref: qcom,gcc.yaml#
+
 properties:
   compatible:
     const: qcom,sc7180-camcc
@@ -31,28 +34,15 @@ properties:
       - const: iface
       - const: xo
 
-  '#clock-cells':
-    const: 1
-
-  '#reset-cells':
-    const: 1
-
-  '#power-domain-cells':
-    const: 1
-
   reg:
     maxItems: 1
 
 required:
   - compatible
-  - reg
   - clocks
   - clock-names
-  - '#clock-cells'
-  - '#reset-cells'
-  - '#power-domain-cells'
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/clock/qcom,sc7280-camcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sc7280-camcc.yaml
index 01feef1cab0a..dcef8de3a905 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sc7280-camcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sc7280-camcc.yaml
@@ -15,6 +15,9 @@ description: |
 
   See also:: include/dt-bindings/clock/qcom,camcc-sc7280.h
 
+allOf:
+  - $ref: qcom,gcc.yaml#
+
 properties:
   compatible:
     const: qcom,sc7280-camcc
@@ -31,28 +34,15 @@ properties:
       - const: bi_tcxo_ao
       - const: sleep_clk
 
-  '#clock-cells':
-    const: 1
-
-  '#reset-cells':
-    const: 1
-
-  '#power-domain-cells':
-    const: 1
-
   reg:
     maxItems: 1
 
 required:
   - compatible
-  - reg
   - clocks
   - clock-names
-  - '#clock-cells'
-  - '#reset-cells'
-  - '#power-domain-cells'
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/clock/qcom,sdm845-camcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sdm845-camcc.yaml
index 91d1f7918037..810b852ae371 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sdm845-camcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sdm845-camcc.yaml
@@ -15,6 +15,9 @@ description: |
 
   See also:: include/dt-bindings/clock/qcom,camcc-sm845.h
 
+allOf:
+  - $ref: qcom,gcc.yaml#
+
 properties:
   compatible:
     const: qcom,sdm845-camcc
@@ -27,28 +30,15 @@ properties:
     items:
       - const: bi_tcxo
 
-  '#clock-cells':
-    const: 1
-
-  '#reset-cells':
-    const: 1
-
-  '#power-domain-cells':
-    const: 1
-
   reg:
     maxItems: 1
 
 required:
   - compatible
-  - reg
   - clocks
   - clock-names
-  - '#clock-cells'
-  - '#reset-cells'
-  - '#power-domain-cells'
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
index dc3c18e4ead7..6915498deacf 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
@@ -17,6 +17,9 @@ description: |
     include/dt-bindings/clock/qcom,sm8450-camcc.h
     include/dt-bindings/clock/qcom,sm8550-camcc.h
 
+allOf:
+  - $ref: qcom,gcc.yaml#
+
 properties:
   compatible:
     enum:
@@ -40,29 +43,16 @@ properties:
     description:
       A phandle to an OPP node describing required MMCX performance point.
 
-  '#clock-cells':
-    const: 1
-
-  '#reset-cells':
-    const: 1
-
-  '#power-domain-cells':
-    const: 1
-
   reg:
     maxItems: 1
 
 required:
   - compatible
-  - reg
   - clocks
   - power-domains
   - required-opps
-  - '#clock-cells'
-  - '#reset-cells'
-  - '#power-domain-cells'
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
-- 
2.40.1

