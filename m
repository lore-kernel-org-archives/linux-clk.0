Return-Path: <SRS0=MeOa=3X=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A698EC3524F
	for <linux-clk@archiver.kernel.org>; Mon,  3 Feb 2020 18:32:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 827B72082E
	for <linux-clk@archiver.kernel.org>; Mon,  3 Feb 2020 18:32:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="BdULmOCW"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729975AbgBCSco (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 3 Feb 2020 13:32:44 -0500
Received: from mail-pf1-f194.google.com ([209.85.210.194]:43675 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729972AbgBCSc2 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 3 Feb 2020 13:32:28 -0500
Received: by mail-pf1-f194.google.com with SMTP id s1so7988400pfh.10
        for <linux-clk@vger.kernel.org>; Mon, 03 Feb 2020 10:32:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=RKN0WqAtpRXlZLQAbpsRUXVNFr6J7IAd3QgsbRQLWCk=;
        b=BdULmOCWTTwykDLz/VlJIkPI0WyQDbO088Vq1dRFwoLFTk+mvm5+zUgCcI8G9c+QeK
         pYKZPSenwIK8qffyRMZLBeUPZOKZ2QQzmfRLwVFDOE7CcY0jWv8kyhHspDW1mqhGKgZF
         2MV7dPAEW4DzLGYDQtyAW8lGlWWo6JuKPwL+I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RKN0WqAtpRXlZLQAbpsRUXVNFr6J7IAd3QgsbRQLWCk=;
        b=si8nck7vw6E0YFWAqGh9yu1+VuXQkUBgcJ5Ht9nChYB594eA/OLUcA6EP8oqXzsZT0
         IbATdeWdktASZHvK+vElKrywTE8slcanUo7yo8bE8cMoHC7xTagXXokcWntr6946jv9f
         UMHgARqsyKv8+evzR2TxdQaBOPyaQZnAmGJV2xFuce/eApjms8YBiWf/IWZYJZdluSip
         ntYq6NGwWygfcuQE9BrU1WRlYAX0bkkYpFPcqmQeNMVHSKCZhO++nNzE4a8R/RZ7mOp8
         xYZpuTZqlDcJboiFCPHo5bkAOrDShecsiCCuxClB8FqwylAMm6c6LaSIESLw5gy0KYOj
         nodQ==
X-Gm-Message-State: APjAAAXLDWqMWrXyJx4mA3+pYF7G0/mptYRifdax+DkWhiHoXa1PmZ0Z
        QtXRFCHwozgnr89+W5wMQOYiug==
X-Google-Smtp-Source: APXvYqyucrWizz3g5g3rxQ3ARzLwqEguVciLlZpzkfUtkox3V5loKVi8ThNlpT37NInXwcHjLrCiHQ==
X-Received: by 2002:a62:e217:: with SMTP id a23mr7651932pfi.50.1580754746509;
        Mon, 03 Feb 2020 10:32:26 -0800 (PST)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:24fa:e766:52c9:e3b2])
        by smtp.gmail.com with ESMTPSA id f9sm21009137pfd.141.2020.02.03.10.32.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2020 10:32:25 -0800 (PST)
From:   Douglas Anderson <dianders@chromium.org>
To:     Rob Herring <robh@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Jeffrey Hugo <jhugo@codeaurora.org>,
        Taniya Das <tdas@codeaurora.org>, jeffrey.l.hugo@gmail.com,
        linux-arm-msm@vger.kernel.org, harigovi@codeaurora.org,
        devicetree@vger.kernel.org, mka@chromium.org,
        kalyan_t@codeaurora.org, Mark Rutland <mark.rutland@arm.com>,
        linux-clk@vger.kernel.org, hoegsberg@chromium.org,
        Douglas Anderson <dianders@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v4 11/15] dt-bindings: clock: Cleanup qcom,videocc bindings for sdm845/sc7180
Date:   Mon,  3 Feb 2020 10:31:44 -0800
Message-Id: <20200203103049.v4.11.I27bbd90045f38cd3218c259526409d52a48efb35@changeid>
X-Mailer: git-send-email 2.25.0.341.g760bfbb309-goog
In-Reply-To: <20200203183149.73842-1-dianders@chromium.org>
References: <20200203183149.73842-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

This makes the qcom,videocc bindings match the recent changes to the
dispcc and gpucc.

1. Switched to using "bi_tcxo" instead of "xo".

2. Adds a description for the XO clock.  Not terribly important but
   nice if it cleanly matches its cousins.

3. Updates the example to use the symbolic name for the RPMH clock and
   also show that the real devices are currently using 2 address cells
   / size cells and fixes the spacing on the closing brace.

