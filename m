Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.92.40.78
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793876850;
	b=VeShkZZNGJFQ9A5z/6h+N8p7G7OyYuI/a0ouCC8Z+xbmOnrCnq6mOM6DdGBAGI5ug2vV
	 UVOz0xbS6VHgSQWWjOjzX0rY5oHdcWGOf9Ey0JBFb1+U08no7GRCL8u8llEMaTQ3HoBiR
	 KPgn1BZNheHFXBecPjz+eN9m84KnujMIKdwoLF2jmTqT6qItQkA4/Q6Of5aopMu3QxWNH
	 Bfrr0tUGsCkLl2plDwbAJXHVlKTmcIhXt34tnWi08B5zXxyAhEQF+eQIZkzZWfYZX21TK
	 M027UGEH4LD+VNaDGVCz6X3ZtylIiWuJrpJQKBFHscZ6DlpUgs0S2nHQGCBXFK1fM/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793876850;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=qRtaoYPpcX5o8ocOiQoryhWt/gszvTTnQicjOjV3lUQ=;
	b=vlqiAzrijx7wb95TZhTjqaCSQyMfBNXKZnm0+ZF2NF3COjTgDcx7n1FF0MWNJBaqEMrQ
	 bFaK29MF/tyx4a6piCulPigq4b6g2fUgBqaaV1rN4oGx5CRbvEdo91+RMFWQEAskId80n
	 gAN1QoKDrNJ0i4c6nUMatISLpRfD+VPBP7iSUXgR/hW6KTq69mU7mSidBpVht5Wlvnyhb
	 Vi7eZ29t3MIDgk05JNNU9Em9ECVRPRHNTMPCBOYBUBw/Ombt3eq+TZRPPXTTlP1c+1hAX
	 3/BihoRUezSC/csFdlKJ4dEqfvlTJP5641BAhLs6v3zNMigsLVoxVeVrpdzQoWnR7Qg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=thorsis.com;
	spf=pass smtp.mailfrom=thorsis.com;
	dkim=pass header.d=thorsis.com header.i=@thorsis.com header.a=rsa-sha256 header.s=dkim header.b=nTntgJOm;
	arc=none smtp.remote-ip=217.92.40.78
Received: from mail.thorsis.com (mail.thorsis.com [217.92.40.78])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 540FD606A32E;
	Thu,  5 Nov 2026 11:07:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 540FD606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=thorsis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thorsis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=thorsis.com header.i=@thorsis.com header.a=rsa-sha256 header.s=dkim header.b=nTntgJOm
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 28EA2149663A;
	Thu, 05 Nov 2026 12:07:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thorsis.com; s=dkim;
	t=1793876876; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=qRtaoYPpcX5o8ocOiQoryhWt/gszvTTnQicjOjV3lUQ=;
	b=nTntgJOmzLYFgNzZqxAbXwj8lHmVfGLo/srQUR5R2M7DBtetxIhUuJlWAv7Drim+XT8SKN
	g/eaHz55UmE638wyUv8blGt1ywQMgDbSTjMoKKi69014v+LUzkcxe9EXFfZ5IgKOaNbVPc
	rT3UuRPqyaQFaeTSNHTYIxCVs3Tc1yfhuwwHQxjj+nVV20xS7NORe9ePzkjrC+SZYvngZj
	pyX0+v9onfKrIdtZcydUBirAerZpZ3RWRwbibkCSAySeG5pA+cVLNc0q2rKTOUidRtXfyE
	4qcVGrISXBTZXOyVJskOblpoBdHO2GKAkxdne2ROSc9IVel/h+1yGBxPcFTNDA==
From: Alexander Dahl <ada@thorsis.com>
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Ryan Wanner <ryan.wanner@microchip.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	linux-usb@vger.kernel.org (open list:USB SUBSYSTEM)
Subject: [PATCH v4 02/16] dt-bindings: clock: at91: Split up per SoC partially
Date: Thu,  5 Nov 2026 12:06:38 +0100
Message-ID: <20261105110715.2486432-3-ada@thorsis.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261105110715.2486432-1-ada@thorsis.com>
References: <20261105110715.2486432-1-ada@thorsis.com>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Before adding even more new indexes creating more holes in the
clk at91 drivers pmc_data->chws arrays, split this up.

