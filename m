Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8262FC43331
	for <linux-clk@archiver.kernel.org>; Mon,  4 Jan 2021 08:13:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 54C5120784
	for <linux-clk@archiver.kernel.org>; Mon,  4 Jan 2021 08:13:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726333AbhADINQ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 4 Jan 2021 03:13:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726196AbhADINP (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 4 Jan 2021 03:13:15 -0500
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8955C0617A7
        for <linux-clk@vger.kernel.org>; Mon,  4 Jan 2021 00:11:53 -0800 (PST)
Received: by mail-pj1-x102e.google.com with SMTP id z12so9645468pjn.1
        for <linux-clk@vger.kernel.org>; Mon, 04 Jan 2021 00:11:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SajeAnD/bM3T+Qtfi1lyQyoeSgIHCjSTfGa4G04tdEU=;
        b=d57p44xYkAfTKPD/W6X3/fJl0rjkV7I2LaLHztAPAVpf/QB99QozubH7hoAP5v9Co6
         xjNWgCneY25yaMLkAWcJOI/7qictDJPROg78bCyW0Kw4PCI9vCS7mlqbGnlcEPytpyQ8
         +eDAPxw9av0lUcETEduC/NziZeHr8HCRnoK1CGaREsg/+CdBAITprxPQM5z7Wm5icYEL
         IliejGJ6DaP0vRdwapwweIdCN87ePnTs9zNUijeF6H4rNy387VRCmOO6fxT0uWCYBMxq
         VWxVdi1XtOjyVZN7UBJtrgFb8+GRqbFXba+t2Hn+zpRb9QwAWsaDcV/YRoZ4yyw2jS84
         m7zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SajeAnD/bM3T+Qtfi1lyQyoeSgIHCjSTfGa4G04tdEU=;
        b=XjzCy7UoyhORD9hNysfIKKzXo2WWKS43/OXPRiESoyIe754lC635iQcLTIU5Tmx6J1
         48jDJDAKwUiI/dSr8Afw5aXZsItSMXlyedh1wqDllakTi9hNQdnG//i5FX+hbyzI7ej5
         mxqtzWN8oNn9DQVdDcWry7P2mtBUWjTt21gb2wtwbCuW16Eb9LVS31C9gkX3vkYVcd/O
         FstQRSXU09f4A1V6Wj+cf2z39GsW40qt3bkux8pF6/y18KhC3Gii/xC3tLyo0j3+wXNl
         KJcKb+WaBW26iPhLLSkUgV1//xV+4gU+M96j/wyx1YFV8ACmchnqguaAjw02th5z3hC3
         rYoA==
X-Gm-Message-State: AOAM531Bqp/MukRv1TqOK+SlUTXN1fsiqJgVvTBWueoratpjmK1Ojwkm
        IOJyx5hgQ5VRYwdeWdotQyqC
X-Google-Smtp-Source: ABdhPJxF5ORVTpxCWmZAbSGJk5tsy+dsR2IJF1AKqZAjyimmP80KE4lWYbJvVOQaAqNu7bprN0TOWQ==
X-Received: by 2002:a17:90b:68e:: with SMTP id m14mr28507675pjz.228.1609747913323;
        Mon, 04 Jan 2021 00:11:53 -0800 (PST)
Received: from localhost.localdomain ([103.77.37.160])
        by smtp.gmail.com with ESMTPSA id n7sm55051339pfn.141.2021.01.04.00.11.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Jan 2021 00:11:52 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        jassisinghbrar@gmail.com
Cc:     viresh.kumar@linaro.org, ulf.hansson@linaro.org,
        bjorn.andersson@linaro.org, agross@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 3/5] dt-bindings: clock: Add Qualcomm A7 PLL binding
Date:   Mon,  4 Jan 2021 13:41:23 +0530
Message-Id: <20210104081125.147300-4-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210104081125.147300-1-manivannan.sadhasivam@linaro.org>
References: <20210104081125.147300-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add devicetree YAML binding for Cortex A7 PLL clock in Qualcomm
platforms like SDX55.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 .../devicetree/bindings/clock/qcom,a7pll.yaml | 51 +++++++++++++++++++
 1 file changed, 51 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,a7pll.yaml

diff --git a/Documentation/devicetree/bindings/clock/qcom,a7pll.yaml b/Documentation/devicetree/bindings/clock/qcom,a7pll.yaml
new file mode 100644
index 000000000000..8666e995725f
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,a7pll.yaml
@@ -0,0 +1,51 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,a7pll.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm A7 PLL Binding
+
+maintainers:
+  - Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
+
+description:
+  The A7 PLL on the Qualcomm platforms like SDX55 is used to provide high
+  frequency clock to the CPU.
+
+properties:
+  compatible:
+    enum:
+      - qcom,sdx55-a7pll
+
+  reg:
+    maxItems: 1
+
+  '#clock-cells':
+    const: 0
+
+  clocks:
+    items:
+      - description: board XO clock
+
+  clock-names:
+    items:
+      - const: bi_tcxo
+
+required:
+  - compatible
+  - reg
+  - '#clock-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,rpmh.h>
+    a7pll: clock@17808000 {
+        compatible = "qcom,sdx55-a7pll";
+        reg = <0x17808000 0x1000>;
+        clocks = <&rpmhcc RPMH_CXO_CLK>;
+        clock-names = "bi_tcxo";
+        #clock-cells = <0>;
+    };
-- 
2.25.1

