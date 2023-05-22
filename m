Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23CF4C7EE29
	for <linux-clk@archiver.kernel.org>; Mon, 22 May 2023 06:32:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230357AbjEVGcX (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 22 May 2023 02:32:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229621AbjEVGcW (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 22 May 2023 02:32:22 -0400
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9982CF;
        Sun, 21 May 2023 23:32:17 -0700 (PDT)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 34M6Vwcl087174;
        Mon, 22 May 2023 01:31:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1684737118;
        bh=Y1PgBFAW58oQQelrLWGs2ihl4Rz/2sGaWxADqzqTSGU=;
        h=From:Subject:Date:To:CC;
        b=L1TV4L3zw4Bs6wZFDIPS/7eC0hB/RaviAvzD0mI3pAThPQpwnRrAujSLbbLdHvsit
         YcXhFPLIOu9MGeq72RN3L7dTLQL1frC8CcHbzvvLDhTiyrpabXn3iiuBrkvOi7S0cs
         R9AfnGGRB/xVMgn6os/SvglgrpwNagXB23FebX7g=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 34M6VweZ027528
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 22 May 2023 01:31:58 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 22
 May 2023 01:31:58 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 22 May 2023 01:31:58 -0500
Received: from localhost (ileaxei01-snat.itg.ti.com [10.180.69.5])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 34M6VvXb086761;
        Mon, 22 May 2023 01:31:58 -0500
From:   Jai Luthra <j-luthra@ti.com>
Subject: [PATCH v2 0/2] clk: keystone: syscon-clk: Enable audio reference
 clock
Date:   Mon, 22 May 2023 12:01:54 +0530
Message-ID: <20230515-refclk-v2-0-fc9ff08826f5@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFoMa2QC/2WNyw6CMBBFf4XM2po+fbDyPwwLaAeZqK1pCcGQ/
 rstW5fn5uTcDRJGwgRts0HEhRIFX0AeGrBT7x/IyBUGyaXiRhgWcbSvJzOD0dopoa1UUOShT8i
 G2Hs7Vd3jOtf5U3Ra9/69KzxRmkP87neLqOtfeRGMM4OX68iFO52Vus10tOENXc75BypTDkuwA
 AAA
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Santosh Shilimkar <ssantosh@kernel.org>
CC:     Vignesh Raghavendra <vigneshr@ti.com>, Andrew Davis <afd@ti.com>,
        <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Jai Luthra <j-luthra@ti.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2633; i=j-luthra@ti.com;
 h=from:subject:message-id; bh=00+PDpG4Jh6Ip7rfWxUl0DcfQvjrKR/hkRa7/qnO7QY=;
 b=owEBbQKS/ZANAwAIAUPekfkkmnFFAcsmYgBkawxbG16yp1rV4j7+lfvIbmXvUHA3Kg9cA3QcM
 SsXiQhv+hCJAjMEAAEIAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCZGsMWwAKCRBD3pH5JJpx
 Rf5REAC5+mNi8dliL12u8XTdPamsw72iVxGm2JblwiDvBw5acWQnWZnHnkE9IkwMrQd8ClSlgBI
 zWPXCstQqylbVElX2llbgs8I9KuXjkb2mHvTXsiFaQSlKJJCabsy7A0qVlsk6mf/09DMb6AKVCv
 T6OwTGIOFta74gzsHEu7wOFDzGVQXynVbXa5HPYwogx/CNwBdl/k/h1qbbpw8LVunW5wXz5qRxs
 6jsXMAn02mABr+jmS38Unk6TSeFB9+rL2ySl1TNK+Ak/Pgh4zRrDe8NZ72Vdt0waQgys+SBhWuj
 1QlYs2/EJaQGZJFIqImj82yj6QwyBOJ1EAb8ec2Kd5tcxUTjmKDJUz0SwGuK98rOHg/x5cbOeOn
 mS/BOUVVRMnf57TzS8bcXUZTTtjVM1/ffz/ADMeXYcDlaxaIPRa3RfAi5ilTKENu0mFtLJ8MMG4
 9EtpsT7NRf6L3ozFeVJJJU5+Szuu7g/FW7JyvJbcr9P7u7j1bgurRvvDTS/q3unzUdYQXrVXRcz
 2ELTuSGZ/oDSIIT9qT4ptdxQRxLkrh9HTe9mDQmCqHDdO9Vf2IhPsObs+T8AmZIITC5TtMImNQR
 xPl5Gb2ltbYPxGgd1IDRGnkEtouUXaQfMILWU36ba6CrGzqLao9HedNU04/k9npqjQdlcnaywDM
 GhXAGk2vT5oK0QQ==
X-Developer-Key: i=j-luthra@ti.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

TI's AM62 SoC can optionally provide two audio reference clocks
(AUDIO_REFCLKx) to external peripherals. By default the reference clock
is looped-back inside the SoC to a mux that goes to McASP AHCLK, but can
optionally be enabled as an output to peripherals outside the SoC by
setting a bit through CTRL_MMR registers.

This patch series extends the existing syscon-clk driver to support
the audio reference clock, and also adds new device tree bindings
documentation.

Please apply this on-top-of Andrew's series [1] removing the unnecessary
dependency on syscon compatible.

Signed-off-by: Jai Luthra <j-luthra@ti.com>
---
Changes in v2:
- Removed "syscon" compatible and rebased on top of [1]
- Moved reg above other properties in bindings yaml
- Link to v1: https://lore.kernel.org/r/20230515-refclk-v1-0-5e89f01d6733@ti.com

[1]: https://lore.kernel.org/linux-clk/20230516184626.154892-1-afd@ti.com/#t

Range-diff from v1:
1:  8107cb140f7d ! 1:  a690c2044971 dt-bindings: clock: Add binding documentation for TI Audio REFCLK
    @@ Documentation/devicetree/bindings/clock/ti,am62-audio-refclk.yaml (new)
     +  compatible:
     +    items:
     +      - const: ti,am62-audio-refclk
    -+      - const: syscon
    -+
    -+  "#clock-cells":
    -+    const: 0
     +
     +  reg:
     +    maxItems: 1
     +
    ++  "#clock-cells":
    ++    const: 0
    ++
     +  clocks:
     +    maxItems: 1
     +
     +required:
     +  - compatible
    -+  - "#clock-cells"
     +  - reg
    ++  - "#clock-cells"
     +  - clocks
     +
     +additionalProperties: false
    @@ Documentation/devicetree/bindings/clock/ti,am62-audio-refclk.yaml (new)
     +examples:
     +  - |
     +    audio_refclk0: clock@82e0 {
    -+        compatible = "ti,am62-audio-refclk", "syscon";
    ++        compatible = "ti,am62-audio-refclk";
     +        reg = <0x82e0 0x4>;
     +        clocks = <&k3_clks 157 0>;
     +        assigned-clocks = <&k3_clks 157 0>;
2:  5a555757fe42 = 2:  854166d4305f clk: keystone: syscon-clk: Add support for audio refclk

---
Jai Luthra (2):
      dt-bindings: clock: Add binding documentation for TI Audio REFCLK
      clk: keystone: syscon-clk: Add support for audio refclk

 .../bindings/clock/ti,am62-audio-refclk.yaml       | 43 ++++++++++++++++++++++
 drivers/clk/keystone/syscon-clk.c                  | 43 +++++++++++++++++++---
 2 files changed, 81 insertions(+), 5 deletions(-)
---
base-commit: 62f117ff3cbc8ea2bf9be36f019eba60369b6a81
change-id: 20230515-refclk-5b544d314c23

Best regards,
-- 
Jai Luthra <j-luthra@ti.com>

