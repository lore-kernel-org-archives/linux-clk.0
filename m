Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66D50C433EF
	for <linux-clk@archiver.kernel.org>; Tue, 15 Mar 2022 19:13:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350788AbiCOTOZ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 15 Mar 2022 15:14:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349362AbiCOTOX (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 15 Mar 2022 15:14:23 -0400
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FF77E06;
        Tue, 15 Mar 2022 12:13:05 -0700 (PDT)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 3C72AC0007;
        Tue, 15 Mar 2022 19:13:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1647371584;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=NUnsQ1oGbmfdJo7lE8MZSfdAsUjuXHnI++Iru8elyKw=;
        b=YCSKWaj39H0p1UYqPcM0Nit9WVuy1AlNuApJU3v518F7NNf88lTQgvCI2fmLOFAl9adFFT
        m255PRrwtWnPTFxVk/p7qFRyFOjCB9vKWo7TiIxQvxbfiphCfAuodZ3eL49n3IIRYRZgpi
        urqPtUYVPCPDAzI5LulgrFNCzpZkTwrnb7wjzVk/ZgPJZY0m3DU9OB7/U8AR/eXJ5bGZYn
        n/wsJhbWfkEGwE4hx8cdJ6eawGSv3B//uIfkHKvnpdaj7fZiG0lXFo7P4EeWQkrcOxPyNi
        mEhcjApVSPFRYjvEM40hrcE27iuy9J8tiQF1OqK9oMcbe5aCgMBwSFIGyVhZaA==
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     linux-renesas-soc@vger.kernel.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Gareth Williams <gareth.williams.jx@renesas.com>,
        Phil Edworthy <phil.edworthy@renesas.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
        dmaengine@vger.kernel.org
Cc:     Milan Stevanovic <milan.stevanovic@se.com>,
        Jimmy Lalande <jimmy.lalande@se.com>,
        Pascal Eberhard <pascal.eberhard@se.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Herve Codina <herve.codina@bootlin.com>,
        Clement Leger <clement.leger@bootlin.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Viresh Kumar <vireshk@kernel.org>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v5 2/8] dt-bindings: clock: r9a06g032-sysctrl: Reference the DMAMUX subnode
Date:   Tue, 15 Mar 2022 20:12:49 +0100
Message-Id: <20220315191255.221473-3-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220315191255.221473-1-miquel.raynal@bootlin.com>
References: <20220315191255.221473-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

This system controller contains several registers that have nothing to
do with the clock handling, like the DMA mux register. Describe this
part of the system controller as a subnode.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../bindings/clock/renesas,r9a06g032-sysctrl.yaml     | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/renesas,r9a06g032-sysctrl.yaml b/Documentation/devicetree/bindings/clock/renesas,r9a06g032-sysctrl.yaml
index 25dbb0fac065..95bf485c6cec 100644
--- a/Documentation/devicetree/bindings/clock/renesas,r9a06g032-sysctrl.yaml
+++ b/Documentation/devicetree/bindings/clock/renesas,r9a06g032-sysctrl.yaml
@@ -39,6 +39,17 @@ properties:
   '#power-domain-cells':
     const: 0
 
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 1
+
+patternProperties:
+  "^dma-router@[a-f0-9]+$":
+    type: object
+    $ref: "../dma/renesas,rzn1-dmamux.yaml#"
+
 required:
   - compatible
   - reg
-- 
2.27.0

