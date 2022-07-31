Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B775AC00140
	for <linux-clk@archiver.kernel.org>; Sun, 31 Jul 2022 17:48:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237159AbiGaRsP (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 31 Jul 2022 13:48:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230365AbiGaRsO (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 31 Jul 2022 13:48:14 -0400
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6AEEE0F6
        for <linux-clk@vger.kernel.org>; Sun, 31 Jul 2022 10:48:13 -0700 (PDT)
Received: by mail-pj1-x1032.google.com with SMTP id s5-20020a17090a13c500b001f4da9ffe5fso2841511pjf.5
        for <linux-clk@vger.kernel.org>; Sun, 31 Jul 2022 10:48:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=edgeble-ai.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=vofowt60zIc/lnFVlyI4BeBG85w8rxNk/k1iZ0Ct+8A=;
        b=ar8l0q9L46UWX+F9Te/v4KS9Qv+yBtO9qlnaSB7xA56F6wxLpdimuSzgf+Yd4agg6u
         wLLhi/OI2E4eoB5bZez0owlgCLZ1PYl9A+/JQ3Pm7MCrcR1yhCB5N6fqcBaizCykahkV
         yeyvccrWse5G1tIIESVKF1uGfIvQ1d+RxcSfGb4D1nhkHuQ5f5UJ2EmESIr+Zznefr6w
         3YKRUD7t1iN8DJa8de3JLj/gZH45AB2pC1fH3gVLQ+ksBgMdfCMbW+6fOqdt4jeC6gOu
         j2Af2OauFURpdlr8/MiTxSRKgQZ1GA1EGbr++tp+hCVdmH1+zdAVBTGnxiL2NgGyVber
         Ykww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=vofowt60zIc/lnFVlyI4BeBG85w8rxNk/k1iZ0Ct+8A=;
        b=c9MjYCy0wtQdSHtYEJh0+RO3xS43i/czfylbHLxtFWlLRMzEQU4RSwJtwrTeKqHbb2
         X+cIobUzlMvwBquR6d72OHi30t0+K5acrB2NU0TosW6CX+Sb05aATnfZe503TxlIXsIM
         WGiTJY+sa5Qa/egcDU8iWmX/J9/raDvePZvkVvakwlfucIFTF/4O+mQpuLa2G2ZqgMn7
         Sjobg2Jj7JIGLCvVc4iKhM/KZrPYV6zaJh9TjILY8SLcJShq196PhQlI4ii46XCnaXCa
         K2GS8uP3+k5QywWmODLDEQKGW4EkpyE1EfI3xcngk4hEWs+55btMJGFu8+ZO2+67riW4
         RgPA==
X-Gm-Message-State: ACgBeo0/dMPkjEl6MX5xgIogPzbTpu8AhtyqoT/af7oYWu39DRKIqwGc
        OJdCwQXVO6OtrhvkM3y0O8aISQ==
X-Google-Smtp-Source: AA6agR4d276bFmsiyju9FRb8KWzEgmWCJbVK/qluicSptnCXw2Eq+I1YDnJA5AFgCC5tAqrvE7lLDQ==
X-Received: by 2002:a17:90a:6b45:b0:1e3:3cfa:3104 with SMTP id x5-20020a17090a6b4500b001e33cfa3104mr15915990pjl.113.1659289693383;
        Sun, 31 Jul 2022 10:48:13 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:c00a:a073:c5e8:48d3:6a8c:6418])
        by smtp.gmail.com with ESMTPSA id n5-20020a170903110500b0016d3935eff0sm7812062plh.176.2022.07.31.10.48.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Jul 2022 10:48:13 -0700 (PDT)
From:   Jagan Teki <jagan@edgeble.ai>
To:     Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Kever Yang <kever.yang@rock-chips.com>
Cc:     linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
        Jagan Teki <jagan@edgeble.ai>, linux-clk@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 09/20] dt-bindings: clock: rockchip: Document RV1126 CRU
Date:   Sun, 31 Jul 2022 23:17:15 +0530
Message-Id: <20220731174726.72631-10-jagan@edgeble.ai>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220731174726.72631-1-jagan@edgeble.ai>
References: <20220731174726.72631-1-jagan@edgeble.ai>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Document dt-bindings for Rockchip RV1126 clock controller.

Cc: linux-clk@vger.kernel.org
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Stephen Boyd <sboyd@kernel.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Jagan Teki <jagan@edgeble.ai>
---
Changes for v2:
- fixed title
- remove '|' in description
- add one example

 .../bindings/clock/rockchip,rv1126-cru.yaml   | 62 +++++++++++++++++++
 1 file changed, 62 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/rockchip,rv1126-cru.yaml

diff --git a/Documentation/devicetree/bindings/clock/rockchip,rv1126-cru.yaml b/Documentation/devicetree/bindings/clock/rockchip,rv1126-cru.yaml
new file mode 100644
index 000000000000..0998f8b922bd
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/rockchip,rv1126-cru.yaml
@@ -0,0 +1,62 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/rockchip,rv1126-cru.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Rockchip RV1126 Clock and Reset Unit
+
+maintainers:
+  - Jagan Teki <jagan@edgeble.ai>
+  - Finley Xiao <finley.xiao@rock-chips.com>
+  - Heiko Stuebner <heiko@sntech.de>
+
+description:
+  The RV1126 clock controller generates the clock and also implements a
+  reset controller for SoC peripherals.
+
+properties:
+  compatible:
+    enum:
+      - rockchip,rv1126-cru
+      - rockchip,rv1126-pmucru
+
+  reg:
+    maxItems: 1
+
+  "#clock-cells":
+    const: 1
+
+  "#reset-cells":
+    const: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    const: xin24m
+
+  rockchip,grf:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Phandle to the syscon managing the "general register files" (GRF),
+      if missing pll rates are not changeable, due to the missing pll
+      lock status.
+
+required:
+  - compatible
+  - reg
+  - "#clock-cells"
+  - "#reset-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    cru: clock-controller@ff490000 {
+      compatible = "rockchip,rv1126-cru";
+      reg = <0xff490000 0x1000>;
+      rockchip,grf = <&grf>;
+      #clock-cells = <1>;
+      #reset-cells = <1>;
+    };
-- 
2.25.1

