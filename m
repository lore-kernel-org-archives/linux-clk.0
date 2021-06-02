Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21144C47092
	for <linux-clk@archiver.kernel.org>; Wed,  2 Jun 2021 00:15:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 05955613B4
	for <linux-clk@archiver.kernel.org>; Wed,  2 Jun 2021 00:15:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229471AbhFBAQu (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 1 Jun 2021 20:16:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229586AbhFBAQt (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 1 Jun 2021 20:16:49 -0400
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A12BC061574
        for <linux-clk@vger.kernel.org>; Tue,  1 Jun 2021 17:15:04 -0700 (PDT)
Received: by mail-pf1-x42c.google.com with SMTP id k15so790005pfp.6
        for <linux-clk@vger.kernel.org>; Tue, 01 Jun 2021 17:15:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nigauri-org.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ve25niUF9LLoE0nA88lyQGD82UiyWvJHn1XO4OjttlQ=;
        b=rQILG342WaKFSqsXPFIZPMzPmKUG2dH391enozJq3RQ+UrPxVUhBn+FnGWgCDQCMga
         DiYB17nAwlfhVbhL3XEvM/HdKoYpNz13UNqM7FKzfn2KgFuLC+7WxUJaT4SZcKrlEPZp
         y6vNDd7VvbBGGEbO15/0AVeX9hAcJa04DT1wPokN1cVaE8ZqQEe0u0L3cTKeqAIGqN7Y
         1ocv57Xs06zGlgkI4DZ337Tme0P/vKnMoI/R8bAroHoQzGGr1fIK03bVkQphhtqxmQmI
         BSp5JZZ/lt/3j2BGc0sxbzLEUkx10w9cT46sJLrE6qI+BlDwQ0h/YtQF8EqQvNXmMC37
         NATA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ve25niUF9LLoE0nA88lyQGD82UiyWvJHn1XO4OjttlQ=;
        b=pjOZz/bvdK4SOSJGNX6aIl6eCdYrs/yS8iuA95q42N9lE4VxmRjhmhxLP37zjjLwNA
         RzQ20qdU8VkbKhYuuHKCxPmyg8m132ZtQprzXEypaxWclQFIKHu+P0Gf88TAFcVRhBB8
         Yi+k90oUrQdGv8dIuqCntxDzrd1P5dH4DxkM1DOoS+rcla9Dzs97a2G9eRp5OiY/lGLm
         wiy/wL/AMbe786Uijul76mQ8szz+rlGEttF1MJ+6jBKjhToN/LZ+h+LiPnoNgYyR58va
         zl4s/xgX2SCewK4fEv4oroqxKKhoWJ9g1wYiFQwe1s2D+CnF2ECh9jxRyguQxGcYh9e6
         h+Lg==
X-Gm-Message-State: AOAM5307ZU5TOfAUDh1ccfaYO8wSybnI2NS9rVOB+lbZt3rK5T+SN5Xl
        Ugky4Gj85EnfiC8bVBRqbjug
X-Google-Smtp-Source: ABdhPJwQLAniCzxErWbDcwy7Wd13rfCF2vOq7Gps2oAPtjzn63EnP/8luZtLh1ipOOXCbKat1dOXBA==
X-Received: by 2002:a63:1e16:: with SMTP id e22mr5905887pge.140.1622592903894;
        Tue, 01 Jun 2021 17:15:03 -0700 (PDT)
Received: from localhost ([2405:6581:5360:1800:7285:c2ff:fec2:8f97])
        by smtp.gmail.com with ESMTPSA id o10sm14249857pfh.67.2021.06.01.17.15.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jun 2021 17:15:03 -0700 (PDT)
From:   Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Michal Simek <michal.simek@xilinx.com>
Cc:     linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
Subject: [PATCH v2] dt-bindings: clk: zynqmp: convert bindings to YAML
Date:   Wed,  2 Jun 2021 09:14:49 +0900
Message-Id: <20210602001449.780075-1-iwamatsu@nigauri.org>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Convert common clock for Xilinx Zynq MPSoC SoC bindings documentation
to YAML.

Signed-off-by: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
---

v2: Fix warning with DT_CHECKER_FLAGS=-m.

 .../bindings/clock/xlnx,zynqmp-clk.txt        |  63 ---------
 .../bindings/clock/xlnx,zynqmp-clk.yaml       |  63 +++++++++
 .../mailbox/xlnx,zynqmp-ipi-mailbox.txt       | 127 ------------------
 3 files changed, 63 insertions(+), 190 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/clock/xlnx,zynqmp-clk.txt
 create mode 100644 Documentation/devicetree/bindings/clock/xlnx,zynqmp-clk.yaml
 delete mode 100644 Documentation/devicetree/bindings/mailbox/xlnx,zynqmp-ipi-mailbox.txt

diff --git a/Documentation/devicetree/bindings/clock/xlnx,zynqmp-clk.txt b/Documentation/devicetree/bindings/clock/xlnx,zynqmp-clk.txt
deleted file mode 100644
index 391ee1a60bed4a..00000000000000
--- a/Documentation/devicetree/bindings/clock/xlnx,zynqmp-clk.txt
+++ /dev/null
@@ -1,63 +0,0 @@
---------------------------------------------------------------------------
-Device Tree Clock bindings for the Zynq Ultrascale+ MPSoC controlled using
-Zynq MPSoC firmware interface
---------------------------------------------------------------------------
-The clock controller is a h/w block of Zynq Ultrascale+ MPSoC clock
-tree. It reads required input clock frequencies from the devicetree and acts
-as clock provider for all clock consumers of PS clocks.
-
-See clock_bindings.txt for more information on the generic clock bindings.
-
-Required properties:
- - #clock-cells:	Must be 1
- - compatible:		Must contain:	"xlnx,zynqmp-clk"
- - clocks:		List of clock specifiers which are external input
-			clocks to the given clock controller. Please refer
-			the next section to find the input clocks for a
-			given controller.
- - clock-names:		List of clock names which are exteral input clocks
-			to the given clock controller. Please refer to the
-			clock bindings for more details.
-
-Input clocks for zynqmp Ultrascale+ clock controller:
-
-The Zynq UltraScale+ MPSoC has one primary and four alternative reference clock
-inputs. These required clock inputs are:
- - pss_ref_clk (PS reference clock)
- - video_clk (reference clock for video system )
- - pss_alt_ref_clk (alternative PS reference clock)
- - aux_ref_clk
- - gt_crx_ref_clk (transceiver reference clock)
-
-The following strings are optional parameters to the 'clock-names' property in
-order to provide an optional (E)MIO clock source:
- - swdt0_ext_clk
- - swdt1_ext_clk
- - gem0_emio_clk
- - gem1_emio_clk
- - gem2_emio_clk
- - gem3_emio_clk
- - mio_clk_XX		# with XX = 00..77
- - mio_clk_50_or_51	#for the mux clock to gem tsu from 50 or 51
-
-
-Output clocks are registered based on clock information received
-from firmware. Output clocks indexes are mentioned in
-include/dt-bindings/clock/xlnx-zynqmp-clk.h.
-
--------
-Example
--------
-
-firmware {
-	zynqmp_firmware: zynqmp-firmware {
-		compatible = "xlnx,zynqmp-firmware";
-		method = "smc";
-		zynqmp_clk: clock-controller {
-			#clock-cells = <1>;
-			compatible = "xlnx,zynqmp-clk";
-			clocks = <&pss_ref_clk>, <&video_clk>, <&pss_alt_ref_clk>, <&aux_ref_clk>, <&gt_crx_ref_clk>;
-			clock-names = "pss_ref_clk", "video_clk", "pss_alt_ref_clk","aux_ref_clk", "gt_crx_ref_clk";
-		};
-	};
-};
diff --git a/Documentation/devicetree/bindings/clock/xlnx,zynqmp-clk.yaml b/Documentation/devicetree/bindings/clock/xlnx,zynqmp-clk.yaml
new file mode 100644
index 00000000000000..e7a1384fb646e4
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/xlnx,zynqmp-clk.yaml
@@ -0,0 +1,63 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/xlnx,zynqmp-clk.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Xilinx Zynq Ultrascale+ MPSoC clock controller Device Tree Bindings
+
+maintainers:
+  - Michal Simek <michal.simek@xilinx.com>
+
+description: |
+  The clock controller is a h/w block of Zynq Ultrascale+ MPSoC clock
+  tree. It reads required input clock frequencies from the devicetree and acts
+  as clock provider for all clock consumers of PS clocks.
+
+properties:
+  compatible:
+    const: xlnx,zynqmp-clk
+
+  "#clock-cells":
+    const: 1
+
+  clocks:
+    description: |
+      List of clock specifiers which are external input
+      clocks to the given clock controller.
+    items:
+      - description: PS reference clock
+      - description: reference clock for video system
+      - description: alternative PS reference clock
+      - description: auxiliary reference clock
+      - description: transceiver reference clock
+
+  clock-names:
+    items:
+      - const: pss_ref_clk
+      - const: video_clk
+      - const: pss_alt_ref_clk
+      - const: aux_ref_clk
+      - const: gt_crx_ref_clk
+
+required:
+  - compatible
+  - "#clock-cells"
+  - clocks
+  - clock-names
+
+additionalProperties: false
+
+examples:
+  - |
+    firmware {
+      zynqmp_firmware: zynqmp-firmware {
+        zynqmp_clk: clock-controller {
+          #clock-cells = <1>;
+          compatible = "xlnx,zynqmp-clk";
+          clocks = <&pss_ref_clk>, <&video_clk>, <&pss_alt_ref_clk>, <&aux_ref_clk>, <&gt_crx_ref_clk>;
+          clock-names = "pss_ref_clk", "video_clk", "pss_alt_ref_clk","aux_ref_clk", "gt_crx_ref_clk";
+        };
+      };
+    };
+...
diff --git a/Documentation/devicetree/bindings/mailbox/xlnx,zynqmp-ipi-mailbox.txt b/Documentation/devicetree/bindings/mailbox/xlnx,zynqmp-ipi-mailbox.txt
deleted file mode 100644
index ad76edccf88166..00000000000000
--- a/Documentation/devicetree/bindings/mailbox/xlnx,zynqmp-ipi-mailbox.txt
+++ /dev/null
@@ -1,127 +0,0 @@
-Xilinx IPI Mailbox Controller
-========================================
-
-The Xilinx IPI(Inter Processor Interrupt) mailbox controller is to manage
-messaging between two Xilinx Zynq UltraScale+ MPSoC IPI agents. Each IPI
-agent owns registers used for notification and buffers for message.
-
-               +-------------------------------------+
-               | Xilinx ZynqMP IPI Controller        |
-               +-------------------------------------+
-    +--------------------------------------------------+
-ATF                    |                     |
-                       |                     |
-                       |                     |
-    +--------------------------+             |
-                       |                     |
-                       |                     |
-    +--------------------------------------------------+
-            +------------------------------------------+
-            |  +----------------+   +----------------+ |
-Hardware    |  |  IPI Agent     |   |  IPI Buffers   | |
-            |  |  Registers     |   |                | |
-            |  |                |   |                | |
-            |  +----------------+   +----------------+ |
-            |                                          |
-            | Xilinx IPI Agent Block                   |
-            +------------------------------------------+
-
-
-Controller Device Node:
-===========================
-Required properties:
---------------------
-IPI agent node:
-- compatible:		Shall be: "xlnx,zynqmp-ipi-mailbox"
-- interrupt-parent:	Phandle for the interrupt controller
-- interrupts:		Interrupt information corresponding to the
-			interrupt-names property.
-- xlnx,ipi-id:		local Xilinx IPI agent ID
-- #address-cells:	number of address cells of internal IPI mailbox nodes
-- #size-cells:		number of size cells of internal IPI mailbox nodes
-
-Internal IPI mailbox node:
-- reg:			IPI buffers address ranges
-- reg-names:		Names of the reg resources. It should have:
-			* local_request_region
-			  - IPI request msg buffer written by local and read
-			    by remote
-			* local_response_region
-			  - IPI response msg buffer written by local and read
-			    by remote
-			* remote_request_region
-			  - IPI request msg buffer written by remote and read
-			    by local
-			* remote_response_region
-			  - IPI response msg buffer written by remote and read
-			    by local
-- #mbox-cells:		Shall be 1. It contains:
-			* tx(0) or rx(1) channel
-- xlnx,ipi-id:		remote Xilinx IPI agent ID of which the mailbox is
-			connected to.
-
-Optional properties:
---------------------
-- method:              The method of accessing the IPI agent registers.
-                       Permitted values are: "smc" and "hvc". Default is
-                       "smc".
-
-Client Device Node:
-===========================
-Required properties:
---------------------
-- mboxes:		Standard property to specify a mailbox
-			(See ./mailbox.txt)
-- mbox-names:		List of identifier  strings for each mailbox
-			channel.
-
-Example:
-===========================
-	zynqmp_ipi {
-		compatible = "xlnx,zynqmp-ipi-mailbox";
-		interrupt-parent = <&gic>;
-		interrupts = <0 29 4>;
-		xlnx,ipi-id = <0>;
-		#address-cells = <1>;
-		#size-cells = <1>;
-		ranges;
-
-		/* APU<->RPU0 IPI mailbox controller */
-		ipi_mailbox_rpu0: mailbox@ff990400 {
-			reg = <0xff990400 0x20>,
-			      <0xff990420 0x20>,
-			      <0xff990080 0x20>,
-			      <0xff9900a0 0x20>;
-			reg-names = "local_request_region",
-				    "local_response_region",
-				    "remote_request_region",
-				    "remote_response_region";
-			#mbox-cells = <1>;
-			xlnx,ipi-id = <1>;
-		};
-		/* APU<->RPU1 IPI mailbox controller */
-		ipi_mailbox_rpu1: mailbox@ff990440 {
-			reg = <0xff990440 0x20>,
-			      <0xff990460 0x20>,
-			      <0xff990280 0x20>,
-			      <0xff9902a0 0x20>;
-			reg-names = "local_request_region",
-				    "local_response_region",
-				    "remote_request_region",
-				    "remote_response_region";
-			#mbox-cells = <1>;
-			xlnx,ipi-id = <2>;
-		};
-	};
-	rpu0 {
-		...
-		mboxes = <&ipi_mailbox_rpu0 0>,
-			 <&ipi_mailbox_rpu0 1>;
-		mbox-names = "tx", "rx";
-	};
-	rpu1 {
-		...
-		mboxes = <&ipi_mailbox_rpu1 0>,
-			 <&ipi_mailbox_rpu1 1>;
-		mbox-names = "tx", "rx";
-	};
-- 
2.30.0

