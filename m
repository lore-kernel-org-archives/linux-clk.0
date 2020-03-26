Return-Path: <SRS0=aVCd=5L=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2104C2D0E9
	for <linux-clk@archiver.kernel.org>; Thu, 26 Mar 2020 11:56:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AA0ED20409
	for <linux-clk@archiver.kernel.org>; Thu, 26 Mar 2020 11:56:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="U+R2t+we"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728141AbgCZL4M (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 26 Mar 2020 07:56:12 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:36368 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728120AbgCZL4M (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 26 Mar 2020 07:56:12 -0400
Received: by mail-wm1-f66.google.com with SMTP id g62so6681559wme.1
        for <linux-clk@vger.kernel.org>; Thu, 26 Mar 2020 04:56:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=lPSeMRXMvs1jklTgKPytoha0xP4ZvkWTq9YlisW8Cvo=;
        b=U+R2t+weaATwNyGDRAG6+xB1J93vtC2t+ZX0o4FbNYAQp1dXVlKwq1vw2DdcmgsLer
         VkpIhwu4s7xveE49A5RUqTN/VCkirodyGsJmXkRgjOEhX2Jr/dhamio0++T1Nf3JNSbP
         uvqvyTvtPRggjfAlRNUBldfj6Gy6wURIxA4Lp8UIaMhduwnpTdMgmJVHltuk/7svjXXo
         pVrh8Qi0g4HOOe4+X5jX7LizBjjAzpki16Z+RULkJ36VyW6afsGrByLEadZRR6YD0BCI
         qj2Vyc3hM/4AwqUE4wVJdpzaJwOduH2fuThUmJIrlEEq+suXnck5rr1afXQrklTQJ06v
         AT0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=lPSeMRXMvs1jklTgKPytoha0xP4ZvkWTq9YlisW8Cvo=;
        b=I9vS7HV9gy/kKAEZovyPQHCfJYjgWmoFpLSjF+Nhrdnoda6TEaNP7Sf3r7MFnxVKYC
         ezqe6bUOYHnbHHuEN5FV8Z6Cmlk+SBM4yhkFi4XYFaqkhE/iezECDcVqozbLKU1lvdge
         qcuUdVAYELPw5CJOzsGlCLRN92lhq3CHEGzwzi5LhHEYTY6+bcEfUzmnwj1T8fZ0BJAf
         r6daz6c5K3LNmE9dqhOBdfjUq6h+sHIBYjwel+3Ec5UCxRLNaEOwuu/gS+pRl6GKByDW
         A0KXGO0XOO84/xzNSj31DZS6v93xKiUFr/bZ6lxlIqON6WXK2g6H8nhygVN4Gcjysrt+
         K0iw==
X-Gm-Message-State: ANhLgQ2dqCWovw0SEENfdLHLRW38i8Q3LiC7iDNVPkAtshG7mKv9fEGn
        L49wUCKr8tqpDuyeFeujo3g/VQ==
X-Google-Smtp-Source: ADFU+vvmTgBiraQyzcG13LqF6pr7ItKlisqJujmRcCt8J5mksK2xm0PlFDFoL/9Bqc3lhBQ7XtPsPg==
X-Received: by 2002:a7b:ce81:: with SMTP id q1mr2902477wmj.156.1585223770259;
        Thu, 26 Mar 2020 04:56:10 -0700 (PDT)
Received: from localhost.localdomain ([88.122.66.28])
        by smtp.gmail.com with ESMTPSA id o14sm3103270wmh.22.2020.03.26.04.56.09
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Thu, 26 Mar 2020 04:56:09 -0700 (PDT)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     bjorn.andersson@linaro.org, mturquette@baylibre.com
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Ilia Lin <ilialin@codeaurora.org>
Subject: [PATCH 3/4] dt-bindings: clk: qcom: Add bindings for CPU clock for msm8996
Date:   Thu, 26 Mar 2020 13:00:07 +0100
Message-Id: <1585224008-15730-4-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1585224008-15730-1-git-send-email-loic.poulain@linaro.org>
References: <1585224008-15730-1-git-send-email-loic.poulain@linaro.org>
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
 Documentation/devicetree/bindings/clock/qcom,kryocc.txt | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,kryocc.txt

diff --git a/Documentation/devicetree/bindings/clock/qcom,kryocc.txt b/Documentation/devicetree/bindings/clock/qcom,kryocc.txt
new file mode 100644
index 0000000..8458783
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,kryocc.txt
@@ -0,0 +1,17 @@
+Qualcomm CPUSS clock controller for Kryo CPUs
+----------------------------------------------------
+
+Required properties :
+- compatible : shall contain only one of the following:
+
+			"qcom,msm8996-apcc"
+
+- reg : shall contain base register location and length
+- #clock-cells : shall contain 1
+
+Example:
+	kryocc: clock-controller@6400000 {
+		compatible = "qcom,msm8996-apcc";
+		reg = <0x6400000 0x90000>;
+		#clock-cells = <1>;
+	};
-- 
2.7.4

