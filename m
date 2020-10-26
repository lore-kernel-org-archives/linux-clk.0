Return-Path: <SRS0=xpy6=EB=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BBD0C4363A
	for <linux-clk@archiver.kernel.org>; Mon, 26 Oct 2020 12:02:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6690922263
	for <linux-clk@archiver.kernel.org>; Mon, 26 Oct 2020 12:02:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hidCzcr4"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1774661AbgJZMCa (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 26 Oct 2020 08:02:30 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:36040 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1774646AbgJZMCa (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 26 Oct 2020 08:02:30 -0400
Received: by mail-wr1-f66.google.com with SMTP id x7so12171649wrl.3
        for <linux-clk@vger.kernel.org>; Mon, 26 Oct 2020 05:02:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hLnWR4evaA6k5JcpTnqiMDGjsxjllMiiAGlGQ8F3HZE=;
        b=hidCzcr4Evm3Jzp1oLrTxKjeogTphLx+ryAs7Uo4mJCFKK58Vw9X5DEgjLXDvOrDDs
         aJ0iB6p1gkV2AxRqJsySiqpe+swk/B67j3JrkzgwKOoUjKrtALST/i35aV9NZopKcqOJ
         rdY1wcZyIvvYHyYmW8+cIR5ByPRFwChJC0ZKEGDXVto/qYEEE6lGarjO6bjPZyPLNnbX
         ZtYfnb0AXCFFGP6aIWNaNx82aFTQF1nyZMEKdk388rJO7T0uDByy5ufmZ092/dOrQyme
         s65NHIUAztXqA/VqzygvRqfERxv0fqqooYycNa+xVukFgSuHL3Fn0pNYCfEcYhT/yiYV
         011A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hLnWR4evaA6k5JcpTnqiMDGjsxjllMiiAGlGQ8F3HZE=;
        b=TGlSqEufxbLlYbomHnG8SLrOAwvwnvdOjynzC7kg8VssZ2s8S6gcckitMutC3KZSsY
         CJVjeCWyU0Gq8lj/u9TZG7LU4VCbMNIefFLzpiZjW0PiAGqc6GPu1kJ/02gOBu6mD0jW
         5Pzi1oVHrRmfMVoNobdc7Dy3+xItpG9DEo6VN/GmFC8KoT74Tp36LlnnWa3+qmb3Y5IU
         f0W6oTmeCZFYQaE/Zs9mBhxyeztOSwXczPWLgL11iXmtDOhYhAMrHzrgdv7Uo4a0qTCI
         xuyVnrH4ZvWZs5F1ExG3X/JnB2956vvCXNCo9AaCEX1FRwOCA8zbxkSVk/TnrLlnrytz
         Smrg==
X-Gm-Message-State: AOAM533AFscdFzVBvNjQ7fepb+GcbvOhcFN94M2NVJojpB6fTEhmvhYJ
        wqge8acTwWuIaHK/4QQFjCOSuw==
X-Google-Smtp-Source: ABdhPJygzGkcrJqrxLEgNda89Fe4jtqLffzEECZy547P4vFqvtCMMlUhcJLH4ydJPtUVCpeWB1kzUA==
X-Received: by 2002:adf:a31c:: with SMTP id c28mr18377360wrb.351.1603713746202;
        Mon, 26 Oct 2020 05:02:26 -0700 (PDT)
Received: from srini-hackbox.lan (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
        by smtp.gmail.com with ESMTPSA id i33sm23659337wri.79.2020.10.26.05.02.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2020 05:02:25 -0700 (PDT)
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To:     sboyd@kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     bjorn.andersson@linaro.org, mturquette@baylibre.com,
        robh+dt@kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [RESEND PATCH v3 1/4] dt-bindings: clock: Add support for LPASS Audio Clock Controller
Date:   Mon, 26 Oct 2020 12:02:18 +0000
Message-Id: <20201026120221.18984-2-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20201026120221.18984-1-srinivas.kandagatla@linaro.org>
References: <20201026120221.18984-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Audio Clock controller is a block inside LPASS which controls
2 Glitch free muxes to LPASS codec Macros.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 .../bindings/clock/qcom,audiocc-sm8250.yaml   | 58 +++++++++++++++++++
 .../clock/qcom,sm8250-lpass-audiocc.h         | 13 +++++
 2 files changed, 71 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,audiocc-sm8250.yaml
 create mode 100644 include/dt-bindings/clock/qcom,sm8250-lpass-audiocc.h

diff --git a/Documentation/devicetree/bindings/clock/qcom,audiocc-sm8250.yaml b/Documentation/devicetree/bindings/clock/qcom,audiocc-sm8250.yaml
new file mode 100644
index 000000000000..915d76206ad0
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,audiocc-sm8250.yaml
@@ -0,0 +1,58 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,audiocc-sm8250.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Clock bindings for LPASS Audio Clock Controller on SM8250 SoCs
+
+maintainers:
+  - Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
+
+description: |
+  The clock consumer should specify the desired clock by having the clock
+  ID in its "clocks" phandle cell.
+  See include/dt-bindings/clock/qcom,sm8250-lpass-audiocc.h for the full list
+  of Audio Clock controller clock IDs.
+
+properties:
+  compatible:
+    const: qcom,sm8250-lpass-audiocc
+
+  reg:
+    maxItems: 1
+
+  '#clock-cells':
+    const: 1
+
+  clocks:
+    items:
+      - description: LPASS Core voting clock
+      - description: Glitch Free Mux register clock
+
+  clock-names:
+    items:
+      - const: core
+      - const: bus
+
+required:
+  - compatible
+  - reg
+  - '#clock-cells'
+  - clocks
+  - clock-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,sm8250-lpass-audiocc.h>
+    #include <dt-bindings/sound/qcom,q6afe.h>
+    clock-controller@3300000 {
+      #clock-cells = <1>;
+      compatible = "qcom,sm8250-lpass-audiocc";
+      reg = <0x03300000 0x30000>;
+      clocks = <&q6afecc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+               <&q6afecc LPASS_CLK_ID_TX_CORE_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+      clock-names = "core", "bus";
+    };
diff --git a/include/dt-bindings/clock/qcom,sm8250-lpass-audiocc.h b/include/dt-bindings/clock/qcom,sm8250-lpass-audiocc.h
new file mode 100644
index 000000000000..a1aa6cb5d840
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,sm8250-lpass-audiocc.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef _DT_BINDINGS_CLK_LPASS_AUDIOCC_SM8250_H
+#define _DT_BINDINGS_CLK_LPASS_AUDIOCC_SM8250_H
+
+/* From AudioCC */
+#define LPASS_CDC_WSA_NPL				0
+#define LPASS_CDC_WSA_MCLK				1
+#define LPASS_CDC_RX_MCLK				2
+#define LPASS_CDC_RX_NPL				3
+#define LPASS_CDC_RX_MCLK_MCLK2				4
+
+#endif /* _DT_BINDINGS_CLK_LPASS_AUDIOCC_SM8250_H */
-- 
2.21.0

