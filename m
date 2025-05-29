Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4DD028E584
	for <linux-clk@vger.kernel.org>; Thu, 29 May 2025 10:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748515694; cv=none; b=ZAJk6Gy2bmA8FnEXcXet9ScrW8Rj2jyEVPCwDBxMNBa6jxUS+5Ibjf2tQV/ByrAa2WyMd7uBfuBe5nETV7wLS0VsUZ4CpzJsQnkZQI+VOZgHUhnbPMthmLp8AlSLcapq6nYMTIy0+GTYRBQZ9grG5HKOToRf8nn4wgGiLZdZMoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748515694; c=relaxed/simple;
	bh=QW7VTm572jmsB5I7p8SLx6Wb3evUoSSkHBGzBXDeejA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P9HfeXxBxM/nnqsciGSL13g7A1bCUhhX1iek7CGpkkr2mWudJSRH7OcJH9cjeL7xZktrf0ZZiuNjS9bhipD0QxClgjEpA3O6c1a8hP5Uyd1pCLNqLHZy55JMJGIzcCxOR22rVXH7JyCe0uKiAlQ6EvEDGcw1egqHTqnrUk6Z/00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=dxEUclQx; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="dxEUclQx"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-ad5566ac13cso111305566b.1
        for <linux-clk@vger.kernel.org>; Thu, 29 May 2025 03:48:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1748515690; x=1749120490; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WZ7xUfAXguvsPdu5QAJbu8MyCaxUyBGB0j1AZF9I7as=;
        b=dxEUclQxu3IFlwiNWvlkYXrL3NYwZjgRiOXpKAIxzDV6Ijg9RZsqnoWoapY07Eacs+
         zV3/ydPsLvW9igmGcV5W8bCcb0qCtLY0I6+zEIbU7/sV5GQcvln14XJAb5yK+b4hw81K
         j/t9EaS+W4V7tUn02BgvseXWu415b0AX9Gnr9AMw9G+8k5jNzf1tgszuH/wxWYyO82OW
         s7njkxFBO00n/cruJ9JW+IIShZb0iIWYNcQxfTvZDGcKDFmB5NbAf7tbFTvO/7NyyYna
         RflJf+JkFIipaLW06fGYiI5vrDEFez0dmihyeKWpXibvq0OzgqeAza8fv5HbDqg1yh34
         ByjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748515690; x=1749120490;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WZ7xUfAXguvsPdu5QAJbu8MyCaxUyBGB0j1AZF9I7as=;
        b=DptMU9D5e5i+Ev4HBAEpiRgVfSWXelkX5EZ0Ahzw5NxdLfsgYQC9FQOVQGLG5Cg3kQ
         BQ7/dIniBBPN9Zx1DSke10SmY/EoAJV4nOjbRbhXSo2/0XOGuwMNRxZuArtimsLjF/h8
         dA8FC1i+7+N0cbHr3xnOecQCt+OGMtqGPTceYr1IRRUVVEwo6SZdQCyoxxSOZyJAUiAb
         cyzCRQEOrjHafzEgyRS7xpOb24VbdA0cEBXstl2I1TBf45jrMA2HvLnDkcLRwrflbKuL
         CU4qJDofffzg0kfaryOijmU5CtZ1ffJmD/hUEnzAECU9Icrx4zFN16zBH34NyWi0gEEJ
         YABQ==
X-Forwarded-Encrypted: i=1; AJvYcCXjjMq04SOPb0pVH5X28zO+PLh3Gw+nwddZZjB14tyM+6L7o17IzjptG9YyVZcamg3ozCw9cUx7/tY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyt9wzmv/8VZQyp+YCQ/mFVUjpabvvs3mVjFMZFLQSVif41xpm9
	2lKi3en56a3Y0O+qyzNPAwb80X6BDAkD7gd8mEh54tPictvyIGITB+FIq2/8zotIuh8=
