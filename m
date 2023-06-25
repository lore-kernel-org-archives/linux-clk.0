Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18668C04FE2
	for <linux-clk@archiver.kernel.org>; Sun, 25 Jun 2023 20:26:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230157AbjFYU0B (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 25 Jun 2023 16:26:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230159AbjFYUZ6 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 25 Jun 2023 16:25:58 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B8CBE48
        for <linux-clk@vger.kernel.org>; Sun, 25 Jun 2023 13:25:55 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-4f86fbe5e4fso2965802e87.2
        for <linux-clk@vger.kernel.org>; Sun, 25 Jun 2023 13:25:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687724753; x=1690316753;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P6IQl2jydqEVzMHgyvXGKi5dP1nmhqYFToeW0usGn04=;
        b=cCnMP6hgg80Wv1iohEYrspwKCL/eAfWkw4IHVVj4IbDRWAwtE4drLYNKdJyMNqtKen
         C90le5J112H8WfyG7Ej5c6n5+SaVfltC3Kn0heIh5PNwI/NAcr0Qnhwh2xSnshbpjz4A
         pChJxPAKHNiFs/DX48jFnLQhpHDjtZTrIDVvRGVPnk+ZFekdo9op3Ec19OYXJ+MQCl3h
         3LnQ78ymAU9vRQxfId8yeg/eQtVMYT1QKiyxjNppSxceADNil98RxR9GkOPDH20g1lmk
         IAutLklX6PPG012cyZERYCQTb2CZg0q+5eHfxZFgKRbjaoepVtc/pSfDL3cFhtaD9n6D
         /naQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687724753; x=1690316753;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P6IQl2jydqEVzMHgyvXGKi5dP1nmhqYFToeW0usGn04=;
        b=StyRxcxmQQHEINaxn9VASdY8Yo/IGAbRbHrQkmWfu6GiDrUPlWMtJ3hYRgxB7m5Owi
         SwRyrZQ06bY/ulmZ1l95DLoyooOhkPIWFCzp0VwbFw3eOo+YOFUXLjiwmZ2ME72xuqjl
         MIH7WD95LEBkZmb1TPUjMWvK7Nw6ADi63jK4iu64kSdAPV1pUBoKJ5WsBMDmH2lBDRxS
         t0kkpmHgrPrSfxmlfdOsY8hbL70C2aK9eQqVt39Art35R0nghIaqV6b/ZJv3luej5t7R
         M7vrLZgjvXhgE4LkooQeYb9Hy3B974Uw4rQr1QICjXFbu3CIgpqvkrIqUVj4HDaYdF2T
         QPFQ==
X-Gm-Message-State: AC+VfDzVFnjF5B+sigZLkz6zxquBr4cpNEx0S5G7Fn46bS0JqVvyVqUy
        uYV/HBhg8nEzdZ0tZ69iEYC/Ng==
X-Google-Smtp-Source: ACHHUZ7sdpONkCT0uFv1glG3RaUylMcRYeZ1VbX8RY+p/4zKS2XBEMJP4IeGiit/8MnyK9a4R4EpxQ==
X-Received: by 2002:ac2:4db7:0:b0:4f8:5f19:4b49 with SMTP id h23-20020ac24db7000000b004f85f194b49mr13400874lfe.64.1687724753721;
        Sun, 25 Jun 2023 13:25:53 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id m21-20020a195215000000b004f8427f8716sm787537lfb.262.2023.06.25.13.25.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jun 2023 13:25:53 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Ilia Lin <ilia.lin@kernel.org>,
        Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Georgi Djakov <djakov@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        Christian Marangi <ansuelsmth@gmail.com>,
        Stephan Gerhold <stephan@gerhold.net>
Subject: [PATCH v2 05/26] dt-bindings: cache: describe L2 cache on Qualcomm Krait platforms
Date:   Sun, 25 Jun 2023 23:25:26 +0300
Message-Id: <20230625202547.174647-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230625202547.174647-1-dmitry.baryshkov@linaro.org>
References: <20230625202547.174647-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The L2 cache device on Qualcomm Krait platforms controls the supplying
voltages and the cache frequency. Add corresponding bindings for this
device.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../bindings/cache/qcom,krait-l2-cache.yaml   | 75 +++++++++++++++++++
 include/dt-bindings/soc/qcom,krait-l2-cache.h | 12 +++
 2 files changed, 87 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/cache/qcom,krait-l2-cache.yaml
 create mode 100644 include/dt-bindings/soc/qcom,krait-l2-cache.h

diff --git a/Documentation/devicetree/bindings/cache/qcom,krait-l2-cache.yaml b/Documentation/devicetree/bindings/cache/qcom,krait-l2-cache.yaml
new file mode 100644
index 000000000000..1dcf8165135b
--- /dev/null
+++ b/Documentation/devicetree/bindings/cache/qcom,krait-l2-cache.yaml
@@ -0,0 +1,75 @@
+# SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/cache/qcom,krait-l2-cache.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Krait L2 Cache
+
+maintainers:
+  - Bjorn Andersson <andersson@kernel.org>
+
+description:
+  L2 cache on Qualcomm Krait platforms is shared between all CPU cores. L2
+  cache frequency and voltages should be scaled according to the needs of the
+  cores.
+
+allOf:
+  - $ref: ../cache-controller.yaml#
+
+properties:
+  compatible:
+    items:
+      - const: qcom,krait-l2-cache
+      - const: cache
+
+  clocks:
+    maxItems: 1
+
+  '#interconnect-cells':
+    const: 1
+
+  vdd-mem-supply:
+    description: suppling regulator for the memory cells of the cache
+
+  vdd-dig-supply:
+    description: suppling regulator for the digital logic of the cache
+
+  operating-points-v2: true
+  opp-table-l2: true
+
+required:
+  - compatible
+  - cache-level
+  - cache-unified
+  - clocks
+  - '#interconnect-cells'
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/soc/qcom,krait-l2-cache.h>
+
+    l2-cache {
+        compatible = "qcom,krait-l2-cache", "cache";
+        cache-level = <2>;
+        cache-unified;
+        vdd-mem-supply = <&pm8921_l24>;
+        vdd-dig-supply = <&pm8921_s3>;
+        clocks = <&kraitcc 4>;
+        #interconnect-cells = <1>;
+        operating-points-v2 = <&l2_opp_table>;
+
+        l2_opp_table: opp-table-l2 {
+            compatible = "operating-points-v2";
+
+            opp-384000000 {
+                opp-hz = /bits/ 64 <384000000>;
+                opp-microvolt = <1050000 1050000 1150000>,
+                                <950000 950000 1150000>;
+            };
+        };
+    };
+...
+
diff --git a/include/dt-bindings/soc/qcom,krait-l2-cache.h b/include/dt-bindings/soc/qcom,krait-l2-cache.h
new file mode 100644
index 000000000000..c9a38d368111
--- /dev/null
+++ b/include/dt-bindings/soc/qcom,krait-l2-cache.h
@@ -0,0 +1,12 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (C) 2023 Linaro Ltd. All rights reserved.
+ */
+
+#ifndef __DT_BINDINGS_SOC_QCOM_KRAIT_L2_CACHE_H
+#define __DT_BINDINGS_SOC_QCOM_KRAIT_L2_CACHE_H
+
+#define MASTER_KRAIT_L2		0
+#define SLAVE_KRAIT_L2		1
+
+#endif
-- 
2.39.2

