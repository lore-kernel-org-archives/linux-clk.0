Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795787166;
	b=a601XIZfSuhUGSb432ggiKausfFb3z8O8cx4JYWU0YjWy87uMa4DdLAl025zr93kdMSx
	 YBnPnMgiz7Vjg4hwItMr8ow8jZB+enJeC5llft9Ihg4g005EbZA6rxVvoLmxWjaZj79WN
	 AlU/7c3AAWozpoAaqG/8ERaD5g4HDDgjAm2TW1P+oWuHF8dCMUWVTdtJTbJdg1Xr6d5dR
	 qPhD3EXrMHaufJPMcvwdYugJql8GC2hWyXlRRyCDFLh2wlpVkzItDsDJyJ9r1+omaHzDX
	 Q9O+sQes48q0NE8ZMcEXJe4u5s9tMV4mGEZtIGilH+T5RVXaTF6Fxp/TrAXrMlb2aoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795787166;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=RoL42gzoJZnx/2rfnpic2MzKrIpTAAEm9+NNRJEbmT4=;
	b=BH+/NmAHLkr6oFCLR8iitrkbz+j5tfod0P5/fW5nAzqBYJfrIiN3gWrSqOWjNSQ8ecsL
	 R3vSF9QeYcc/HVj7rgwBDsUJQFnu9l5C7HMnKMGUP5FIJ8kQR3wpVVq6z/V2qoS3Rpq3o
	 xE8MhhZw0l9aeNkQLi1kEAA9H8v19bm7T+9qsuGyHlfq/j9dYLmDyePQFTZdW3DwPDNOm
	 rlhOb6Ont+5AHln0wp0Qdhzj1b9ML4/JpB+8CO1VI99N2NlIpcpV9I8OGIgcCLKXQ8cId
	 isWwfrEISGzXEHV0Go16JmtB2cbGV4I+L6dv0GQsBSImqrpczGRemtCRzFVRuh2LSJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="ynJ/3l+6";
	arc=none smtp.remote-ip=209.85.214.180
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B23E606A32C
	for <linux-clk@vger.kernel.org>; Fri, 27 Nov 2026 13:46:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B23E606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ynJ/3l+6
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2f02ee04378so63271585ad.1
        for <linux-clk@vger.kernel.org>; Fri, 27 Nov 2026 05:46:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795787165; x=1796391965; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RoL42gzoJZnx/2rfnpic2MzKrIpTAAEm9+NNRJEbmT4=;
        b=ynJ/3l+6RFwBPz7uZzu67TeyuGiX2s+NP+WaOzycTaf1K8DdvQ9n+DgZDfk2wYbL7f
         YOOKjFD1W54PpUIlakpL20B66GQsIlfLvXASFHdInYq6qBmzbvwowfijB6YpfEHbYlMH
         fM1iFl+AVkJbjcKHfkohG+35tJshkS9AxAnxyujbXXJIoA2zHFszDR0hUmsQyEr8P8SP
         tqc6fch3ixFYa+O+6X9v7sZJowhYBpqiNpYa9RA1Ojw0Xo5t0PijW9LWs9RypIjfmUCf
         N6z2sRqiOiFa3gP2C+VlKxOCmFFiVDGwAx1bSRyXo53tZmXu3vUEEjUJUplEH6ZosK7i
         +J0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795787165; x=1796391965;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RoL42gzoJZnx/2rfnpic2MzKrIpTAAEm9+NNRJEbmT4=;
        b=WDylaUtJMw45d/Z8MFgTwBL3mACyfX9PHnSIa8K42R+V36DOs3th07CvWlifLB2wM9
         eWh6fgD6c90p+hNjsJjakphP+vm03y1u4pjuxlXH87sjAle4qF4YvPv25yTxXwErskpI
         oW6cZVsiP96XsvhKNW0z0oKNDMhaeh26dSX4CX0pZyqwTYnwUo3sMrjgmfkQp6bBhYbe
         gqjGV1PNPgr3bmg2fANLp9SYoyEy/lcOTeEcNDjPIdNgbd4SJZaOQK+YBBTrfLXbBMaQ
         w3/jwZEes8nHu8xDQHi1J7ASr+eJ4a//xMqxV2a8VezO7rFq88MKR9Z9+LlPdIDRF7E2
         KBKw==
X-Forwarded-Encrypted: i=1; AL+hErGmhJ8YVG6dse7ZPyLTPW/o4bCq5uDVy8WdkUeQ8wLk+dPP+DpHiX27bdSbB6Mdtal/kvGxkKaba08=@vger.kernel.org
X-Gm-Message-State: APuU4Z/xNcVbyWYZ6FM6WBggnV3wkrRV532DJPS0Pq80AOcwLSlPPJjU
	DC3DYhRairNEATEAP2dKkkur7r8sexyhZjeq04LVr8m28Gp9D0VVmjms
X-Gm-Gg: AZFdTZcwWlFl8XNBHhuloiYBUn6AmPw0c0h51ORMx67C9kUReki2BdC3cgxXg8pBxt4
	wDwyL/P1wZu2Ko7JSsqZ7XF8d2PsoxHVs48bfyRQVt1R6/f+y7bhbyUch4QpBDgS+ft4HPV52Aj
	1mkPvrnjm9dUQgnnCMALGAhr0avqtnxRrSo4RYY8BeLFRlv9iuQBOCrJaR/hxRh+urdgB4o4y+S
	RmEK8QR3Z7YHHpYpe9B+o4CwUQb3j9hzHb2KN8HC9sFqjpYaJqUvGkZyQDpE7ls/9ZWAuYnQKRr
	/j+fonanL4jzXiut6gfpN72EN4FE5EmDYVxKqhzA3j+ldb0yqIgMADQAa8PeCkK5ndB32VTRP82
	kMH8ySzSkt+1yRMyMNhxu5A+aQ3IUH/py2QxthzGRuWodEybw5y7UuCM1A0rIqNr9fByKGwXwOn
	aLnmDjfO2KVqSM8HObfQlcO39fXjO8YPOzLMmp9PHoRrdAW1JChKoZQ1tjSk0OET+JrLUXOXrXa
	NTGiseI5aYfXOI5g7DuuwR6wgbwXvhe9HRZFLDp0rWFtP9n1NZJPd3qb1nwTHlLgLXAateqIerp
	0Q93rO37Rn19aXSGBXJUQL34pzXIliALuVTaICltP+rjNUzp2vn8jx23JVsULuB7iOMB
