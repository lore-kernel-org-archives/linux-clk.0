Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76EBB3EE1D3
	for <linux-clk@vger.kernel.org>; Tue, 19 May 2026 22:08:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779228522; cv=none; b=AWX7D5w07KjeeHc/LTE5fsQOoPrEaWubmoN+KJE+W/Gb2KnrQM6Llji0K/ZbA5Cr8maktWesoz/Ldu7ve/H1eEb1NtTArwL6F9mfRQSmSmPr9ENu09JikIWj08iJbpgRlw+6VQiRMao4isOHhSWdxA4aa3VPD89GHIE6Wnouq8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779228522; c=relaxed/simple;
	bh=YjxbMZ+yk7cisMmHvb6qZw8xla3Zs2zCU9zPUH8M4SI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=beWj9KFba/5uRamvjr6JtgmLSvI7hCChnEnmnlIXav/YW8u7Eb3MrNju/TLySw8jw1y3DqsIZKzgiR9XmeSRlDkUAAzpOeUBSIMCc3UTs8Nej1MiK1SSG8E9JV50WX/5MzW5amkaWpwSejRJYNtW+1Ul6+rqgue8vBFNa/E4f6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TG0NufGb; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TG0NufGb"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4891e5b9c1fso35472805e9.2
        for <linux-clk@vger.kernel.org>; Tue, 19 May 2026 15:08:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779228518; x=1779833318; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3l6tT+zv2hEv+5a2W4DXJsvwW56rmOCfwB442L9l3pY=;
        b=TG0NufGbaivpoZSYNrtnRHKYkT1mNLmKGbCmsU1ft4dKuKT3lX/Zii34kigKgOW9rs
         OKhqYI1mUYeO5G2sznBjDpH2EpzEpqa2zuEPmSttKYKOBIBg29OeME+Tg5cTZ8+3zZOL
         v62sLZTAvOufXaUYfLUVwutSsZveLpvjeebF8DcIp8fnmVs7NXLJnpRdjRUqjZu1JZDL
         w+W1ebc29myr8Cge1Lo/3mwCqMpgnYvJS7xTyDXgz7aXt+Wh2A5nqoZ1SMSH/bwXDwCH
         9dkApeOz7SmK+Cr7AjaInJ16BRz/a5r3BZ27t9PY1LC+ulfisoZBl+J6QXQAfV4beUge
         spmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779228518; x=1779833318;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3l6tT+zv2hEv+5a2W4DXJsvwW56rmOCfwB442L9l3pY=;
        b=HnuvLLToaFAy0+OBGPXChBzAWTZvxcWUPacjKgabOSE3kTbrDcxdxtx0n4PU7Q9I4u
         pmo+42Va1deEgPW5Bie+udwuW5WsZmVnd0i2OVJ6R7uS4km/0yYia2EdaUGEe9ZadPxa
         a1T1q01IZNcT/f9SAV4oN8kVYzWjbKTkgftkc3ob908g/esVyhOJLdeEkBHpUfEjfeCS
         1ugDTECovINdyAIJcOJEbOrEu37ffInAV+huMdIPWHxg5YnxbbwE0V6Ul8tuaECRDrhT
         bGpx9gyyiVfNkitZO/ksyFpGDIpy9T6Lck+4zl+oCLB6Pe2L5Y7KIT+mGyoAAVXltdRx
         Hegg==
X-Forwarded-Encrypted: i=1; AFNElJ822xYurQ/AYgj+n850sA638KQ8YtYZyxAU+1ule4OiIt6m2oH+UwTUwgIfuq+2AKCHMcoEbJ6WzHY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzxwKlpSqgQtV+7wMUZJWbEJF/CKJqozSy7t95xsNcmGGwHK+2q
	AkGAz1uv+dXPPQy+/HRZWc2f+Nl1iomuwbL5UVRP8OUsV06+IifqIGOv
X-Gm-Gg: Acq92OHhF4e2KH58GHzbE9xM/sFBzbZfY/5s8ruI19eTL6wNjY/l0swzEkGXOnQrW1F
	idxHPGsTgiHuCOcrlLHdxCqMf8nGQJWU2DY4BSfFv5j//cOqCHx0QFfCSMsxhHbZ/nTxf8j6251
	zm3Du7k1vmB+/qGw4JxulQ0vJglmZQos7VRwN9j3Ext0fySjElY9DIdTm7eXJQaYaQ3kzAO6Br8
	TXegwLOplffOOGCU15LqxgteWNIVjmXQq0hwwTxuXInGJP/j6iYZCjmGWZhASJeWaTkD2t/lJ1x
	OErL4nSQVPYpfLq9TlUV3ow/p95ZIe/6hvkvNyAKl9KEN1oJtNYrtFvsvpdXpppOQnJ5lAPmocv
	SrhHf9xdlL+zeM00DTSo1i4UCJdxa2xge59tXgf3+1H3yQTPIjATa5KJ37Y6j2m6Te2mA0HVWHa
	NnFH7VTDkD7YhBM/artK8zvRt3xCu+77v6EBkc2Ad+ubcM8sIPx2KSL+B5FVfr8JIUvS7bx/XYO
	ogAomavcg==
