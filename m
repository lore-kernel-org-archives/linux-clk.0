Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68DF3C433F5
	for <linux-clk@archiver.kernel.org>; Wed, 16 Mar 2022 12:31:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237563AbiCPMcO (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 16 Mar 2022 08:32:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230190AbiCPMcN (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 16 Mar 2022 08:32:13 -0400
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21895BF78;
        Wed, 16 Mar 2022 05:30:58 -0700 (PDT)
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 4835782155;
        Wed, 16 Mar 2022 13:30:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1647433856;
        bh=8DLiq12+R+1W1A2dvx8Ymm+lSe/Df51pPYgzhPcT6nI=;
        h=From:To:Cc:Subject:Date:From;
        b=rgCtfRkUFuYOwdkX9/dEFkFcgmDn+WHfghlXYodnZ8SrFSMY1jx7C/V3fC7Bweptx
         NKuFMqGI+VCoskIGVLy/0ybj/B6r+QPInYOt6PTqoALxWLQw/HzWC+o1R29Tzj/Ve7
         j2GTSoXn30vGj9jww5NaK5bmJKX9oHIRzQqAlcR4kb2Ia6gKkvfgOswbD9WYIp40YU
         spXgDCVLuDpu+O0xTybMOgthWXA/tbwq1WHOk1/dWDZ5j706RxZ4GkRIJA3RxKyEse
         WT8KRHcF5p68sITpyeJmBu4jg3bZRxc8rpG1D0/0Hy9zLev9Ona2A9knoaJX8QuIkp
         FCvtATsoYnkGA==
From:   Marek Vasut <marex@denx.de>
To:     linux-clk@vger.kernel.org
Cc:     Marek Vasut <marex@denx.de>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org
Subject: [PATCH v2 1/2] dt-bindings: clk: Introduce 'critical-clocks' property
Date:   Wed, 16 Mar 2022 13:30:33 +0100
Message-Id: <20220316123034.13465-1-marex@denx.de>
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
index f2ea53832ac63..975230e603d12 100644
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