X-Received: by 2002:a17:903:4b03:b0:2ed:ebc:460f with SMTP id d9443c01a7336-2f03f2118f0mr254452305ad.33.1795787164460;
        Fri, 27 Nov 2026 05:46:04 -0800 (PST)
Received: from localhost.localdomain ([2404:c0:aa07:12b3:e89:dfdd:d14b:d911])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f0c1f2csm121741545ad.22.2026.11.27.05.45.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 05:46:04 -0800 (PST)
From: Hikmah Gumelar <hikmahgumelar@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Abel Vesa <abelvesa@kernel.org>
Subject: [PATCH v5 5/7] media: i2c: add ov12a10 image sensor driver
Date: Fri, 27 Nov 2026 20:45:05 +0700
Message-ID: <20261127134507.125513-6-hikmahgumelar@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261127134507.125513-1-hikmahgumelar@gmail.com>
References: <20261127134507.125513-1-hikmahgumelar@gmail.com>
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

Add V4L2 subdev driver for the OmniVision OV12A10 12-megapixel MIPI

CSI-2 CMOS image sensor supporting 1280x720 binned 10-bit Bayer output.

Signed-off-by: Hikmah Gumelar <hikmahgumelar@gmail.com>
---
 MAINTAINERS                 |   7 +
 drivers/media/i2c/Kconfig   |  10 +
 drivers/media/i2c/Makefile  |   1 +
 drivers/media/i2c/ov12a10.c | 770 ++++++++++++++++++++++++++++++++++++
 4 files changed, 788 insertions(+)
 create mode 100644 drivers/media/i2c/ov12a10.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 2ac245d4ad7c..3918dcc96191 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20682,6 +20682,13 @@ S:	Maintained
 F:	drivers/media/i2c/ov08x40.c
 F:	Documentation/devicetree/bindings/media/i2c/ovti,ov08x40.yaml
 
+OMNIVISION OV12A10 CAMERA SENSOR DRIVER
+M:	Hikmah Gumelar <hikmahgumelar@gmail.com>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/media/i2c/ovti,ov12a10.yaml
+F:	drivers/media/i2c/ov12a10.c
+
 OMNIVISION OV13858 SENSOR DRIVER
 M:	Sakari Ailus <sakari.ailus@linux.intel.com>
 L:	linux-media@vger.kernel.org
diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
index 4c622e5eef73..338244aa23eb 100644
--- a/drivers/media/i2c/Kconfig
+++ b/drivers/media/i2c/Kconfig
@@ -538,6 +538,16 @@ config VIDEO_OV08X40
 	  To compile this driver as a module, choose M here: the
 	  module will be called ov08x40.
 
+config VIDEO_OV12A10
+	tristate "OmniVision OV12A10 sensor support"
+	select V4L2_CCI_I2C
+	help
+	  This is a Video4Linux2 sensor-level driver for the OmniVision
+	  OV12A10 12MP camera.
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called ov12a10.
+
 config VIDEO_OV13858
 	tristate "OmniVision OV13858 sensor support"
 	help
diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
index bdcb8f34aca3..8148ee872a31 100644
--- a/drivers/media/i2c/Makefile
+++ b/drivers/media/i2c/Makefile
@@ -99,6 +99,7 @@ obj-$(CONFIG_VIDEO_OV02E10) += ov02e10.o
 obj-$(CONFIG_VIDEO_OV05C10) += ov05c10.o
 obj-$(CONFIG_VIDEO_OV08D10) += ov08d10.o
 obj-$(CONFIG_VIDEO_OV08X40) += ov08x40.o
+obj-$(CONFIG_VIDEO_OV12A10) += ov12a10.o
 obj-$(CONFIG_VIDEO_OV13858) += ov13858.o
 obj-$(CONFIG_VIDEO_OV13B10) += ov13b10.o
 obj-$(CONFIG_VIDEO_OV2640) += ov2640.o
