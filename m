Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D0CDC433F5
	for <linux-clk@archiver.kernel.org>; Tue, 15 Feb 2022 08:45:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232815AbiBOIpp (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 15 Feb 2022 03:45:45 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:54896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231856AbiBOIpo (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 15 Feb 2022 03:45:44 -0500
Received: from phobos.denx.de (phobos.denx.de [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ACEFF111DFD;
        Tue, 15 Feb 2022 00:45:34 -0800 (PST)
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 38B35810EC;
        Tue, 15 Feb 2022 09:45:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1644914733;
        bh=r/esxbMcciUQzWxilvwKIGNa/vezBZby3xlsiRXgXZg=;
        h=From:To:Cc:Subject:Date:From;
        b=CV0Q+4wkoI3ieAr5fK4zLLQqDUlgyb50pnfu1lcMCVdHapBJ/dfoHhYszdPkL9raZ
         RtxbjJ05aACO1xtbqlCo0q+hU3ZvuSwxqkWEXP95C1QafTC+Pmprfv3aA6zP8KlVjM
         tn+nv9TP6SpASxUDoNhg/KvCLJRe3t5nKYPXuJAcELNnxO25YS/GfFSpd6nSGdZsQI
         7ilkiMTZlxVOaW6hehwn6PGFmdzCOvujwqKwYOqhdvAb+sl306k/CKx3OKKXvdOa+K
         nLaP3YL3vcte9/tesDB2ufG8GFP27muXvrGn3PXVBoMjXXiV7qYNRXyPRv7gwiST7h
         2CeB2Kys1QvTQ==
From:   Marek Vasut <marex@denx.de>
To:     devicetree@vger.kernel.org
Cc:     Marek Vasut <marex@denx.de>, Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Subject: [PATCH] schemas: clock: Add critical-clock
Date:   Tue, 15 Feb 2022 09:45:13 +0100
Message-Id: <20220215084513.8125-1-marex@denx.de>
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
allows listing clock which must never be turned off.

```
clock-controller@a000f000 {
     compatible = "vendor,clk95;
     reg = <0xa000f000 0x1000>
     #clocks-cells = <1>;
     ...
     critical-clocks = <UART3_CLK>, <SPI5_CLK>;
};
```

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org
To: devicetree@vger.kernel.org
---
 dtschema/lib.py                   | 2 ++
 dtschema/meta-schemas/clocks.yaml | 3 +++
 dtschema/schemas/clock/clock.yaml | 3 +++
 3 files changed, 8 insertions(+)

diff --git a/dtschema/lib.py b/dtschema/lib.py
index eada062..e74b7b9 100644
--- a/dtschema/lib.py
+++ b/dtschema/lib.py
@@ -471,6 +471,8 @@ def fixup_node_props(schema):
         schema['properties']['assigned-clocks'] = True
         schema['properties']['assigned-clock-rates'] = True
         schema['properties']['assigned-clock-parents'] = True
+    if "clocks" in keys and "critical-clocks" not in keys:
+        schema['properties']['critical-clocks'] = True
     if "clocks" in keys and "protected-clocks" not in keys:
         schema['properties']['protected-clocks'] = True
 
diff --git a/dtschema/meta-schemas/clocks.yaml b/dtschema/meta-schemas/clocks.yaml
index 9057a4f..1074f36 100644
--- a/dtschema/meta-schemas/clocks.yaml
+++ b/dtschema/meta-schemas/clocks.yaml
@@ -21,6 +21,8 @@ properties:
     $ref: "cell.yaml#/array"
   assigned-clock-rates:
     $ref: "cell.yaml#/array"
+  critical-clocks:
+    $ref: "cell.yaml#/array"
   protected-clocks:
     $ref: "cell.yaml#/array"
 
@@ -37,4 +39,5 @@ dependentRequired:
   assigned-clocks: [clocks]
   assigned-clock-parents: [assigned-clocks]
   assigned-clock-rates: [assigned-clocks]
+  critical-clocks: [clocks]
   protected-clocks: [clocks]
diff --git a/dtschema/schemas/clock/clock.yaml b/dtschema/schemas/clock/clock.yaml
index 6e0f9d0..7dbace4 100644
--- a/dtschema/schemas/clock/clock.yaml
+++ b/dtschema/schemas/clock/clock.yaml
@@ -89,6 +89,8 @@ properties:
     $ref: "/schemas/types.yaml#/definitions/phandle-array"
   assigned-clock-rates:
     $ref: "/schemas/types.yaml#/definitions/uint32-array"
+  critical-clocks:
+    $ref: "/schemas/types.yaml#/definitions/phandle-array"
   protected-clocks:
     $ref: "/schemas/types.yaml#/definitions/phandle-array"
 
@@ -100,6 +102,7 @@ dependencies:
   assigned-clocks: [clocks]
   assigned-clock-parents: [assigned-clocks]
   assigned-clock-rates: [assigned-clocks]
+  critical-clocks: [clocks]
   protected-clocks: [clocks]
 
 additionalProperties: true
-- 
2.34.1