X-Received: by 2002:a05:600c:314f:b0:490:389:7644 with SMTP id 5b1f17b1804b1-49006db5bc0mr193224275e9.17.1779228517800;
        Tue, 19 May 2026 15:08:37 -0700 (PDT)
Received: from Ansuel-XPS24 (host-82-55-252-101.retail.telecomitalia.it. [82.55.252.101])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-48febe585absm118304005e9.19.2026.05.19.15.08.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 15:08:37 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Felix Fietkau <nbd@nbd.name>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org
Subject: [PATCH v7 6/6] phy: airoha: Add support for Airoha AN7581 USB PHY
Date: Wed, 20 May 2026 00:08:11 +0200
Message-ID: <20260519220813.28468-7-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260519220813.28468-1-ansuelsmth@gmail.com>
References: <20260519220813.28468-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for Airoha AN7581 USB PHY driver. AN7581 supports up to 2
USB port with USB 2.0 mode always supported and USB 3.0 mode available
only if the Serdes port is correctly configured for USB 3.0.

If the USB 3.0 mode is not configured, the modes needs to be also
disabled in the xHCI node or the driver will report unsable clock and
fail probe.

For USB 2.0 Slew Rate calibration, airoha,usb2-monitor-clk-sel is
mandatory and is used to select the monitor clock for calibration.

Normally it's 1 for USB port 1 and 2 for USB port 2.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 MAINTAINERS                         |   1 +
 drivers/phy/airoha/Kconfig          |  10 +
 drivers/phy/airoha/Makefile         |   1 +
 drivers/phy/airoha/phy-an7581-usb.c | 562 ++++++++++++++++++++++++++++
 4 files changed, 574 insertions(+)
 create mode 100644 drivers/phy/airoha/phy-an7581-usb.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 7bea8c620da8..2f05faa44503 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -776,6 +776,7 @@ M:	Christian Marangi <ansuelsmth@gmail.com>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
 F:	Documentation/devicetree/bindings/phy/airoha,an7581-usb-phy.yaml
+F:	drivers/phy/airoha/phy-an7581-usb.c
 
 AIRSPY MEDIA DRIVER
 L:	linux-media@vger.kernel.org
diff --git a/drivers/phy/airoha/Kconfig b/drivers/phy/airoha/Kconfig
index 9a1b625a7701..bb4e3367baa5 100644
--- a/drivers/phy/airoha/Kconfig
+++ b/drivers/phy/airoha/Kconfig
@@ -11,3 +11,13 @@ config PHY_AIROHA_AN7581_PCIE
 	  Say Y here to add support for Airoha AN7581 PCIe PHY driver.
 	  This driver create the basic PHY instance and provides initialize
 	  callback for PCIe GEN3 port.
+
+config PHY_AIROHA_AN7581_USB
+	tristate "Airoha AN7581 USB PHY Driver"
+	depends on ARCH_AIROHA || COMPILE_TEST
+	depends on OF
+	select GENERIC_PHY
+	help
+	  Say 'Y' here to add support for Airoha AN7581 USB PHY driver.
+	  This driver create the basic PHY instance and provides initialize
+	  callback for USB port.
diff --git a/drivers/phy/airoha/Makefile b/drivers/phy/airoha/Makefile
index 912f3e11a061..944bf842deba 100644
--- a/drivers/phy/airoha/Makefile
+++ b/drivers/phy/airoha/Makefile
@@ -1,3 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0
 
 obj-$(CONFIG_PHY_AIROHA_AN7581_PCIE)	+= phy-an7581-pcie.o