This is a partial split up only for some of the old PMC definitions.

Binding splitup was proposed for several reasons:

1) keep the driver code simple, readable, and efficient
2) avoid accidental array index duplication
3) avoid memory waste by creating more and more unused array members.

Old values are kept to not break dts, and to maintain dt ABI.

Link: https://lore.kernel.org/linux-devicetree/20250207-jailbird-circus-bcc04ee90e05@thorsis.com/T/#u
Signed-off-by: Alexander Dahl <ada@thorsis.com>
---

Notes:
    v4:
    - "re-added" some definitions present in hardware but not used in dt
    - reword header comment (at91 -> Microchip) for newer SoCs
    - PMC_UTMI was renamed where appropriate according to datasheets
    
    v3:
    - full splitup for all at91 family SoCs instead of just a few
    
    v2:
    - new patch, not present in v1

 .../reset/atmel,at91sam9260-reset.yaml        |  3 ++-
 .../bindings/usb/atmel,at91sam9rl-udc.yaml    |  3 ++-
 .../dt-bindings/clock/atmel,at91rm9200-pmc.h  | 16 ++++++++++++
 .../dt-bindings/clock/atmel,at91sam9260-pmc.h | 16 ++++++++++++
 .../dt-bindings/clock/atmel,at91sam9g45-pmc.h | 16 ++++++++++++
 .../dt-bindings/clock/atmel,at91sam9n12-pmc.h | 16 ++++++++++++
 .../dt-bindings/clock/atmel,at91sam9rl-pmc.h  | 16 ++++++++++++
 .../dt-bindings/clock/atmel,at91sam9x5-pmc.h  | 16 ++++++++++++
 include/dt-bindings/clock/atmel,sama5d2-pmc.h | 20 ++++++++++++++
 include/dt-bindings/clock/atmel,sama5d3-pmc.h | 16 ++++++++++++
 include/dt-bindings/clock/atmel,sama5d4-pmc.h | 17 ++++++++++++
 .../dt-bindings/clock/microchip,sam9x60-pmc.h | 15 +++++++++++
 .../dt-bindings/clock/microchip,sam9x7-pmc.h  | 19 ++++++++++++++
 .../clock/microchip,sama7d65-pmc.h            | 26 +++++++++++++++++++
 .../dt-bindings/clock/microchip,sama7g5-pmc.h | 23 ++++++++++++++++
 15 files changed, 236 insertions(+), 2 deletions(-)
 create mode 100644 include/dt-bindings/clock/atmel,at91rm9200-pmc.h
 create mode 100644 include/dt-bindings/clock/atmel,at91sam9260-pmc.h
 create mode 100644 include/dt-bindings/clock/atmel,at91sam9g45-pmc.h
 create mode 100644 include/dt-bindings/clock/atmel,at91sam9n12-pmc.h
 create mode 100644 include/dt-bindings/clock/atmel,at91sam9rl-pmc.h
 create mode 100644 include/dt-bindings/clock/atmel,at91sam9x5-pmc.h
 create mode 100644 include/dt-bindings/clock/atmel,sama5d2-pmc.h
 create mode 100644 include/dt-bindings/clock/atmel,sama5d3-pmc.h
 create mode 100644 include/dt-bindings/clock/atmel,sama5d4-pmc.h
 create mode 100644 include/dt-bindings/clock/microchip,sam9x60-pmc.h
 create mode 100644 include/dt-bindings/clock/microchip,sam9x7-pmc.h
 create mode 100644 include/dt-bindings/clock/microchip,sama7d65-pmc.h
 create mode 100644 include/dt-bindings/clock/microchip,sama7g5-pmc.h

diff --git a/Documentation/devicetree/bindings/reset/atmel,at91sam9260-reset.yaml b/Documentation/devicetree/bindings/reset/atmel,at91sam9260-reset.yaml
index 84c4801df8d9a..8c89ccc3d6393 100644
--- a/Documentation/devicetree/bindings/reset/atmel,at91sam9260-reset.yaml
+++ b/Documentation/devicetree/bindings/reset/atmel,at91sam9260-reset.yaml
@@ -67,9 +67,10 @@ additionalProperties: false
 examples:
   - |
     #include <dt-bindings/clock/at91.h>
