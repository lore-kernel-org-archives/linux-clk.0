Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30FFBC4321E
	for <linux-clk@archiver.kernel.org>; Tue, 14 Sep 2021 03:21:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 16C6B61168
	for <linux-clk@archiver.kernel.org>; Tue, 14 Sep 2021 03:21:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238786AbhINDWV (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 13 Sep 2021 23:22:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238591AbhINDWT (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 13 Sep 2021 23:22:19 -0400
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39B9AC061760
        for <linux-clk@vger.kernel.org>; Mon, 13 Sep 2021 20:20:52 -0700 (PDT)
Received: by mail-pf1-x432.google.com with SMTP id j16so10842657pfc.2
        for <linux-clk@vger.kernel.org>; Mon, 13 Sep 2021 20:20:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=tTEiTbO1ZH85XonKLmdTYGjcvfIzkgPG2492l17rrOI=;
        b=o0Wp+y9Oc1SJtQMVmXF5bDY6z8etnwqllWaOXlatEAHh6g/e8PFaZ5snnZBs++t+oc
         rGt61Oar74qZzrkPtfF6qRGdWrsK4weJGlCy4H3WQ2Ob5CEvVMRFeOC9PCTJ3l0YU+JJ
         xs4K66GUk3C1rkGaPeA9+6kLMl9ylzRukNiKnBUHBaVWvhTsbgpN6x3zwMlCFFwNxhwR
         +BGmWYkMSGsSQGzrbcXxlCXjx0rJxg0e8fY+wYOq3i64Cs/zbiL9zJ0Trfafq9sei6Yc
         9UvVLyDk1HlWbkwhSW8M3LvOc6PzZoz8ICTi7lZZBZPZHL/9AAlEILSaqnFA2rRJM1vs
         BgFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=tTEiTbO1ZH85XonKLmdTYGjcvfIzkgPG2492l17rrOI=;
        b=AhxUeO+5QNaJYvKBeYmuq6q2tiqnZ2N1gLJ/gVjle3YNVktDFs7RFRuXc/QbMobZO7
         aNivhzULvHPCecEibucUYbcPQMSTbhOq7v3y2ihB1nMWc33duI5HUHDbXe4dmG5pYYzC
         gmveiLXY+49KpjYCyE7f5u14HBr4F8MRWsEWpT6QbpPnGhjIw5qYorQrLCVT+LB19fAT
         /Rwgd9GhBobsCLjpKvLwqh1Qyb5QCb/ZC4QfGhllpC+Oi9vELfSMgp+EVSwm8+oOPpQ+
         i1D2ZqimpTu7bjFkURIaOWWiUazFIx1phJDc8AvOaLB1rSpAuKDmbbmv7/L+HrrMbdoG
         YLbg==
X-Gm-Message-State: AOAM531ZpWTibNzvh1kTAZcBDOfll/2GTJQzTCimXm1M9XIGf/7ae5bO
        tLc1O12DCyVN0UfT+pHS2mwzBQ==
X-Google-Smtp-Source: ABdhPJxc67ZwkwMeb3rMevjY1tOcyCMODfRBsnj+wvzInM8/hFFQTju7+UhIiGnXaYQeha86SFNgYw==
X-Received: by 2002:a05:6a00:14c4:b0:412:444e:f600 with SMTP id w4-20020a056a0014c400b00412444ef600mr2488264pfu.83.1631589651751;
        Mon, 13 Sep 2021 20:20:51 -0700 (PDT)
Received: from localhost.localdomain (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id t68sm9714498pgc.59.2021.09.13.20.20.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Sep 2021 20:20:51 -0700 (PDT)
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shawn.guo@linaro.org>
Subject: [PATCH 1/2] dt-bindings: clk: qcom: Add QCM2290 Global Clock Controller bindings
Date:   Tue, 14 Sep 2021 11:20:40 +0800
Message-Id: <20210914032041.6547-2-shawn.guo@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210914032041.6547-1-shawn.guo@linaro.org>
References: <20210914032041.6547-1-shawn.guo@linaro.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

It adds device tree bindings for QCM2290 Global Clock Controller.

Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
---
 .../bindings/clock/qcom,gcc-qcm2290.yaml      | 72 +++++++++++++++++++
 1 file changed, 72 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,gcc-qcm2290.yaml

diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-qcm2290.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-qcm2290.yaml
new file mode 100644
index 000000000000..f8130d8ce259
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-qcm2290.yaml
@@ -0,0 +1,72 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,gcc-qcm2290.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Global Clock & Reset Controller Binding for QCM2290
+
+maintainers:
+  - Shawn Guo <shawn.guo@linaro.org>
+
+description: |
+  Qualcomm global clock control module which supports the clocks, resets and
+  power domains on QCM2290.
+
+  See also:
+  - dt-bindings/clock/qcom,gcc-qcm2290.h
+
+properties:
+  compatible:
+    const: qcom,gcc-qcm2290
+
+  clocks:
+    items:
+      - description: Board XO source
+      - description: Sleep clock source
+
+  clock-names:
+    items:
+      - const: bi_tcxo
+      - const: sleep_clk
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
+  protected-clocks:
+    description:
+      Protected clock specifier list as per common clock binding.
+
+required:
+  - compatible
+  - clocks
+  - clock-names
+  - reg
+  - '#clock-cells'
+  - '#reset-cells'
+  - '#power-domain-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,rpmcc.h>
+    clock-controller@1400000 {
+        compatible = "qcom,gcc-qcm2290";
+        reg = <0x01400000 0x1f0000>;
+        #clock-cells = <1>;
+        #reset-cells = <1>;
+        #power-domain-cells = <1>;
+        clock-names = "bi_tcxo", "sleep_clk";
+        clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>, <&sleep_clk>;
+    };
+...
-- 
2.17.1

