Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D689B364035
	for <linux-clk@vger.kernel.org>; Tue, 27 Jan 2026 17:09:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769533784; cv=none; b=OUECW/JA/yMCNJWe+h41Oa0Y7elDb2xbC1pQwxZKJ2mFxk5r6R8DNIj8HYkucJ90gy/h/OHpZqn/DLA+cyI8PRIckbIKMyg3gnbWGk+1xDBSv495hBFO/63egtuBrct+6q1vjqLITT7jkh/z3dWTgrDA/zoH82/+648Oao51Rvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769533784; c=relaxed/simple;
	bh=1vi+Msl5R79qBzAfUzeesTByl0ELGftsvbDJ0vXY03E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UEwSLgtThzL5SxA7d7jcMbSdPuaEkIXC8V8ylvAi2O0B7GSpLg68AvGip8aX6b+3kt4Xal61RbmtreWWjasOBF1wK2mmT6dqIIPBDy2PAh4Q7rgSe0Jl5LfT2oikmbWF4RH7wcXkufWhNB3p5jjdZvlbR4WLHOh0wJUvoOVIx6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=dhbVaD2N; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="dhbVaD2N"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 506AC1A2A9C;
	Tue, 27 Jan 2026 17:09:41 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2655B606F5;
	Tue, 27 Jan 2026 17:09:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7AE6D119A8699;
	Tue, 27 Jan 2026 18:09:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769533780; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=w1odAlmEkx+GduKelnjex71vq0A+kOfMC2EKAhxZ2Dk=;
	b=dhbVaD2N4fMAcH5gjf2sNIhFQahpWNk3cJY1d11xExAXjrKgUTUF72o6LKv2b13D27/92I
	MGRqnmEc/xAgEvvbjchv38L/0h2n0l7udPRKWQS+W//Bej0OJ+I7uN66kihlU4uvILRAjE
	ADCAstHbQA7jdTI0R6rcjx+X0ntFmsP5WD0vR3TL2Te173+0uqn7GgicKxx+h3X33JVUu9
	j+4IctmT1WpssDKErjCCqHnWVPUUbiBnDth2bgQU9K4lkB6OVWsYzdQ4WYTh0T+B0kBFX3
	HuQoBP9J9ablpodhsYGSQ/eT2IkJcmAkZkrAGAetH4tmCYgA6GrjmYXeat1byQ==
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Date: Tue, 27 Jan 2026 18:09:30 +0100
Subject: [PATCH v6 2/8] phy: sort Kconfig and Makefile
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260127-macb-phy-v6-2-cdd840588188@bootlin.com>
References: <20260127-macb-phy-v6-0-cdd840588188@bootlin.com>
In-Reply-To: <20260127-macb-phy-v6-0-cdd840588188@bootlin.com>
To: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 =?utf-8?q?Gr=C3=A9gory_Clement?= <gregory.clement@bootlin.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-mips@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-clk@vger.kernel.org, 
 =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>, 
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

Neither Kconfig nor Makefile are sorted; reorder them.

$ diff -U100 <(grep ^config drivers/phy/Kconfig) \
             <(grep ^config drivers/phy/Kconfig | sort)

$ diff -U100 <(grep ^obj-\\$ drivers/phy/Makefile) \
             <(grep ^obj-\\$ drivers/phy/Makefile | sort)

Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
---
 drivers/phy/Kconfig  | 62 ++++++++++++++++++++++++++--------------------------
 drivers/phy/Makefile |  6 ++---
 2 files changed, 34 insertions(+), 34 deletions(-)

diff --git a/drivers/phy/Kconfig b/drivers/phy/Kconfig
index 678dd0452f0a..4f1b1d7f5d20 100644
--- a/drivers/phy/Kconfig
+++ b/drivers/phy/Kconfig
@@ -25,6 +25,26 @@ config GENERIC_PHY_MIPI_DPHY
 	  Provides a number of helpers a core functions for MIPI D-PHY
 	  drivers to us.
 
+config PHY_AIROHA_PCIE
+	tristate "Airoha PCIe-PHY Driver"
+	depends on ARCH_AIROHA || COMPILE_TEST
+	depends on OF
+	select GENERIC_PHY
+	help
+	  Say Y here to add support for Airoha PCIe PHY driver.
+	  This driver create the basic PHY instance and provides initialize
+	  callback for PCIe GEN3 port.
+
+config PHY_CAN_TRANSCEIVER
+	tristate "CAN transceiver PHY"
+	select GENERIC_PHY
+	select MULTIPLEXER
+	help
+	  This option enables support for CAN transceivers as a PHY. This
+	  driver provides function for putting the transceivers in various
+	  functional modes using gpios and sets the attribute max link
+	  rate, for CAN drivers.
+
 config PHY_LPC18XX_USB_OTG
 	tristate "NXP LPC18xx/43xx SoC USB OTG PHY driver"
 	depends on OF && (ARCH_LPC18XX || COMPILE_TEST)
