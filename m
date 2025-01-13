Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com [209.85.208.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B83F22DFBA
	for <linux-clk@vger.kernel.org>; Mon, 13 Jan 2025 14:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736780248; cv=none; b=OIsPFX78epUYtSQmyICX47VXg6I32EW+gie28UrMwxjXEESZqBGdk2jOtff39hINJIJIfAAAJMJNqAJj6ZbiTc3X6oCXaWoFYTmTmXhk8PWK801mnVOwrhPOxKthEWJifaiJzQWTC4ScIBK3jOsQxP6MvpwfSeyXLFuvwLAXV6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736780248; c=relaxed/simple;
	bh=eLVVhfnyMIbO184s+FRnyqaburk4vHa6mrusOYiCVoY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T7Fu1ERIyEU7VSPvQ/dm2Y/9GxFSL3zP6uhxV6+GpJHYs04M8vXoYa4gq4R0nwyga9P+YfQ3N5C5jbdmZcx9m+q2v0FVj83+niojPhA7b6sEIeX08NM8l6lecLV7AaIKlG21O83gPcxhPzl8nXjPdJ58ojp+CuOS7DNtq7MOQZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=gPhz1r/r; arc=none smtp.client-ip=209.85.208.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="gPhz1r/r"
Received: by mail-ed1-f68.google.com with SMTP id 4fb4d7f45d1cf-5d9f06f8cf2so481291a12.3
        for <linux-clk@vger.kernel.org>; Mon, 13 Jan 2025 06:57:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1736780244; x=1737385044; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5oL+ODcQasvCBAzRTJ+DvIqFD3YhC5IBkuyemaByobY=;
        b=gPhz1r/rBUuZNHpiQKHXYyNjwXnG0OLkRAMlsbt11vFHq7qBGqGlnDinQbhj4hVqwn
         zOfgyaSs5Yt3UeoVYikjxAq+Yj2UT07e0nI18ljN+kfqIg1l3rypULzppZIRPHFG7plP
         wUOvtLdNUyAfkOnCsioNRlm1o5VOy3soU/6Jat+xa0EmyRWh0/y/KMOEUN+W615iqY9K
         IIhQy8q4SZpVKT2Z/OJ+8s+KvbnOAbTN71w4MZnQKq11h5JccrCcVfi4geD/EPonumn+
         FAygIVWsapF9ZpDBSLUmYo2wgyAcDf5MpSGa2bAkSEaVjnT0or0Eccw2/L02/cWzlUmN
         zWYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736780244; x=1737385044;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5oL+ODcQasvCBAzRTJ+DvIqFD3YhC5IBkuyemaByobY=;
        b=ZQEAPaG8wFIaUSPeyV7R+aEtHKeLY3EfdVF7/Weh/jbCPYgpw666WXtwqVAAc44L5v
         PA1gOh4OrM5IHISl+MmvCQuAKSxlSAWGoPFq56l36LqTT+iYkVQecK1FkkY012TyvSQ1
         C+LoK6FcKa6BAKxEttcUCBQG2mJfTzWOdejx8S7e+oXUJYQ78o9B5DLwib2Hn601cO+J
         TQ6NSQ7kV7lahPRFJ6HELwcMjn0BiF7aW4l6cH+dDSa/6p9HednmqA3gyt6sfQs/exTW
         l/+YEizCSNE3zVOtPcy/OjwHgf/42eJNrpzpVYVDPsbaEjXdCMGkNHKbxrlDRyc7D6yQ
         AE5w==
X-Forwarded-Encrypted: i=1; AJvYcCWWHoT1vZ3Fz7PjqsrY3eQjHZLAOtdbjiA+xoRLhyObgiRo9nP8s5zXjGsWMZj+NSQjkZwetg08le4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3yc0sbbPG/UPHWKGE5b1odmMSi9fZ2Y7xBNw/FI8fWNxS8/JJ
	8GPJjAFRot8XPKq4HGY/hmjDchCN+4OGG6Q0piUDoBZ4pVeNJCcAFgsCpdsLpu0=
X-Gm-Gg: ASbGncvMgMjWyJ1Y6PjtVK8Rcg93+2ompvoQFYynkx5EnZA+4teljoYAeKFNudbQ5ph
	xFOBqhTLzISOsobLhP6EPESKAixepw9X6G/9UehhMPR+3rHC40RTAMBgdxloEyru3Ew5DxYky+I
	jDs2zkJF+iqUwmIQkf+sVC36T2sLYclUs3ivMp6yoTrzclBAfOlMljynyO/I2Ax0yePCLe+Vd2P
	z0uyTf+9zfnzFxxKJkHR4ujmQFV3BcQ0ZpJCgGA7eFKuL6JpQUDfNinXEMYsr1ucWatGA6aQgw7
	RIx9YOrKQyYEkdvwDXJT8KArzFM=
X-Google-Smtp-Source: AGHT+IF1eb9wjyemuA/CkQvKrnWPvUi+BW6RlRVhXADP33sG5miX/dPcvtlInui9RO166jo+y/C63Q==
X-Received: by 2002:a05:6402:3585:b0:5d9:f1f8:e726 with SMTP id 4fb4d7f45d1cf-5d9f1f8ed05mr270635a12.2.1736780244150;
        Mon, 13 Jan 2025 06:57:24 -0800 (PST)
Received: from localhost (host-87-14-236-197.retail.telecomitalia.it. [87.14.236.197])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d99046a05asm5069944a12.67.2025.01.13.06.57.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2025 06:57:23 -0800 (PST)
From: Andrea della Porta <andrea.porta@suse.com>
To: Andrea della Porta <andrea.porta@suse.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof Wilczynski <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Derek Kiernan <derek.kiernan@amd.com>,
	Dragan Cvetic <dragan.cvetic@amd.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Saravana Kannan <saravanak@google.com>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Stefan Wahren <wahrenst@gmx.net>,
	Herve Codina <herve.codina@bootlin.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Andrew Lunn <andrew@lunn.ch>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v6 01/10] dt-bindings: clock: Add RaspberryPi RP1 clock bindings
