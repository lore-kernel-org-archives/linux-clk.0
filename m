Received: from mail-io1-f43.google.com (mail-io1-f43.google.com [209.85.166.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2FA428ECEE
	for <linux-clk@vger.kernel.org>; Fri,  9 May 2025 11:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746789647; cv=none; b=sOisXNo/psI3QgND2AQvyJzxE2tbyMjVGRZyeCSZ374eST0jS5/o6d9Th44JYh67eztPgkHkjoYPCEQChSdhCnHLWgg+C/0FZVDLntNuNw9vGhTfJapxNzAWO7bHM12C0Gv4Xsnr0/Ol+lSMfztz8fgfNtTIt6FNtMEzkqqSnVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746789647; c=relaxed/simple;
	bh=mLs0fxNowr0COgkr82fEpqkOf+JG1y/e9MDEoWE3mQA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CORjhCr2v2nNSS39y7SDjysXZJM9QKVJ87iPVbPcI67j3niYBYMI5M7pTdyDhPrxTbilUPdgOwAPiiVTN0c51ZiIl7L4MpUGWffEN65giszy/1m1/+dFtyaAAKOfz1gbyNNy5yA1lnATHHRkCWzv/p1tZRZQl5fDpWjXb3OBEdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=CLDNTTPX; arc=none smtp.client-ip=209.85.166.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="CLDNTTPX"
Received: by mail-io1-f43.google.com with SMTP id ca18e2360f4ac-861b1f04b99so56048739f.0
        for <linux-clk@vger.kernel.org>; Fri, 09 May 2025 04:20:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1746789644; x=1747394444; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hembn1ZHHPDkNP/mH4YRUnbmiUBes0gARU1fynTJWJs=;
        b=CLDNTTPXyXy9U31Mdn7c+3yQHX2BO1cevxOMZMJYEkNRnBCry/H/VA87syjGcV0nms
         fuuTL7IQMY93j4gaoofYgqrYtLF16cG3aCcpeo0zKRBJvisSxoGLQGu8DWecDnAUZm0j
         xVPoUFIT/LlozI7UL3yWnvOQqtRkoKZrVjVI3vZCN76QpRG0h3aeFXYZhh5foklGlJ//
         2OSJqSPRu7O2eO+cKa/EOYSHuGAl4Ru1xVvzGOFAcmxH08lcH9fDHIba/gG2HnObQWQh
         y8AoiElmFtnGJmLzmQmcIB0YDsrh7D/09XhnPgiOB5Q5BIWqJUbhVp2R5Zk2K0T2ebhv
         4vKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746789644; x=1747394444;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Hembn1ZHHPDkNP/mH4YRUnbmiUBes0gARU1fynTJWJs=;
        b=O6yDgDQP7S6BYZ/73yswMFWiCeTIKNKS1cfm6XqKVCXOuoTlGG3KSUZt6kJR1tZeue
         yBnUtZPOt+6dxIdeeqDkgC/9hXiI6VfdR5iwrB9WdqHRki6M407+mHvWf0+iyaqtw6Qu
         /pCYUXOeHqmQp1kFcH0/e14GhntqwFJD7z1u20ac0caKLf2adNbIEMu9urSWRxdLQeCI
         yApntDpjBOm6REmo7oUBW8Zi6zWB6kE8I7ohbXTcbXQpp6RQ1mv1msinwQDbfsC9eeRS
         uvyJkdtoY50Bg53qEm19n+hw+U+Tr1bqD7mccD9zM0hpYnN2vs8VQ373dNJ/G8IO7eWk
         LEsg==
X-Forwarded-Encrypted: i=1; AJvYcCW4KjA36KftKjhB9tIWcLtUU874iRIdmNTiT3Dj9/v+bPudJIfN/X8Bpfok7tEi2NtETnO3+8pSkYg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzgOsByK4OJj/oK7qQyfPTgXapvlo7hSiBtnc30ohDswkEBsrKf
	rlQbvbtgImUF64CCcbmbYoyv41LD9lbKYDQLEWtPN7gtTTDH2PayWM/DVEPS870=
X-Gm-Gg: ASbGncuzufbnpeyNBkU1VXIuJkouWZ7w5LOSa0S+uKGhVAwFyzTFdPkQIxEtYj/SBx6
	ojMIWlDnlW9cjNYdvLqXuEO64YAHOjLevQWsNs+25dNdzDdMuR5sNYjWL6NURnm0mXMAzmh+Mzj
	Vu1ip70i96g8K17tmUmrroNA+HIvKxhQuxucuKdT06G3kbVjm7AqIYY2vaE/wPW9V3J9UeESSLe
	mCFGMsPiTKggp3Zgv8I7iSbUepsnVem2s4kAbvnADjE4p9GaKOQg7uXaza0LTwPAPGIEjqu0A4p
	rLa5sPPjyApTErMcRy2xzOE0WFHj0Ay0+Tr86fDtKRb0qbwhAIr/qDdn7+ETx5KDKHfpqTdoikN
	Py9F3z4MBkumM8g==
X-Google-Smtp-Source: AGHT+IHeOyq4NfJjqewraMZRDEeDKvPknZofKjtaDUybDOKdClf8Ez0NT+JaHGpGxHJS+FlVdfMUFA==
X-Received: by 2002:a05:6e02:3498:b0:3d3:f64a:38b9 with SMTP id e9e14a558f8ab-3da7e211026mr40278785ab.15.1746789643782;
        Fri, 09 May 2025 04:20:43 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3da7e10549fsm5136325ab.23.2025.05.09.04.20.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 04:20:43 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	p.zabel@pengutronix.de,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	dlan@gentoo.org
Cc: heylenay@4d2.org,
	inochiama@outlook.com,
	guodong@riscstar.com,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v8 4/6] reset: spacemit: add support for SpacemiT CCU resets
Date: Fri,  9 May 2025 06:20:29 -0500
Message-ID: <20250509112032.2980811-5-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250509112032.2980811-1-elder@riscstar.com>
References: <20250509112032.2980811-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Implement reset support for SpacemiT CCUs.  A SpacemiT reset controller
device is an auxiliary device associated with a clock controller (CCU).

This initial patch defines the reset controllers for the MPMU, APBC, and
MPMU CCUs, which already define clock controllers.

Signed-off-by: Alex Elder <elder@riscstar.com>
---
 drivers/reset/Kconfig          |   9 ++
 drivers/reset/Makefile         |   1 +
 drivers/reset/reset-spacemit.c | 246 +++++++++++++++++++++++++++++++++
 3 files changed, 256 insertions(+)
 create mode 100644 drivers/reset/reset-spacemit.c

diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
index 99f6f9784e686..28fa84ea4dbcc 100644
--- a/drivers/reset/Kconfig
+++ b/drivers/reset/Kconfig
@@ -263,6 +263,15 @@ config RESET_SOCFPGA
 	  This enables the reset driver for the SoCFPGA ARMv7 platforms. This
 	  driver gets initialized early during platform init calls.
 
+config RESET_SPACEMIT
+	tristate "SpacemiT reset driver"
+	depends on ARCH_SPACEMIT || COMPILE_TEST
+	select AUXILIARY_BUS
+	default ARCH_SPACEMIT
+	help
+	  This enables the reset controller driver for SpacemiT SoCs,
+	  including the K1.
+
 config RESET_SUNPLUS
 	bool "Sunplus SoCs Reset Driver" if COMPILE_TEST
 	default ARCH_SUNPLUS
diff --git a/drivers/reset/Makefile b/drivers/reset/Makefile
index 31f9904d13f9c..84f90abf96846 100644
--- a/drivers/reset/Makefile
+++ b/drivers/reset/Makefile
@@ -33,6 +33,7 @@ obj-$(CONFIG_RESET_RASPBERRYPI) += reset-raspberrypi.o
 obj-$(CONFIG_RESET_RZG2L_USBPHY_CTRL) += reset-rzg2l-usbphy-ctrl.o
 obj-$(CONFIG_RESET_SCMI) += reset-scmi.o
 obj-$(CONFIG_RESET_SIMPLE) += reset-simple.o
+obj-$(CONFIG_RESET_SPACEMIT) += reset-spacemit.o
 obj-$(CONFIG_RESET_SOCFPGA) += reset-socfpga.o
 obj-$(CONFIG_RESET_SUNPLUS) += reset-sunplus.o
 obj-$(CONFIG_RESET_SUNXI) += reset-sunxi.o
diff --git a/drivers/reset/reset-spacemit.c b/drivers/reset/reset-spacemit.c
new file mode 100644
index 0000000000000..eff67bdc8adba
--- /dev/null
+++ b/drivers/reset/reset-spacemit.c
@@ -0,0 +1,246 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+/* SpacemiT reset controller driver */
+
+#include <linux/auxiliary_bus.h>
+#include <linux/container_of.h>
+#include <linux/device.h>
+#include <linux/module.h>
+#include <linux/regmap.h>
+#include <linux/reset-controller.h>
+#include <linux/types.h>
+
+#include <soc/spacemit/k1-syscon.h>
+#include <dt-bindings/clock/spacemit,k1-syscon.h>
+
+struct ccu_reset_data {
+	u32 offset;
+	u32 assert_mask;
+	u32 deassert_mask;
+};
+
+struct ccu_reset_controller_data {
+	const struct ccu_reset_data *reset_data;	/* array */
+	size_t count;
+};
+
+struct ccu_reset_controller {
+	struct reset_controller_dev rcdev;
+	const struct ccu_reset_controller_data *data;
+	struct regmap *regmap;
+};
+
+#define RESET_DATA(_offset, _assert_mask, _deassert_mask)	\
+	{							\
+		.offset		= (_offset),			\
+		.assert_mask	= (_assert_mask),		\
+		.deassert_mask	= (_deassert_mask),		\
+	}
+
+static const struct ccu_reset_data k1_mpmu_resets[] = {
+	[RESET_WDT]	= RESET_DATA(MPMU_WDTPCR,		BIT(2), 0),
+};
+
+static const struct ccu_reset_controller_data k1_mpmu_reset_data = {
+	.reset_data	= k1_mpmu_resets,
+	.count		= ARRAY_SIZE(k1_mpmu_resets),
+};
+
+static const struct ccu_reset_data k1_apbc_resets[] = {
+	[RESET_UART0]	= RESET_DATA(APBC_UART1_CLK_RST,	BIT(2),	0),
+	[RESET_UART2]	= RESET_DATA(APBC_UART2_CLK_RST,	BIT(2), 0),
+	[RESET_GPIO]	= RESET_DATA(APBC_GPIO_CLK_RST,		BIT(2), 0),
+	[RESET_PWM0]	= RESET_DATA(APBC_PWM0_CLK_RST,		BIT(2), BIT(0)),
+	[RESET_PWM1]	= RESET_DATA(APBC_PWM1_CLK_RST,		BIT(2), BIT(0)),
+	[RESET_PWM2]	= RESET_DATA(APBC_PWM2_CLK_RST,		BIT(2), BIT(0)),
+	[RESET_PWM3]	= RESET_DATA(APBC_PWM3_CLK_RST,		BIT(2), BIT(0)),
+	[RESET_PWM4]	= RESET_DATA(APBC_PWM4_CLK_RST,		BIT(2), BIT(0)),
+	[RESET_PWM5]	= RESET_DATA(APBC_PWM5_CLK_RST,		BIT(2), BIT(0)),
+	[RESET_PWM6]	= RESET_DATA(APBC_PWM6_CLK_RST,		BIT(2), BIT(0)),
+	[RESET_PWM7]	= RESET_DATA(APBC_PWM7_CLK_RST,		BIT(2), BIT(0)),
+	[RESET_PWM8]	= RESET_DATA(APBC_PWM8_CLK_RST,		BIT(2), BIT(0)),
+	[RESET_PWM9]	= RESET_DATA(APBC_PWM9_CLK_RST,		BIT(2), BIT(0)),
+	[RESET_PWM10]	= RESET_DATA(APBC_PWM10_CLK_RST,	BIT(2), BIT(0)),
+	[RESET_PWM11]	= RESET_DATA(APBC_PWM11_CLK_RST,	BIT(2), BIT(0)),
+	[RESET_PWM12]	= RESET_DATA(APBC_PWM12_CLK_RST,	BIT(2), BIT(0)),
+	[RESET_PWM13]	= RESET_DATA(APBC_PWM13_CLK_RST,	BIT(2), BIT(0)),
+	[RESET_PWM14]	= RESET_DATA(APBC_PWM14_CLK_RST,	BIT(2), BIT(0)),
+	[RESET_PWM15]	= RESET_DATA(APBC_PWM15_CLK_RST,	BIT(2), BIT(0)),
+	[RESET_PWM16]	= RESET_DATA(APBC_PWM16_CLK_RST,	BIT(2), BIT(0)),
+	[RESET_PWM17]	= RESET_DATA(APBC_PWM17_CLK_RST,	BIT(2), BIT(0)),
+	[RESET_PWM18]	= RESET_DATA(APBC_PWM18_CLK_RST,	BIT(2), BIT(0)),
+	[RESET_PWM19]	= RESET_DATA(APBC_PWM19_CLK_RST,	BIT(2), BIT(0)),
+	[RESET_SSP3]	= RESET_DATA(APBC_SSP3_CLK_RST,		BIT(2), 0),
+	[RESET_UART3]	= RESET_DATA(APBC_UART3_CLK_RST,	BIT(2), 0),
+	[RESET_RTC]	= RESET_DATA(APBC_RTC_CLK_RST,		BIT(2), 0),
+	[RESET_TWSI0]	= RESET_DATA(APBC_TWSI0_CLK_RST,	BIT(2), 0),
+	[RESET_TIMERS1]	= RESET_DATA(APBC_TIMERS1_CLK_RST,	BIT(2), 0),
+	[RESET_AIB]	= RESET_DATA(APBC_AIB_CLK_RST,		BIT(2), 0),
+	[RESET_TIMERS2]	= RESET_DATA(APBC_TIMERS2_CLK_RST,	BIT(2), 0),
+	[RESET_ONEWIRE]	= RESET_DATA(APBC_ONEWIRE_CLK_RST,	BIT(2), 0),
+	[RESET_SSPA0]	= RESET_DATA(APBC_SSPA0_CLK_RST,	BIT(2), 0),
+	[RESET_SSPA1]	= RESET_DATA(APBC_SSPA1_CLK_RST,	BIT(2), 0),
+	[RESET_DRO]	= RESET_DATA(APBC_DRO_CLK_RST,		BIT(2), 0),
+	[RESET_IR]	= RESET_DATA(APBC_IR_CLK_RST,		BIT(2), 0),
+	[RESET_TWSI1]	= RESET_DATA(APBC_TWSI1_CLK_RST,	BIT(2), 0),
+	[RESET_TSEN]	= RESET_DATA(APBC_TSEN_CLK_RST,		BIT(2), 0),
+	[RESET_TWSI2]	= RESET_DATA(APBC_TWSI2_CLK_RST,	BIT(2), 0),
+	[RESET_TWSI4]	= RESET_DATA(APBC_TWSI4_CLK_RST,	BIT(2), 0),
+	[RESET_TWSI5]	= RESET_DATA(APBC_TWSI5_CLK_RST,	BIT(2), 0),
+	[RESET_TWSI6]	= RESET_DATA(APBC_TWSI6_CLK_RST,	BIT(2), 0),
+	[RESET_TWSI7]	= RESET_DATA(APBC_TWSI7_CLK_RST,	BIT(2), 0),
+	[RESET_TWSI8]	= RESET_DATA(APBC_TWSI8_CLK_RST,	BIT(2), 0),
+	[RESET_IPC_AP2AUD] = RESET_DATA(APBC_IPC_AP2AUD_CLK_RST, BIT(2), 0),
+	[RESET_UART4]	= RESET_DATA(APBC_UART4_CLK_RST,	BIT(2), 0),
+	[RESET_UART5]	= RESET_DATA(APBC_UART5_CLK_RST,	BIT(2), 0),
+	[RESET_UART6]	= RESET_DATA(APBC_UART6_CLK_RST,	BIT(2), 0),
+	[RESET_UART7]	= RESET_DATA(APBC_UART7_CLK_RST,	BIT(2), 0),
+	[RESET_UART8]	= RESET_DATA(APBC_UART8_CLK_RST,	BIT(2), 0),
+	[RESET_UART9]	= RESET_DATA(APBC_UART9_CLK_RST,	BIT(2), 0),
+	[RESET_CAN0]	= RESET_DATA(APBC_CAN0_CLK_RST,		BIT(2), 0),
+};
+
+static const struct ccu_reset_controller_data k1_apbc_reset_data = {
+	.reset_data	= k1_apbc_resets,
+	.count		= ARRAY_SIZE(k1_apbc_resets),
+};
+
+static const struct ccu_reset_data k1_apmu_resets[] = {
+	[RESET_CCIC_4X]	= RESET_DATA(APMU_CCIC_CLK_RES_CTRL,	0, BIT(1)),
+	[RESET_CCIC1_PHY] = RESET_DATA(APMU_CCIC_CLK_RES_CTRL,	0, BIT(2)),
+	[RESET_SDH_AXI]	= RESET_DATA(APMU_SDH0_CLK_RES_CTRL,	0, BIT(0)),
+	[RESET_SDH0]	= RESET_DATA(APMU_SDH0_CLK_RES_CTRL,	0, BIT(1)),
+	[RESET_SDH1]	= RESET_DATA(APMU_SDH1_CLK_RES_CTRL,	0, BIT(1)),
+	[RESET_SDH2]	= RESET_DATA(APMU_SDH2_CLK_RES_CTRL,	0, BIT(1)),
+	[RESET_USBP1_AXI] = RESET_DATA(APMU_USB_CLK_RES_CTRL,	0, BIT(4)),
+	[RESET_USB_AXI]	= RESET_DATA(APMU_USB_CLK_RES_CTRL,	0, BIT(0)),
+	[RESET_USB3_0]	= RESET_DATA(APMU_USB_CLK_RES_CTRL,	0,
+				      BIT(11) | BIT(10) | BIT(9)),
+	[RESET_QSPI]	= RESET_DATA(APMU_QSPI_CLK_RES_CTRL,	0, BIT(1)),
+	[RESET_QSPI_BUS] = RESET_DATA(APMU_QSPI_CLK_RES_CTRL,	0, BIT(0)),
+	[RESET_DMA]	= RESET_DATA(APMU_DMA_CLK_RES_CTRL,	0, BIT(0)),
+	[RESET_AES]	= RESET_DATA(APMU_AES_CLK_RES_CTRL,	0, BIT(4)),
+	[RESET_VPU]	= RESET_DATA(APMU_VPU_CLK_RES_CTRL,	0, BIT(0)),
+	[RESET_GPU]	= RESET_DATA(APMU_GPU_CLK_RES_CTRL,	0, BIT(1)),
+	[RESET_EMMC]	= RESET_DATA(APMU_PMUA_EM_CLK_RES_CTRL,	0, BIT(1)),
+	[RESET_EMMC_X]	= RESET_DATA(APMU_PMUA_EM_CLK_RES_CTRL,	0, BIT(0)),
+	[RESET_AUDIO]	= RESET_DATA(APMU_AUDIO_CLK_RES_CTRL,	0,
+				   BIT(3) | BIT(2) | BIT(0)),
+	[RESET_HDMI]	= RESET_DATA(APMU_HDMI_CLK_RES_CTRL,	0, BIT(9)),
+	[RESET_PCIE0]	= RESET_DATA(APMU_PCIE_CLK_RES_CTRL_0,	BIT(8),
+				   BIT(5) | BIT(4) | BIT(3)),
+	[RESET_PCIE1]	= RESET_DATA(APMU_PCIE_CLK_RES_CTRL_1,	BIT(8),
+				   BIT(5) | BIT(4) | BIT(3)),
+	[RESET_PCIE2]	= RESET_DATA(APMU_PCIE_CLK_RES_CTRL_2,	BIT(8),
+				   BIT(5) | BIT(4) | BIT(3)),
+	[RESET_EMAC0]	= RESET_DATA(APMU_EMAC0_CLK_RES_CTRL,	0, BIT(1)),
+	[RESET_EMAC1]	= RESET_DATA(APMU_EMAC1_CLK_RES_CTRL,	0, BIT(1)),
+	[RESET_JPG]	= RESET_DATA(APMU_JPG_CLK_RES_CTRL,	0, BIT(0)),
+	[RESET_CCIC2PHY] = RESET_DATA(APMU_CSI_CCIC2_CLK_RES_CTRL, 0, BIT(2)),
+	[RESET_CCIC3PHY] = RESET_DATA(APMU_CSI_CCIC2_CLK_RES_CTRL, 0, BIT(29)),
+	[RESET_CSI]	= RESET_DATA(APMU_CSI_CCIC2_CLK_RES_CTRL, 0, BIT(1)),
+	[RESET_ISP]	= RESET_DATA(APMU_ISP_CLK_RES_CTRL,	0, BIT(0)),
+	[RESET_ISP_CPP]	= RESET_DATA(APMU_ISP_CLK_RES_CTRL,	0, BIT(27)),
+	[RESET_ISP_BUS]	= RESET_DATA(APMU_ISP_CLK_RES_CTRL,	0, BIT(3)),
+	[RESET_ISP_CI]	= RESET_DATA(APMU_ISP_CLK_RES_CTRL,	0, BIT(16)),
+	[RESET_DPU_MCLK] = RESET_DATA(APMU_LCD_CLK_RES_CTRL2,	0, BIT(9)),
+	[RESET_DPU_ESC]	= RESET_DATA(APMU_LCD_CLK_RES_CTRL1,	0, BIT(3)),
+	[RESET_DPU_HCLK] = RESET_DATA(APMU_LCD_CLK_RES_CTRL1,	0, BIT(4)),
+	[RESET_DPU_SPIBUS] = RESET_DATA(APMU_LCD_SPI_CLK_RES_CTRL, 0, BIT(4)),
+	[RESET_DPU_SPI_HBUS] = RESET_DATA(APMU_LCD_SPI_CLK_RES_CTRL, 0, BIT(2)),
+	[RESET_V2D]	= RESET_DATA(APMU_LCD_CLK_RES_CTRL1,	0, BIT(27)),
+	[RESET_MIPI]	= RESET_DATA(APMU_LCD_CLK_RES_CTRL1,	0, BIT(15)),
+	[RESET_MC]	= RESET_DATA(APMU_PMUA_MC_CTRL,		0, BIT(0)),
+};
+
+static const struct ccu_reset_controller_data k1_apmu_reset_data = {
+	.reset_data	= k1_apmu_resets,
+	.count		= ARRAY_SIZE(k1_apmu_resets),
+};
+
+static int spacemit_reset_update(struct reset_controller_dev *rcdev,
+				 unsigned long id, bool assert)
+{
+	struct ccu_reset_controller *controller;
+	const struct ccu_reset_data *data;
+	u32 mask;
+	u32 val;
+
+	controller = container_of(rcdev, struct ccu_reset_controller, rcdev);
+	data = &controller->data->reset_data[id];
+	mask = data->assert_mask | data->deassert_mask;
+	val = assert ? data->assert_mask : data->deassert_mask;
+
+	return regmap_update_bits(controller->regmap, data->offset, mask, val);
+}
+
+static int spacemit_reset_assert(struct reset_controller_dev *rcdev,
+				 unsigned long id)
+{
+	return spacemit_reset_update(rcdev, id, true);
+}
+
+static int spacemit_reset_deassert(struct reset_controller_dev *rcdev,
+				   unsigned long id)
+{
+	return spacemit_reset_update(rcdev, id, false);
+}
+
+static const struct reset_control_ops spacemit_reset_control_ops = {
+	.assert		= spacemit_reset_assert,
+	.deassert	= spacemit_reset_deassert,
+};
+
+static int spacemit_reset_controller_register(struct device *dev,
+			       struct ccu_reset_controller *controller)
+{
+	struct reset_controller_dev *rcdev = &controller->rcdev;
+
+	rcdev->ops = &spacemit_reset_control_ops;
+	rcdev->owner = THIS_MODULE;
+	rcdev->of_node = dev->of_node;
+	rcdev->nr_resets = controller->data->count;
+
+	return devm_reset_controller_register(dev, &controller->rcdev);
+}
+
+static int spacemit_reset_probe(struct auxiliary_device *adev,
+				const struct auxiliary_device_id *id)
+{
+	struct spacemit_ccu_adev *rdev = to_spacemit_ccu_adev(adev);
+	const void *data = (void *)id->driver_data;
+	struct ccu_reset_controller *controller;
+	struct device *dev = &adev->dev;
+
+	controller = devm_kzalloc(dev, sizeof(*controller), GFP_KERNEL);
+	if (!controller)
+		return -ENOMEM;
+	controller->data = data;
+	controller->regmap = rdev->regmap;
+
+	return spacemit_reset_controller_register(dev, controller);
+}
+
+#define K1_AUX_DEV_ID(_unit) \
+	{ \
+		.name = "spacemit_ccu_k1." #_unit "-reset", \
+		.driver_data = (kernel_ulong_t)&k1_ ## _unit ## _reset_data, \
+	}
+
+static const struct auxiliary_device_id spacemit_reset_ids[] = {
+	K1_AUX_DEV_ID(mpmu),
+	K1_AUX_DEV_ID(apbc),
+	K1_AUX_DEV_ID(apmu),
+	{ },
+};
+MODULE_DEVICE_TABLE(auxiliary, spacemit_reset_ids);
+
+static struct auxiliary_driver spacemit_k1_reset_driver = {
+	.probe          = spacemit_reset_probe,
+	.id_table       = spacemit_reset_ids,
+};
+module_auxiliary_driver(spacemit_k1_reset_driver);
+
+MODULE_AUTHOR("Alex Elder <elder@kernel.org>");
+MODULE_DESCRIPTION("SpacemiT reset controller driver");
+MODULE_LICENSE("GPL");
-- 
2.45.2