@@ -36,6 +56,17 @@ config PHY_LPC18XX_USB_OTG
 	  This driver is need for USB0 support on LPC18xx/43xx and takes
 	  care of enabling and clock setup.
 
+config PHY_NXP_PTN3222
+	tristate "NXP PTN3222 1-port eUSB2 to USB2 redriver"
+	depends on I2C
+	depends on OF
+	select GENERIC_PHY
+	help
+	  Enable this to support NXP PTN3222 1-port eUSB2 to USB2 Redriver.
+	  This redriver performs translation between eUSB2 and USB2 signalling
+	  schemes. It supports all three USB 2.0 data rates: Low Speed, Full
+	  Speed and High Speed.
+
 config PHY_PISTACHIO_USB
 	tristate "IMG Pistachio USB2.0 PHY driver"
 	depends on MIPS || COMPILE_TEST
@@ -70,37 +101,6 @@ config USB_LGM_PHY
 	  interface to interact with USB GEN-II and USB 3.x PHY that is part
 	  of the Intel network SOC.
 
-config PHY_CAN_TRANSCEIVER
-	tristate "CAN transceiver PHY"
-	select GENERIC_PHY
-	select MULTIPLEXER
-	help
-	  This option enables support for CAN transceivers as a PHY. This
-	  driver provides function for putting the transceivers in various
-	  functional modes using gpios and sets the attribute max link
-	  rate, for CAN drivers.
-
-config PHY_AIROHA_PCIE
-	tristate "Airoha PCIe-PHY Driver"
-	depends on ARCH_AIROHA || COMPILE_TEST
-	depends on OF
-	select GENERIC_PHY
-	help
-	  Say Y here to add support for Airoha PCIe PHY driver.
-	  This driver create the basic PHY instance and provides initialize
-	  callback for PCIe GEN3 port.
-
-config PHY_NXP_PTN3222
-	tristate "NXP PTN3222 1-port eUSB2 to USB2 redriver"
-	depends on I2C
-	depends on OF
-	select GENERIC_PHY
-	help
-	  Enable this to support NXP PTN3222 1-port eUSB2 to USB2 Redriver.
-	  This redriver performs translation between eUSB2 and USB2 signalling
-	  schemes. It supports all three USB 2.0 data rates: Low Speed, Full
-	  Speed and High Speed.
-
 source "drivers/phy/allwinner/Kconfig"
 source "drivers/phy/amlogic/Kconfig"
 source "drivers/phy/broadcom/Kconfig"
diff --git a/drivers/phy/Makefile b/drivers/phy/Makefile
index bfb27fb5a494..9943d742571d 100644
--- a/drivers/phy/Makefile
+++ b/drivers/phy/Makefile
@@ -5,14 +5,14 @@
 
 obj-$(CONFIG_GENERIC_PHY)		+= phy-core.o
 obj-$(CONFIG_GENERIC_PHY_MIPI_DPHY)	+= phy-core-mipi-dphy.o
+obj-$(CONFIG_PHY_AIROHA_PCIE)		+= phy-airoha-pcie.o
 obj-$(CONFIG_PHY_CAN_TRANSCEIVER)	+= phy-can-transceiver.o
 obj-$(CONFIG_PHY_LPC18XX_USB_OTG)	+= phy-lpc18xx-usb-otg.o
-obj-$(CONFIG_PHY_XGENE)			+= phy-xgene.o
+obj-$(CONFIG_PHY_NXP_PTN3222)		+= phy-nxp-ptn3222.o
 obj-$(CONFIG_PHY_PISTACHIO_USB)		+= phy-pistachio-usb.o
 obj-$(CONFIG_PHY_SNPS_EUSB2)		+= phy-snps-eusb2.o
+obj-$(CONFIG_PHY_XGENE)			+= phy-xgene.o
 obj-$(CONFIG_USB_LGM_PHY)		+= phy-lgm-usb.o
-obj-$(CONFIG_PHY_AIROHA_PCIE)		+= phy-airoha-pcie.o
-obj-$(CONFIG_PHY_NXP_PTN3222)		+= phy-nxp-ptn3222.o
 obj-y					+= allwinner/	\
 					   amlogic/	\
 					   broadcom/	\

-- 
2.52.0

