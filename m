Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F95BC433FE
	for <linux-clk@archiver.kernel.org>; Tue, 22 Feb 2022 10:35:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231244AbiBVKfY (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 22 Feb 2022 05:35:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230376AbiBVKfX (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 22 Feb 2022 05:35:23 -0500
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46E0115B3D3;
        Tue, 22 Feb 2022 02:34:57 -0800 (PST)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 18186FF808;
        Tue, 22 Feb 2022 10:34:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1645526096;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=O08Pcry/HWi2NEFBE62QX3hMBX74lPRjsdrIBYgSiTU=;
        b=pwq/Lza+I6j2V/lroXmmB3SPXTxbWWGLIDMLN/QY3/PAcjJ/QOQS/6PiFsiXyKDukbbUfp
        0niL7J2m9fQkUH90F5yBZblNU4K7QAOzVzVJHfmhgnACEPGvE9lktrSrtaJB+ecoXtuLtl
        M/24lngGNn0/ILhoKzNqcjq7zcHFWEOzeeZ9pKjwzILKRILeqwoJDG0BRB5osRpHoMKQ62
        94qxHSbonoh8KIUoD2FxbFaE3o7uBMFqUrlCfhD4LSgKZ9J28dNO9udFyLqoo6fNaQncuh
        IzRpoOQ4wKBN2yiJvuuRwmq496WqgH5al4b8aEWH5FhbllTVxJNSw2amAyXkeA==
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Vinod Koul <vkoul@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     dmaengine@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Gareth Williams <gareth.williams.jx@renesas.com>,
        Phil Edworthy <phil.edworthy@renesas.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Milan Stevanovic <milan.stevanovic@se.com>,
        Jimmy Lalande <jimmy.lalande@se.com>,
        Pascal Eberhard <pascal.eberhard@se.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v2 2/8] dt-bindings: dma: Introduce RZN1 DMA compatible
Date:   Tue, 22 Feb 2022 11:34:31 +0100
Message-Id: <20220222103437.194779-3-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220222103437.194779-1-miquel.raynal@bootlin.com>
References: <20220222103437.194779-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Just like for the NAND controller that is also on this SoC, let's
provide a SoC generic and a more specific couple of compatibles for the
DMA controller.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 .../devicetree/bindings/dma/snps,dma-spear1340.yaml       | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/dma/snps,dma-spear1340.yaml b/Documentation/devicetree/bindings/dma/snps,dma-spear1340.yaml
index 6b35089ac017..c13649bf7f19 100644
--- a/Documentation/devicetree/bindings/dma/snps,dma-spear1340.yaml
+++ b/Documentation/devicetree/bindings/dma/snps,dma-spear1340.yaml
@@ -15,7 +15,13 @@ allOf:
 
 properties:
   compatible:
-    const: snps,dma-spear1340
+    oneOf:
+      - const: snps,dma-spear1340
+      - items:
+          - enum:
+              - renesas,r9a06g032-dma
+          - const: renesas,rzn1-dma
+
 
   "#dma-cells":
     minimum: 3
-- 
2.27.0