+    #include <dt-bindings/clock/atmel,at91sam9260-pmc.h>
 
     reset-controller@fffffd00 {
         compatible = "atmel,at91sam9260-rstc";
         reg = <0xfffffd00 0x10>;
-        clocks = <&pmc PMC_TYPE_CORE PMC_SLOW>;
+        clocks = <&pmc PMC_TYPE_CORE AT91SAM9260_PMC_SLOW>;
     };
diff --git a/Documentation/devicetree/bindings/usb/atmel,at91sam9rl-udc.yaml b/Documentation/devicetree/bindings/usb/atmel,at91sam9rl-udc.yaml
index cdbbd17f80363..15f5bb51fd8a7 100644
--- a/Documentation/devicetree/bindings/usb/atmel,at91sam9rl-udc.yaml
+++ b/Documentation/devicetree/bindings/usb/atmel,at91sam9rl-udc.yaml
@@ -61,13 +61,14 @@ examples:
   - |
     #include <dt-bindings/interrupt-controller/irq.h>
     #include <dt-bindings/clock/at91.h>
+    #include <dt-bindings/clock/atmel,at91sam9rl-pmc.h>
     #include <dt-bindings/gpio/gpio.h>
     gadget@fff78000 {
         compatible = "atmel,at91sam9g45-udc";
         reg = <0x00600000 0x80000
                0xfff78000 0x400>;
         interrupts = <27 IRQ_TYPE_LEVEL_HIGH 0>;
-        clocks = <&pmc PMC_TYPE_PERIPHERAL 27>, <&pmc PMC_TYPE_CORE PMC_UTMI>;
+        clocks = <&pmc PMC_TYPE_PERIPHERAL 27>, <&pmc PMC_TYPE_CORE AT91SAM9RL_PMC_UTMI>;
         clock-names = "pclk", "hclk";
         atmel,vbus-gpio = <&pioC 15 GPIO_ACTIVE_HIGH>;
     };
