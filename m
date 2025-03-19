Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0777A21CC40
	for <linux-clk@vger.kernel.org>; Wed, 19 Mar 2025 21:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742421100; cv=none; b=kpBbXw0gamA5uskA6iHL4PK23Yrapo+rIVTHYfAqgL74YdZD1x3TbQmhuazuiKsDIN//BCLePW/TXD1wPU87erO++ATXGVK98aM4W0fx84t9AjX0Lp0bVJXuXUnThdZ7LtnkAkzRvb+fPFUHkaeFkYbdSEjgVYf/gCzTZAtmEEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742421100; c=relaxed/simple;
	bh=Lhy7CEokE9Gijs+wEZ0284UNzyprowstDvOGnqo+duQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=g3cm/d2SvXIEldLk79cF2MKYH5PDWZVaKvdXcwadPYlxLTS2/C3SbjVFw89VZ5OvZjjK0Ku2CrZn/OSsqy+1jHsd/hDxQ4uxVwAgk/0jpLpJbQwro0Ctf8glRYhQ/u0H8Mz3X9+0m+8BcAV/PawIzmcjEBJ18km3nagrE64ppQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=IM6eFRHj; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="IM6eFRHj"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-aaecf50578eso30325766b.2
        for <linux-clk@vger.kernel.org>; Wed, 19 Mar 2025 14:51:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742421093; x=1743025893; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B2zy4FeXIXTtYjjpoH71JN1fhoa8L/cfW4fCg6XzYKI=;
        b=IM6eFRHja71MgTnpPW93Xsz2c42RXxF/xScgjf1LbKTxopDYTW2aksK5Z40ZdKSzEb
         tnH5PZyrDRYJGjbinmixiT9rc9aDKcNbdlVUIYajaFKOJqAE5g4oXhsFyxalnRvHADHb
         Izcp6klqJxF2JKQIklP5IqxnXGM14V308rigU5ijCKwWR2FqD7oI3YcdUTYOJ+AsUSeb
         7uY7F58cX3DX5RU+0OOipp7qKwbJmiLcQrqn6yC2VStyq9V5fuXEWcenO5e/smlFxcB0
         KsD/z2CosSbdtfUyz92k5zXEdo5vjdKXKclbvr+j1UEKe3kYLF1YoapzYxv/0gZcanBS
         O0iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742421093; x=1743025893;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B2zy4FeXIXTtYjjpoH71JN1fhoa8L/cfW4fCg6XzYKI=;
        b=tKIqwtYv3T57fyM54wTLgERBYM8f2JAVoqGQcYgNZT5PJXpodRY1CT5a/W21FqAT0I
         BtgXyMbXEEc3RQC8ojmDFdiRhpwiQxXAm/rjPVKzRkX+Z2fs8AEn1JzJYBZnF/hRgt0f
         4ze4IvMvZ3qUp3d60cian/DIiyMbm4T7PGG9abV6MnDd6+PJqL8/qbc/7TpxlxmNzae8
         r+2uQSt41iCtpMV0LYYfkoYdHyjjWNVEAazhYFqbpWcRaOVKTl6hcq9iPpHCGZ11sWJU
         muYGRdhfReyVri2Hyb/fyggA3+OZW/FKQAqlVJM0NrHqbCqmoAX9L0P+WwbPHisJyVU+
         09EQ==
X-Forwarded-Encrypted: i=1; AJvYcCUtlbCVxFrTd5qj2tDmHhrri0tqyEiHHx+W303Qfi+bDng+pUNKkDMrMhrapjJ2HkokcCBIHGXei7o=@vger.kernel.org
X-Gm-Message-State: AOJu0YwILG4beqccDqzaouUcMW5Ny03aUfbPzQ50iovmlSejIQhbRwNz
	F6qTAsJuDfAxylHYZbuJxIaf0CHfEhOgfD6g5UVaBtLkyjd59VfrU1X1mo1q4vY=
X-Gm-Gg: ASbGncu5fcexLv40iqtxEYSn/MGz67IC89HC1FcADAfCUw9eSefh9Y3iWY6iSL+cCGZ
	bdZaWFvVT8a/4lnDhZUKM3uXExIiaXGzOUN5w21Xz1uL2G39wku6YxxbeHKanFpTWUNeI9gOImn
	Ax7OljyJUndi5nhdeQcHTL2zkoflOVaNQs5fepspaJ0oYEzGaZcFO7I+MRRfidwyf47Uhi71nXk
	KLj/e8WoA9uWBE5Li8NOhFRrl/msGvSFi0KJe+adlnlQNi8QZiu21/sB6XCwu+43km9VX6jtU2u
	F8jpVon5yIuqoGTo7PLSAgf2Tz7rSgrhfsUaDmaiJQBQdhq0cqCd1P/uF2iRE992vW7bDHcind7
	d6ttkMT0jsw==
X-Google-Smtp-Source: AGHT+IGNlsQE3/+ip7HiTTOlJRqlxotWKEGD3QpH9WcC3PxLd3+7MT5s4pAz5vww6yDtWBF8s6KPiQ==
X-Received: by 2002:a17:907:3d9e:b0:ac2:7cd1:3aa0 with SMTP id a640c23a62f3a-ac3b7fcca8bmr538543566b.57.1742421093063;
        Wed, 19 Mar 2025 14:51:33 -0700 (PDT)
