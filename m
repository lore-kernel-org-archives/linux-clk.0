Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58926C678DC
	for <linux-clk@archiver.kernel.org>; Fri, 20 Jan 2023 06:14:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229539AbjATGOZ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 20 Jan 2023 01:14:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229510AbjATGOY (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 20 Jan 2023 01:14:24 -0500
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 310867CCCE
        for <linux-clk@vger.kernel.org>; Thu, 19 Jan 2023 22:14:22 -0800 (PST)
Received: by mail-ej1-x630.google.com with SMTP id hw16so11341478ejc.10
        for <linux-clk@vger.kernel.org>; Thu, 19 Jan 2023 22:14:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HrzyXn+3KXGB8jFmT4/nP9r21IZNbBpvAIbG/j2BgWc=;
        b=U8W6UFMceijb3/FC5kVHJ5LKocCAl+9PHeNn3cKnOcEYcokbtnirLoVPqZCDEZtmoW
         c0VMkrw35x3vdDpinYX6b2xleYHMiOALU2rZWSx56uZbXKJOj1AoTjhGZu885oTVGf6w
         j6xJwvE9ALKsR/I8DbL+qthjm/4Cn69Cdh/8nphENddsjxQXHcGIpAjjfIlg3WmoiN23
         9uipYT70SP2Sxx5AOdHYCU9rjclkONtZcOks6oZTU4vRQIbUc4izGUFyaZoWNucuJais
         x6TMevPX8vPX+7EVZ8+GV92IAteCHbYSB3yML2qdMRtrhVjwPecM5bSKjXDddpws1iOC
         +QcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HrzyXn+3KXGB8jFmT4/nP9r21IZNbBpvAIbG/j2BgWc=;
        b=UsNXqqtrGHrROoZ/+M15gOIfAcqU9Vt7TfVLjgH7qlxZPNRlyWLx1OyLUC8odB+VZE
         /d2Bse1SmYOg+OXR9VB59ANP4j1OiY9qOwf4QndGr4+M7RR0wHyD6pv8jcfy9xV96Ire
         o6cfzCfUK3yAS5rrLADEmLPObQcDdLZ7xZZNwAQWC34GBoFuS/QAXb0rOM1kxDfC2BL8
         x3auCFW4ycSvfT4d2a8B2bNTYpL7PonBDvVjL7rkponM5Fzftn9ia1gdrAii2KLw2SO4
         6Zp1QzTxFd5+z7+AZs+oFl3i9ijgzgUHhs93yL6YiB8X3SVl7/Ilj0Et4Zr3KTX3kjHD
         g8Hw==
X-Gm-Message-State: AFqh2kqU5cDkL4p+iTe5x4s0iti6GFql/fNSXnEde8gyKDqHEK6nZ4EH
        hJofBrBooV5OZQDB2U99HgxpRw==
X-Google-Smtp-Source: AMrXdXtgQbcqB/eEMj3ANbMxGs+z75Ggql2W9FsMW6oMpbPmKLc/ZzFRn8qZooy8zYoiBjhaP/1QWg==
X-Received: by 2002:a17:906:d0c8:b0:7c1:10b8:e6a4 with SMTP id bq8-20020a170906d0c800b007c110b8e6a4mr13956354ejb.19.1674195260756;
        Thu, 19 Jan 2023 22:14:20 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id hp24-20020a1709073e1800b008720c458bd4sm5813358ejc.3.2023.01.19.22.14.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jan 2023 22:14:20 -0800 (PST)
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
        devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 1/8] dt-bindings: clock: qcom,msm8996-cbf: Describe the MSM8996 CBF clock controller
Date:   Fri, 20 Jan 2023 08:14:10 +0200
Message-Id: <20230120061417.2623751-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230120061417.2623751-1-dmitry.baryshkov@linaro.org>
References: <20230120061417.2623751-1-dmitry.baryshkov@linaro.org>
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

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../bindings/clock/qcom,msm8996-cbf.yaml      | 53 +++++++++++++++++++
 1 file changed, 53 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,msm8996-cbf.yaml

diff --git a/Documentation/devicetree/bindings/clock/qcom,msm8996-cbf.yaml b/Documentation/devicetree/bindings/clock/qcom,msm8996-cbf.yaml
new file mode 100644
index 000000000000..3ffe69d8cdd5
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,msm8996-cbf.yaml
@@ -0,0 +1,53 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
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
2.39.0

