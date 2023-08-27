Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A65EEC83F26
	for <linux-clk@archiver.kernel.org>; Sun, 27 Aug 2023 11:51:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229869AbjH0LvM (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 27 Aug 2023 07:51:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229932AbjH0Luq (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 27 Aug 2023 07:50:46 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3F141A4
        for <linux-clk@vger.kernel.org>; Sun, 27 Aug 2023 04:50:39 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-2bcda0aaf47so38416051fa.1
        for <linux-clk@vger.kernel.org>; Sun, 27 Aug 2023 04:50:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693137038; x=1693741838;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1h5yZ1ON0tbidIVRhLbpjEGcgJUDJL2iKVUumFLXMN4=;
        b=a7muBL9IUjqVns3i7KW6R+6B7wM+KGnCPlxLztBTGwmKd+7z0pZeGLdaSXFwCjJhfX
         9Ub944wky508FCfEE8IQHBzo3TJlucAi5N1NkR7K+gAVoqa5iZkw9CddGPC2PS80cqVT
         HZD51xtrHwKHyC/GFCx+xAL2moQUGk0xmcXgrjtG2grNG4NaKBOH97WPa83SEOCP/CMW
         jGzVMk176p7kQNitmRfBRVlDQsllaRWQFkBtGkBobzd6rwr5MumkHM49mMYqOrdkXMVV
         PigGQa4KeXaau44rGImOqs1sReH4OGRItWGNBkknm82QaVKarQcnuYOQkSCNkWGXS4WF
         iYJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693137038; x=1693741838;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1h5yZ1ON0tbidIVRhLbpjEGcgJUDJL2iKVUumFLXMN4=;
        b=QFNa8FwAYkcArhpltT2tq8M5ZCVRyHG8vtih3lUWmnrnfLlsDiBarfYvyxlAzFQUGg
         GGNrjeX8CNUBphxP+tSUFntaWc2gKZYWfEufj/WnI7aJ1k78TMr2CEzxOK2Yz+ftYjoU
         7VbiwhlXWA8mc0B2byaZk2RRVCoMfFgA9q9lhB/AUXVNWMccpdUh8kPEyA/NF4JmKSeH
         l8+LaxGPfJ2jz7mS0IOA/pC4pfIBrM97Xqmh6p9dg8A+LeUicQAQV2snKbx2qLtjbsu/
         sSb7xVoibiLhaX84wPj6HMmHdCiEoWIfl3ItUt3Ii372UWEQLL0jxBPD2OidxUYVunbx
         +qyQ==
X-Gm-Message-State: AOJu0YxdxMImE4CvjVvrHOfKsbPnMriIu+b/96XMCRywWy2xPuTXRy6G
        TfrkmKsKHc3aArsO6w+ohUdiTw==
X-Google-Smtp-Source: AGHT+IGW0g5PxPyHdiA94zEf8AFi046HCvktmj51b88ouBJ1A4lNV4gblc4U8fgDj2Haet1KdvtBvA==
X-Received: by 2002:a05:6512:3096:b0:500:a008:a2e8 with SMTP id z22-20020a056512309600b00500a008a2e8mr3090179lfd.12.1693137038048;
        Sun, 27 Aug 2023 04:50:38 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id a8-20020a19f808000000b004ff9f88b86esm1114770lff.308.2023.08.27.04.50.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Aug 2023 04:50:37 -0700 (PDT)
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
Subject: [PATCH v4 04/23] dt-bindings: cache: describe L2 cache on Qualcomm Krait platforms
Date:   Sun, 27 Aug 2023 14:50:14 +0300
Message-Id: <20230827115033.935089-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230827115033.935089-1-dmitry.baryshkov@linaro.org>
References: <20230827115033.935089-1-dmitry.baryshkov@linaro.org>
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
 .../bindings/cache/qcom,krait-l2-cache.yaml   | 86 +++++++++++++++++++
 include/dt-bindings/soc/qcom,krait-l2-cache.h | 12 +++
 2 files changed, 98 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/cache/qcom,krait-l2-cache.yaml
 create mode 100644 include/dt-bindings/soc/qcom,krait-l2-cache.h

diff --git a/Documentation/devicetree/bindings/cache/qcom,krait-l2-cache.yaml b/Documentation/devicetree/bindings/cache/qcom,krait-l2-cache.yaml
new file mode 100644
index 000000000000..59ce11dd0a24
--- /dev/null
+++ b/Documentation/devicetree/bindings/cache/qcom,krait-l2-cache.yaml
@@ -0,0 +1,86 @@
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
+  - $ref: /schemas/cache-controller.yaml#
+
+select:
+  properties:
+    compatible:
+      contains:
+        enum:
+          - qcom,krait-l2-cache
+
+  required:
+    - compatible
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
+  opp-table:
+    type: object
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
+        l2_opp_table: opp-table {
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

