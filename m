Return-Path: <SRS0=ceW6=AO=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 605D4C433E1
	for <linux-clk@archiver.kernel.org>; Fri,  3 Jul 2020 08:44:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3EFEA20870
	for <linux-clk@archiver.kernel.org>; Fri,  3 Jul 2020 08:44:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aw1ohUsB"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725779AbgGCIog (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 3 Jul 2020 04:44:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725972AbgGCIog (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 3 Jul 2020 04:44:36 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FE46C08C5DD
        for <linux-clk@vger.kernel.org>; Fri,  3 Jul 2020 01:44:36 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id f139so33250912wmf.5
        for <linux-clk@vger.kernel.org>; Fri, 03 Jul 2020 01:44:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=EnE6Ie1AshEC9kkSkD1phqKDaIW4ZsPLXsjnuMEgDU4=;
        b=aw1ohUsBoxDniIyHNA7v9rnOKSNC66sjlVpOBM5APjRG6gPP9i9mIa341pwrvaLg4c
         j0R6Tn7xEcRao5qhNSmg6FSwQQrxxEdzl5dbI0lXVMLmFRklohnafoWqhI/tFYAJYvRO
         ExBwhDJMvblHQDUUqgVG1xN2i4T0iiLGXJdWd3k+9CIMMLUclDFwJYhEK/KrRr402XN3
         rE+LaYWyl+Ho3w2nVfZTLc0Gj54XoSR6rE5N67g3VIkZMJ4pdG4/XRUIwzID7U/0tnqv
         L9WV+RFdSoUKXLYobGtfzYb+xjwm9ROcv/44pZHSuQGcFlRD35YCasG2NvRzLHjKg6bO
         AlvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=EnE6Ie1AshEC9kkSkD1phqKDaIW4ZsPLXsjnuMEgDU4=;
        b=uXjek7WZReUv6GPCWLFhf71V/FToHagB6gbrPzJ9Hu+zoIVhOSjEKOLV9dMq1K2ZVO
         EEsSAsrtIYaJbOi/3+PalVRig1/H5NJGZrMpEkOFODSZC/d1aoNcns8hZ2g97JchPYa4
         ZfmkKcev0AW4o76un3iJZotlA7teaURZvLjMH0gHFO4jLC8xIkmehCCl42r5c65eR/1m
         fojqTsqa3n9014+23NCtbmEBP7+6/yGhE3PHTfv3z3e7/rhhIaXE5dHK0kvHnqfvg2wb
         ZO2IVL2ai/I2HXUBiDhFtMffNF013NFBTQZ+c0eD77ete3xeaQfEq4BqPlwZHdrq+z2E
         g+4Q==
X-Gm-Message-State: AOAM531GkoNgN31Xa2KvOzsCpRYPZiy5QzBA4z6nmljH5U9lJ2OBV+e8
        PYOjyebxzwR8OkIVHHViXl0XJDaNg47chA==
X-Google-Smtp-Source: ABdhPJzHaGuRIryFRfqDYj/1ac3PdTPEdE2FmP9y5RQ8kfQ08roaBOYWoRuACMf9TgqTfaMZpACkBw==
X-Received: by 2002:a1c:e209:: with SMTP id z9mr36019759wmg.153.1593765874676;
        Fri, 03 Jul 2020 01:44:34 -0700 (PDT)
Received: from localhost.localdomain ([88.122.66.28])
        by smtp.gmail.com with ESMTPSA id b18sm4213116wrs.46.2020.07.03.01.44.33
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 03 Jul 2020 01:44:34 -0700 (PDT)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     sboyd@kernel.org, bjorn.andersson@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        amit.kucheria@linaro.org, Ilia Lin <ilialin@codeaurora.org>
Subject: [PATCH v5 3/5] dt-bindings: clk: qcom: Add bindings for CPU clock for msm8996
Date:   Fri,  3 Jul 2020 10:49:43 +0200
Message-Id: <1593766185-16346-4-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1593766185-16346-1-git-send-email-loic.poulain@linaro.org>
References: <1593766185-16346-1-git-send-email-loic.poulain@linaro.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Ilia Lin <ilialin@codeaurora.org>

Each of the CPU clusters (Power and Perf) on msm8996 are
clocked via 2 PLLs, a primary and alternate. There are also
2 Mux'es, a primary and secondary all connected together
as shown below

                             +-------+
              XO             |       |
          +------------------>0      |
                             |       |
                   PLL/2     | SMUX  +----+
                     +------->1      |    |
                     |       |       |    |
                     |       +-------+    |    +-------+
                     |                    +---->0      |
                     |                         |       |
+---------------+    |             +----------->1      | CPU clk
|Primary PLL    +----+ PLL_EARLY   |           |       +------>
|               +------+-----------+    +------>2 PMUX |
+---------------+      |                |      |       |
                       |   +------+     |   +-->3      |
                       +--^+  ACD +-----+   |  +-------+
+---------------+          +------+         |
|Alt PLL        |                           |
|               +---------------------------+
+---------------+         PLL_EARLY

The primary PLL is what drives the CPU clk, except for times
when we are reprogramming the PLL itself (for rate changes) when
we temporarily switch to an alternate PLL. A subsequent patch adds
support to switch between primary and alternate PLL during rate
changes.

The primary PLL operates on a single VCO range, between 600MHz
and 3GHz. However the CPUs do support OPPs with frequencies
between 300MHz and 600MHz. In order to support running the CPUs
at those frequencies we end up having to lock the PLL at twice
the rate and drive the CPU clk via the PLL/2 output and SMUX.

Signed-off-by: Ilia Lin <ilialin@codeaurora.org>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../bindings/clock/qcom,msm8996-apcc.yaml          | 56 ++++++++++++++++++++++
 1 file changed, 56 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,msm8996-apcc.yaml

diff --git a/Documentation/devicetree/bindings/clock/qcom,msm8996-apcc.yaml b/Documentation/devicetree/bindings/clock/qcom,msm8996-apcc.yaml
new file mode 100644
index 0000000..d673ede
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,msm8996-apcc.yaml
@@ -0,0 +1,56 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,kryocc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm clock controller for MSM8996 CPUs
+
+maintainers:
+  - Loic Poulain <loic.poulain@linaro.org>
+
+description: |
+  Qualcomm CPU clock controller for MSM8996 CPUs, clock 0 is for Power cluster
+  and clock 1 is for Perf cluster.
+
+properties:
+  compatible:
+    enum:
+      - qcom,msm8996-apcc
+
+  reg:
+    maxItems: 1
+
+  '#clock-cells':
+    const: 1
+
+  clocks:
+    items:
+      - description: Primary PLL clock for power cluster (little)
+      - description: Primary PLL clock for perf cluster (big)
+      - description: Alternate PLL clock for power cluster (little)
+      - description: Alternate PLL clock for perf cluster (big)
+
+  clock-names:
+    items:
+      - const: pwrcl_pll
+      - const: perfcl_pll
+      - const: pwrcl_alt_pll
+      - const: perfcl_alt_pll
+
+required:
+  - compatible
+  - reg
+  - '#clock-cells'
+
+additionalProperties: false
+
+examples:
+  # Example for msm8996
+  - |
+    kryocc: clock-controller@6400000 {
+        compatible = "qcom,msm8996-apcc";
+        reg = <0x6400000 0x90000>;
+        #clock-cells = <1>;
+  };
+...
-- 
2.7.4