diff --git a/include/dt-bindings/clock/atmel,at91rm9200-pmc.h b/include/dt-bindings/clock/atmel,at91rm9200-pmc.h
new file mode 100644
index 0000000000000..35fce34e00b82
--- /dev/null
+++ b/include/dt-bindings/clock/atmel,at91rm9200-pmc.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
+/*
+ * The constants defined in this header are being used in dts and in
+ * at91rm9200 clock driver.
+ */
+
+#ifndef _DT_BINDINGS_CLOCK_ATMEL_AT91RM9200_PMC_H
+#define _DT_BINDINGS_CLOCK_ATMEL_AT91RM9200_PMC_H
+
+#define AT91RM9200_PMC_SLOW	0
+#define AT91RM9200_PMC_MCK	1
+#define AT91RM9200_PMC_MAIN	3
+#define AT91RM9200_PMC_PLLACK	7
+#define AT91RM9200_PMC_PLLBCK	8
+
+#endif
diff --git a/include/dt-bindings/clock/atmel,at91sam9260-pmc.h b/include/dt-bindings/clock/atmel,at91sam9260-pmc.h
new file mode 100644
index 0000000000000..6a5453cf70954
--- /dev/null
+++ b/include/dt-bindings/clock/atmel,at91sam9260-pmc.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
+/*
+ * The constants defined in this header are being used in dts and in
+ * at91sam9260 clock driver.
+ */
+
+#ifndef _DT_BINDINGS_CLOCK_ATMEL_AT91SAM9260_PMC_H
+#define _DT_BINDINGS_CLOCK_ATMEL_AT91SAM9260_PMC_H
+
+#define AT91SAM9260_PMC_SLOW	0
+#define AT91SAM9260_PMC_MCK	1
+#define AT91SAM9260_PMC_MAIN	3
+#define AT91SAM9260_PMC_PLLACK	7
+#define AT91SAM9260_PMC_PLLBCK	8
+
+#endif
diff --git a/include/dt-bindings/clock/atmel,at91sam9g45-pmc.h b/include/dt-bindings/clock/atmel,at91sam9g45-pmc.h
new file mode 100644
index 0000000000000..44a804ff96fff
--- /dev/null
+++ b/include/dt-bindings/clock/atmel,at91sam9g45-pmc.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
+/*
+ * The constants defined in this header are being used in dts and in
+ * at91sam9g45 clock driver.
+ */
+
+#ifndef _DT_BINDINGS_CLOCK_ATMEL_AT91SAM9G45_PMC_H
+#define _DT_BINDINGS_CLOCK_ATMEL_AT91SAM9G45_PMC_H
+
+#define AT91SAM9G45_PMC_SLOW	0
+#define AT91SAM9G45_PMC_MCK	1
+#define AT91SAM9G45_PMC_UPLLCK	2
+#define AT91SAM9G45_PMC_MAIN	3
+#define AT91SAM9G45_PMC_PLLACK	7
+
+#endif
diff --git a/include/dt-bindings/clock/atmel,at91sam9n12-pmc.h b/include/dt-bindings/clock/atmel,at91sam9n12-pmc.h
new file mode 100644
index 0000000000000..6eaef69242ee8
--- /dev/null
+++ b/include/dt-bindings/clock/atmel,at91sam9n12-pmc.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
+/*
+ * The constants defined in this header are being used in dts and in
+ * at91sam9n12 clock driver.
+ */
+
+#ifndef _DT_BINDINGS_CLOCK_ATMEL_AT91SAM9N12_PMC_H
+#define _DT_BINDINGS_CLOCK_ATMEL_AT91SAM9N12_PMC_H
+
+#define AT91SAM9N12_PMC_SLOW	0
+#define AT91SAM9N12_PMC_MCK	1
+#define AT91SAM9N12_PMC_MAIN	3
+#define AT91SAM9N12_PMC_PLLACK	7
+#define AT91SAM9N12_PMC_PLLBCK	8
+
+#endif
diff --git a/include/dt-bindings/clock/atmel,at91sam9rl-pmc.h b/include/dt-bindings/clock/atmel,at91sam9rl-pmc.h
new file mode 100644
index 0000000000000..0bb195712f785
--- /dev/null
+++ b/include/dt-bindings/clock/atmel,at91sam9rl-pmc.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
+/*
+ * The constants defined in this header are being used in dts and in
+ * at91sam9rl clock driver.
+ */
+
+#ifndef _DT_BINDINGS_CLOCK_ATMEL_AT91SAM9RL_PMC_H
+#define _DT_BINDINGS_CLOCK_ATMEL_AT91SAM9RL_PMC_H
+
+#define AT91SAM9RL_PMC_SLOW	0
+#define AT91SAM9RL_PMC_MCK	1
+#define AT91SAM9RL_PMC_UTMI	2
+#define AT91SAM9RL_PMC_MAIN	3
+#define AT91SAM9RL_PMC_PLLACK	7
+
+#endif
diff --git a/include/dt-bindings/clock/atmel,at91sam9x5-pmc.h b/include/dt-bindings/clock/atmel,at91sam9x5-pmc.h
new file mode 100644
index 0000000000000..d095dcc9b29ff
--- /dev/null
+++ b/include/dt-bindings/clock/atmel,at91sam9x5-pmc.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
+/*
+ * The constants defined in this header are being used in dts and in
+ * at91sam9x5 clock driver.
+ */
+
+#ifndef _DT_BINDINGS_CLOCK_ATMEL_AT91SAM9X5_PMC_H
+#define _DT_BINDINGS_CLOCK_ATMEL_AT91SAM9X5_PMC_H
+
+#define AT91SAM9X5_PMC_SLOW	0
+#define AT91SAM9X5_PMC_MCK	1
+#define AT91SAM9X5_PMC_UPLLCK	2
+#define AT91SAM9X5_PMC_MAIN	3
+#define AT91SAM9X5_PMC_PLLACK	7
+
+#endif
diff --git a/include/dt-bindings/clock/atmel,sama5d2-pmc.h b/include/dt-bindings/clock/atmel,sama5d2-pmc.h
new file mode 100644
index 0000000000000..51bb410c699e2
--- /dev/null
+++ b/include/dt-bindings/clock/atmel,sama5d2-pmc.h
@@ -0,0 +1,20 @@
+/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
+/*
+ * The constants defined in this header are being used in dts and in
+ * at91 sama5d2 clock driver.
+ */
+
+#ifndef _DT_BINDINGS_CLOCK_ATMEL_SAMA5D2_PMC_H
+#define _DT_BINDINGS_CLOCK_ATMEL_SAMA5D2_PMC_H
+
+#define SAMA5D2_PMC_MCK		1
+#define SAMA5D2_PMC_UPLLCK	2
+#define SAMA5D2_PMC_MAIN	3
+#define SAMA5D2_PMC_MCK2	4
+#define SAMA5D2_PMC_I2S0_MUX	5
+#define SAMA5D2_PMC_I2S1_MUX	6
+#define SAMA5D2_PMC_PLLACK	7
+#define SAMA5D2_PMC_AUDIOPLLCK	9
+#define SAMA5D2_PMC_AUDIOPINCK	10
+
+#endif
diff --git a/include/dt-bindings/clock/atmel,sama5d3-pmc.h b/include/dt-bindings/clock/atmel,sama5d3-pmc.h
new file mode 100644
index 0000000000000..92210969104d6
--- /dev/null
+++ b/include/dt-bindings/clock/atmel,sama5d3-pmc.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
+/*
+ * The constants defined in this header are being used in dts and in
+ * at91 sama5d3 clock driver.
+ */
+
+#ifndef _DT_BINDINGS_CLOCK_ATMEL_SAMA5D3_PMC_H
+#define _DT_BINDINGS_CLOCK_ATMEL_SAMA5D3_PMC_H
+
+#define SAMA5D3_PMC_SLOW	0
+#define SAMA5D3_PMC_MCK		1
+#define SAMA5D3_PMC_UPLLCK	2
+#define SAMA5D3_PMC_MAIN	3
+#define SAMA5D3_PMC_PLLACK	7
+
+#endif
diff --git a/include/dt-bindings/clock/atmel,sama5d4-pmc.h b/include/dt-bindings/clock/atmel,sama5d4-pmc.h
new file mode 100644
index 0000000000000..53870448d6a1d
--- /dev/null
+++ b/include/dt-bindings/clock/atmel,sama5d4-pmc.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
+/*
+ * The constants defined in this header are being used in dts and in
+ * at91 sama5d4 clock driver.
+ */
+
+#ifndef _DT_BINDINGS_CLOCK_ATMEL_SAMA5D4_PMC_H
+#define _DT_BINDINGS_CLOCK_ATMEL_SAMA5D4_PMC_H
+
+#define SAMA5D4_PMC_SLOW	0
+#define SAMA5D4_PMC_MCK		1
+#define SAMA5D4_PMC_UPLLCK	2
+#define SAMA5D4_PMC_MAIN	3
+#define SAMA5D4_PMC_MCK2	4
+#define SAMA5D4_PMC_PLLACK	7
+
+#endif
diff --git a/include/dt-bindings/clock/microchip,sam9x60-pmc.h b/include/dt-bindings/clock/microchip,sam9x60-pmc.h
new file mode 100644
index 0000000000000..050e5e774b274
--- /dev/null
+++ b/include/dt-bindings/clock/microchip,sam9x60-pmc.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
+/*
+ * The constants defined in this header are being used in dts and in
+ * Microchip sam9x60 clock driver.
+ */
+
+#ifndef _DT_BINDINGS_CLOCK_MICROCHIP_SAM9X60_PMC_H
+#define _DT_BINDINGS_CLOCK_MICROCHIP_SAM9X60_PMC_H
+
+#define SAM9X60_PMC_MCK		1
+#define SAM9X60_PMC_UPLLCK	2
+#define SAM9X60_PMC_MAIN	3
+#define SAM9X60_PMC_PLLACK	7
+
+#endif
diff --git a/include/dt-bindings/clock/microchip,sam9x7-pmc.h b/include/dt-bindings/clock/microchip,sam9x7-pmc.h
new file mode 100644
index 0000000000000..292c5873e101e
--- /dev/null
+++ b/include/dt-bindings/clock/microchip,sam9x7-pmc.h
@@ -0,0 +1,19 @@
+/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
+/*
+ * The constants defined in this header are being used in dts and in
+ * Microchip sam9x7 clock driver.
+ */
+
+#ifndef _DT_BINDINGS_CLOCK_MICROCHIP_SAM9X7_PMC_H
+#define _DT_BINDINGS_CLOCK_MICROCHIP_SAM9X7_PMC_H
+
+#define SAM9X7_PMC_MCK		1
+#define SAM9X7_PMC_UPLLCK	2
+#define SAM9X7_PMC_MAIN		3
+#define SAM9X7_PMC_PLLACK	7
+#define SAM9X7_PMC_AUDIOPMCPLL	9
+#define SAM9X7_PMC_AUDIOIOPLL	10
+#define SAM9X7_PMC_PLLADIV2	14
+#define SAM9X7_PMC_LVDSPLL	15
+
+#endif
diff --git a/include/dt-bindings/clock/microchip,sama7d65-pmc.h b/include/dt-bindings/clock/microchip,sama7d65-pmc.h
new file mode 100644
index 0000000000000..08581418b9115
--- /dev/null
+++ b/include/dt-bindings/clock/microchip,sama7d65-pmc.h
@@ -0,0 +1,26 @@
+/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
+/*
+ * The constants defined in this header are being used in dts and in
+ * Microchip sama7d65 clock driver.
+ */
+
+#ifndef _DT_BINDINGS_CLOCK_MICROCHIP_SAMA7D65_PMC_H
+#define _DT_BINDINGS_CLOCK_MICROCHIP_SAMA7D65_PMC_H
+
+#define SAMA7D65_PMC_MCK0		1
+#define SAMA7D65_PMC_USBPLL		2
+#define SAMA7D65_PMC_MAIN		3
+#define SAMA7D65_PMC_CPUPLL		4
+#define SAMA7D65_PMC_SYSPLL		5
+#define SAMA7D65_PMC_DDRPLL		6
+#define SAMA7D65_PMC_GPUPLL		7
+#define SAMA7D65_PMC_BAUDPLL		8
+#define SAMA7D65_PMC_AUDIOPMCPLL	9
+#define SAMA7D65_PMC_AUDIOIOPLL		10
+#define SAMA7D65_PMC_ETHPLL		11
+#define SAMA7D65_PMC_MCK1		13
+#define SAMA7D65_PMC_LVDSPLL		15
+#define SAMA7D65_PMC_MCK3		16
+#define SAMA7D65_PMC_MCK5		17
+
+#endif
diff --git a/include/dt-bindings/clock/microchip,sama7g5-pmc.h b/include/dt-bindings/clock/microchip,sama7g5-pmc.h
new file mode 100644
index 0000000000000..27668634b0a2b
--- /dev/null
+++ b/include/dt-bindings/clock/microchip,sama7g5-pmc.h
@@ -0,0 +1,23 @@
+/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
+/*
+ * The constants defined in this header are being used in dts and in
+ * Microchip sama7g5 clock driver.
+ */
+
+#ifndef _DT_BINDINGS_CLOCK_MICROCHIP_SAMA7G5_PMC_H
+#define _DT_BINDINGS_CLOCK_MICROCHIP_SAMA7G5_PMC_H
+
+#define SAMA7G5_PMC_MCK0	1
+#define SAMA7G5_PMC_UTMI	2
+#define SAMA7G5_PMC_MAIN	3
+#define SAMA7G5_PMC_CPUPLL	4
+#define SAMA7G5_PMC_SYSPLL	5
+#define SAMA7G5_PMC_DDRPLL	6
+#define SAMA7G5_PMC_IMGPLL	7
+#define SAMA7G5_PMC_BAUDPLL	8
+#define SAMA7G5_PMC_AUDIOPMCPLL	9
+#define SAMA7G5_PMC_AUDIOIOPLL	10
+#define SAMA7G5_PMC_ETHPLL	11
+#define SAMA7G5_PMC_MCK1	13
+
+#endif
-- 
2.47.3