+obj-$(CONFIG_PHY_AIROHA_AN7581_USB)	+= phy-an7581-usb.o
diff --git a/drivers/phy/airoha/phy-an7581-usb.c b/drivers/phy/airoha/phy-an7581-usb.c
new file mode 100644
index 000000000000..90fd2cbe68d4
--- /dev/null
+++ b/drivers/phy/airoha/phy-an7581-usb.c
@@ -0,0 +1,562 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Author: Christian Marangi <ansuelsmth@gmail.com>
+ */
+
+#include <dt-bindings/phy/phy.h>
+#include <dt-bindings/soc/airoha,scu-ssr.h>
+#include <linux/bitfield.h>
+#include <linux/math.h>
+#include <linux/module.h>
+#include <linux/mfd/syscon.h>
+#include <linux/phy/phy.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+/* U2PHY */
+#define AIROHA_USB_PHY_FMCR0			0x100
+#define   AIROHA_USB_PHY_MONCLK_SEL		GENMASK(27, 26)
+#define   AIROHA_USB_PHY_MONCLK_SEL0		FIELD_PREP_CONST(AIROHA_USB_PHY_MONCLK_SEL, 0x0)
+#define   AIROHA_USB_PHY_MONCLK_SEL1		FIELD_PREP_CONST(AIROHA_USB_PHY_MONCLK_SEL, 0x1)
+#define   AIROHA_USB_PHY_MONCLK_SEL2		FIELD_PREP_CONST(AIROHA_USB_PHY_MONCLK_SEL, 0x2)
+#define   AIROHA_USB_PHY_MONCLK_SEL3		FIELD_PREP_CONST(AIROHA_USB_PHY_MONCLK_SEL, 0x3)
+#define   AIROHA_USB_PHY_FREQDET_EN		BIT(24)
+#define   AIROHA_USB_PHY_CYCLECNT		GENMASK(23, 0)
+#define AIROHA_USB_PHY_FMMONR0			0x10c
+#define   AIROHA_USB_PHY_USB_FM_OUT		GENMASK(31, 0)
+#define AIROHA_USB_PHY_FMMONR1			0x110
+#define   AIROHA_USB_PHY_FRCK_EN		BIT(8)
+
+#define AIROHA_USB_PHY_USBPHYACR4		0x310
+#define   AIROHA_USB_PHY_USB20_FS_CR		GENMASK(10, 8)
+#define   AIROHA_USB_PHY_USB20_FS_CR_MAX	FIELD_PREP_CONST(AIROHA_USB_PHY_USB20_FS_CR, 0x0)
+#define   AIROHA_USB_PHY_USB20_FS_CR_NORMAL	FIELD_PREP_CONST(AIROHA_USB_PHY_USB20_FS_CR, 0x2)
+#define   AIROHA_USB_PHY_USB20_FS_CR_SMALLER	FIELD_PREP_CONST(AIROHA_USB_PHY_USB20_FS_CR, 0x4)
+#define   AIROHA_USB_PHY_USB20_FS_CR_MIN	FIELD_PREP_CONST(AIROHA_USB_PHY_USB20_FS_CR, 0x6)
+#define   AIROHA_USB_PHY_USB20_FS_SR		GENMASK(2, 0)
+#define   AIROHA_USB_PHY_USB20_FS_SR_MAX	FIELD_PREP_CONST(AIROHA_USB_PHY_USB20_FS_SR, 0x0)
+#define   AIROHA_USB_PHY_USB20_FS_SR_NORMAL	FIELD_PREP_CONST(AIROHA_USB_PHY_USB20_FS_SR, 0x2)
+#define   AIROHA_USB_PHY_USB20_FS_SR_SMALLER	FIELD_PREP_CONST(AIROHA_USB_PHY_USB20_FS_SR, 0x4)
+#define   AIROHA_USB_PHY_USB20_FS_SR_MIN	FIELD_PREP_CONST(AIROHA_USB_PHY_USB20_FS_SR, 0x6)
+#define AIROHA_USB_PHY_USBPHYACR5		0x314
+#define   AIROHA_USB_PHY_USB20_HSTX_SRCAL_EN	BIT(15)
+#define   AIROHA_USB_PHY_USB20_HSTX_SRCTRL	GENMASK(14, 12)
+#define AIROHA_USB_PHY_USBPHYACR6		0x318
+#define   AIROHA_USB_PHY_USB20_BC11_SW_EN	BIT(23)
+#define   AIROHA_USB_PHY_USB20_DISCTH		GENMASK(7, 4)
+#define   AIROHA_USB_PHY_USB20_DISCTH_400	FIELD_PREP_CONST(AIROHA_USB_PHY_USB20_DISCTH, 0x0)
+#define   AIROHA_USB_PHY_USB20_DISCTH_420	FIELD_PREP_CONST(AIROHA_USB_PHY_USB20_DISCTH, 0x1)
+#define   AIROHA_USB_PHY_USB20_DISCTH_440	FIELD_PREP_CONST(AIROHA_USB_PHY_USB20_DISCTH, 0x2)
+#define   AIROHA_USB_PHY_USB20_DISCTH_460	FIELD_PREP_CONST(AIROHA_USB_PHY_USB20_DISCTH, 0x3)
+#define   AIROHA_USB_PHY_USB20_DISCTH_480	FIELD_PREP_CONST(AIROHA_USB_PHY_USB20_DISCTH, 0x4)
+#define   AIROHA_USB_PHY_USB20_DISCTH_500	FIELD_PREP_CONST(AIROHA_USB_PHY_USB20_DISCTH, 0x5)
+#define   AIROHA_USB_PHY_USB20_DISCTH_520	FIELD_PREP_CONST(AIROHA_USB_PHY_USB20_DISCTH, 0x6)
+#define   AIROHA_USB_PHY_USB20_DISCTH_540	FIELD_PREP_CONST(AIROHA_USB_PHY_USB20_DISCTH, 0x7)
+#define   AIROHA_USB_PHY_USB20_DISCTH_560	FIELD_PREP_CONST(AIROHA_USB_PHY_USB20_DISCTH, 0x8)
+#define   AIROHA_USB_PHY_USB20_DISCTH_580	FIELD_PREP_CONST(AIROHA_USB_PHY_USB20_DISCTH, 0x9)
+#define   AIROHA_USB_PHY_USB20_DISCTH_600	FIELD_PREP_CONST(AIROHA_USB_PHY_USB20_DISCTH, 0xa)
+#define   AIROHA_USB_PHY_USB20_DISCTH_620	FIELD_PREP_CONST(AIROHA_USB_PHY_USB20_DISCTH, 0xb)
+#define   AIROHA_USB_PHY_USB20_DISCTH_640	FIELD_PREP_CONST(AIROHA_USB_PHY_USB20_DISCTH, 0xc)
+#define   AIROHA_USB_PHY_USB20_DISCTH_660	FIELD_PREP_CONST(AIROHA_USB_PHY_USB20_DISCTH, 0xd)
+#define   AIROHA_USB_PHY_USB20_DISCTH_680	FIELD_PREP_CONST(AIROHA_USB_PHY_USB20_DISCTH, 0xe)
+#define   AIROHA_USB_PHY_USB20_DISCTH_700	FIELD_PREP_CONST(AIROHA_USB_PHY_USB20_DISCTH, 0xf)
+#define   AIROHA_USB_PHY_USB20_SQTH		GENMASK(3, 0)
+#define   AIROHA_USB_PHY_USB20_SQTH_85		FIELD_PREP_CONST(AIROHA_USB_PHY_USB20_SQTH, 0x0)
+#define   AIROHA_USB_PHY_USB20_SQTH_90		FIELD_PREP_CONST(AIROHA_USB_PHY_USB20_SQTH, 0x1)
+#define   AIROHA_USB_PHY_USB20_SQTH_95		FIELD_PREP_CONST(AIROHA_USB_PHY_USB20_SQTH, 0x2)
+#define   AIROHA_USB_PHY_USB20_SQTH_100		FIELD_PREP_CONST(AIROHA_USB_PHY_USB20_SQTH, 0x3)
+#define   AIROHA_USB_PHY_USB20_SQTH_105		FIELD_PREP_CONST(AIROHA_USB_PHY_USB20_SQTH, 0x4)
+#define   AIROHA_USB_PHY_USB20_SQTH_110		FIELD_PREP_CONST(AIROHA_USB_PHY_USB20_SQTH, 0x5)
+#define   AIROHA_USB_PHY_USB20_SQTH_115		FIELD_PREP_CONST(AIROHA_USB_PHY_USB20_SQTH, 0x6)
+#define   AIROHA_USB_PHY_USB20_SQTH_120		FIELD_PREP_CONST(AIROHA_USB_PHY_USB20_SQTH, 0x7)
+#define   AIROHA_USB_PHY_USB20_SQTH_125		FIELD_PREP_CONST(AIROHA_USB_PHY_USB20_SQTH, 0x8)
+#define   AIROHA_USB_PHY_USB20_SQTH_130		FIELD_PREP_CONST(AIROHA_USB_PHY_USB20_SQTH, 0x9)
+#define   AIROHA_USB_PHY_USB20_SQTH_135		FIELD_PREP_CONST(AIROHA_USB_PHY_USB20_SQTH, 0xa)
+#define   AIROHA_USB_PHY_USB20_SQTH_140		FIELD_PREP_CONST(AIROHA_USB_PHY_USB20_SQTH, 0xb)
+#define   AIROHA_USB_PHY_USB20_SQTH_145		FIELD_PREP_CONST(AIROHA_USB_PHY_USB20_SQTH, 0xc)
+#define   AIROHA_USB_PHY_USB20_SQTH_150		FIELD_PREP_CONST(AIROHA_USB_PHY_USB20_SQTH, 0xd)
+#define   AIROHA_USB_PHY_USB20_SQTH_155		FIELD_PREP_CONST(AIROHA_USB_PHY_USB20_SQTH, 0xe)
+#define   AIROHA_USB_PHY_USB20_SQTH_160		FIELD_PREP_CONST(AIROHA_USB_PHY_USB20_SQTH, 0xf)
+
+#define AIROHA_USB_PHY_U2PHYDTM1		0x36c
+#define   AIROHA_USB_PHY_FORCE_IDDIG		BIT(9)
+#define   AIROHA_USB_PHY_IDDIG			BIT(1)
+
+#define AIROHA_USB_PHY_GPIO_CTLD		0x80c
+#define   AIROHA_USB_PHY_C60802_GPIO_CTLD	GENMASK(31, 0)
+#define     AIROHA_USB_PHY_SSUSB_IP_SW_RST	BIT(31)
+#define     AIROHA_USB_PHY_MCU_BUS_CK_GATE_EN	BIT(30)
+#define     AIROHA_USB_PHY_FORCE_SSUSB_IP_SW_RST BIT(29)
+#define     AIROHA_USB_PHY_SSUSB_SW_RST		BIT(28)
+
+#define AIROHA_USB_PHY_U3_PHYA_REG0		0xb00
+#define   AIROHA_USB_PHY_SSUSB_BG_DIV		GENMASK(29, 28)
+#define   AIROHA_USB_PHY_SSUSB_BG_DIV_2		FIELD_PREP_CONST(AIROHA_USB_PHY_SSUSB_BG_DIV, 0x0)
+#define   AIROHA_USB_PHY_SSUSB_BG_DIV_4		FIELD_PREP_CONST(AIROHA_USB_PHY_SSUSB_BG_DIV, 0x1)
+#define   AIROHA_USB_PHY_SSUSB_BG_DIV_8		FIELD_PREP_CONST(AIROHA_USB_PHY_SSUSB_BG_DIV, 0x2)
+#define   AIROHA_USB_PHY_SSUSB_BG_DIV_16	FIELD_PREP_CONST(AIROHA_USB_PHY_SSUSB_BG_DIV, 0x3)
+#define AIROHA_USB_PHY_U3_PHYA_REG1		0xb04
+#define   AIROHA_USB_PHY_SSUSB_XTAL_TOP_RESERVE	GENMASK(25, 10)
+#define AIROHA_USB_PHY_U3_PHYA_REG6		0xb18
+#define   AIROHA_USB_PHY_SSUSB_CDR_RESERVE	GENMASK(31, 24)
+#define AIROHA_USB_PHY_U3_PHYA_REG8		0xb20
+#define   AIROHA_USB_PHY_SSUSB_CDR_RST_DLY	GENMASK(7, 6)
+#define   AIROHA_USB_PHY_SSUSB_CDR_RST_DLY_32	FIELD_PREP_CONST(AIROHA_USB_PHY_SSUSB_CDR_RST_DLY, 0x0)
+#define   AIROHA_USB_PHY_SSUSB_CDR_RST_DLY_64	FIELD_PREP_CONST(AIROHA_USB_PHY_SSUSB_CDR_RST_DLY, 0x1)
+#define   AIROHA_USB_PHY_SSUSB_CDR_RST_DLY_128	FIELD_PREP_CONST(AIROHA_USB_PHY_SSUSB_CDR_RST_DLY, 0x2)
+#define   AIROHA_USB_PHY_SSUSB_CDR_RST_DLY_216	FIELD_PREP_CONST(AIROHA_USB_PHY_SSUSB_CDR_RST_DLY, 0x3)
+
+#define AIROHA_USB_PHY_U3_PHYA_DA_REG19		0xc38
+#define   AIROHA_USB_PHY_SSUSB_PLL_SSC_DELTA1_U3 GENMASK(15, 0)
+
+#define AIROHA_USB_PHY_U2_FM_DET_CYCLE_CNT	1024
+#define AIROHA_USB_PHY_REF_CK			20
+#define AIROHA_USB_PHY_U2_SR_COEF		28
+#define AIROHA_USB_PHY_U2_SR_COEF_DIVISOR	1000
+
+#define AIROHA_USB_PHY_DEFAULT_SR_CALIBRATION	0x5
+#define AIROHA_USB_PHY_FREQDET_SLEEP		1000 /* 1ms */
+#define AIROHA_USB_PHY_FREQDET_TIMEOUT		(AIROHA_USB_PHY_FREQDET_SLEEP * 10)
+
+struct an7581_usb_phy_instance {
+	struct phy *phy;
+	u32 type;
+};
+
+enum an7581_usb_phy_instance_type {
+	AIROHA_PHY_USB2,
+	AIROHA_PHY_USB3,
+
+	AIROHA_PHY_USB_MAX,
+};
+
+struct an7581_usb_phy_priv {
+	struct device *dev;
+	struct regmap *regmap;
+
+	unsigned int monclk_sel;
+
+	struct phy *serdes_phy;
+	struct an7581_usb_phy_instance *phys[AIROHA_PHY_USB_MAX];
+};
+
+static void an7581_usb_phy_u2_slew_rate_calibration(struct an7581_usb_phy_priv *priv)
+{
+	u32 fm_out;
+	u32 srctrl;
+
+	/* Enable HS TX SR calibration */
+	regmap_set_bits(priv->regmap, AIROHA_USB_PHY_USBPHYACR5,
+			AIROHA_USB_PHY_USB20_HSTX_SRCAL_EN);
+
+	usleep_range(1000, 1500);
+
+	/* Enable Free run clock */
+	regmap_set_bits(priv->regmap, AIROHA_USB_PHY_FMMONR1,
+			AIROHA_USB_PHY_FRCK_EN);
+
+	/* Select Monitor Clock */
+	regmap_update_bits(priv->regmap, AIROHA_USB_PHY_FMCR0,
+			   AIROHA_USB_PHY_MONCLK_SEL,
+			   FIELD_PREP(AIROHA_USB_PHY_MONCLK_SEL,
+				      priv->monclk_sel));
+
+	/* Set cyclecnt */
+	regmap_update_bits(priv->regmap, AIROHA_USB_PHY_FMCR0,
+			   AIROHA_USB_PHY_CYCLECNT,
+			   FIELD_PREP(AIROHA_USB_PHY_CYCLECNT,
+				      AIROHA_USB_PHY_U2_FM_DET_CYCLE_CNT));
+
+	/* Enable Frequency meter */
+	regmap_set_bits(priv->regmap, AIROHA_USB_PHY_FMCR0,
+			AIROHA_USB_PHY_FREQDET_EN);
+
+	/* Timeout can happen and we will apply workaround at the end */
+	regmap_read_poll_timeout(priv->regmap, AIROHA_USB_PHY_FMMONR0, fm_out,
+				 fm_out, AIROHA_USB_PHY_FREQDET_SLEEP,
+				 AIROHA_USB_PHY_FREQDET_TIMEOUT);
+
+	/* Disable Frequency meter */
+	regmap_clear_bits(priv->regmap, AIROHA_USB_PHY_FMCR0,
+			  AIROHA_USB_PHY_FREQDET_EN);
+
+	/* Disable Free run clock */
+	regmap_clear_bits(priv->regmap, AIROHA_USB_PHY_FMMONR1,
+			  AIROHA_USB_PHY_FRCK_EN);
+
+	/* Disable HS TX SR calibration */
+	regmap_clear_bits(priv->regmap, AIROHA_USB_PHY_USBPHYACR5,
+			  AIROHA_USB_PHY_USB20_HSTX_SRCAL_EN);
+
+	usleep_range(1000, 1500);
+
+	/* Frequency was not detected, use default SR calibration value */
+	if (!fm_out) {
+		srctrl = AIROHA_USB_PHY_DEFAULT_SR_CALIBRATION;
+		dev_err(priv->dev, "Frequency not detected, using default SR calibration.\n");
+	} else {
+		/* (1024 / FM_OUT) * REF_CK * U2_SR_COEF (round to the nearest digits) */
+		srctrl = AIROHA_USB_PHY_REF_CK * AIROHA_USB_PHY_U2_SR_COEF;
+		srctrl = (srctrl * AIROHA_USB_PHY_U2_FM_DET_CYCLE_CNT) / fm_out;
+		srctrl = DIV_ROUND_CLOSEST(srctrl, AIROHA_USB_PHY_U2_SR_COEF_DIVISOR);
+		dev_dbg(priv->dev, "SR calibration applied: %x\n", srctrl);
+	}
+
+	regmap_update_bits(priv->regmap, AIROHA_USB_PHY_USBPHYACR5,
+			   AIROHA_USB_PHY_USB20_HSTX_SRCTRL,
+			   FIELD_PREP(AIROHA_USB_PHY_USB20_HSTX_SRCTRL, srctrl));
+}
+
+static void an7581_usb_phy_u2_init(struct an7581_usb_phy_priv *priv)
+{
+	regmap_update_bits(priv->regmap, AIROHA_USB_PHY_USBPHYACR4,
+			   AIROHA_USB_PHY_USB20_FS_CR,
+			   AIROHA_USB_PHY_USB20_FS_CR_MIN);
+
+	regmap_update_bits(priv->regmap, AIROHA_USB_PHY_USBPHYACR4,
+			   AIROHA_USB_PHY_USB20_FS_SR,
+			   AIROHA_USB_PHY_USB20_FS_SR_NORMAL);
+
+	/* FIXME: evaluate if needed */
+	regmap_update_bits(priv->regmap, AIROHA_USB_PHY_USBPHYACR6,
+			   AIROHA_USB_PHY_USB20_SQTH,
+			   AIROHA_USB_PHY_USB20_SQTH_130);
+
+	regmap_update_bits(priv->regmap, AIROHA_USB_PHY_USBPHYACR6,
+			   AIROHA_USB_PHY_USB20_DISCTH,
+			   AIROHA_USB_PHY_USB20_DISCTH_600);
+
+	/* Enable the USB port and then disable after calibration */
+	regmap_clear_bits(priv->regmap, AIROHA_USB_PHY_USBPHYACR6,
+			  AIROHA_USB_PHY_USB20_BC11_SW_EN);
+
+	an7581_usb_phy_u2_slew_rate_calibration(priv);
+
+	regmap_set_bits(priv->regmap, AIROHA_USB_PHY_USBPHYACR6,
+			AIROHA_USB_PHY_USB20_BC11_SW_EN);
+
+	usleep_range(1000, 1500);
+}
+
+/*
+ * USB 3.0 mode can only work if USB serdes is correctly set.
+ * This is validated in xLate function.
+ */
+static void an7581_usb_phy_u3_init(struct an7581_usb_phy_priv *priv)
+{
+	regmap_update_bits(priv->regmap, AIROHA_USB_PHY_U3_PHYA_REG8,
+			   AIROHA_USB_PHY_SSUSB_CDR_RST_DLY,
+			   AIROHA_USB_PHY_SSUSB_CDR_RST_DLY_32);
+
+	regmap_update_bits(priv->regmap, AIROHA_USB_PHY_U3_PHYA_REG6,
+			   AIROHA_USB_PHY_SSUSB_CDR_RESERVE,
+			   FIELD_PREP(AIROHA_USB_PHY_SSUSB_CDR_RESERVE, 0xe));
+
+	regmap_update_bits(priv->regmap, AIROHA_USB_PHY_U3_PHYA_REG0,
+			   AIROHA_USB_PHY_SSUSB_BG_DIV,
+			   AIROHA_USB_PHY_SSUSB_BG_DIV_4);
+
+	regmap_set_bits(priv->regmap, AIROHA_USB_PHY_U3_PHYA_REG1,
+			FIELD_PREP(AIROHA_USB_PHY_SSUSB_XTAL_TOP_RESERVE, 0x600));
+
+	regmap_update_bits(priv->regmap, AIROHA_USB_PHY_U3_PHYA_DA_REG19,
+			   AIROHA_USB_PHY_SSUSB_PLL_SSC_DELTA1_U3,
+			   FIELD_PREP(AIROHA_USB_PHY_SSUSB_PLL_SSC_DELTA1_U3, 0x43));
+}
+
+static int an7581_usb_phy_init(struct phy *phy)
+{
+	struct an7581_usb_phy_instance *instance = phy_get_drvdata(phy);
+	struct an7581_usb_phy_priv *priv = dev_get_drvdata(phy->dev.parent);
+	int ret;
+
+	switch (instance->type) {
+	case PHY_TYPE_USB2:
+		an7581_usb_phy_u2_init(priv);
+		break;
+	case PHY_TYPE_USB3:
+		ret = phy_set_mode(priv->serdes_phy, PHY_MODE_USB_DEVICE_SS);
+		if (ret)
+			return ret;
+
+		an7581_usb_phy_u3_init(priv);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int an7581_usb_phy_u2_power_on(struct an7581_usb_phy_priv *priv)
+{
+	regmap_clear_bits(priv->regmap, AIROHA_USB_PHY_USBPHYACR6,
+			  AIROHA_USB_PHY_USB20_BC11_SW_EN);
+
+	usleep_range(1000, 1500);
+
+	return 0;
+}
+
+static int an7581_usb_phy_u3_power_on(struct an7581_usb_phy_priv *priv)
+{
+	regmap_clear_bits(priv->regmap, AIROHA_USB_PHY_GPIO_CTLD,
+			  AIROHA_USB_PHY_SSUSB_IP_SW_RST |
+			  AIROHA_USB_PHY_MCU_BUS_CK_GATE_EN |
+			  AIROHA_USB_PHY_FORCE_SSUSB_IP_SW_RST |
+			  AIROHA_USB_PHY_SSUSB_SW_RST);
+
+	usleep_range(1000, 1500);
+
+	return 0;
+}
+
+static int an7581_usb_phy_power_on(struct phy *phy)
+{
+	struct an7581_usb_phy_instance *instance = phy_get_drvdata(phy);
+	struct an7581_usb_phy_priv *priv = dev_get_drvdata(phy->dev.parent);
+
+	switch (instance->type) {
+	case PHY_TYPE_USB2:
+		an7581_usb_phy_u2_power_on(priv);
+		break;
+	case PHY_TYPE_USB3:
+		if (phy_get_mode(phy) == PHY_MODE_PCIE ||
+		    phy_get_mode(phy) == PHY_MODE_ETHERNET)
+			return 0;
+
+		an7581_usb_phy_u3_power_on(priv);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int an7581_usb_phy_u2_power_off(struct an7581_usb_phy_priv *priv)
+{
+	regmap_set_bits(priv->regmap, AIROHA_USB_PHY_USBPHYACR6,
+			AIROHA_USB_PHY_USB20_BC11_SW_EN);
+
+	usleep_range(1000, 1500);
+
+	return 0;
+}
+
+static int an7581_usb_phy_u3_power_off(struct an7581_usb_phy_priv *priv)
+{
+	regmap_set_bits(priv->regmap, AIROHA_USB_PHY_GPIO_CTLD,
+			AIROHA_USB_PHY_SSUSB_IP_SW_RST |
+			AIROHA_USB_PHY_FORCE_SSUSB_IP_SW_RST);
+
+	usleep_range(1000, 1500);
+
+	return 0;
+}
+
+static int an7581_usb_phy_power_off(struct phy *phy)
+{
+	struct an7581_usb_phy_instance *instance = phy_get_drvdata(phy);
+	struct an7581_usb_phy_priv *priv = dev_get_drvdata(phy->dev.parent);
+
+	switch (instance->type) {
+	case PHY_TYPE_USB2:
+		an7581_usb_phy_u2_power_off(priv);
+		break;
+	case PHY_TYPE_USB3:
+		if (phy_get_mode(phy) == PHY_MODE_PCIE ||
+		    phy_get_mode(phy) == PHY_MODE_ETHERNET)
+			return 0;
+
+		an7581_usb_phy_u3_power_off(priv);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int an7581_usb_phy_u2_set_mode(struct an7581_usb_phy_priv *priv,
+				      enum phy_mode mode)
+{
+	u32 val;
+
+	/*
+	 * For Device and Host mode, enable force IDDIG.
+	 * For Device set IDDIG, for Host clear IDDIG.
+	 * For OTG disable force and clear IDDIG bit while at it.
+	 */
+	switch (mode) {
+	case PHY_MODE_USB_DEVICE:
+		val = AIROHA_USB_PHY_IDDIG;
+		break;
+	case PHY_MODE_USB_HOST:
+		val = AIROHA_USB_PHY_FORCE_IDDIG |
+		      AIROHA_USB_PHY_FORCE_IDDIG;
+		break;
+	case PHY_MODE_USB_OTG:
+		val = 0;
+		break;
+	default:
+		return 0;
+	}
+
+	regmap_update_bits(priv->regmap, AIROHA_USB_PHY_U2PHYDTM1,
+			   AIROHA_USB_PHY_FORCE_IDDIG |
+			   AIROHA_USB_PHY_IDDIG, val);
+
+	return 0;
+}
+
+static int an7581_usb_phy_set_mode(struct phy *phy, enum phy_mode mode, int submode)
+{
+	struct an7581_usb_phy_instance *instance = phy_get_drvdata(phy);
+	struct an7581_usb_phy_priv *priv = dev_get_drvdata(phy->dev.parent);
+
+	switch (instance->type) {
+	case PHY_TYPE_USB2:
+		return an7581_usb_phy_u2_set_mode(priv, mode);
+	default:
+		return 0;
+	}
+}
+
+static struct phy *an7581_usb_phy_xlate(struct device *dev,
+					const struct of_phandle_args *args)
+{
+	struct an7581_usb_phy_priv *priv = dev_get_drvdata(dev);
+	struct an7581_usb_phy_instance *instance = NULL;
+	unsigned int index, phy_type;
+
+	if (args->args_count != 1) {
+		dev_err(dev, "invalid number of cells in 'phy' property\n");
+		return ERR_PTR(-EINVAL);
+	}
+
+	phy_type = args->args[0];
+	if (!(phy_type == PHY_TYPE_USB2 || phy_type == PHY_TYPE_USB3)) {
+		dev_err(dev, "unsupported device type: %d\n", phy_type);
+		return ERR_PTR(-EINVAL);
+	}
+
+	for (index = 0; index < AIROHA_PHY_USB_MAX; index++)
+		if (priv->phys[index] &&
+		    phy_type == priv->phys[index]->type) {
+			instance = priv->phys[index];
+			break;
+		}
+
+	if (!instance) {
+		dev_err(dev, "failed to find appropriate phy\n");
+		return ERR_PTR(-EINVAL);
+	}
+
+	return instance->phy;
+}
+
+static const struct phy_ops airoha_phy = {
+	.init		= an7581_usb_phy_init,
+	.power_on	= an7581_usb_phy_power_on,
+	.power_off	= an7581_usb_phy_power_off,
+	.set_mode	= an7581_usb_phy_set_mode,
+	.owner		= THIS_MODULE,
+};
+
+static const struct regmap_config an7581_usb_phy_regmap_config = {
+	.reg_bits = 32,
+	.val_bits = 32,
+	.reg_stride = 4,
+};
+
+static int an7581_usb_phy_probe(struct platform_device *pdev)
+{
+	struct phy_provider *phy_provider;
+	struct an7581_usb_phy_priv *priv;
+	struct device *dev = &pdev->dev;
+	unsigned int index;
+	void __iomem *base;
+	int ret;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->dev = dev;
+
+	ret = of_property_read_u32(dev->of_node, "airoha,usb2-monitor-clk-sel",
+				   &priv->monclk_sel);
+	if (ret)
+		return dev_err_probe(dev, ret, "Monitor clock selection is mandatory for USB PHY calibration\n");
+
+	if (priv->monclk_sel > 3)
+		return dev_err_probe(dev, -EINVAL, "only 4 Monitor clock are selectable on the SoC\n");
+
+	base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(base))
+		return PTR_ERR(base);
+
+	priv->regmap = devm_regmap_init_mmio(dev, base, &an7581_usb_phy_regmap_config);
+	if (IS_ERR(priv->regmap))
+		return PTR_ERR(priv->regmap);
+
+	platform_set_drvdata(pdev, priv);
+
+	for (index = 0; index < AIROHA_PHY_USB_MAX; index++) {
+		enum an7581_usb_phy_instance_type phy_type;
+		struct an7581_usb_phy_instance *instance;
+
+		switch (index) {
+		case AIROHA_PHY_USB2:
+			phy_type = PHY_TYPE_USB2;
+			break;
+		case AIROHA_PHY_USB3:
+			phy_type = PHY_TYPE_USB3;
+			break;
+		}
+
+		if (phy_type == PHY_TYPE_USB3) {
+			priv->serdes_phy = devm_phy_get(dev, NULL);
+			if (IS_ERR(priv->serdes_phy))
+				return dev_err_probe(dev, IS_ERR(priv->serdes_phy), "missing serdes phy for USB 3.0\n");
+		}
+
+		instance = devm_kzalloc(dev, sizeof(*instance), GFP_KERNEL);
+		if (!instance)
+			return -ENOMEM;
+
+		instance->type = phy_type;
+		priv->phys[index] = instance;
+
+		instance->phy = devm_phy_create(dev, NULL, &airoha_phy);
+		if (IS_ERR(instance->phy))
+			return dev_err_probe(dev, PTR_ERR(instance->phy), "failed to create phy\n");
+
+		phy_set_drvdata(instance->phy, instance);
+	}
+
+	phy_provider = devm_of_phy_provider_register(&pdev->dev, an7581_usb_phy_xlate);
+
+	return PTR_ERR_OR_ZERO(phy_provider);
+}
+
+static const struct of_device_id airoha_phy_id_table[] = {
+	{ .compatible = "airoha,an7581-usb-phy" },
+	{ },
+};
+MODULE_DEVICE_TABLE(of, airoha_phy_id_table);
+
+static struct platform_driver an7581_usb_driver = {
+	.probe		= an7581_usb_phy_probe,
+	.driver		= {
+		.name	= "airoha-an7581-usb-phy",
+		.of_match_table = airoha_phy_id_table,
+	},
+};
+
+module_platform_driver(an7581_usb_driver);
+
+MODULE_DESCRIPTION("Airoha AN7581 USB PHY driver");
+MODULE_AUTHOR("Christian Marangi <ansuelsmth@gmail.com>");
+MODULE_LICENSE("GPL");
-- 
2.53.0

