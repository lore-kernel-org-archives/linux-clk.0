Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F5B5C54EBC
	for <linux-clk@archiver.kernel.org>; Wed, 11 Jan 2023 20:00:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236076AbjAKUA4 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 11 Jan 2023 15:00:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239509AbjAKUAP (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 11 Jan 2023 15:00:15 -0500
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 898BD43A1C
        for <linux-clk@vger.kernel.org>; Wed, 11 Jan 2023 11:57:58 -0800 (PST)
Received: by mail-lf1-x134.google.com with SMTP id bf43so25199490lfb.6
        for <linux-clk@vger.kernel.org>; Wed, 11 Jan 2023 11:57:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ht3zSGSj2eFqzl5LX1pgp8D+J5K5Oiem2nBvVfvaaLM=;
        b=R02ddUuuE8GyNN6RR7c78iWWVUtiS7JIMVEcf7h6nCPPgKDws8JNnQrd57A5Q1JIFH
         zQevyUoIhr9bWjyaFFUg+mzaThKObrhZnXze+pgfcgJweiivbUwzszy45Pg7C+ldFboS
         O+XRxLcb7S2Ojh3Q6HtfMLgjHAL1f5NGkPOyjGDd4SP1Hhe7YwbpJyzCNHLUNiwCXNPX
         UZ/d1YnqpnuBEus/DZg6XxCnU0fq8eqkd7zt3Aox0sx7YGtwlYR/2dmV6vY0pPWHo79W
         GamzYeQ+RnCoJj6KYrprbiKRmybI3LS0uANgCxyozZeBR00FVaykpOmpcC5pzFH5EU91
         m1zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ht3zSGSj2eFqzl5LX1pgp8D+J5K5Oiem2nBvVfvaaLM=;
        b=TTomprO4+VJqx68eucInq3ihmUaCdusp0HbUscqcK05JfEM7d2hn3ZvDtpqlv/Ele1
         jo3fHkdFh4nSnW0ZoXwXlYQSEbvRZpAgrUY5wxNx9gDLyqVrdmsvm/ECwiNTiXMf7qlL
         fKw0S1ty70+FetJzN7yjFhnSW1V0zPOHcM/4RXRMn+WMybxnl6eDCUPR6sUdYRvCsY7J
         lu4B0dAYHG6NdTU2/Tb9kDIk8T+Mi+iB6L5jKdFnKRkIj6gQ1Q+J9vt/YJ1UrVcjVaxv
         8PoAPupbWVpwBEl5rcvh+EdWe0XZktxET3J9i92dGbyIAZEd9pmFx8hZmv00y7iXEoV2
         H+OQ==
X-Gm-Message-State: AFqh2kpmP61YCfGvzAGl6PE2ec3QFgfC3aWlyC6+6kgGsWBZ+5dru2id
        BbesZagXh+wmMcft2NhFGjNeLw==
X-Google-Smtp-Source: AMrXdXvosVgXGRsH5lXQ6JZGffvDwcuGo5qCLEUF1HFL6FDNHSi6pqZDdhxgTrk57dreIuECxo+l6g==
X-Received: by 2002:a05:6512:2987:b0:4a4:68b7:d642 with SMTP id du7-20020a056512298700b004a468b7d642mr20954698lfb.41.1673467076743;
        Wed, 11 Jan 2023 11:57:56 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id c3-20020ac25f63000000b0049f54c5f2a4sm2872452lfc.229.2023.01.11.11.57.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jan 2023 11:57:56 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH 1/5] dt-bindings: clock: qcom,msm8996-cbf: Describe the MSM8996 CBF clock controller
Date:   Wed, 11 Jan 2023 22:57:50 +0300
Message-Id: <20230111195754.2593134-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230111195754.2593134-1-dmitry.baryshkov@linaro.org>
References: <20230111195754.2593134-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

MSM8996 Core Bus Fabric (CBF) clock controller clocks an interconnect
between two CPU clusters. The CBF clock should follow the CPU
frequencies to provide enough bandwidth between clusters. Thus a single
driver implements both a clock and an interconnect to set the clock
rate.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../bindings/clock/qcom,msm8996-cbf.yaml      | 53 +++++++++++++++++++
 1 file changed, 53 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,msm8996-cbf.yaml

diff --git a/Documentation/devicetree/bindings/clock/qcom,msm8996-cbf.yaml b/Documentation/devicetree/bindings/clock/qcom,msm8996-cbf.yaml
new file mode 100644
index 000000000000..2080e1743b2e
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,msm8996-cbf.yaml
@@ -0,0 +1,53 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,msm8996-cbf.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm MSM8996 Core Bus Fabric (CBF) clock controller
+
+maintainers:
+  - Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
+
+description: >
+  The clock controller for the Qualcomm MSM8996 CBF clock, which drives the
+  interconnect between two CPU clusters.
+
+properties:
+  compatible:
+    const: qcom,msm8996-cbf
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: XO source
+      - description: SYS APCS AUX clock
+
+  '#clock-cells':
+    const: 0
+
+  '#interconnect-cells':
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - '#clock-cells'
+  - '#interconnect-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,rpmcc.h>
+    clock-controller@9a11000 {
+        compatible = "qcom,msm8996-cbf";
+        reg = <0x09a11000 0x10000>;
+        clocks = <&rpmcc RPM_SMD_BB_CLK1>, <&apcs_glb>;
+        #clock-cells = <0>;
+        #interconnect-cells = <1>;
+    };
+...
-- 
2.30.2

