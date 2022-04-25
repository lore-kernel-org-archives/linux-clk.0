Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDDDCC4332F
	for <linux-clk@archiver.kernel.org>; Mon, 25 Apr 2022 20:40:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245614AbiDYUnR (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 25 Apr 2022 16:43:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245610AbiDYUnP (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 25 Apr 2022 16:43:15 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3E283B2A5
        for <linux-clk@vger.kernel.org>; Mon, 25 Apr 2022 13:40:08 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id g23so12874802edy.13
        for <linux-clk@vger.kernel.org>; Mon, 25 Apr 2022 13:40:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=sOsTp5aBXIqdnMkOZufs6chxOiba6BGNfqJDs66Y7sI=;
        b=MSRbdZgI3MdaTlyTtZgN60FdjSiXxhCkh0699Cbv5rxL/1i4+FUzFrqusDaKqWlXjx
         AgBYJ3ZImI9jT1Ay9JJ2LIQudwdhji3zZWpY5A9HWzvwGCwvvkILSqMw2CcV3g8uhnsY
         SNVCPNeJQgwrTXWlXpHV3C7xeSzcEdsVw4wBH3OY8fetyFfYXWEZE1SBIJ5JTt4n8e5w
         RWf4uF7KxTyl0AuyMn5RsO3DZcomVKMZRxBHu87j+5EXeifNdc+2jfmSSyCTxR8KDXkL
         meLhkQNTpjx7PdFlIEPTMpxwn+aRS7R/lFBjTtBfbgACuuv5rWvR9qKEBlpjiYz8GQoz
         MAaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=sOsTp5aBXIqdnMkOZufs6chxOiba6BGNfqJDs66Y7sI=;
        b=BZSytXKtIM6hrA03k3puO/Xf9Pw4AtWUbzci6g7b5Ikv7b0LriGSn4iTnoYCkt04CL
         mHU3g9140RB5555f8J2GLVClyWL2cWth3+sl1yRkc6NrdIz/yvW3MVqP8Okni4dQvNe5
         ILnduyCQTSZNJY44AkKIvdSXNukSwygD4dOKmWXIa62DIqCBWqb3cDunsD8/Suj3lmOm
         rLfxvVX5aDTgbjZqA8gMBAJWtcbjvzI4W8psdsS/FMscm+/RsuX/e9yfK5OWZD7F6DyF
         VRHYPn1rf+9pFPTT0A+QGPWS08VzRUeWQxUZbBW4sL7HR58QIAgdzRnRAlTWM2sXMqYZ
         dgjw==
X-Gm-Message-State: AOAM533DyLhoFNqAKwMbDkA0D1rHV8oOyf3AqL0Pr0ZGFBcuKlU529bW
        mgPJ+Iak71o6XcHZapzm4ucR4A==
X-Google-Smtp-Source: ABdhPJzcBeQI2OUItvPLc2iaIO48nqrQvXbe2W1iE7on1AFBKVTxymAxNKJLV2vEc1rSfD1SGMYt7w==
X-Received: by 2002:a05:6402:1a36:b0:425:f96c:350f with SMTP id be22-20020a0564021a3600b00425f96c350fmr560924edb.160.1650919207297;
        Mon, 25 Apr 2022 13:40:07 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id mb22-20020a170906eb1600b006f38dcf211bsm1834037ejb.138.2022.04.25.13.40.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Apr 2022 13:40:06 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <tdas@codeaurora.org>,
        Ansuel Smith <ansuelsmth@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH] dt-bindings: clock: qcom,gcc-apq8064: Fix typo in compatible and split apq8084
Date:   Mon, 25 Apr 2022 22:40:01 +0200
Message-Id: <20220425204001.710238-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The qcom,gcc-apq8064.yaml was meant to describe only APQ8064 and APQ8084
should have slightly different bindings (without Qualcomm thermal sensor
device).

Fixes: a469bf89a009 ("dt-bindings: clock: simplify qcom,gcc-apq8064 Documentation")
Reported-by: Rob Herring <robh@kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/clock/qcom,gcc-apq8064.yaml      |  4 +-
 .../bindings/clock/qcom,gcc-apq8084.yaml      | 42 +++++++++++++++++++
 2 files changed, 43 insertions(+), 3 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,gcc-apq8084.yaml

diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-apq8064.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-apq8064.yaml
index 97936411b6b4..9fafcb080069 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc-apq8064.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-apq8064.yaml
@@ -20,12 +20,10 @@ description: |
   See also:
   - dt-bindings/clock/qcom,gcc-msm8960.h
   - dt-bindings/reset/qcom,gcc-msm8960.h
-  - dt-bindings/clock/qcom,gcc-apq8084.h
-  - dt-bindings/reset/qcom,gcc-apq8084.h
 
 properties:
   compatible:
-    const: qcom,gcc-apq8084
+    const: qcom,gcc-apq8064
 
   nvmem-cells:
     minItems: 1
diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-apq8084.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-apq8084.yaml
new file mode 100644
index 000000000000..63d08e82b3d8
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-apq8084.yaml
@@ -0,0 +1,42 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,gcc-apq8084.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Global Clock & Reset Controller Binding for APQ8084
+
+maintainers:
+  - Stephen Boyd <sboyd@kernel.org>
+  - Taniya Das <tdas@codeaurora.org>
+
+description: |
+  Qualcomm global clock control module which supports the clocks, resets and
+  power domains on APQ8064/APQ8084.
+
+  See also::
+  - dt-bindings/clock/qcom,gcc-apq8084.h
+  - dt-bindings/reset/qcom,gcc-apq8084.h
+
+allOf:
+  - $ref: qcom,gcc.yaml#
+
+properties:
+  compatible:
+    const: qcom,gcc-apq8084
+
+required:
+  - compatible
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    clock-controller@fc400000 {
+        compatible = "qcom,gcc-apq8084";
+        reg = <0xfc400000 0x4000>;
+        #clock-cells = <1>;
+        #reset-cells = <1>;
+        #power-domain-cells = <1>;
+    };
+...
-- 
2.32.0

