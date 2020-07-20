Return-Path: <SRS0=zu0T=A7=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AE24C433E8
	for <linux-clk@archiver.kernel.org>; Mon, 20 Jul 2020 13:56:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E97EC206F2
	for <linux-clk@archiver.kernel.org>; Mon, 20 Jul 2020 13:56:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Xg/+uAV5"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728307AbgGTN45 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 20 Jul 2020 09:56:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728254AbgGTN45 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 20 Jul 2020 09:56:57 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E40B4C0619D2
        for <linux-clk@vger.kernel.org>; Mon, 20 Jul 2020 06:56:56 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id c80so22383560wme.0
        for <linux-clk@vger.kernel.org>; Mon, 20 Jul 2020 06:56:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=cZ/E41o6pDsnZRKTO5YwwCWEJlhu1qYrVaTUK2F8dEM=;
        b=Xg/+uAV5DDS+QEv72bQODs8CPgbmTOTYBWpmJOsAuR+VbsgpP1K5QD7I9K4cUL0xg9
         o+SBUd/4E1aCjtyf6H9m3r+TvTgjKcquMQZ+FsmFA2fTnaOiD5IvBf+2G85DVc5lkHXA
         AJnC3j39p0bMSWJW2nTZd8qgx+dMOX6QPFIBqOfM8GLdynsj+WSU84/tgURrdAVaV097
         RUL5Ox6JpaVQyxzkE2E/31Ha9nF0+BfW0G5K0Ze2SmwtBjxPiWYBBBjNAhsc9xCE2MXH
         Jb34VTYTXKff4sktAkR6a/TJ0yBOqA/9lNId0U3TdJEba9OH/PYzpxqckLtr0RdE8t8E
         GsCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=cZ/E41o6pDsnZRKTO5YwwCWEJlhu1qYrVaTUK2F8dEM=;
        b=KRi9TvbaE80DV5cvC3X7jC9j23xfBhLjOMaHfcoud2dHvgyyc4DZLCpm5uql34lyt/
         nJfC3+7ghMLWAzw7/FM9D4ZpbkCvRmPan4pKLD3Qo70gyEZ8eW5JnM+LtDNVJ9duI4qA
         wvVfoCo2MeZAuabwzqQ/mg8wj7/ANOhzyetfSEzmVV8hBGauAKyySj8y/qKQQJrkNgsx
         otqz0HlxtBfkI6QuirL0Y506zNXypBOTNaVyTozAhPi3X34g4yfsq2foZYL027Zwlbxr
         3uq5WbnZDrfxqlxFQPTvEJVQqlkvdaD6Ejx3DMeVQC6v4Gf4dZaoAqlW7UDLqDTsvU7a
         AMwg==
X-Gm-Message-State: AOAM530jlXTm0pNPoHRcpLYYk00GzV7lX4cf6+HOLmO+Db9vLxPF70pP
        XU5DjjCXjD8UZoSVqQFzLXa6ug==
X-Google-Smtp-Source: ABdhPJwlbG2g0sGU7LkjKcmjDNgBOt2skHQ5113q5XuZdPJNO44FmOr7qq+GF8tIs437rZ1PVYNtBw==
X-Received: by 2002:a1c:345:: with SMTP id 66mr21125900wmd.31.1595253415570;
        Mon, 20 Jul 2020 06:56:55 -0700 (PDT)
Received: from localhost.localdomain ([88.122.66.28])
        by smtp.gmail.com with ESMTPSA id d10sm32776743wrx.66.2020.07.20.06.56.54
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 20 Jul 2020 06:56:55 -0700 (PDT)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     sboyd@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        amit.kucheria@linaro.org, bjorn.andersson@linaro.org,
        robh@kernel.org, Ilia Lin <ilialin@codeaurora.org>
Subject: [PATCH v6 3/5] dt-bindings: clk: qcom: Add bindings for CPU clock for msm8996
Date:   Mon, 20 Jul 2020 16:02:18 +0200
Message-Id: <1595253740-29466-4-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1595253740-29466-1-git-send-email-loic.poulain@linaro.org>
References: <1595253740-29466-1-git-send-email-loic.poulain@linaro.org>
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
 .../bindings/clock/qcom,msm8996-apcc.yaml          | 54 ++++++++++++++++++++++
 1 file changed, 54 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,msm8996-apcc.yaml

diff --git a/Documentation/devicetree/bindings/clock/qcom,msm8996-apcc.yaml b/Documentation/devicetree/bindings/clock/qcom,msm8996-apcc.yaml
new file mode 100644
index 0000000..a20cb10
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,msm8996-apcc.yaml
@@ -0,0 +1,54 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,msm8996-apcc.yaml#
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
+  - |
+    kryocc: clock-controller@6400000 {
+        compatible = "qcom,msm8996-apcc";
+        reg = <0x6400000 0x90000>;
+        #clock-cells = <1>;
+    };
-- 
2.7.4

