Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7121B29AAEB
	for <linux-clk@vger.kernel.org>; Tue, 22 Apr 2025 18:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745347938; cv=none; b=DBqI2KKuCRAI6IhtjrE7xKjSzU/LFbDByPCrZqfahyhJArZo+kxCBbnlOeqHRFfLUr3b/UvfTQgSdPpsEOUR5t4Qbu2LyftWHv7in7nfowjRjZTBLZDVBgNoUyC7GFwq2ZJ5oA+mJQVGi6jERtI3eOCBJroX6GS1ovVbm4eXc7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745347938; c=relaxed/simple;
	bh=+8gyxdXbm3+RANqKDI50fOTJLWzGq/AcuVOPKv6v96E=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kiBlqFvNP+mmVqm/3Ad6AgnSh+HVYrd1tqLWHXTfCrHL8P6YWxV/4oyG/YpgnQJ3zT5w6dla6bKJlWfLehWqP/E8/T2t7/h0slJq1G2mLCky6QSP0S73r017t5Ifx4xhcNL11oaz9egVwDB+H1jS7IDzwDuVx9Oa/dUgn9ZhPEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=ESfHRNKW; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="ESfHRNKW"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3914bc3e01aso3459603f8f.2
        for <linux-clk@vger.kernel.org>; Tue, 22 Apr 2025 11:52:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1745347932; x=1745952732; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4S2zMfk9L58yqd9I9dwxn1xniIvOfEglQ8lSAt5/4z0=;
        b=ESfHRNKWz3VSaVl/G7At75PVLDdSMGjxwYl3MsAffNYdmXczWZqxlUf5pNhNgLfR+d
         y4i37amy2ayl2hiYp7jFK0M+iF2KPqFwiP3kcnW54/wTYj5L4Nk/AH7ikSotRoRdFTPe
         FNJqwUDWMH269NwQQKgM+Puffip6mNnFkZxNPZa2Btcm9WJgRxnwH1U32dw8Bszrk2oz
         O68uxqAYgMnmBLxiyxp3DfYIiX9rUP/cMdk4tA7piZ/CWpwEUA/MO+WCpUFOGO5n9VAM
         TTjAhVddEsxr0njxzgKDF+79b3qIRsvMZy5DKZkJCzjQkgmXxvinIBZub9mxqn2eOFoG
         3tBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745347932; x=1745952732;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4S2zMfk9L58yqd9I9dwxn1xniIvOfEglQ8lSAt5/4z0=;
        b=SjshrzTlKa9/41toooL0IlRMgIXtWW2f/DxjulwQ8dAcs6xVhYpHLltzPCVc5bmk/H
         8Nps1uQf/m6MNdw7jDuhKbDZpuqL13r7KItVBFbZjznWlVzaCsqgnKCt0Q+QtEjgdlAh
         D0RtdieQ06CPkHADljX64KfnvV3M4uCUJibAX3c1kODhZo8sBc6A2RisdM2erp9rbUdR
         uwD1jrOBi9PXvPsgoWUyEzSnmUB2aeYiqzoIRURs5xY5rhWvxEtShJLaYKddFGdaQ3Y8
         ItFRAvNBH/1KmiR/WeCJQo1iORf7fKQ1DSfFgBwf8CZyQLG5FzsWHm2Ep9ZiYtSsO5/q
         xY+A==
X-Forwarded-Encrypted: i=1; AJvYcCWgXns2+axBkZ7KD0I46RjX3YX99NA2BPlRR3Ppr9y6xwy7Hd7pAqT1OyG5H2Xs7E2/k59zdhCxvpQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzhP88czxGOETraYQAXlwSr2ViO1gJRLmW+Ip/lYPDGgp21d+nn
	LDNLtNfl3d2IPJeCmXeUSLNNaJQuZHZZ2fZU4jLi0FbZxHxygeQRhyq8N4U8YF0=
