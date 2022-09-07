Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE632C38145
	for <linux-clk@archiver.kernel.org>; Wed,  7 Sep 2022 16:04:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229767AbiIGQEm (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 7 Sep 2022 12:04:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229889AbiIGQEL (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 7 Sep 2022 12:04:11 -0400
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3B30BBA73
        for <linux-clk@vger.kernel.org>; Wed,  7 Sep 2022 09:02:50 -0700 (PDT)
Received: by mail-pl1-x634.google.com with SMTP id jm11so14987257plb.13
        for <linux-clk@vger.kernel.org>; Wed, 07 Sep 2022 09:02:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=edgeble-ai.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=/8rl6gokx88Kuf6qcH/eMq1owuxgLHmqVncOwj3PuLg=;
        b=YSOnNkg3Uj6/xVTKMm8VlwSDo9BWyHe8bNAOm8UjOhfy5K22RhPCT+IK93C7tR8b4C
         gGipp/JY0hmtmU+jO/UmviIc0F/nl0oF/19dNDIQ0H+Y4hBETh8b04UScMhwRveQPMWr
         OHuZdryZpsJL9qUkQ3+zBmQY/mp8FZW1rziFWf8MhMH2SobpRgrJS5QSdCeLE8Bgyeza
         upmjp8YRDsxE87+0SUEWBTY66E9cBOhUM5Pr/S0qK14IAMI6A0m0WZVW1OcyzaRxcvia
         6chlFvUiV1+HEAi2aOi3soVZiIpjJ9fMwCEoRPC78Rihmf84/VRlzGy1RLZyvy0UzQRN
         MIrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=/8rl6gokx88Kuf6qcH/eMq1owuxgLHmqVncOwj3PuLg=;
        b=L+AUKsSyCwT2cccnw6U4lijIbVzoNLrIlLFF+rpOuCaxfdDtZM04ecp1zrUjofq2PP
         2ofQjpHD5g5vVPKcTWZPEwmHNiv2Ix+isUANTbbGLu38G2nfMO9+B06ToCP01hk/LgpF
         eQuVspQZdlfahZ0Yu2zhGrAm76Ppc2VT/YgkUJrAkPSoXTjdF1IcJTjuBbhKtfshI9In
         q63IBr2XuvT7N6yN2v/ansBIVpbJDuTZ1kJQtBLAzxQ1ln1h73+fI3chyd9dA4T3WLu2
         66PrGPPwWpBbRIw3UuQSYuQIx5mULErkkurWMCti459sIHJH0JPsARaOmhZ4cx2qvIKQ
         KLxw==
X-Gm-Message-State: ACgBeo2/298bvr6+IpsazEYzLvRS0HAMC4wwIxZxWx07d7SYKyWjhiqt
        JN0OJ9kLDpv0DAsjQLdNq2afSg==
X-Google-Smtp-Source: AA6agR7O4dt+QfLaTyngTlSpQ1y5IWYzNnAmowN62Ei2fgaeYMZ6E5sAlfhPbzYtvB41SjqhvkB7+w==
X-Received: by 2002:a17:903:516:b0:176:6c04:f15e with SMTP id jn22-20020a170903051600b001766c04f15emr4387178plb.93.1662566563854;
        Wed, 07 Sep 2022 09:02:43 -0700 (PDT)
Received: from localhost.localdomain ([23.27.44.184])
        by smtp.gmail.com with ESMTPSA id x13-20020a17090a1f8d00b001f510175984sm14919719pja.41.2022.09.07.09.02.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Sep 2022 09:02:43 -0700 (PDT)
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
Subject: [PATCH v4 04/13] dt-bindings: clock: rockchip: Document RV1126 CRU
Date:   Wed,  7 Sep 2022 21:31:58 +0530
Message-Id: <20220907160207.3845791-5-jagan@edgeble.ai>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220907160207.3845791-1-jagan@edgeble.ai>
References: <20220907160207.3845791-1-jagan@edgeble.ai>
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
Changes for v4:
- rebase on -next 
Changes for v3:
- none
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

