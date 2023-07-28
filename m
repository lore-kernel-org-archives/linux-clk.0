Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A4D6C001DE
	for <linux-clk@archiver.kernel.org>; Fri, 28 Jul 2023 10:24:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233454AbjG1KYs (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 28 Jul 2023 06:24:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235817AbjG1KYk (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 28 Jul 2023 06:24:40 -0400
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20998448C;
        Fri, 28 Jul 2023 03:24:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1690539851; x=1722075851;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ym71mCDBgh8iICftYfFYdM9thEa3xk0aEvdvtshyHAc=;
  b=BiWR3Mucv8kZfZKOvzhAVmj469zqtaG3MxN1yRw6frZJ3q5urtJMNQWO
   Y3V2OoRn9u/1/0KJ39ZOLAQxAL6rnmqmGW25GGGAM/MzKx76b0zE1IAHI
   kD3oOwC+5vuDmvTtgaX/Ogm04lNWs28u7i2IBQgtXKmLnKJU88oqy079G
   mv2bYTqTg79aMR+YLxhAWGBMUlKASPPTFQ8LDHlXdKQhAXiX6rSTluvZW
   JzgXJHUN8ad2gDo70pZcr+bBlbe4i1+OIOFEUicX8J49EExaMHfD1Xx+Y
   ZwbvJCq5Fl/oQsP47XqSy1vEQddo9CKdAGkjU+iBmAkqK5eWZWVXKSZ9B
   A==;
X-IronPort-AV: E=Sophos;i="6.01,237,1684825200"; 
   d="scan'208";a="238400817"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 28 Jul 2023 03:23:59 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 28 Jul 2023 03:23:58 -0700
Received: from che-lt-i67070.amer.actel.com (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.21 via Frontend Transport; Fri, 28 Jul 2023 03:23:54 -0700
From:   Varshini Rajendran <varshini.rajendran@microchip.com>
To:     <mturquette@baylibre.com>, <sboyd@kernel.org>,
        <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
        <conor+dt@kernel.org>, <nicolas.ferre@microchip.com>,
        <alexandre.belloni@bootlin.com>, <claudiu.beznea@microchip.com>,
        <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
CC:     <varshini.rajendran@microchip.com>
Subject: [PATCH v3 05/50] dt-bindings: clk: at91: add sam9x7 clock controller
Date:   Fri, 28 Jul 2023 15:53:50 +0530
Message-ID: <20230728102350.265520-1-varshini.rajendran@microchip.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add bindings for SAM9X7's pmc.

Signed-off-by: Varshini Rajendran <varshini.rajendran@microchip.com>
---
 .../devicetree/bindings/clock/atmel,at91rm9200-pmc.yaml          | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/clock/atmel,at91rm9200-pmc.yaml b/Documentation/devicetree/bindings/clock/atmel,at91rm9200-pmc.yaml
index c1bdcd9058ed..ce0d99503645 100644
--- a/Documentation/devicetree/bindings/clock/atmel,at91rm9200-pmc.yaml
+++ b/Documentation/devicetree/bindings/clock/atmel,at91rm9200-pmc.yaml
@@ -43,6 +43,7 @@ properties:
               - atmel,sama5d4-pmc
               - microchip,sam9x60-pmc
               - microchip,sama7g5-pmc
+              - microchip,sam9x7-pmc
           - const: syscon
 
   reg:
-- 
2.25.1