X-Gm-Gg: ASbGnct23BZPLWQpwKaTKPJ1rSO78V7d+zc2OtdB6lh8jPswQUujBYwgHHOroB+C+Wr
	ftBcc+b0uosnTNA0gydh0s/nwnxobXvYyc1LvNFkEH/3tuJaMj4sa4aWVZRltcjP3KkwcOBjz40
	YkF59hjufx28K3rPu3w8URSu3Zv9beBBt2dwm1grt24P/BooKO5jRsep79xfVugElpNE5XdB4QX
	nX5+e2ojjdbGOUgnF8VtB/yXgT6hwkokkPG4wlOOjaqQ+jRJIHbOPzft8r09Ot0y2aDtfPBYMSV
	d6ohomwtb2/kLsJ8vM4RixYLqgbZ3AK/oP7shabdCginbb8wPlupu53Rv+UDhpYG3uf6knM=
X-Google-Smtp-Source: AGHT+IFCWCPj+73nZ86VYVGxJ1BmYAXqpcLeVDCFeR5pdb1n1JDxCAKYEBioaEEyL1pTrGS90AOlvw==
X-Received: by 2002:a05:6000:2408:b0:39a:ca0b:e7c7 with SMTP id ffacd0b85a97d-39efbacdea0mr13017659f8f.36.1745347932336;
        Tue, 22 Apr 2025 11:52:12 -0700 (PDT)
Received: from localhost (93-44-188-26.ip98.fastwebnet.it. [93.44.188.26])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa493230sm16364832f8f.64.2025.04.22.11.52.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 11:52:11 -0700 (PDT)
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
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Stefan Wahren <wahrenst@gmx.net>,
	Herve Codina <herve.codina@bootlin.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Phil Elwell <phil@raspberrypi.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	kernel-list@raspberrypi.com,
	Matthias Brugger <mbrugger@suse.com>
Subject: [PATCH v9 -next 09/12] arm64: dts: broadcom: Add board DTS for Rpi5 which includes RP1 node
Date: Tue, 22 Apr 2025 20:53:18 +0200
Message-ID: <30394042e9ede04621dd1a9422c76711f0e7cd80.1745347417.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1745347417.git.andrea.porta@suse.com>
References: <cover.1745347417.git.andrea.porta@suse.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the fully populated DTS for RaspberryPi 5 which includes
the RP1 node definition. The inclusion tree is as follow (the
arrow points to the includer):

rp1-common.dtsi ----> rp1-nexus.dtsi ----> bcm2712-rpi-5-b.dts
                                               ^
                                               |
                                           bcm2712-rpi-5-b-ovl-rp1.dts

This is designed to maximize the compatibility with downstream DT
while ensuring that a fully defined DT (one which includes the RP1
node as opposed to load it from overlay at runtime) is present
since early boot stage.

Since the preferred board DT is the fully populated one, name it
bcm2712-rpi-5-b.dts and move the previous one into
bcm2712-rpi-5-b-ovl-rp1.dts.

Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 arch/arm64/boot/dts/broadcom/Makefile         |   1 +
 .../dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dts  | 121 +++++++++++++++++
 .../boot/dts/broadcom/bcm2712-rpi-5-b.dts     | 124 ++----------------
 3 files changed, 132 insertions(+), 114 deletions(-)
 create mode 100644 arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dts

diff --git a/arch/arm64/boot/dts/broadcom/Makefile b/arch/arm64/boot/dts/broadcom/Makefile
index 3d0efb93b06d..09563c41ea6b 100644
--- a/arch/arm64/boot/dts/broadcom/Makefile
+++ b/arch/arm64/boot/dts/broadcom/Makefile
@@ -7,6 +7,7 @@ dtb-$(CONFIG_ARCH_BCM2835) += bcm2711-rpi-400.dtb \
 			      bcm2711-rpi-4-b.dtb \
 			      bcm2711-rpi-cm4-io.dtb \
 			      bcm2712-rpi-5-b.dtb \
+			      bcm2712-rpi-5-b-ovl-rp1.dtb \
 			      bcm2712-d-rpi-5-b.dtb \
 			      bcm2837-rpi-3-a-plus.dtb \
 			      bcm2837-rpi-3-b.dtb \