Received: from localhost (host-87-4-238-14.retail.telecomitalia.it. [87.4.238.14])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac314aa5208sm1073774366b.177.2025.03.19.14.51.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 14:51:32 -0700 (PDT)
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
	kernel-list@raspberrypi.com
Subject: [PATCH v8 07/13] arm64: dts: rp1: Add support for RaspberryPi's RP1 device
Date: Wed, 19 Mar 2025 22:52:28 +0100
Message-ID: <99269f7762ec0124315e0e8977d9ca4f469f89ce.1742418429.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1742418429.git.andrea.porta@suse.com>
References: <cover.1742418429.git.andrea.porta@suse.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

RaspberryPi RP1 is a multi function PCI endpoint device that
exposes several subperipherals via PCI BAR.
Add a dtb overlay that will be compiled into a binary blob
and linked in the RP1 driver.
This overlay offers just minimal support to represent the
RP1 device itself, the sub-peripherals will be added by
future patches.

Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 MAINTAINERS                                  |  1 +
 arch/arm64/boot/dts/broadcom/rp1-common.dtsi | 42 ++++++++++++++++++++
 arch/arm64/boot/dts/broadcom/rp1-nexus.dtsi  | 14 +++++++
 3 files changed, 57 insertions(+)
 create mode 100644 arch/arm64/boot/dts/broadcom/rp1-common.dtsi
 create mode 100644 arch/arm64/boot/dts/broadcom/rp1-nexus.dtsi

diff --git a/MAINTAINERS b/MAINTAINERS
index c2749c588809..6e07b4fb1924 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19751,6 +19751,7 @@ F:	drivers/media/platform/raspberrypi/rp1-cfe/
 RASPBERRY PI RP1 PCI DRIVER
 M:	Andrea della Porta <andrea.porta@suse.com>
 S:	Maintained
+F:	arch/arm64/boot/dts/broadcom/rp1*.dts*
 F:	drivers/clk/clk-rp1.c
 F:	drivers/pinctrl/pinctrl-rp1.c
 
diff --git a/arch/arm64/boot/dts/broadcom/rp1-common.dtsi b/arch/arm64/boot/dts/broadcom/rp1-common.dtsi
new file mode 100644
index 000000000000..5002a375eb0b
--- /dev/null
+++ b/arch/arm64/boot/dts/broadcom/rp1-common.dtsi
@@ -0,0 +1,42 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/clock/raspberrypi,rp1-clocks.h>
+
+pci_ep_bus: pci-ep-bus@1 {
+	compatible = "simple-bus";
+	ranges = <0x00 0x40000000  0x01 0x00 0x00000000  0x00 0x00400000>;
+	dma-ranges = <0x10 0x00000000  0x43000000 0x10 0x00000000  0x10 0x00000000>;
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	rp1_clocks: clocks@40018000 {
+		compatible = "raspberrypi,rp1-clocks";
+		reg = <0x00 0x40018000 0x0 0x10038>;
+		#clock-cells = <1>;
+		clocks = <&clk_rp1_xosc>;
+		assigned-clocks = <&rp1_clocks RP1_PLL_SYS_CORE>,
+				  <&rp1_clocks RP1_PLL_SYS>,
+				  <&rp1_clocks RP1_PLL_SYS_SEC>,
+				  <&rp1_clocks RP1_CLK_SYS>;
+		assigned-clock-rates = <1000000000>, // RP1_PLL_SYS_CORE
+				       <200000000>,  // RP1_PLL_SYS
+				       <125000000>,  // RP1_PLL_SYS_SEC
+				       <200000000>;  // RP1_CLK_SYS
+	};
+
+	rp1_gpio: pinctrl@400d0000 {
+		compatible = "raspberrypi,rp1-gpio";
+		reg = <0x00 0x400d0000  0x0 0xc000>,
+		      <0x00 0x400e0000  0x0 0xc000>,
+		      <0x00 0x400f0000  0x0 0xc000>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		interrupts = <0 IRQ_TYPE_LEVEL_HIGH>,
+			     <1 IRQ_TYPE_LEVEL_HIGH>,
+			     <2 IRQ_TYPE_LEVEL_HIGH>;
+	};
+};
diff --git a/arch/arm64/boot/dts/broadcom/rp1-nexus.dtsi b/arch/arm64/boot/dts/broadcom/rp1-nexus.dtsi
new file mode 100644
index 000000000000..0ef30d7f1c35
--- /dev/null
+++ b/arch/arm64/boot/dts/broadcom/rp1-nexus.dtsi
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+
+rp1_nexus {
+	compatible = "pci1de4,1";
+	#address-cells = <3>;
+	#size-cells = <2>;
+	ranges = <0x01 0x00 0x00000000
+		  0x02000000 0x00 0x00000000
+		  0x0 0x400000>;
+	interrupt-controller;
+	#interrupt-cells = <2>;
+
+	#include "rp1-common.dtsi"
+};
-- 
2.35.3