Date: Mon, 13 Jan 2025 15:58:00 +0100
Message-ID: <ae94e78443099cb6c48528ac8b18daaaae41419a.1736776658.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1736776658.git.andrea.porta@suse.com>
References: <cover.1736776658.git.andrea.porta@suse.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add device tree bindings for the clock generator found in RP1 multi
function device, and relative entries in MAINTAINERS file.

Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../clock/raspberrypi,rp1-clocks.yaml         | 58 ++++++++++++++++++
 MAINTAINERS                                   |  6 ++
 .../clock/raspberrypi,rp1-clocks.h            | 61 +++++++++++++++++++
 3 files changed, 125 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/raspberrypi,rp1-clocks.yaml
 create mode 100644 include/dt-bindings/clock/raspberrypi,rp1-clocks.h

diff --git a/Documentation/devicetree/bindings/clock/raspberrypi,rp1-clocks.yaml b/Documentation/devicetree/bindings/clock/raspberrypi,rp1-clocks.yaml
new file mode 100644
index 000000000000..b2670cf7403a
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/raspberrypi,rp1-clocks.yaml
@@ -0,0 +1,58 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/raspberrypi,rp1-clocks.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: RaspberryPi RP1 clock generator
+
+maintainers:
+  - Andrea della Porta <andrea.porta@suse.com>
+
+description: |
+  The RP1 contains a clock generator designed as three PLLs (CORE, AUDIO,
+  VIDEO), and each PLL output can be programmed though dividers to generate
+  the clocks to drive the sub-peripherals embedded inside the chipset.
+
+  Link to datasheet:
+  https://datasheets.raspberrypi.com/rp1/rp1-peripherals.pdf
+
+properties:
+  compatible:
+    const: raspberrypi,rp1-clocks
+
+  reg:
+    maxItems: 1
+
+  '#clock-cells':
+    const: 1
+    description:
+      The available clocks are defined in
+      include/dt-bindings/clock/raspberrypi,rp1-clocks.h.
+
+  clocks:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - '#clock-cells'
+  - clocks
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/raspberrypi,rp1-clocks.h>
+
+    rp1 {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        clocks@c040018000 {
+            compatible = "raspberrypi,rp1-clocks";
+            reg = <0xc0 0x40018000 0x0 0x10038>;
+            #clock-cells = <1>;
+            clocks = <&clk_rp1_xosc>;
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 1e930c7a58b1..8ced4ed32c00 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19574,6 +19574,12 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/media/raspberrypi,rp1-cfe.yaml
 F:	drivers/media/platform/raspberrypi/rp1-cfe/
 
+RASPBERRY PI RP1 PCI DRIVER
+M:	Andrea della Porta <andrea.porta@suse.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/clock/raspberrypi,rp1-clocks.yaml
+F:	include/dt-bindings/clock/rp1.h
+
 RC-CORE / LIRC FRAMEWORK
 M:	Sean Young <sean@mess.org>
 L:	linux-media@vger.kernel.org
diff --git a/include/dt-bindings/clock/raspberrypi,rp1-clocks.h b/include/dt-bindings/clock/raspberrypi,rp1-clocks.h
new file mode 100644
index 000000000000..248efb895f35
--- /dev/null
+++ b/include/dt-bindings/clock/raspberrypi,rp1-clocks.h
@@ -0,0 +1,61 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (C) 2021 Raspberry Pi Ltd.
+ */
+
+#ifndef __DT_BINDINGS_CLOCK_RASPBERRYPI_RP1
+#define __DT_BINDINGS_CLOCK_RASPBERRYPI_RP1
+
+#define RP1_PLL_SYS_CORE		0
+#define RP1_PLL_AUDIO_CORE		1
+#define RP1_PLL_VIDEO_CORE		2
+
+#define RP1_PLL_SYS			3
+#define RP1_PLL_AUDIO			4
+#define RP1_PLL_VIDEO			5
+
+#define RP1_PLL_SYS_PRI_PH		6
+#define RP1_PLL_SYS_SEC_PH		7
+#define RP1_PLL_AUDIO_PRI_PH		8
+
+#define RP1_PLL_SYS_SEC			9
+#define RP1_PLL_AUDIO_SEC		10
+#define RP1_PLL_VIDEO_SEC		11
+
+#define RP1_CLK_SYS			12
+#define RP1_CLK_SLOW_SYS		13
+#define RP1_CLK_DMA			14
+#define RP1_CLK_UART			15
+#define RP1_CLK_ETH			16
+#define RP1_CLK_PWM0			17
+#define RP1_CLK_PWM1			18
+#define RP1_CLK_AUDIO_IN		19
+#define RP1_CLK_AUDIO_OUT		20
+#define RP1_CLK_I2S			21
+#define RP1_CLK_MIPI0_CFG		22
+#define RP1_CLK_MIPI1_CFG		23
+#define RP1_CLK_PCIE_AUX		24
+#define RP1_CLK_USBH0_MICROFRAME	25
+#define RP1_CLK_USBH1_MICROFRAME	26
+#define RP1_CLK_USBH0_SUSPEND		27
+#define RP1_CLK_USBH1_SUSPEND		28
+#define RP1_CLK_ETH_TSU			29
+#define RP1_CLK_ADC			30
+#define RP1_CLK_SDIO_TIMER		31
+#define RP1_CLK_SDIO_ALT_SRC		32
+#define RP1_CLK_GP0			33
+#define RP1_CLK_GP1			34
+#define RP1_CLK_GP2			35
+#define RP1_CLK_GP3			36
+#define RP1_CLK_GP4			37
+#define RP1_CLK_GP5			38
+#define RP1_CLK_VEC			39
+#define RP1_CLK_DPI			40
+#define RP1_CLK_MIPI0_DPI		41
+#define RP1_CLK_MIPI1_DPI		42
+
+/* Extra PLL output channels - RP1B0 only */
+#define RP1_PLL_VIDEO_PRI_PH		43
+#define RP1_PLL_AUDIO_TERN		44
+
+#endif
-- 
2.35.3