4. Split into 2 files.  In this case they could probably share one
   file, but let's be consistent.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v4:
- Added Rob's review tag.
- Fixed schema id to not have "bindings/" as per Rob.

Changes in v3:
- Added include file to description.
- Split videocc bindings into 2 files.
- Unlike in v2, use internal name instead of purist name.

Changes in v2:
- Patch ("dt-bindings: clock: Cleanup qcom,videocc") new for v2.

 .../bindings/clock/qcom,sc7180-videocc.yaml   | 63 +++++++++++++++++++
 ...,videocc.yaml => qcom,sdm845-videocc.yaml} | 27 ++++----
 2 files changed, 77 insertions(+), 13 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,sc7180-videocc.yaml
 rename Documentation/devicetree/bindings/clock/{qcom,videocc.yaml => qcom,sdm845-videocc.yaml} (61%)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sc7180-videocc.yaml b/Documentation/devicetree/bindings/clock/qcom,sc7180-videocc.yaml
new file mode 100644
index 000000000000..31df901884ac
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,sc7180-videocc.yaml
@@ -0,0 +1,63 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,sc7180-videocc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Video Clock & Reset Controller Binding for SC7180
+
+maintainers:
+  - Taniya Das <tdas@codeaurora.org>
+
+description: |
+  Qualcomm video clock control module which supports the clocks, resets and
+  power domains on SC7180.
+
+  See also dt-bindings/clock/qcom,videocc-sc7180.h.
+
+properties:
+  compatible:
+    const: qcom,sc7180-videocc
+
+  clocks:
+    items:
+      - description: Board XO source
+
+  clock-names:
+    items:
+      - const: bi_tcxo
+
+  '#clock-cells':
+    const: 1
+
+  '#reset-cells':
+    const: 1
+
+  '#power-domain-cells':
+    const: 1
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - '#clock-cells'
+  - '#reset-cells'
+  - '#power-domain-cells'
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,rpmh.h>
+    clock-controller@ab00000 {
+      compatible = "qcom,sc7180-videocc";
+      reg = <0 0x0ab00000 0 0x10000>;
+      clocks = <&rpmhcc RPMH_CXO_CLK>;
+      clock-names = "bi_tcxo";
+      #clock-cells = <1>;
+      #reset-cells = <1>;
+      #power-domain-cells = <1>;
+    };
+...
diff --git a/Documentation/devicetree/bindings/clock/qcom,videocc.yaml b/Documentation/devicetree/bindings/clock/qcom,sdm845-videocc.yaml
similarity index 61%
rename from Documentation/devicetree/bindings/clock/qcom,videocc.yaml
rename to Documentation/devicetree/bindings/clock/qcom,sdm845-videocc.yaml
index 43cfc893a8d1..9d216c0f11d4 100644
--- a/Documentation/devicetree/bindings/clock/qcom,videocc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sdm845-videocc.yaml
@@ -1,30 +1,31 @@
 # SPDX-License-Identifier: GPL-2.0-only
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/bindings/clock/qcom,videocc.yaml#
+$id: http://devicetree.org/schemas/clock/qcom,sdm845-videocc.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Qualcomm Video Clock & Reset Controller Binding
+title: Qualcomm Video Clock & Reset Controller Binding for SDM845
 
 maintainers:
   - Taniya Das <tdas@codeaurora.org>
 
 description: |
   Qualcomm video clock control module which supports the clocks, resets and
-  power domains.
+  power domains on SDM845.
+
+  See also dt-bindings/clock/qcom,videocc-sdm845.h.
 
 properties:
   compatible:
-    enum:
-      - qcom,sc7180-videocc
-      - qcom,sdm845-videocc
+    const: qcom,sdm845-videocc
 
   clocks:
-    maxItems: 1
+    items:
+      - description: Board XO source
 
   clock-names:
     items:
-      - const: xo
+      - const: bi_tcxo
 
   '#clock-cells':
     const: 1
@@ -48,15 +49,15 @@ required:
   - '#power-domain-cells'
 
 examples:
-  # Example of VIDEOCC with clock node properties for SDM845:
   - |
+    #include <dt-bindings/clock/qcom,rpmh.h>
     clock-controller@ab00000 {
       compatible = "qcom,sdm845-videocc";
-      reg = <0xab00000 0x10000>;
-      clocks = <&rpmhcc 0>;
-      clock-names = "xo";
+      reg = <0 0x0ab00000 0 0x10000>;
+      clocks = <&rpmhcc RPMH_CXO_CLK>;
+      clock-names = "bi_tcxo";
       #clock-cells = <1>;
       #reset-cells = <1>;
       #power-domain-cells = <1>;
-     };
+    };
 ...
-- 
2.25.0.341.g760bfbb309-goog

