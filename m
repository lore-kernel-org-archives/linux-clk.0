Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E998C433FE
	for <linux-clk@archiver.kernel.org>; Tue, 15 Feb 2022 08:44:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234612AbiBOIou (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 15 Feb 2022 03:44:50 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:53472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234596AbiBOIot (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 15 Feb 2022 03:44:49 -0500
Received: from phobos.denx.de (phobos.denx.de [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FD42111F88;
        Tue, 15 Feb 2022 00:44:40 -0800 (PST)
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id DCFF280F47;
        Tue, 15 Feb 2022 09:44:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1644914678;
        bh=pibTTjw3kBcqRPgO4XTGPBPhlKzmNPhhZZXTZVtS75g=;
        h=From:To:Cc:Subject:Date:From;
        b=XSbLL2KawJu9JITDnpyO4+geIdtMMzV8FpJTRmqwnSe95ME1s96PEaWIIvzcAsEYL
         L71a5DLGHSoHPDNXStR8NnZYZ1NKlWVeUiSR3QQXR+OzXS2c55CDmIk9HJ+Z09+4Gt
         l8hncF9qOUvqYNF/samQquxtmlgesa1ZShFyLUfHzhhiZ/5Fbjf4Awj3/onDXlnXUg
         CNP1AyzVxu41XpjKMn5Am6VXqXyK8JXiWfar8bPKxjeVj1g7c6v4taT2dJMcxmo/HP
         xZwIfcJa42LVnHuoN1jA2BWlB4aKJ+yoJI1PAAR1rH/qrog+JICI6VyyNMqPl81rc6
         E0qj/fmVdYAMA==
From:   Marek Vasut <marex@denx.de>
To:     linux-clk@vger.kernel.org
Cc:     Marek Vasut <marex@denx.de>,
        Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org,
        linux-power@fi.rohmeurope.com
Subject: [PATCH 1/3] dt-bindings: clk: Introduce 'critical-clocks' property
Date:   Tue, 15 Feb 2022 09:44:10 +0100
Message-Id: <20220215084412.8090-1-marex@denx.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Some platforms require clock to be always running, e.g. because those clock
supply devices which are not otherwise attached to the system. One example
is a system where the SoC serves as a crystal oscillator replacement for a
programmable logic device. The critical-clock property of a clock controller
allows listing clock which must never be turned off. The implementation here
is similar to "protected-clock".

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-power@fi.rohmeurope.com
To: linux-clk@vger.kernel.org
---
 .../devicetree/bindings/clock/clock-bindings.txt | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/clock-bindings.txt b/Documentation/devicetree/bindings/clock/clock-bindings.txt
index f2ea53832ac63..d9a783c35c5a1 100644
--- a/Documentation/devicetree/bindings/clock/clock-bindings.txt
+++ b/Documentation/devicetree/bindings/clock/clock-bindings.txt
@@ -169,6 +169,22 @@ a shared clock is forbidden.
 Configuration of common clocks, which affect multiple consumer devices can
 be similarly specified in the clock provider node.
 
+==Critical clocks==
+
+Some platforms require clock to be always running, e.g. because those clock
+supply devices which are not otherwise attached to the system. One example
+is a system where the SoC serves as a crystal oscillator replacement for a
+programmable logic device. The critical-clock property of a clock controller
+allows listing clock which must never be turned off.
+
+   clock-controller@a000f000 {
+        compatible = "vendor,clk95;
+        reg = <0xa000f000 0x1000>
+        #clocks-cells = <1>;
+        ...
+        critical-clocks = <UART3_CLK>, <SPI5_CLK>;
+   };
+
 ==Protected clocks==
 
 Some platforms or firmwares may not fully expose all the clocks to the OS, such
-- 
2.34.1

