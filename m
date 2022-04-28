Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB792C433FE
	for <linux-clk@archiver.kernel.org>; Thu, 28 Apr 2022 11:03:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345313AbiD1LGQ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 28 Apr 2022 07:06:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345394AbiD1LGC (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 28 Apr 2022 07:06:02 -0400
Received: from phobos.denx.de (phobos.denx.de [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A7D8A27C1;
        Thu, 28 Apr 2022 04:01:32 -0700 (PDT)
Received: from tr.lan (ip-86-49-12-201.net.upcbroadband.cz [86.49.12.201])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id F359280331;
        Thu, 28 Apr 2022 13:01:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1651143690;
        bh=jM1KkY4bkFk5mF5H41NcAcbeK1bTxrtKp5mYpIDpesk=;
        h=From:To:Cc:Subject:Date:From;
        b=WYY3Ua2JTDXg4XWw/jCk4onSy64yMmY6hqV7MUXfPW64LiGtllYeYfaJ/l0lqcfNK
         nK/30GEraHHJZSpcTgxCqU5wGBKIeGv+Cz4mvOSeJsSK8Vz7Zp0uPyiIeIsHTeTqVV
         aZs6IWXoj6qUqFWucFJH6/YxfxtuBhBuH0EQOM75+rABGNOy7iiuYYov+1XKcgOoKd
         7D7Rphso0g/NaGK5tQ6llL5/wPJczQKug9VsGraFHk51XgILj4hu2n2IueDtD8IDzd
         yJN8SsYuWKHoZPWJBaXg4SAJEy5gu75LWXfqaVVc+IQDFkeBkHDlhOLhICMKhNsddG
         haZ8P5MbFxB7Q==
From:   Marek Vasut <marex@denx.de>
To:     linux-clk@vger.kernel.org
Cc:     Marek Vasut <marex@denx.de>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org
Subject: [RESEND][PATCH v2 1/2] dt-bindings: clk: Introduce 'critical-clocks' property
Date:   Thu, 28 Apr 2022 13:01:06 +0200
Message-Id: <20220428110107.149524-1-marex@denx.de>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Some platforms require select clock to be always running, e.g. because
those clock supply vital devices which are not otherwise attached to
the system and thus do not have a matching DT node and clock consumer.

An example is a system where the SoC serves as a crystal oscillator
replacement for a programmable logic device. The "critical-clocks"
property of a clock controller allows listing clock which must never
be turned off.

Clock listed in the "critical-clocks" property may have other consumers
in DT, listing the clock in "critical-clocks" only assures those clock
are never turned off, and none of these optional additional consumers
can turn the clock off either.

The implementation is modeled after "protected-clocks".

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: devicetree@vger.kernel.org
To: linux-clk@vger.kernel.org
---
V2: Update the commit message to clarify the behavior
---
 .../devicetree/bindings/clock/clock-bindings.txt | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/clock-bindings.txt b/Documentation/devicetree/bindings/clock/clock-bindings.txt
index f2ea53832ac6..975230e603d1 100644
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
+programmable logic device. The critical-clocks property of a clock controller
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
2.35.1