diff --git a/drivers/media/i2c/ov12a10.c b/drivers/media/i2c/ov12a10.c
new file mode 100644
index 000000000000..99580ceedcef
--- /dev/null
+++ b/drivers/media/i2c/ov12a10.c
@@ -0,0 +1,770 @@
+// SPDX-License-Identifier: GPL-2.0
+#include <linux/clk.h>
+#include <linux/delay.h>
+#include <linux/gpio/consumer.h>
+#include <linux/i2c.h>
+#include <linux/module.h>
+#include <linux/pm_runtime.h>
+#include <linux/regulator/consumer.h>
+#include <linux/unaligned.h>
+#include <media/v4l2-ctrls.h>
+#include <media/v4l2-device.h>
+#include <media/v4l2-fwnode.h>
+
+#define OV12A10_CHIP_ID_REG		0x300a
+#define OV12A10_CHIP_ID			0x5612
+#define OV12A10_REG_MODE_SELECT		0x0100
+#define OV12A10_MODE_STANDBY		0x00
+#define OV12A10_REG_VTS			0x380e
+#define OV12A10_REG_EXPOSURE		0x3500
+#define OV12A10_REG_ANALOG_GAIN		0x3508
+#define OV12A10_REG_TEST_PATTERN		0x5080
+#define OV12A10_XVCLK_FREQ		24000000
+#define OV12A10_LINK_FREQ_216MHZ		216000000ULL
+#define OV12A10_PIXEL_RATE		144000000ULL
+
+struct ov12a10_reg {
+	u16 address;
+	u8 val;
+};
+
+struct ov12a10_mode {
+	u32 width, height, hts_def, num_regs;
+	const struct ov12a10_reg *regs;
+};
+
+static const char * const ov12a10_supply_names[] = { "avdd", "dvdd", "dovdd" };
+#define OV12A10_NUM_SUPPLIES ARRAY_SIZE(ov12a10_supply_names)
+
+/* Register initialization tables derived from Xiaomi Mi A1 vendor configuration */
+static const struct ov12a10_reg ov12a10_common_regs[] = {
+	{ 0x0103, 0x01 },
+	{ 0x0302, 0x49 },
+	{ 0x0303, 0x00 },
+	{ 0x0304, 0x00 },
+	{ 0x0305, 0x01 },
+	{ 0x0312, 0x11 },
+	{ 0x030b, 0x06 },
+	{ 0x030c, 0x02 },
+	{ 0x030d, 0x88 },
+	{ 0x030e, 0x02 },
+	{ 0x0313, 0x05 },
+	{ 0x3002, 0x21 },
+	{ 0x3012, 0x40 },
+	{ 0x3013, 0x72 },
+	{ 0x3016, 0x72 },
+	{ 0x301b, 0xd0 },
+	{ 0x301d, 0xf0 },
+	{ 0x301f, 0xd0 },
+	{ 0x3021, 0x23 },
+	{ 0x3022, 0x01 },
+	{ 0x3106, 0x15 },
+	{ 0x3107, 0x23 },
+	{ 0x3500, 0x00 },
+	{ 0x3501, 0xd0 },
+	{ 0x3502, 0x00 },
+	{ 0x3505, 0x83 },
+	{ 0x3508, 0x02 },
+	{ 0x3509, 0x00 },
+	{ 0x3600, 0x43 },
+	{ 0x3611, 0x8a },
+	{ 0x3613, 0x97 },
+	{ 0x3620, 0x80 },
+	{ 0x3624, 0x2c },
+	{ 0x3625, 0xa0 },
+	{ 0x3626, 0x00 },
+	{ 0x3631, 0x60 },
+	{ 0x3632, 0x00 },
+	{ 0x3641, 0x80 },
+	{ 0x3642, 0x12 },
+	{ 0x3644, 0x78 },
+	{ 0x3645, 0xa7 },
+	{ 0x364e, 0x44 },
+	{ 0x364f, 0x44 },
+	{ 0x3650, 0x11 },
+	{ 0x3654, 0x00 },
+	{ 0x3657, 0x31 },
+	{ 0x3659, 0x0c },
+	{ 0x365f, 0x07 },
+	{ 0x3661, 0x17 },
+	{ 0x3662, 0x17 },
+	{ 0x3663, 0x17 },
+	{ 0x3664, 0x17 },
+	{ 0x3666, 0x08 },
+	{ 0x366b, 0x20 },
+	{ 0x366c, 0xa4 },
+	{ 0x366d, 0x20 },
+	{ 0x366e, 0xa4 },
+	{ 0x3680, 0x00 },
+	{ 0x3714, 0x24 },
+	{ 0x371a, 0x3e },
+	{ 0x3737, 0x04 },
+	{ 0x3739, 0x12 },
+	{ 0x3765, 0x20 },
+	{ 0x3767, 0x00 },
+	{ 0x37a1, 0x3e },
+	{ 0x37a8, 0x4d },
+	{ 0x37ab, 0x2c },
+	{ 0x37c2, 0x04 },
+	{ 0x37d8, 0x03 },
+	{ 0x37d9, 0x0c },
+	{ 0x37e0, 0x00 },
+	{ 0x37e1, 0x0a },
+	{ 0x37e2, 0x14 },
+	{ 0x37e3, 0x04 },
+	{ 0x37e4, 0x2a },
+	{ 0x37e5, 0x03 },
+	{ 0x37e6, 0x04 },
+	{ 0x3800, 0x00 },
+	{ 0x3801, 0x00 },
+	{ 0x3802, 0x00 },
+	{ 0x3803, 0x00 },
+	{ 0x3804, 0x10 },
+	{ 0x3805, 0x0f },
+	{ 0x3806, 0x0c },
+	{ 0x3807, 0x0f },
+	{ 0x3808, 0x10 },
+	{ 0x3809, 0x00 },
+	{ 0x380a, 0x0c },
+	{ 0x380b, 0x00 },
+	{ 0x380c, 0x04 },
+	{ 0x380d, 0x28 },
+	{ 0x380e, 0x0d },
+	{ 0x380f, 0x12 },
+	{ 0x3811, 0x0a },
+	{ 0x3813, 0x08 },
+	{ 0x3814, 0x01 },
+	{ 0x3815, 0x01 },
+	{ 0x3816, 0x01 },
+	{ 0x3817, 0x01 },
+	{ 0x3820, 0xa8 },
+	{ 0x3821, 0x00 },
+	{ 0x3822, 0x91 },
+	{ 0x3823, 0x18 },
+	{ 0x3826, 0x00 },
+	{ 0x3827, 0x00 },
+	{ 0x3829, 0x03 },
+	{ 0x3832, 0x08 },
+	{ 0x3833, 0x30 },
+	{ 0x3c80, 0x00 },
+	{ 0x3c87, 0x01 },
+	{ 0x3c8c, 0x1a },
+	{ 0x3c8d, 0x68 },
+	{ 0x3c97, 0x02 },
+	{ 0x3cc0, 0x40 },
+	{ 0x3cc1, 0x54 },
+	{ 0x3cc2, 0x34 },
+	{ 0x3cc3, 0x04 },
+	{ 0x3cc4, 0x00 },
+	{ 0x3cc5, 0x00 },
+	{ 0x3cc6, 0x00 },
+	{ 0x3cc7, 0x00 },
+	{ 0x3cc8, 0x00 },
+	{ 0x3cc9, 0x00 },
+	{ 0x3d8c, 0x73 },
+	{ 0x3d8d, 0xc0 },
+	{ 0x4001, 0x2b },
+	{ 0x4008, 0x02 },
+	{ 0x4009, 0x0f },
+	{ 0x4011, 0xff },
+	{ 0x4013, 0x08 },
+	{ 0x4014, 0x08 },
+	{ 0x4015, 0x08 },
+	{ 0x4017, 0x08 },
+	{ 0x401a, 0x58 },
+	{ 0x4050, 0x04 },
+	{ 0x4051, 0x0b },
+	{ 0x405e, 0x20 },
+	{ 0x4501, 0x00 },
+	{ 0x4503, 0x00 },
+	{ 0x450a, 0x04 },
+	{ 0x4601, 0x30 },
+	{ 0x4800, 0x24 },
+	{ 0x481f, 0x30 },
+	{ 0x4837, 0x0d },
+	{ 0x483c, 0x0f },
+	{ 0x484b, 0x01 },
+	{ 0x4d00, 0x05 },
+	{ 0x4d01, 0x19 },
+	{ 0x4d02, 0xfd },
+	{ 0x4d03, 0xd1 },
+	{ 0x4d04, 0xff },
+	{ 0x4d05, 0xff },
+	{ 0x5000, 0x09 },
+	{ 0x5001, 0x42 },
+	{ 0x5002, 0x45 },
+	{ 0x5005, 0x00 },
+	{ 0x5081, 0x04 },
+	{ 0x5180, 0x00 },
+	{ 0x5181, 0x10 },
+	{ 0x5182, 0x02 },
+	{ 0x5183, 0x0f },
+	{ 0x5185, 0x6c },
+	{ 0x5200, 0x03 },
+	{ 0x5203, 0x7c },
+	{ 0x5204, 0x1f },
+	{ 0x5205, 0x41 },
+	{ 0x520b, 0x07 },
+	{ 0x520c, 0x0f },
+	{ 0x0300, 0x02 },
+	{ 0x0302, 0x53 },
+	{ 0x380c, 0x04 },
+	{ 0x380d, 0x90 },
+	{ 0x380e, 0x0c },
+	{ 0x380f, 0xe6 },
+	{ 0x4837, 0x10 },
+};
+
+static const struct ov12a10_reg ov12a10_1280x720_regs[] = {
+	{ 0x0300, 0x06 },
+	{ 0x0301, 0x02 },
+	{ 0x0302, 0x48 },
+	{ 0x0307, 0x01 },
+	{ 0x0303, 0x01 },
+	{ 0x030b, 0x06 },
+	{ 0x030c, 0x02 },
+	{ 0x030d, 0x88 },
+	{ 0x0312, 0x11 },
+	{ 0x0313, 0x09 },
+	{ 0x3642, 0x10 },
+	{ 0x3666, 0x00 },
+	{ 0x366b, 0xa4 },
+	{ 0x366c, 0x20 },
+	{ 0x366d, 0xa4 },
+	{ 0x366e, 0x20 },
+	{ 0x3714, 0x28 },
+	{ 0x371a, 0x3e },
+	{ 0x3737, 0x08 },
+	{ 0x3739, 0x20 },
+	{ 0x37c2, 0x14 },
+	{ 0x37d9, 0x0c },
+	{ 0x37e3, 0x08 },
+	{ 0x37e4, 0x36 },
+	{ 0x37e6, 0x08 },
+	{ 0x3800, 0x03 },
+	{ 0x3801, 0x20 },
+	{ 0x3802, 0x03 },
+	{ 0x3803, 0x68 },
+	{ 0x3804, 0x0d },
+	{ 0x3805, 0x3f },
+	{ 0x3806, 0x09 },
+	{ 0x3807, 0x27 },
+	{ 0x3808, 0x05 },
+	{ 0x3809, 0x00 },
+	{ 0x380a, 0x02 },
+	{ 0x380b, 0xd0 },
+	{ 0x380c, 0x04 },
+	{ 0x380d, 0x28 },
+	{ 0x380e, 0x03 },
+	{ 0x380f, 0x4c },
+	{ 0x3810, 0x00 },
+	{ 0x3811, 0x08 },
+	{ 0x3813, 0x08 },
+	{ 0x3814, 0x03 },
+	{ 0x3816, 0x03 },
+	{ 0x3820, 0xab },
+	{ 0x4009, 0x0d },
+	{ 0x4050, 0x04 },
+	{ 0x4051, 0x0b },
+	{ 0x4501, 0x00 },
+	{ 0x4837, 0x1b },
+	{ 0x5001, 0x42 },
+	{ 0x5002, 0x45 },
+	{ 0x3501, 0x34 },
+	{ 0x3502, 0x00 },
+	{ 0x4800, 0x24 },
+};
+
+static const struct ov12a10_mode default_mode = {
+		.width = 1280, .height = 720, .hts_def = 1440,
+			.num_regs = ARRAY_SIZE(ov12a10_1280x720_regs),
+		.regs = ov12a10_1280x720_regs,
+	};
+
+static const s64 link_freq_menu_items[] = { OV12A10_LINK_FREQ_216MHZ };
+
+struct ov12a10 {
+	struct device *dev;
+	struct v4l2_subdev sd;
+	struct media_pad pad;
+	struct clk *xvclk;
+	struct gpio_desc *reset_gpio, *pwdn_gpio;
+	struct regulator_bulk_data supplies[OV12A10_NUM_SUPPLIES];
+	struct v4l2_ctrl_handler ctrl_handler;
+	struct v4l2_ctrl *link_freq, *hblank, *exposure;
+	const struct ov12a10_mode *cur_mode;
+	/* Serialize access to sensor registers and streaming state */
+	struct mutex mutex;
+	bool streaming;
+};
+
+static inline struct ov12a10 *to_ov12a10(struct v4l2_subdev *sd)
+{
+	return container_of(sd, struct ov12a10, sd);
+}
+
+static int ov12a10_read_reg(struct ov12a10 *ov12a10, u16 reg, u32 len, u32 *val)
+{
+	struct i2c_client *client = v4l2_get_subdevdata(&ov12a10->sd);
+	struct i2c_msg msgs[2];
+	u8 addr_buf[2], data_buf[4] = { 0 };
+	int ret;
+
+	put_unaligned_be16(reg, addr_buf);
+	msgs[0].addr = client->addr;
+	msgs[0].flags = 0;
+	msgs[0].len = 2;
+	msgs[0].buf = addr_buf;
+	msgs[1].addr = client->addr;
+	msgs[1].flags = I2C_M_RD;
+	msgs[1].len = len;
+	msgs[1].buf = &data_buf[4 - len];
+	ret = i2c_transfer(client->adapter, msgs, 2);
+	if (ret != 2)
+		return ret < 0 ? ret : -EIO;
+	*val = get_unaligned_be32(data_buf);
+	return 0;
+}
+
+static int ov12a10_write_reg(struct ov12a10 *ov12a10, u16 reg, u32 len, u32 val)
+{
+	struct i2c_client *client = v4l2_get_subdevdata(&ov12a10->sd);
+	u8 buf[6];
+	int ret;
+
+	put_unaligned_be16(reg, buf);
+	put_unaligned_be32(val << (8 * (4 - len)), buf + 2);
+	ret = i2c_master_send(client, buf, len + 2);
+	return ret == len + 2 ? 0 : (ret < 0 ? ret : -EIO);
+}
+
+static int ov12a10_write_regs(struct ov12a10 *ov12a10, const struct ov12a10_reg *regs, u32 len)
+{
+	u32 i;
+	int ret;
+
+	for (i = 0; i < len; i++) {
+		ret = ov12a10_write_reg(ov12a10, regs[i].address, 1, regs[i].val);
+		if (!ret && regs[i].address == 0x0103)
+			usleep_range(5000, 6000);
+		if (ret)
+			return ret;
+	}
+	return 0;
+}
+
+static int ov12a10_power_on(struct device *dev)
+{
+	struct ov12a10 *ov12a10 = to_ov12a10(dev_get_drvdata(dev));
+	int ret;
+
+	ret = regulator_bulk_enable(OV12A10_NUM_SUPPLIES, ov12a10->supplies);
+	if (ret)
+		return ret;
+
+	ret = clk_prepare_enable(ov12a10->xvclk);
+	if (ret) {
+		regulator_bulk_disable(OV12A10_NUM_SUPPLIES, ov12a10->supplies);
+		return ret;
+	}
+
+	msleep(35);
+	if (ov12a10->pwdn_gpio)
+		gpiod_set_value_cansleep(ov12a10->pwdn_gpio, 0);
+	if (ov12a10->reset_gpio) {
+		gpiod_set_value_cansleep(ov12a10->reset_gpio, 1);
+		usleep_range(3000, 5000);
+		gpiod_set_value_cansleep(ov12a10->reset_gpio, 0);
+	}
+	msleep(35);
+	return 0;
+}
+
+static int ov12a10_power_off(struct device *dev)
+{
+	struct ov12a10 *ov12a10 = to_ov12a10(dev_get_drvdata(dev));
+
+	if (ov12a10->reset_gpio)
+		gpiod_set_value_cansleep(ov12a10->reset_gpio, 1);
+	if (ov12a10->pwdn_gpio)
+		gpiod_set_value_cansleep(ov12a10->pwdn_gpio, 1);
+	clk_disable_unprepare(ov12a10->xvclk);
+	regulator_bulk_disable(OV12A10_NUM_SUPPLIES, ov12a10->supplies);
+	return 0;
+}
+
+static int ov12a10_set_ctrl(struct v4l2_ctrl *ctrl)
+{
+	struct ov12a10 *ov12a10 = container_of(ctrl->handler, struct ov12a10, ctrl_handler);
+	int ret = 0;
+
+	if (ctrl->id == V4L2_CID_VBLANK) {
+		s64 exp_max = ov12a10->cur_mode->height + ctrl->val - 4;
+
+		ret = __v4l2_ctrl_modify_range(ov12a10->exposure, 4, exp_max, 1,
+					       min_t(s64, 2400, exp_max));
+		if (ret)
+			return ret;
+	}
+	if (pm_runtime_get_if_active(ov12a10->dev) <= 0)
+		return 0;
+	switch (ctrl->id) {
+	case V4L2_CID_ANALOGUE_GAIN:
+		ret = ov12a10_write_reg(ov12a10, OV12A10_REG_ANALOG_GAIN, 2, ctrl->val);
+	break;
+	case V4L2_CID_EXPOSURE:
+		ret = ov12a10_write_reg(ov12a10, OV12A10_REG_EXPOSURE, 3, ctrl->val << 4);
+	break;
+	case V4L2_CID_VBLANK:
+		ret = ov12a10_write_reg(ov12a10, OV12A10_REG_VTS, 2,
+					ov12a10->cur_mode->height + ctrl->val);
+	break;
+	case V4L2_CID_TEST_PATTERN:
+		ret = ov12a10_write_reg(ov12a10, OV12A10_REG_TEST_PATTERN, 1,
+					ctrl->val ? ((ctrl->val - 1) | BIT(7)) : 0);
+	break;
+	}
+	pm_runtime_put(ov12a10->dev);
+	return ret;
+}
+
+static const struct v4l2_ctrl_ops ov12a10_ctrl_ops = { .s_ctrl = ov12a10_set_ctrl };
+static const char * const ov12a10_test_pattern_menu[] = {
+	"Disabled",
+	"Solid Color",
+	"100% Color Bars",
+	"Fade to Grey",
+	"PN9",
+};
+
+static int ov12a10_init_controls(struct ov12a10 *ov12a10)
+{
+	struct v4l2_fwnode_device_properties props;
+	struct v4l2_ctrl_handler *hdl = &ov12a10->ctrl_handler;
+	s64 hblank = ov12a10->cur_mode->hts_def - ov12a10->cur_mode->width;
+	int ret = v4l2_ctrl_handler_init(hdl, 8);
+
+	if (ret)
+		return ret;
+	hdl->lock = &ov12a10->mutex;
+	ov12a10->link_freq = v4l2_ctrl_new_int_menu(hdl, &ov12a10_ctrl_ops, V4L2_CID_LINK_FREQ,
+						    0, 0, link_freq_menu_items);
+	if (ov12a10->link_freq)
+		ov12a10->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
+	v4l2_ctrl_new_std(hdl, &ov12a10_ctrl_ops, V4L2_CID_PIXEL_RATE,
+			  OV12A10_PIXEL_RATE, OV12A10_PIXEL_RATE, 1, OV12A10_PIXEL_RATE);
+	v4l2_ctrl_new_std(hdl, &ov12a10_ctrl_ops, V4L2_CID_VBLANK, 124,
+			  0x7fff - ov12a10->cur_mode->height, 1, 2656);
+	ov12a10->hblank = v4l2_ctrl_new_std(hdl, &ov12a10_ctrl_ops, V4L2_CID_HBLANK, hblank,
+					    hblank, 1, hblank);
+	if (ov12a10->hblank)
+		ov12a10->hblank->flags |= V4L2_CTRL_FLAG_READ_ONLY;
+	v4l2_ctrl_new_std(hdl, &ov12a10_ctrl_ops, V4L2_CID_ANALOGUE_GAIN, 0x80, 0x7ff, 1, 0x300);
+	ov12a10->exposure = v4l2_ctrl_new_std(hdl, &ov12a10_ctrl_ops, V4L2_CID_EXPOSURE, 4,
+					      3372, 1, 2400);
+	v4l2_ctrl_new_std_menu_items(hdl, &ov12a10_ctrl_ops, V4L2_CID_TEST_PATTERN, 4, 0, 0,
+				     ov12a10_test_pattern_menu);
+	if (hdl->error) {
+		ret = hdl->error;
+		goto err;
+	}
+	ret = v4l2_fwnode_device_parse(ov12a10->dev, &props);
+	if (ret)
+		goto err;
+	ret = v4l2_ctrl_new_fwnode_properties(hdl, &ov12a10_ctrl_ops, &props);
+	if (ret)
+		goto err;
+	ov12a10->sd.ctrl_handler = hdl;
+	return 0;
+err:
+	v4l2_ctrl_handler_free(hdl);
+	return ret;
+}
+
+static void ov12a10_update_pad_format(const struct ov12a10_mode *mode,
+				      struct v4l2_mbus_framefmt *fmt)
+{
+	fmt->width = mode->width;
+	fmt->height = mode->height;
+	fmt->code = MEDIA_BUS_FMT_SRGGB10_1X10;
+	fmt->field = V4L2_FIELD_NONE;
+	fmt->colorspace = V4L2_COLORSPACE_SRGB;
+	fmt->ycbcr_enc = V4L2_MAP_YCBCR_ENC_DEFAULT(fmt->colorspace);
+	fmt->quantization = V4L2_MAP_QUANTIZATION_DEFAULT(true, fmt->colorspace, fmt->ycbcr_enc);
+	fmt->xfer_func = V4L2_MAP_XFER_FUNC_DEFAULT(fmt->colorspace);
+}
+
+static int ov12a10_set_format(struct v4l2_subdev *sd,
+			      const struct v4l2_subdev_client_info *ci,
+			      struct v4l2_subdev_state *sd_state,
+			      struct v4l2_subdev_format *fmt)
+{
+	struct ov12a10 *ov12a10 = to_ov12a10(sd);
+
+	mutex_lock(&ov12a10->mutex);
+	if (fmt->which == V4L2_SUBDEV_FORMAT_ACTIVE && ov12a10->streaming) {
+		mutex_unlock(&ov12a10->mutex);
+		return -EBUSY;
+	}
+
+	ov12a10_update_pad_format(&default_mode, &fmt->format);
+	if (fmt->which != V4L2_SUBDEV_FORMAT_TRY)
+		ov12a10->cur_mode = &default_mode;
+	*v4l2_subdev_state_get_format(sd_state, fmt->pad) = fmt->format;
+	mutex_unlock(&ov12a10->mutex);
+
+	return 0;
+}
+
+static int ov12a10_enum_mbus_code(struct v4l2_subdev *sd, struct v4l2_subdev_state *sd_state,
+				  struct v4l2_subdev_mbus_code_enum *code)
+{
+	if (code->index > 0)
+		return -EINVAL;
+	code->code = MEDIA_BUS_FMT_SRGGB10_1X10;
+	return 0;
+}
+
+static int ov12a10_enum_frame_size(struct v4l2_subdev *sd, struct v4l2_subdev_state *sd_state,
+				   struct v4l2_subdev_frame_size_enum *fse)
+{
+	if (fse->index > 0 ||
+	    fse->code != MEDIA_BUS_FMT_SRGGB10_1X10)
+		return -EINVAL;
+	fse->min_width = default_mode.width;
+	fse->max_width = default_mode.width;
+	fse->min_height = default_mode.height;
+	fse->max_height = default_mode.height;
+	return 0;
+}
+
+static int ov12a10_set_stream(struct v4l2_subdev *sd, int enable)
+{
+	struct ov12a10 *ov12a10 = to_ov12a10(sd);
+	int ret = 0;
+
+	mutex_lock(&ov12a10->mutex);
+	if (ov12a10->streaming == enable) {
+		mutex_unlock(&ov12a10->mutex);
+		return 0;
+	}
+	if (enable) {
+		ret = pm_runtime_resume_and_get(ov12a10->dev);
+		if (ret < 0)
+			goto out;
+		ret = ov12a10_write_regs(ov12a10, ov12a10_common_regs,
+					 ARRAY_SIZE(ov12a10_common_regs));
+		if (!ret)
+			ret = ov12a10_write_regs(ov12a10, ov12a10->cur_mode->regs,
+						 ov12a10->cur_mode->num_regs);
+		if (!ret)
+			ret = __v4l2_ctrl_handler_setup(ov12a10->sd.ctrl_handler);
+		if (!ret) {
+			static const struct ov12a10_reg stream_on_regs[] = {
+				{ 0x0100, 0x01 },
+			};
+			usleep_range(10000, 12000);
+			ret = ov12a10_write_regs(ov12a10, stream_on_regs,
+						 ARRAY_SIZE(stream_on_regs));
+		}
+		if (ret) {
+			pm_runtime_put(ov12a10->dev);
+			goto out;
+		}
+	} else {
+		ov12a10_write_reg(ov12a10, OV12A10_REG_MODE_SELECT, 1, OV12A10_MODE_STANDBY);
+		pm_runtime_put(ov12a10->dev);
+	}
+	ov12a10->streaming = enable;
+out:
+	mutex_unlock(&ov12a10->mutex);
+	return ret;
+}
+
+static int ov12a10_init_state(struct v4l2_subdev *sd,
+			      struct v4l2_subdev_state *sd_state)
+{
+	ov12a10_update_pad_format(&default_mode,
+				  v4l2_subdev_state_get_format(sd_state, 0));
+	return 0;
+}
+
+static const struct v4l2_subdev_video_ops ov12a10_video_ops = { .s_stream = ov12a10_set_stream };
+
+static int ov12a10_get_selection(struct v4l2_subdev *sd, const struct v4l2_subdev_client_info *ci,
+				 struct v4l2_subdev_state *sd_state,
+				struct v4l2_subdev_selection *sel)
+{
+	switch (sel->target) {
+	case V4L2_SEL_TGT_CROP:
+		sel->r.left = 800;
+		sel->r.top = 872;
+		sel->r.width = 2592;
+		sel->r.height = 1472;
+		return 0;
+	case V4L2_SEL_TGT_CROP_DEFAULT:
+	case V4L2_SEL_TGT_CROP_BOUNDS:
+	case V4L2_SEL_TGT_NATIVE_SIZE:
+		sel->r.left = 0;
+		sel->r.top = 0;
+		sel->r.width = 4096;
+		sel->r.height = 3072;
+		return 0;
+	default:
+		return -EINVAL;
+	}
+}
+
+static const struct v4l2_subdev_pad_ops ov12a10_pad_ops = {
+	.get_selection = ov12a10_get_selection,
+	.set_fmt = ov12a10_set_format, .get_fmt = v4l2_subdev_get_fmt,
+	.enum_mbus_code = ov12a10_enum_mbus_code, .enum_frame_size = ov12a10_enum_frame_size,
+};
+
+static const struct v4l2_subdev_ops ov12a10_subdev_ops = {
+	.video = &ov12a10_video_ops,
+	.pad = &ov12a10_pad_ops,
+};
+
+static const struct media_entity_operations ov12a10_entity_ops = {
+	.link_validate = v4l2_subdev_link_validate,
+};
+
+static const struct v4l2_subdev_internal_ops ov12a10_internal_ops = {
+	.init_state = ov12a10_init_state,
+};
+
+static int ov12a10_probe(struct i2c_client *client)
+{
+	struct device *dev = &client->dev;
+	struct fwnode_handle *endpoint;
+	struct v4l2_fwnode_endpoint ep_cfg = {
+		.bus_type = V4L2_MBUS_CSI2_DPHY,
+	};
+	struct ov12a10 *ov12a10;
+	u32 val = 0;
+	unsigned int i;
+	int ret;
+
+	endpoint = fwnode_graph_get_next_endpoint(dev_fwnode(dev), NULL);
+	if (!endpoint)
+		return dev_err_probe(dev, -EINVAL, "endpoint node not found\n");
+
+	ret = v4l2_fwnode_endpoint_alloc_parse(endpoint, &ep_cfg);
+	fwnode_handle_put(endpoint);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to parse endpoint\n");
+
+	if (ep_cfg.bus.mipi_csi2.num_data_lanes != 4 ||
+	    ep_cfg.nr_of_link_frequencies != 1 ||
+	    ep_cfg.link_frequencies[0] != OV12A10_LINK_FREQ_216MHZ) {
+		v4l2_fwnode_endpoint_free(&ep_cfg);
+		return dev_err_probe(dev, -EINVAL,
+				     "unsupported CSI-2 configuration\n");
+	}
+	v4l2_fwnode_endpoint_free(&ep_cfg);
+
+	ov12a10 = devm_kzalloc(dev, sizeof(*ov12a10), GFP_KERNEL);
+	if (!ov12a10)
+		return -ENOMEM;
+	ov12a10->dev = dev;
+	v4l2_i2c_subdev_init(&ov12a10->sd, client, &ov12a10_subdev_ops);
+	ov12a10->xvclk = devm_v4l2_sensor_clk_get(dev, NULL);
+	if (IS_ERR(ov12a10->xvclk))
+		return dev_err_probe(dev, PTR_ERR(ov12a10->xvclk), "xvclk\n");
+	if (clk_get_rate(ov12a10->xvclk) != OV12A10_XVCLK_FREQ)
+		return dev_err_probe(dev, -EINVAL, "unexpected xvclk rate\n");
+	ov12a10->reset_gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_HIGH);
+	ov12a10->pwdn_gpio = devm_gpiod_get_optional(dev, "powerdown", GPIOD_OUT_HIGH);
+	if (IS_ERR(ov12a10->reset_gpio))
+		return dev_err_probe(dev, PTR_ERR(ov12a10->reset_gpio), "reset\n");
+	if (IS_ERR(ov12a10->pwdn_gpio))
+		return dev_err_probe(dev, PTR_ERR(ov12a10->pwdn_gpio), "powerdown\n");
+	for (i = 0; i < OV12A10_NUM_SUPPLIES; i++)
+		ov12a10->supplies[i].supply = ov12a10_supply_names[i];
+	ret = devm_regulator_bulk_get(dev, OV12A10_NUM_SUPPLIES, ov12a10->supplies);
+	if (ret)
+		return dev_err_probe(dev, ret, "regulators\n");
+	ret = ov12a10_power_on(dev);
+	if (ret)
+		return ret;
+	ret = ov12a10_read_reg(ov12a10, OV12A10_CHIP_ID_REG, 2, &val);
+	if (ret || val != OV12A10_CHIP_ID) {
+		dev_err(dev, "failed to identify ov12a10 (ret=%d, id=0x%04x)\n", ret, val);
+		ret = ret ? ret : -ENXIO;
+		goto err_power;
+	}
+	dev_dbg(dev, "identified OmniVision OV12A10 sensor (0x%04x)\n", val);
+	mutex_init(&ov12a10->mutex);
+	ov12a10->cur_mode = &default_mode;
+	ret = ov12a10_init_controls(ov12a10);
+	if (ret)
+		goto err_mutex;
+	ov12a10->sd.internal_ops = &ov12a10_internal_ops;
+	ov12a10->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
+	ov12a10->sd.entity.ops = &ov12a10_entity_ops;
+	ov12a10->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
+	ov12a10->pad.flags = MEDIA_PAD_FL_SOURCE;
+	ret = media_entity_pads_init(&ov12a10->sd.entity, 1, &ov12a10->pad);
+	if (ret)
+		goto err_ctrl;
+	ov12a10->sd.state_lock = &ov12a10->mutex;
+	ret = v4l2_subdev_init_finalize(&ov12a10->sd);
+	if (ret)
+		goto err_media;
+	pm_runtime_set_active(dev);
+	pm_runtime_enable(dev);
+	ret = v4l2_async_register_subdev_sensor(&ov12a10->sd);
+	if (ret)
+		goto err_subdev;
+	pm_runtime_idle(dev);
+	return 0;
+err_subdev:
+	pm_runtime_disable(dev);
+	pm_runtime_set_suspended(dev);
+	v4l2_subdev_cleanup(&ov12a10->sd);
+err_media:
+	media_entity_cleanup(&ov12a10->sd.entity);
+err_ctrl:
+	v4l2_ctrl_handler_free(ov12a10->sd.ctrl_handler);
+err_mutex:
+	mutex_destroy(&ov12a10->mutex);
+err_power:
+	ov12a10_power_off(dev);
+	return ret;
+}
+
+static void ov12a10_remove(struct i2c_client *client)
+{
+	struct v4l2_subdev *sd = i2c_get_clientdata(client);
+	struct ov12a10 *ov12a10 = to_ov12a10(sd);
+
+	v4l2_async_unregister_subdev(sd);
+	v4l2_subdev_cleanup(sd);
+	media_entity_cleanup(&sd->entity);
+	v4l2_ctrl_handler_free(sd->ctrl_handler);
+	mutex_destroy(&ov12a10->mutex);
+	pm_runtime_disable(&client->dev);
+	if (!pm_runtime_status_suspended(&client->dev))
+		ov12a10_power_off(&client->dev);
+	pm_runtime_set_suspended(&client->dev);
+}
+
+static const struct dev_pm_ops ov12a10_pm_ops = { SET_RUNTIME_PM_OPS(ov12a10_power_off,
+		ov12a10_power_on, NULL) };
+static const struct of_device_id ov12a10_of_match[] = {
+	{ .compatible = "ovti,ov12a10" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, ov12a10_of_match);
+static struct i2c_driver ov12a10_i2c_driver = {
+	.driver = {
+		.name = "ov12a10",
+		.pm = pm_ptr(&ov12a10_pm_ops),
+		.of_match_table = ov12a10_of_match,
+	},
+	.probe = ov12a10_probe, .remove = ov12a10_remove,
+};
+module_i2c_driver(ov12a10_i2c_driver);
+MODULE_DESCRIPTION("OmniVision OV12A10 12MP sensor driver");
+MODULE_LICENSE("GPL");
-- 
2.47.3

