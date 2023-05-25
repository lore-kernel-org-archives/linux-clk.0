Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47FB6C7EE29
	for <linux-clk@archiver.kernel.org>; Thu, 25 May 2023 12:29:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241025AbjEYM3y (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 25 May 2023 08:29:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241069AbjEYM3r (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 25 May 2023 08:29:47 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F79912E
        for <linux-clk@vger.kernel.org>; Thu, 25 May 2023 05:29:45 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-30948709b3cso1352951f8f.3
        for <linux-clk@vger.kernel.org>; Thu, 25 May 2023 05:29:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685017784; x=1687609784;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OuvRuDicrDkTpiapZ9qbY9ea3wcS797f7ELyYZDyHDI=;
        b=S/JIetgcXgA1A05nAOKXcZ9zKRE/D7BI80rlLZOkS0HH7qzevd2EASNBuHAl1QRiIR
         Z5rhHStymQH3/wRF4OhUt6QSnpULTb2HcRb8wkpsrB+LNejwEq/aG8b76PGp9BlmRCyI
         bB/o5CPJIEIm5w7Zj9B1QeasBGCkDOqTJ7Mv21FzZchz+Yi7wI1rt+oEC/UBtLyWWDib
         G02Dpy8RIJkl2iMLzqkGVXPzKYNFQK93lwIDIy6OSAPlpbScbTzrI77xfWa0NSVCs2/H
         OuU3PGH6eoqjrv//EsL9ODgMoyF5yuz9oy8dE76ZowSkatjZDetipM9P8q9ckeOBEBYk
         9W/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685017784; x=1687609784;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OuvRuDicrDkTpiapZ9qbY9ea3wcS797f7ELyYZDyHDI=;
        b=VNsdMgY+Nf6Gc083ZRuT7Yurh5GN2noeMUIW5cS48FBeRjIn7pYCofXZjv3hIc//Su
         v7BpZezBbBpdLQ4pwmyrgYHvXunaGg2lHD1q+9sCgLBjiLz+ds2jgr6xmObgUSdwvKii
         fexctSBqtQIyDedKsx/5Lve3510+1+w8HGyQ9gChnp+cYl9ANvVwpNtpWxebHxKlPK3T
         PUAxIWvQHV40KYbq81EIccKLWHyUAhCMqKhTOajok0042v9CQ8MKCUQhQRKTlRhBj2YV
         vFBW1QEYiewfWwYNg5Wsmp8KIkGCK/BxJ8rQt6Cd6RP89hruAfJ/Qe84WmZ5tz9xjsUD
         gW1g==
X-Gm-Message-State: AC+VfDyMQ2ddOib+xdjQ4ar8Nw02JQrRvm92DtLBVEaVmJYhb08QEifg
        ixMnDClrejmfDDwHn9BYn0ckuA==
X-Google-Smtp-Source: ACHHUZ72Waf3mTjj4DxvPqTfbM7OLB4xZcc5SXGEkcYd6A6DCBCK/qW5Y1RBp/H345W+Is77dTJlog==
X-Received: by 2002:a5d:61d0:0:b0:306:489b:3c6 with SMTP id q16-20020a5d61d0000000b00306489b03c6mr2000407wrv.58.1685017783888;
        Thu, 25 May 2023 05:29:43 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id k7-20020adfe3c7000000b003062b2c5255sm1700227wrm.40.2023.05.25.05.29.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 May 2023 05:29:43 -0700 (PDT)
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To:     andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org
Cc:     johan+linaro@kernel.org, agross@kernel.org,
        konrad.dybcio@linaro.org, mturquette@baylibre.com,
        sboyd@kernel.org, conor+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v2 1/6] dt-bindings: clock: Add YAML schemas for LPASSCC and reset on SC8280XP
Date:   Thu, 25 May 2023 13:29:25 +0100
Message-Id: <20230525122930.17141-2-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230525122930.17141-1-srinivas.kandagatla@linaro.org>
References: <20230525122930.17141-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The LPASS (Low Power Audio Subsystem) clock controller provides reset
support when it is under the control of Q6DSP.

Add support for those resets and adds IDs for clients to request the reset.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 .../bindings/clock/qcom,sc8280xp-lpasscc.yaml | 57 +++++++++++++++++++
 .../dt-bindings/clock/qcom,lpasscc-sc8280xp.h | 12 ++++
 2 files changed, 69 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,sc8280xp-lpasscc.yaml
 create mode 100644 include/dt-bindings/clock/qcom,lpasscc-sc8280xp.h

diff --git a/Documentation/devicetree/bindings/clock/qcom,sc8280xp-lpasscc.yaml b/Documentation/devicetree/bindings/clock/qcom,sc8280xp-lpasscc.yaml
new file mode 100644
index 000000000000..08a9ae60a365
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,sc8280xp-lpasscc.yaml
@@ -0,0 +1,57 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,sc8280xp-lpasscc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm LPASS Core & Audio Clock Controller on SC8280XP
+
+maintainers:
+  - Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
+
+description: |
+  Qualcomm LPASS core and audio clock control module provides the clocks,
+  and reset on SC8280XP.
+
+  See also::
+    include/dt-bindings/clock/qcom,lpasscc-sc8280xp.h
+
+properties:
+  reg: true
+
+  compatible:
+    enum:
+      - qcom,sc8280xp-lpasscc
+
+  qcom,adsp-pil-mode:
+    description:
+      Indicates if the LPASS would be brought out of reset using
+      peripheral loader.
+    type: boolean
+
+  '#clock-cells':
+    const: 1
+
+  '#reset-cells':
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - qcom,adsp-pil-mode
+  - '#reset-cells'
+  - '#clock-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,lpasscc-sc8280xp.h>
+    lpasscc: clock-controller@33e0000 {
+        compatible = "qcom,sc8280xp-lpasscc";
+        reg = <0x033e0000 0x12000>;
+        qcom,adsp-pil-mode;
+        #reset-cells = <1>;
+        #clock-cells = <1>;
+    };
+...
diff --git a/include/dt-bindings/clock/qcom,lpasscc-sc8280xp.h b/include/dt-bindings/clock/qcom,lpasscc-sc8280xp.h
new file mode 100644
index 000000000000..df800ea2741c
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,lpasscc-sc8280xp.h
@@ -0,0 +1,12 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) 2023, Linaro Ltd.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_LPASSCC_SC8280XP_H
+#define _DT_BINDINGS_CLK_QCOM_LPASSCC_SC8280XP_H
+
+/* LPASS TCSR */
+#define LPASS_AUDIO_SWR_TX_CGCR				0
+
+#endif
-- 
2.21.0

