Return-Path: <SRS0=CvJ6=AN=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5538EC433E1
	for <linux-clk@archiver.kernel.org>; Thu,  2 Jul 2020 13:11:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 311312088E
	for <linux-clk@archiver.kernel.org>; Thu,  2 Jul 2020 13:11:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BXu8hz25"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729160AbgGBNLl (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 2 Jul 2020 09:11:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729130AbgGBNLk (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 2 Jul 2020 09:11:40 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F126AC08C5C1
        for <linux-clk@vger.kernel.org>; Thu,  2 Jul 2020 06:11:39 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id q5so28254434wru.6
        for <linux-clk@vger.kernel.org>; Thu, 02 Jul 2020 06:11:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=EnE6Ie1AshEC9kkSkD1phqKDaIW4ZsPLXsjnuMEgDU4=;
        b=BXu8hz25gT5G985voNGeYy+cgczub1sCFo7B/Ngd3OUvmOzor66TRNgX7/VvwgB48y
         FMG7f7Dc+Pr5Qxpb6pGw+qJGn/yNvfXQHp+mzx1pAjeYk3L5kj0QYV5B/DDAMqhXnH8C
         /YpRsMtLbfaKYu1AzO2rdSxNQ+OBuWDg2kocVrHa/LVdmP2JwOG52hOVJutYVa1j1l2X
         VW5PkdPW5SAK6/qVG+9ADurmBbkHPar21TXl37bKwuFGGzsBMeG7Bxr62js1mOBX+tkF
         aPmoPphO1EIyaAiReLwgvI49S0T8qgV+Oj2sOGTOkSQzAqhalfet7K6mxLaJF99sOG9+
         P7wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=EnE6Ie1AshEC9kkSkD1phqKDaIW4ZsPLXsjnuMEgDU4=;
        b=KJp9SzA+uAd2UD0pVPZEs9/FJs5WrDByAD/3VkffLWdpEtqCp5/7ajuRnOjMmlsL2y
         HEflK4FJgDp4kNtPmHN7ctmeJWjJ/l7cXFMypzWqX3HgMfzCDtbYS/tvzp9LjLrt5lfZ
         ip9BvTPcFuPxKImitCbgAZzkb7gP6vJKMiQCYkI/u2GnJuiOWmOaHt2g4Sa4GDiYv5C7
         Yoe8M1FT5Xb3pZrHJWzcRXR7KF0JlP+4hDO/l/hqpsMq25EYMl9JBqGy4lHEM7LYKu1y
         By5gWuI2uHeBb0dDCGqynUMc7/XWr55ITtmJSEZhpYrVDw1w9EVmddxo1zEW/QqcoeFt
         gMnw==
X-Gm-Message-State: AOAM530yXzGgwb0drZ/a0Vae7BmGbTnJ2YrygYdvrR7xvi+96uid5W0v
        fduSSid5ljoBX7WVo/EXVpWYiw==
X-Google-Smtp-Source: ABdhPJyzclgViPZl8GySh2y2zRcD0rt/VTTcu0jnrsho4918md/oZF7g9BA8Wg66sptEOMfmIgYC0w==
X-Received: by 2002:a5d:4b41:: with SMTP id w1mr32613505wrs.27.1593695498712;
        Thu, 02 Jul 2020 06:11:38 -0700 (PDT)
Received: from localhost.localdomain ([88.122.66.28])
        by smtp.gmail.com with ESMTPSA id 140sm5977248wmb.15.2020.07.02.06.11.37
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 02 Jul 2020 06:11:38 -0700 (PDT)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     sboyd@kernel.org, bjorn.andersson@linaro.org
Cc:     mturquette@baylibre.com, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, amit.kucheria@linaro.org,
        Ilia Lin <ilialin@codeaurora.org>
Subject: [PATCH v4 3/4] dt-bindings: clk: qcom: Add bindings for CPU clock for msm8996
Date:   Thu,  2 Jul 2020 15:16:01 +0200
Message-Id: <1593695762-19823-5-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1593695762-19823-1-git-send-email-loic.poulain@linaro.org>
References: <1593695762-19823-1-git-send-email-loic.poulain@linaro.org>
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

