Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D951C433EF
	for <linux-clk@archiver.kernel.org>; Tue, 15 Feb 2022 08:39:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231894AbiBOIje (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 15 Feb 2022 03:39:34 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:35476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232532AbiBOIjd (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 15 Feb 2022 03:39:33 -0500
X-Greylist: delayed 140747 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 15 Feb 2022 00:39:23 PST
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39F4710074A;
        Tue, 15 Feb 2022 00:39:23 -0800 (PST)
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 083E3810EC;
        Tue, 15 Feb 2022 09:39:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1644914361;
        bh=BiR3VVqi5z2dvQ5k6McjZceVLl1xELIGmiCDeYlQc+U=;
        h=From:To:Cc:Subject:Date:From;
        b=MhJ+rnBnGttbDMsgt+hNhjfDBP37c6EBVqdnyAx0dMxPAmTB4zTLpldd+hM9Xweej
         T4Sl8otWaj2OLYtKfi0CXnZ+Q3mEwFfJbvzKmL8CNB354UQ74GqlSV44/yu+NMlS6A
         s1jiR9+xhFaqysvUQRi8+wKdyW+AKobjiQ45uy1Cv4xeuVqvs3soIz6T20bkPjuIxr
         Iv9m7I9bpPauWtEIxz7K/jgqwwpmh0QKyiuPYCbCPjq38WNkc9FBy0Ldn4fEdw8Hqe
         bXgUY7LP9DjpBr2cuLjXKQqbUDa+PB/M29CKdHq6/+h0O1I+MslQ381Jml/EDo5rbI
         QmI+14ejmnGRg==
From:   Marek Vasut <marex@denx.de>
To:     devicetree@vger.kernel.org
Cc:     Marek Vasut <marex@denx.de>, Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Subject: [PATCH] schemas: clock: Add protected-clock
Date:   Tue, 15 Feb 2022 09:39:09 +0100
Message-Id: <20220215083909.7693-1-marex@denx.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Some platforms or firmwares may not fully expose all the clocks to the OS, such
as in situations where those clks are used by drivers running in ARM secure
execution levels. Such a configuration can be specified in device tree with the
protected-clocks property in the form of a clock specifier list. This property should
only be specified in the node that is providing the clocks being protected:

```
clock-controller@a000f000 {
     compatible = "vendor,clk95;
     reg = <0xa000f000 0x1000>
     #clocks-cells = <1>;
     ...
     protected-clocks = <UART3_CLK>, <SPI5_CLK>;
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
index ae5a3bc..eada062 100644
--- a/dtschema/lib.py
+++ b/dtschema/lib.py
@@ -471,6 +471,8 @@ def fixup_node_props(schema):
         schema['properties']['assigned-clocks'] = True
         schema['properties']['assigned-clock-rates'] = True
         schema['properties']['assigned-clock-parents'] = True
+    if "clocks" in keys and "protected-clocks" not in keys:
+        schema['properties']['protected-clocks'] = True
 
 
 def extract_node_compatibles(schema):
diff --git a/dtschema/meta-schemas/clocks.yaml b/dtschema/meta-schemas/clocks.yaml
index facad30..9057a4f 100644
--- a/dtschema/meta-schemas/clocks.yaml
+++ b/dtschema/meta-schemas/clocks.yaml
@@ -21,6 +21,8 @@ properties:
     $ref: "cell.yaml#/array"
   assigned-clock-rates:
     $ref: "cell.yaml#/array"
+  protected-clocks:
+    $ref: "cell.yaml#/array"
 
   clock-frequency:
     $ref: "cell.yaml#/single"
@@ -35,3 +37,4 @@ dependentRequired:
   assigned-clocks: [clocks]
   assigned-clock-parents: [assigned-clocks]
   assigned-clock-rates: [assigned-clocks]
+  protected-clocks: [clocks]
diff --git a/dtschema/schemas/clock/clock.yaml b/dtschema/schemas/clock/clock.yaml
index a530f67..6e0f9d0 100644
--- a/dtschema/schemas/clock/clock.yaml
+++ b/dtschema/schemas/clock/clock.yaml
@@ -89,6 +89,8 @@ properties:
     $ref: "/schemas/types.yaml#/definitions/phandle-array"
   assigned-clock-rates:
     $ref: "/schemas/types.yaml#/definitions/uint32-array"
+  protected-clocks:
+    $ref: "/schemas/types.yaml#/definitions/phandle-array"
 
 dependencies:
   clock-names: [clocks]
@@ -98,5 +100,6 @@ dependencies:
   assigned-clocks: [clocks]
   assigned-clock-parents: [assigned-clocks]
   assigned-clock-rates: [assigned-clocks]
+  protected-clocks: [clocks]
 
 additionalProperties: true
-- 
2.34.1