X-Gm-Gg: ASbGnct9YLiTZfh06JQpRH4fk/Q38m+BHzPjTwN4bQ1aEV7JMciOgaxbEEW/OtCYU/a
	KT2Iu14O4MWacjvL9PgwHq8Q34KtSwX8JM+woK0RFkzOr0KGkH3BmXweBHKc9b0HPjFCePK/lwk
	2tDLAq9GPKzW3DDi/EOezY59ScUEVDuxtIUOQeaPY5cdLCMD9J4bVBvp7T3ucumCwZqBAcACYgP
	4bM9f24vAKG6JWiK1/WU2wWFy9t1l35JZoXQrFS7Lk1Jvo7+0l5kRVIDjtAhOZp4MtJxSpi6xDi
	+Ow9CreWuERUjPMhNyWk2UFUlDlzQqo0a1+z8te693t79nghQmfUkf0cd0vi1iEnZMJby7ACvE/
	+i8CR7KBep2+gqCB3ZNnfOCCHO9XUYSZt
X-Google-Smtp-Source: AGHT+IEqctQn6JYkD2OU2g3E86TiXNt7YciFPiTRUFr7ZULRQQIqdNiEQCdQ6/MquQBqItelOVzh2Q==
X-Received: by 2002:a17:907:9806:b0:ad2:2146:3b89 with SMTP id a640c23a62f3a-ad85b185b5fmr1527064066b.47.1748515689516;
        Thu, 29 May 2025 03:48:09 -0700 (PDT)
Received: from localhost (host-87-21-228-106.retail.telecomitalia.it. [87.21.228.106])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adb2c842b9fsm21581266b.143.2025.05.29.03.48.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 03:48:09 -0700 (PDT)
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
Subject: [PATCH v10 09/10] arm64: dts: broadcom: Add board DTS for Rpi5 which includes RP1 node
Date: Thu, 29 May 2025 12:49:26 +0200
Message-ID: <20250529104940.23053-4-andrea.porta@suse.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1748514765.git.andrea.porta@suse.com>
References: <cover.1748514765.git.andrea.porta@suse.com>
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
 .../dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dts  | 121 ++++++++++++++++++
 .../boot/dts/broadcom/bcm2712-rpi-5-b.dts     | 118 ++---------------
 3 files changed, 133 insertions(+), 107 deletions(-)
 create mode 100644 arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dts

diff --git a/arch/arm64/boot/dts/broadcom/Makefile b/arch/arm64/boot/dts/broadcom/Makefile
index 01ecfa304184..031875a277d7 100644
--- a/arch/arm64/boot/dts/broadcom/Makefile
+++ b/arch/arm64/boot/dts/broadcom/Makefile
@@ -7,6 +7,7 @@ dtb-$(CONFIG_ARCH_BCM2835) += bcm2711-rpi-400.dtb \
 			      bcm2711-rpi-4-b.dtb \
 			      bcm2711-rpi-cm4-io.dtb \
 			      bcm2712-rpi-5-b.dtb \
+			      bcm2712-rpi-5-b-ovl-rp1.dtb \
 			      bcm2712-d-rpi-5-b.dtb \
 			      bcm2837-rpi-2-b.dtb \
 			      bcm2837-rpi-3-a-plus.dtb \
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
index 1850a575e708..adad85e68f1b 100644
--- a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
+++ b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
@@ -1,113 +1,17 @@
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
 
-/* SDIO1 is used to drive the SD card */
-&sdio1 {
-	vqmmc-supply = <&sd_io_1v8_reg>;
-	vmmc-supply = <&sd_vcc_reg>;
-	bus-width = <4>;
-	sd-uhs-sdr50;
-	sd-uhs-ddr50;
-	sd-uhs-sdr104;
-};
-
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
+/dts-v1/;
 
-&hdmi0 {
-	clocks = <&firmware_clocks 13>, <&firmware_clocks 14>, <&dvp 0>, <&clk_27MHz>;
-	clock-names = "hdmi", "bvb", "audio", "cec";
-};
+#include "bcm2712-rpi-5-b-ovl-rp1.dts"
 
-&hdmi1 {
-	clocks = <&firmware_clocks 13>, <&firmware_clocks 14>, <&dvp 1>, <&clk_27MHz>;
-	clock-names = "hdmi", "bvb", "audio", "cec";
+&pcie2 {
+	#include "rp1-nexus.dtsi"
 };
-- 
2.35.3

