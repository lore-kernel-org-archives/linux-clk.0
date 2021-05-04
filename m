Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCA67C43616
	for <linux-clk@archiver.kernel.org>; Tue,  4 May 2021 11:00:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A73A0613C4
	for <linux-clk@archiver.kernel.org>; Tue,  4 May 2021 11:00:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230296AbhEDLBj (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 4 May 2021 07:01:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230301AbhEDLBa (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 4 May 2021 07:01:30 -0400
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A30DC06134A
        for <linux-clk@vger.kernel.org>; Tue,  4 May 2021 04:00:30 -0700 (PDT)
Received: by mail-pf1-x42a.google.com with SMTP id q2so7021352pfh.13
        for <linux-clk@vger.kernel.org>; Tue, 04 May 2021 04:00:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=aI2FFkU7bKDlqiGKTRTWAsuX6TrWHQzdkpcCP9dXjH0=;
        b=Sg8M03GFxXoFa6ZRrsk+AZdY2lSccYkyd4+CvMjoBiTmGv75ZxVUH8OgK2cRnlkl0l
         HevF/AEHrpkpI1UQauNdBisrHjzvc2PKtqZMFVqrcnv5M91sgPyqi9rfTmLJGFUNnWbL
         P+rgyBwUTersXaXTD6Q3ivqtXmx6gY/C8ZXHTpFI+1AphUoWrlGvaYu1/Mb71PGBjoqR
         pR0H024TRql1Hsys/H5jmlp0SxZst/eRMUq5O1DjzvN6eXg8CMucN0/yBIkG7vQlDt06
         3L/zbSxTR4O0qPeO+qf64biD34PmpYoKfbbVQkFI6iXcA0dwFV1KErHkxrq6QULY9BNn
         bIRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=aI2FFkU7bKDlqiGKTRTWAsuX6TrWHQzdkpcCP9dXjH0=;
        b=qylC6dp7/bfYa+ZgmpVfYPkclXgd+1BGDASyIrxFJpjLbo9U8j4Itl8sobu2UW4XYZ
         98S+IOSRfDtiHnEKH548inewdQj/ZWLO2ZraPetfwP8qklXDUy0j5i5hzFQtMEl6+nm4
         fTSs910ojCmt1I8QoU02HhTRRgVwOR+DR71Dyf93DU8BlQIbFbOpyNK1s76p2dS1sV1p
         QMflsC3zM3UYhVIDNfBbdhVn+WCS5tFpPvgRDeLxSStJZL9AJpjn7vzGOhwjmBOW6GBa
         XVafIDWhvkNlAPMS5BqSO6lRaXZ3mZdTMm3ykb1HCw0TrlLif/MY97vUn91AinKE5ZTT
         i11A==
X-Gm-Message-State: AOAM531Zd5KKj+m5a35P2gEPfbrWHMHMH9YCiUUk4psex+hmlQnmFQRF
        GzRd9GlzOKcwcVmcrpTDr+JLIWu9+RbpAw==
X-Google-Smtp-Source: ABdhPJwcF40iyxqw/l7otHDmJuinh4gdTSc3PnmBCLnz7T0BE/TlGgIzO1udGUgiFc7SwpudWeAk1Q==
X-Received: by 2002:a63:da55:: with SMTP id l21mr22515119pgj.188.1620126029661;
        Tue, 04 May 2021 04:00:29 -0700 (PDT)
Received: from hsinchu02.internal.sifive.com (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
        by smtp.gmail.com with ESMTPSA id k17sm11762529pfa.68.2021.05.04.04.00.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 May 2021 04:00:29 -0700 (PDT)
From:   Greentime Hu <greentime.hu@sifive.com>
To:     greentime.hu@sifive.com, paul.walmsley@sifive.com, hes@sifive.com,
        erik.danie@sifive.com, zong.li@sifive.com, bhelgaas@google.com,
        robh+dt@kernel.org, aou@eecs.berkeley.edu, mturquette@baylibre.com,
        sboyd@kernel.org, lorenzo.pieralisi@arm.com,
        p.zabel@pengutronix.de, alex.dewar90@gmail.com,
        khilman@baylibre.com, hayashi.kunihiko@socionext.com,
        vidyas@nvidia.com, jh80.chung@samsung.com,
        linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, helgaas@kernel.org
Cc:     Rob Herring <robh@kernel.org>
Subject: [PATCH v6 4/6] dt-bindings: PCI: Add SiFive FU740 PCIe host controller
Date:   Tue,  4 May 2021 18:59:38 +0800
Message-Id: <20210504105940.100004-5-greentime.hu@sifive.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210504105940.100004-1-greentime.hu@sifive.com>
References: <20210504105940.100004-1-greentime.hu@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add PCIe host controller DT bindings of SiFive FU740.

Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../bindings/pci/sifive,fu740-pcie.yaml       | 113 ++++++++++++++++++
 1 file changed, 113 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pci/sifive,fu740-pcie.yaml

diff --git a/Documentation/devicetree/bindings/pci/sifive,fu740-pcie.yaml b/Documentation/devicetree/bindings/pci/sifive,fu740-pcie.yaml
new file mode 100644
index 000000000000..b03cbb9b6602
--- /dev/null
+++ b/Documentation/devicetree/bindings/pci/sifive,fu740-pcie.yaml
@@ -0,0 +1,113 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pci/sifive,fu740-pcie.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: SiFive FU740 PCIe host controller
+
+description: |+
+  SiFive FU740 PCIe host controller is based on the Synopsys DesignWare
+  PCI core. It shares common features with the PCIe DesignWare core and
+  inherits common properties defined in
+  Documentation/devicetree/bindings/pci/designware-pcie.txt.
+
+maintainers:
+  - Paul Walmsley <paul.walmsley@sifive.com>
+  - Greentime Hu <greentime.hu@sifive.com>
+
+allOf:
+  - $ref: /schemas/pci/pci-bus.yaml#
+
+properties:
+  compatible:
+    const: sifive,fu740-pcie
+
+  reg:
+    maxItems: 3
+
+  reg-names:
+    items:
+      - const: dbi
+      - const: config
+      - const: mgmt
+
+  num-lanes:
+    const: 8
+
+  msi-parent: true
+
+  interrupt-names:
+    items:
+      - const: msi
+      - const: inta
+      - const: intb
+      - const: intc
+      - const: intd
+
+  resets:
+    description: A phandle to the PCIe power up reset line.
+    maxItems: 1
+
+  pwren-gpios:
+    description: Should specify the GPIO for controlling the PCI bus device power on.
+    maxItems: 1
+
+  reset-gpios:
+    maxItems: 1
+
+required:
+  - dma-coherent
+  - num-lanes
+  - interrupts
+  - interrupt-names
+  - interrupt-parent
+  - interrupt-map-mask
+  - interrupt-map
+  - clock-names
+  - clocks
+  - resets
+  - pwren-gpios
+  - reset-gpios
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    bus {
+        #address-cells = <2>;
+        #size-cells = <2>;
+        #include <dt-bindings/clock/sifive-fu740-prci.h>
+
+        pcie@e00000000 {
+            compatible = "sifive,fu740-pcie";
+            #address-cells = <3>;
+            #size-cells = <2>;
+            #interrupt-cells = <1>;
+            reg = <0xe 0x00000000 0x0 0x80000000>,
+                  <0xd 0xf0000000 0x0 0x10000000>,
+                  <0x0 0x100d0000 0x0 0x1000>;
+            reg-names = "dbi", "config", "mgmt";
+            device_type = "pci";
+            dma-coherent;
+            bus-range = <0x0 0xff>;
+            ranges = <0x81000000  0x0 0x60080000  0x0 0x60080000 0x0 0x10000>,      /* I/O */
+                     <0x82000000  0x0 0x60090000  0x0 0x60090000 0x0 0xff70000>,    /* mem */
+                     <0x82000000  0x0 0x70000000  0x0 0x70000000 0x0 0x1000000>,    /* mem */
+                     <0xc3000000 0x20 0x00000000 0x20 0x00000000 0x20 0x00000000>;  /* mem prefetchable */
+            num-lanes = <0x8>;
+            interrupts = <56>, <57>, <58>, <59>, <60>, <61>, <62>, <63>, <64>;
+            interrupt-names = "msi", "inta", "intb", "intc", "intd";
+            interrupt-parent = <&plic0>;
+            interrupt-map-mask = <0x0 0x0 0x0 0x7>;
+            interrupt-map = <0x0 0x0 0x0 0x1 &plic0 57>,
+                            <0x0 0x0 0x0 0x2 &plic0 58>,
+                            <0x0 0x0 0x0 0x3 &plic0 59>,
+                            <0x0 0x0 0x0 0x4 &plic0 60>;
+            clock-names = "pcie_aux";
+            clocks = <&prci PRCI_CLK_PCIE_AUX>;
+            resets = <&prci 4>;
+            pwren-gpios = <&gpio 5 0>;
+            reset-gpios = <&gpio 8 0>;
+        };
+    };
-- 
2.31.1