diff --git a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dts b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dts
new file mode 100644
index 000000000000..6ea3c102e0d6
--- /dev/null
+++ b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dts
@@ -0,0 +1,121 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/dts-v1/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include "bcm2712.dtsi"
+
+/ {
+	compatible = "raspberrypi,5-model-b", "brcm,bcm2712";
+	model = "Raspberry Pi 5";
+
+	aliases {
+		serial10 = &uart10;
+	};
+
+	chosen: chosen {
+		stdout-path = "serial10:115200n8";
+	};
+
+	clk_rp1_xosc: clock-50000000 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-output-names = "rp1-xosc";
+		clock-frequency = <50000000>;
+	};
+
+	/* Will be filled by the bootloader */
+	memory@0 {
+		device_type = "memory";
+		reg = <0 0 0 0x28000000>;
+	};
+
+	sd_io_1v8_reg: sd-io-1v8-reg {
+		compatible = "regulator-gpio";
+		regulator-name = "vdd-sd-io";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-boot-on;
+		regulator-always-on;
+		regulator-settling-time-us = <5000>;
+		gpios = <&gio_aon 3 GPIO_ACTIVE_HIGH>;
+		states = <1800000 1>,
+			 <3300000 0>;
+	};
+
+	sd_vcc_reg: sd-vcc-reg {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc-sd";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-boot-on;
+		enable-active-high;
+		gpios = <&gio_aon 4 GPIO_ACTIVE_HIGH>;
+	};
+};
+
+/* The Debug UART, on Rpi5 it's on JST-SH 1.0mm 3-pin connector
+ * labeled "UART", i.e. the interface with the system console.
+ */
+&uart10 {
+	status = "okay";
+};
+
+/* SDIO1 is used to drive the SD card */
+&sdio1 {
+	vqmmc-supply = <&sd_io_1v8_reg>;
+	vmmc-supply = <&sd_vcc_reg>;
+	bus-width = <4>;
+	sd-uhs-sdr50;
+	sd-uhs-ddr50;
+	sd-uhs-sdr104;
+};
+
+&soc {
+	firmware: firmware {
+		compatible = "raspberrypi,bcm2835-firmware", "simple-mfd";
+		#address-cells = <1>;
+		#size-cells = <1>;
+
+		mboxes = <&mailbox>;
+		dma-ranges;
+
+		firmware_clocks: clocks {
+			compatible = "raspberrypi,firmware-clocks";
+			#clock-cells = <1>;
+		};
+
+		reset: reset {
+			compatible = "raspberrypi,firmware-reset";
+			#reset-cells = <1>;
+		};
+	};
+
+	power: power {
+		compatible = "raspberrypi,bcm2835-power";
+		firmware = <&firmware>;
+		#power-domain-cells = <1>;
+	};
+};
+
+&hvs {
+	clocks = <&firmware_clocks 4>, <&firmware_clocks 16>;
+	clock-names = "core", "disp";
+};
+
+&hdmi0 {
+	clocks = <&firmware_clocks 13>, <&firmware_clocks 14>, <&dvp 0>, <&clk_27MHz>;
+	clock-names = "hdmi", "bvb", "audio", "cec";
+};
+
+&hdmi1 {
+	clocks = <&firmware_clocks 13>, <&firmware_clocks 14>, <&dvp 1>, <&clk_27MHz>;
+	clock-names = "hdmi", "bvb", "audio", "cec";
+};
+
+&pcie1 {
+	status = "okay";
+};
+
+&pcie2 {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
index 6ea3c102e0d6..adad85e68f1b 100644
--- a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
+++ b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
@@ -1,121 +1,17 @@
 // SPDX-License-Identifier: (GPL-2.0 OR MIT)
-/dts-v1/;
-
-#include <dt-bindings/gpio/gpio.h>
-#include "bcm2712.dtsi"
-
-/ {
-	compatible = "raspberrypi,5-model-b", "brcm,bcm2712";
-	model = "Raspberry Pi 5";
-
-	aliases {
-		serial10 = &uart10;
-	};
-
-	chosen: chosen {
-		stdout-path = "serial10:115200n8";
-	};
-
-	clk_rp1_xosc: clock-50000000 {
-		compatible = "fixed-clock";
-		#clock-cells = <0>;
-		clock-output-names = "rp1-xosc";
-		clock-frequency = <50000000>;
-	};
-
-	/* Will be filled by the bootloader */
-	memory@0 {
-		device_type = "memory";
-		reg = <0 0 0 0x28000000>;
-	};
-
-	sd_io_1v8_reg: sd-io-1v8-reg {
-		compatible = "regulator-gpio";
-		regulator-name = "vdd-sd-io";
-		regulator-min-microvolt = <1800000>;
-		regulator-max-microvolt = <3300000>;
-		regulator-boot-on;
-		regulator-always-on;
-		regulator-settling-time-us = <5000>;
-		gpios = <&gio_aon 3 GPIO_ACTIVE_HIGH>;
-		states = <1800000 1>,
-			 <3300000 0>;
-	};
-
-	sd_vcc_reg: sd-vcc-reg {
-		compatible = "regulator-fixed";
-		regulator-name = "vcc-sd";
-		regulator-min-microvolt = <3300000>;
-		regulator-max-microvolt = <3300000>;
-		regulator-boot-on;
-		enable-active-high;
-		gpios = <&gio_aon 4 GPIO_ACTIVE_HIGH>;
-	};
-};
-
-/* The Debug UART, on Rpi5 it's on JST-SH 1.0mm 3-pin connector
- * labeled "UART", i.e. the interface with the system console.
+/*
+ * bcm2712-rpi-5-b-ovl-rp1.dts is the overlay-ready DT which will make
+ * the RP1 driver to load the RP1 dtb overlay at runtime, while
+ * bcm2712-rpi-5-b.dts (this file) is the fully defined one (i.e. it
+ * already contains RP1 node, so no overlay is loaded nor needed).
+ * This file is not intended to be modified, nodes should be added
+ * to the included bcm2712-rpi-5-b-ovl-rp1.dts.
  */
-&uart10 {
-	status = "okay";
-};
-
-/* SDIO1 is used to drive the SD card */
-&sdio1 {
-	vqmmc-supply = <&sd_io_1v8_reg>;
-	vmmc-supply = <&sd_vcc_reg>;
-	bus-width = <4>;
-	sd-uhs-sdr50;
-	sd-uhs-ddr50;
-	sd-uhs-sdr104;
-};
 
-&soc {
-	firmware: firmware {
-		compatible = "raspberrypi,bcm2835-firmware", "simple-mfd";
-		#address-cells = <1>;
-		#size-cells = <1>;
-
-		mboxes = <&mailbox>;
-		dma-ranges;
-
-		firmware_clocks: clocks {
-			compatible = "raspberrypi,firmware-clocks";
-			#clock-cells = <1>;
-		};
-
-		reset: reset {
-			compatible = "raspberrypi,firmware-reset";
-			#reset-cells = <1>;
-		};
-	};
-
-	power: power {
-		compatible = "raspberrypi,bcm2835-power";
-		firmware = <&firmware>;
-		#power-domain-cells = <1>;
-	};
-};
-
-&hvs {
-	clocks = <&firmware_clocks 4>, <&firmware_clocks 16>;
-	clock-names = "core", "disp";
-};
-
-&hdmi0 {
-	clocks = <&firmware_clocks 13>, <&firmware_clocks 14>, <&dvp 0>, <&clk_27MHz>;
-	clock-names = "hdmi", "bvb", "audio", "cec";
-};
-
-&hdmi1 {
-	clocks = <&firmware_clocks 13>, <&firmware_clocks 14>, <&dvp 1>, <&clk_27MHz>;
-	clock-names = "hdmi", "bvb", "audio", "cec";
-};
+/dts-v1/;
 
-&pcie1 {
-	status = "okay";
-};
+#include "bcm2712-rpi-5-b-ovl-rp1.dts"
 
 &pcie2 {
-	status = "okay";
+	#include "rp1-nexus.dtsi"
 };
-- 
2.35.3

