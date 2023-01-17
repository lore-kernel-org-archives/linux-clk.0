Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABEDCC00A5A
	for <linux-clk@archiver.kernel.org>; Tue, 17 Jan 2023 23:49:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229672AbjAQXth (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 17 Jan 2023 18:49:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229653AbjAQXtW (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 17 Jan 2023 18:49:22 -0500
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2E985A832
        for <linux-clk@vger.kernel.org>; Tue, 17 Jan 2023 14:58:28 -0800 (PST)
Received: by mail-ej1-x62a.google.com with SMTP id v6so36045477ejg.6
        for <linux-clk@vger.kernel.org>; Tue, 17 Jan 2023 14:58:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s5Lzcx0fJxtEDkCaBCMtJ7mRYNNcSf6f07GA2/uTqDs=;
        b=Zr4w4nVMMtvWTcpg0iM5F5yCsBnVkQBNiUguu8xDa1cLtTotHF7m/Lt0zqx1xUUM2V
         feJd9Ca+rvROxgGFIIealIG28A2A11bkBA4ML1koXbyS8MfJU5umSmfVbcVEWzfenRtd
         mcwt/7siCgDlUJXvRvIbgeQrfuxrwLNMA9/HpQ6oT1sao5Clrdskmz62GbtcjfkJarq+
         keOIYxglBEH4k8f1owiBDekKfl0pzLq/cpYU67Yjg98LimsPxDhec+2ggxlIbm7qy2Q6
         v5aHQfFfxXbERknNDXJIrr4xMoXit5kvk7P35TIYNDfn2nybsjl+KOQTG45ELGqGrwU7
         wuUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s5Lzcx0fJxtEDkCaBCMtJ7mRYNNcSf6f07GA2/uTqDs=;
        b=LBv9TikWPzNuJtw5suai8X+8ScPZ/1CQhDEGfFPukSLHQfotiDmi5TW3PsGu66yP09
         WzeWcDpCzx3Z6KCZd0dEgyVyfwD4fyGgJMHiTwCtyn8Y6O+byjbCKo418IPgdT/x6XK8
         WDF4X7ieyJXOWgnL0DfXRjLVGBrGcQAapWLYhudPiHVepMSPaTmyrTlH+kM/kWbDky32
         5TSvQhHFgp6EZR9WQ18VxlZPF95pZYw9VoZT817kNmVCmVRuqxpsxWaF9ytPFwrmZX7T
         9QmxGlXV8m1nTFr0/N8JgCBvqr9lUPphpQNN54gsHkTc7KEfFC2A0hhRojIFBHzAofKv
         1zgw==
X-Gm-Message-State: AFqh2kotEWHs8p0oCKlBA+gMN5SatzKYmXpZCNtl7EdwdQOjnBIALxTN
        CI7U/pKt7rZsYqdK1QX5RSRkAg==
X-Google-Smtp-Source: AMrXdXtKG0rc3R0O2XxhncWgtAKql+1W27lAbZJnSusuJ0uKqYMbM1Uy8CAxnAoCA1MmxggGakxpxQ==
X-Received: by 2002:a17:907:20e9:b0:7c0:dcc2:e7b1 with SMTP id rh9-20020a17090720e900b007c0dcc2e7b1mr4803208ejb.43.1673996307311;
        Tue, 17 Jan 2023 14:58:27 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id t1-20020a1709061be100b0086f40238403sm3919762ejg.223.2023.01.17.14.58.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jan 2023 14:58:26 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v2 1/7] dt-bindings: clock: qcom,msm8996-cbf: Describe the MSM8996 CBF clock controller
Date:   Wed, 18 Jan 2023 00:58:18 +0200
Message-Id: <20230117225824.1552604-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230117225824.1552604-1-dmitry.baryshkov@linaro.org>
References: <20230117225824.1552604-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

MSM8996 Core Bus Fabric (CBF) clock controller clocks an interconnect
between two CPU clusters. The CBF clock should follow the CPU
frequencies to provide enough bandwidth between clusters. Thus a single
driver implements both a clock and an interconnect to set the clock
rate.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../bindings/clock/qcom,msm8996-cbf.yaml      | 53 +++++++++++++++++++
 1 file changed, 53 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,msm8996-cbf.yaml

diff --git a/Documentation/devicetree/bindings/clock/qcom,msm8996-cbf.yaml b/Documentation/devicetree/bindings/clock/qcom,msm8996-cbf.yaml
new file mode 100644
index 000000000000..3ffe69d8cdd5
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,msm8996-cbf.yaml
@@ -0,0 +1,53 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,msm8996-cbf.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm MSM8996 Core Bus Fabric (CBF) clock controller
+
+maintainers:
+  - Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
+
+description: >
+  The clock controller for the Qualcomm MSM8996 CBF clock, which drives the
+  interconnect between two CPU clusters.
+
+properties:
+  compatible:
+    const: qcom,msm8996-cbf
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: XO source
+      - description: SYS APCS AUX clock
+
+  '#clock-cells':
+    const: 0
+
+  '#interconnect-cells':
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - '#clock-cells'
+  - '#interconnect-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,rpmcc.h>
+    clock-controller@9a11000 {
+        compatible = "qcom,msm8996-cbf";
+        reg = <0x09a11000 0x10000>;
+        clocks = <&rpmcc RPM_SMD_BB_CLK1>, <&apcs_glb>;
+        #clock-cells = <0>;
+        #interconnect-cells = <1>;
+    };
+...
-- 
2.39.0

