Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 915ACC7618E
	for <linux-clk@archiver.kernel.org>; Wed, 26 Apr 2023 10:09:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240421AbjDZKJl (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 26 Apr 2023 06:09:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240398AbjDZKJf (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 26 Apr 2023 06:09:35 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id C8C8349F0;
        Wed, 26 Apr 2023 03:09:33 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.99,227,1677510000"; 
   d="scan'208";a="157361507"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 26 Apr 2023 19:09:33 +0900
Received: from renesas-ubuntu18.ree.adwin.renesas.com (unknown [10.226.93.103])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 1825A41ED0B0;
        Wed, 26 Apr 2023 19:09:28 +0900 (JST)
From:   Chris Paterson <chris.paterson2@renesas.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Chris Paterson <chris.paterson2@renesas.com>
Subject: [PATCH] dt-bindings: clock: r9a06g032-sysctrl: Change maintainer to Fabrizio Castro
Date:   Wed, 26 Apr 2023 11:09:25 +0100
Message-Id: <20230426100925.12063-1-chris.paterson2@renesas.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Gareth no longer works for Renesas.

Signed-off-by: Chris Paterson <chris.paterson2@renesas.com>
---
 .../devicetree/bindings/clock/renesas,r9a06g032-sysctrl.yaml    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/renesas,r9a06g032-sysctrl.yaml b/Documentation/devicetree/bindings/clock/renesas,r9a06g032-sysctrl.yaml
index 95bf485c6cec..99686085f751 100644
--- a/Documentation/devicetree/bindings/clock/renesas,r9a06g032-sysctrl.yaml
+++ b/Documentation/devicetree/bindings/clock/renesas,r9a06g032-sysctrl.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Renesas RZ/N1D (R9A06G032) System Controller
 
 maintainers:
-  - Gareth Williams <gareth.williams.jx@renesas.com>
+  - Fabrizio Castro <fabrizio.castro.jz@renesas.com>
   - Geert Uytterhoeven <geert+renesas@glider.be>
 
 properties:
-- 
2.40.0

