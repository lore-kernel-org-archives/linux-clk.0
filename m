Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0998298CBB
	for <linux-clk@vger.kernel.org>; Tue, 22 Apr 2025 18:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745347935; cv=none; b=VMgecuJ2cX+F0Eq5uV1MF4diRhs2L7Ts9J0LUEfi6q5mURYZvndMGE1vp/jRdcnGMEJdL8oRub1jWiJCRlEfuRvEayg0RwYbSimtb6DrxdJD1IcK+NKpe4Xk1tlmAddfYD/NMHjarJnvWhPOW8qJ+FeuJe3nErl/Gl/2cTqexfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745347935; c=relaxed/simple;
	bh=UTPvffIABUNhlGZVcA2XJgtcHh9OQXOBaQFZpX3Y43E=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=svvdQKq2YawAjyIvjdIW3/G5Gst+GckfEVwRhrDBsGj5tPDmdyLmyAHwhpjzitl46e5ZRObcbc1M7/N/RIXfvH2fRKQ/VfpHPlQZSLT7Rkh7CxMOJFTMzbi4jcRZWXLtY6g1iaLxFdiGIeeFss5TcYrBAGnOX1U0IzVWNCDAlRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=BKzKzsmO; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="BKzKzsmO"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43d0618746bso42603965e9.2
        for <linux-clk@vger.kernel.org>; Tue, 22 Apr 2025 11:52:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1745347929; x=1745952729; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jZnx4j541acJM3Wm8RPUZeJrdc2b8jCDkdy37pgO734=;
        b=BKzKzsmOuR2dIqSK5PmlTIZ6IXxJ3awhQZcXmyEMueIwjXLUH+RjEdugd3JEpGN1MT
         87GoXrs/5ymXtmvpeqcgpfobtjNYMRgj6ETS3sl+NmqEP2ZGvPKrdcqDcNKls35tQfc7
         PhpWs5Zyrdjkl8JWoLyJMON4MrpIvSED+BpfgQAYhIREqz736DUQv4kCXUu3T4tz+/0+
         ZhB6USV+NCU08IqdNBWrQp2Aw8UXQa8JTrQQsHdyW2RRgPKWnoNcal9ewO9r96SbJ0Ki
         HSHqiXNxVcKvu4SMiuMwzLn15Zw/7xoVhRuPUzFr+pk3/bnHvPqA5es9WyBnMx50s7u1
         SahQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745347929; x=1745952729;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jZnx4j541acJM3Wm8RPUZeJrdc2b8jCDkdy37pgO734=;
        b=l+P+P5o/OF53LmGs5Lk3HwKpC2sd5EQsTBgPoByvifsI6hCdOpPn2qhulW7Ad6cLwj
         U0nja/nl8v+zA7EvI5/NHwiGgDNk68Qp0pNzySCUplFhfzh9GB+VPbCYWcvVcG0vYXPn
         Bw+2aVdn0eAzu9v81cT+93REtjNQ4fFSo15BzL/spzGSSIGbMuuC+8pKoEBw6xKbh8Wn
         PnWt0I9gfwJyW8WJbbfNMGs3lMw6pHzQQnZp+SSaryqynYJUacPMniQNInBdfla9WDpu
         9/RkrYx07M94B0tUT66rbaE/DljzMzEJfzwde9jzrwwPhLuw11tGdS5D2naZ7AOpXZX4
         B8ZA==
X-Forwarded-Encrypted: i=1; AJvYcCXIFF0tviGw9FrEBPbmOlTQsMlGt1Ah0G83oQ8Wgye2z9rrGwPXuwapLOMRxH8CdtzhIuw4JSrwWUk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyUXHxcchB1yXkmCkA97MVSjl28rYm97rhgYuj207aeWygGIS07
	RgTYoZsK6DVMtBPUD4wDTJdk6wS5WbOUUm85sWokP4Zrlti7NjQAbBCoIKlj+pc=
X-Gm-Gg: ASbGncvVx+eRT/jx4aUt/C95U9o2+yn8dM+8OItJOZlp776wlrPRicQXxXUzULI+XHJ
	LDsHvdwYU0E8bYZd203X3PpWCv5lXF7w6gdXoOJCXBmgiupDyzUTpJkpSKYLv5QkS3npZoPHkD/
	/7AAQs7ehffxEISqFH537GjiD2CCP4XiPDl48DLQcs/RhgOUxD2nA+DdPNGQTKiS2j2lZl92rDr
	03XikJ6kP3nFx/Xrt+MzOyo1iAZS8bNw4xfpcHd1un9Pn+W/xfy9qINUWhK7H9LU1BQMyYhQZcl
	K+k+RvIViNtaqlvlJWcARqViNjst/eODX8e7YI31xZ9NWiRCD1+2GWCEBsCJVfJHaEeNztU=
X-Google-Smtp-Source: AGHT+IFg8Fki1LRM4fnnmh1iosi+KfKR/CqRtapkeYhOgAsRPRKq+DWMpLJJFhy6jDly7HRKgEDVxA==
X-Received: by 2002:a05:600c:a016:b0:43c:e2dd:98f3 with SMTP id 5b1f17b1804b1-4406ac0a324mr132480095e9.21.1745347928949;
        Tue, 22 Apr 2025 11:52:08 -0700 (PDT)
Received: from localhost (93-44-188-26.ip98.fastwebnet.it. [93.44.188.26])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa43bf2csm16237796f8f.51.2025.04.22.11.52.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 11:52:08 -0700 (PDT)
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
Subject: [PATCH v9 -next 06/12] arm64: dts: rp1: Add support for RaspberryPi's RP1 device
Date: Tue, 22 Apr 2025 20:53:15 +0200
Message-ID: <5d47f8e7eaad76032e1b5f433516dec7640384c3.1745347417.git.andrea.porta@suse.com>
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
index 92b959b4d372..a941e1cfb22e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20364,6 +20364,7 @@ F:	drivers/media/platform/raspberrypi/rp1-cfe/
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

