Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F006EB64D9
	for <linux-clk@archiver.kernel.org>; Thu, 15 Jun 2023 12:02:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239781AbjFOMCN (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 15 Jun 2023 08:02:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344696AbjFOMBv (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 15 Jun 2023 08:01:51 -0400
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CB08E52;
        Thu, 15 Jun 2023 04:56:58 -0700 (PDT)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 35FBuem5086483;
        Thu, 15 Jun 2023 06:56:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1686830200;
        bh=Y27RJj3yszHtLyCh3vYh0g20X3ByJgQ1zU9XnvH+7Ow=;
        h=From:Subject:Date:To:CC;
        b=X7PTVndLQAzcs9MLcT6mNHyP70z+qykn0KqBUZvCLaTHcmDn7uH6CjEIbNIABalh+
         cygLzdAROXxdG0wGGuIVUnVCxG3E9T/mmejq/Ix8UhphT29oBEqAP/WJRB5GjzospK
         tgzh1m2PtS9hhZSVx+TIRHdoopNjACHavwm6TWNI=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 35FBue5G061479
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 15 Jun 2023 06:56:40 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 15
 Jun 2023 06:56:40 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 15 Jun 2023 06:56:40 -0500
Received: from localhost (ileaxei01-snat.itg.ti.com [10.180.69.5])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 35FBudBt001989;
        Thu, 15 Jun 2023 06:56:39 -0500
From:   Jai Luthra <j-luthra@ti.com>
Subject: [PATCH v3 0/2] clk: keystone: syscon-clk: Enable audio reference
 clock
Date:   Thu, 15 Jun 2023 17:25:34 +0530
Message-ID: <20230515-refclk-v3-0-37c0b550f406@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADb8imQC/22Nyw6CMBREf4XctTV9UARW/odxAeVWbtRiWtJgC
 P9uy8KNLmdyzswKAT1hgLZYwWOkQJNLQR0KMGPnbshoSBkkl4proZlHax53pntdloMSpZEKEtx
 3AVnvO2fGjDtc5ly/Ek7Lvn+5pjxSmCf/3u+iyO3PchSMM411Y7kYqpNS55mOZnpC9qP878jkW
 NNYy+taVlZ/nW3bPpc3jSPkAAAA
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Santosh Shilimkar <ssantosh@kernel.org>
CC:     Vignesh Raghavendra <vigneshr@ti.com>, Andrew Davis <afd@ti.com>,
        <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Jai Luthra <j-luthra@ti.com>,
        Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2803; i=j-luthra@ti.com;
 h=from:subject:message-id; bh=j7zSCgLQaqYgF9rUDBIsU7CuO/e6GSmhn3f0zKGfBcs=;
 b=owEBbQKS/ZANAwAIAUPekfkkmnFFAcsmYgBkivx0lm74zAwEj58V3R8xvh1zhEqAPaTBihHa2
 MsMOu+rA3+JAjMEAAEIAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCZIr8dAAKCRBD3pH5JJpx
 RYWbEACAbzyNyDvq6ZqyGN7xsgXsybKd0JmTPszH68jrGzeTLYpgfKFQ3M/i+LvF4iakmJ6WBBs
 Vb8HwtboaP4ws2QzXnpUBxNYkrcso/PMtjFM+7v/jPfkMl4lzcb/sQ9mPbUIevP1ZTASlE1q8iR
 YPNGzYexprCkv+XMr5LbFUrQH7QeVp3j9vrg6U4cyHzWi+pmtuGHj8GINXi03WaY+8GVvGbHSL9
 pmMC6wCCRGQhdHy1ITETtj7gFrBGjX5nbJMUUpcyjLQtP8Sy3DBVwlCIPjV5Nm8yz+F8zcyhFLz
 pWwF7aE39DLWiZexjIwkppcXfJlN5NB4A5iVq4nZVAXvoH1DEwpgVMKQMh1UeeQVyod16Pl+fxR
 ookEy0z+r4vG7oxq5LXB8YcSDYu+ItO4Rd/lfg5+Wv4KGqK0DHsMMN5FcWBiLXN/5g79Fs8T+xc
 PsN5oqccoNm4nPgiNhPAeQJ7eHXUMoLwYyO7srMas/iem1ffDhqMXzpwkoLJP/4muEczJ0vOX5m
 YCA4fSy9qoTQ550oIq7Hu3JpZjD0lGAIQl19LqWcFayPQLMqwAISCfkR5rptJIkublvi/g/C99S
 XOp0KwlXANre28BSQ+K31U/IZ8HyZeQOddmFchF907j+VROdJbnC6VSjmRs/tAHMPuP94Or/AHl
 y609N0pEejOJtaA==
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

[1]: https://lore.kernel.org/linux-clk/20230516184626.154892-1-afd@ti.com/#t

Signed-off-by: Jai Luthra <j-luthra@ti.com>
---
Changes in v3:
- Add missing headers for kasprintf/kfree in [PATCH 2/2]
- Add Conor's R-by for [PATCH 1/2]
- Link to v2: https://lore.kernel.org/r/20230515-refclk-v2-0-fc9ff08826f5@ti.com

Changes in v2:
- Removed "syscon" compatible and rebased on top of [1]
- Moved reg above other properties in bindings yaml
- Link to v1: https://lore.kernel.org/r/20230515-refclk-v1-0-5e89f01d6733@ti.com

Range diff from v2:
1:  f1bb6a34efce ! 1:  db84010f924d dt-bindings: clock: Add binding documentation for TI Audio REFCLK
    @@ Commit message
         Add DT bindings for TI's audio reference clocks (REFCLK) present on AM62
         SoC.

    +    Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
         Signed-off-by: Jai Luthra <j-luthra@ti.com>

      ## Documentation/devicetree/bindings/clock/ti,am62-audio-refclk.yaml (new) ##
2:  bb1b58178bbd ! 2:  06186242572b clk: keystone: syscon-clk: Add support for audio refclk
    @@ Commit message
         Signed-off-by: Jai Luthra <j-luthra@ti.com>

      ## drivers/clk/keystone/syscon-clk.c ##
    +@@
    +  */
    +
    + #include <linux/clk-provider.h>
    ++#include <linux/kernel.h>
    + #include <linux/mfd/syscon.h>
    + #include <linux/module.h>
    + #include <linux/platform_device.h>
    + #include <linux/regmap.h>
    ++#include <linux/slab.h>
    +
    + struct ti_syscon_gate_clk_priv {
    +   struct clk_hw hw;
     @@ drivers/clk/keystone/syscon-clk.c: static const struct clk_ops ti_syscon_gate_clk_ops = {

      static struct clk_hw

---
Jai Luthra (2):
      dt-bindings: clock: Add binding documentation for TI Audio REFCLK
      clk: keystone: syscon-clk: Add support for audio refclk

 .../bindings/clock/ti,am62-audio-refclk.yaml       | 43 +++++++++++++++++++++
 drivers/clk/keystone/syscon-clk.c                  | 45 +++++++++++++++++++---
 2 files changed, 83 insertions(+), 5 deletions(-)
---
base-commit: f9547f8abff52dfb21985057f10744558a7e4cc8
change-id: 20230515-refclk-5b544d314c23

Best regards,
-- 
Jai Luthra <j-luthra@ti.com>

