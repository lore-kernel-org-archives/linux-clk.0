Return-Path: <SRS0=d3cq=7R=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9CFEC433E0
	for <linux-clk@archiver.kernel.org>; Thu,  4 Jun 2020 10:30:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 99487206C3
	for <linux-clk@archiver.kernel.org>; Thu,  4 Jun 2020 10:30:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jBizKfXG"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728248AbgFDKat (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 4 Jun 2020 06:30:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728198AbgFDKas (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 4 Jun 2020 06:30:48 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A72FFC03E97D
        for <linux-clk@vger.kernel.org>; Thu,  4 Jun 2020 03:30:48 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id l26so4700008wme.3
        for <linux-clk@vger.kernel.org>; Thu, 04 Jun 2020 03:30:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=EnE6Ie1AshEC9kkSkD1phqKDaIW4ZsPLXsjnuMEgDU4=;
        b=jBizKfXGFsVhxlXHSyDkCBLeLIedcrJGvN/Y8OM6vZqR3G0W3xMJUBxxTuKYvZgYtC
         uz3nMvrRhmICru+Hj7jwijXFimlBe6LxUwiS6lxmxcFF8PUnEz3ntsUWh/Vin9+NeeDM
         M3D4Y/hjo8sKwspaol12gYZl/BPNlHMNyZ90M+wFkOHB9oixDoO1LsRj9OV9Hu06o2zS
         r6gNDlqfSrq+3Yu09o9sAose6ytGpobi7ZrKhcBTx4IjQWpOLtEwuMa+s0ow3Mq0bl7L
         A1oI5hcJEOkmeoNp0hyoiBAixDf1V2HJZVMM7ki2U7A5cTlgwNhi33MeVRey91biZll3
         XufA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=EnE6Ie1AshEC9kkSkD1phqKDaIW4ZsPLXsjnuMEgDU4=;
        b=Nm1Jjlv9SHezU2aYn4XxRMu8nW0bdjXcFwXy5tL6DTWBfHQffiX281DsFM429S8v6u
         zTg7ZAmLbtYVmKGY5WLFrFIKp79XyWVLjU0OkzrtPrhqwtaY5sn8nXFoea0UokEezsPn
         SXM922Icz6ZvzokI8/Z4k4AXAsjrOVfMkLW4NFzlLgVY9SEu0j2dSRCTZoq/Y7Z1uneu
         qj8tgFUVSgot85faH12NsI3+0KQXrFiLq0/rVKQpfShjgEE2Hq5HEKuX04/3aSOnQr4Q
         TyoX6Npjm2+Xm66sGfWuWKultech7w47iwXDWwVSnKtL350GkuGNOa1fQ/X2sKVM6Hu1
         xj4g==
X-Gm-Message-State: AOAM532w2SQ+5lpkyuO+JXuKfbb/pagd3Tv5kOnDq2sUvoHCmAjZPY+8
        vflvL7wMdg1RoETtxlutA6Qyjg==
X-Google-Smtp-Source: ABdhPJxleMeq5HJch7S7CKNhOJNjRo13DmG6UsGaAuj0dKewF9Oc6BP36YmAFzkZxliu4PsIYMwwIg==
X-Received: by 2002:a1c:9d53:: with SMTP id g80mr3600359wme.13.1591266647241;
        Thu, 04 Jun 2020 03:30:47 -0700 (PDT)
Received: from localhost.localdomain ([88.122.66.28])
        by smtp.gmail.com with ESMTPSA id n19sm6510164wmi.33.2020.06.04.03.30.46
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 04 Jun 2020 03:30:46 -0700 (PDT)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     sboyd@kernel.org, bjorn.andersson@linaro.org
Cc:     mturquette@baylibre.com, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, Ilia Lin <ilialin@codeaurora.org>
Subject: [PATCH v2 3/4] dt-bindings: clk: qcom: Add bindings for CPU clock for msm8996
Date:   Thu,  4 Jun 2020 12:35:26 +0200
Message-Id: <1591266927-24976-4-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1591266927-24976-1-git-send-email-loic.poulain@linaro.org>
References: <1591266927-24976-1-git-send-email-loic.poulain@linaro.org>
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

