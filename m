Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795609973;
	b=J/+3FVrzIZzQyF+r3HqRJhzZ1pzb6LXzaVy8GJLpd2fpJpk3kxXFEVG/5XZ2z6+Yg8hc
	 uGOlKj1oxM+7+uT6b3Bz8FRDDq8M85zCdyZ1rGxkdn9LE00DAX/XSZdhfNcsl/ToD5Msj
	 Qh4n4Nvf2wC62sti35rPkD+Wf2rKmHnzArjF9JUybBhrbyWfgLYPo5Xj9rlnxTEacNObj
	 cTajqa9sKTo5k5Q83+Oip/BucNDyC9v8nmwtNWAhEUVRM/JHP8sZ+g1HKzq3n5Iz0rcKV
	 c1Kbmc/kmmF+aoPH88MfNjoU2qSK7gMRhNmP9SZZJbXchh7Ut8nvE9vVpsucQ2UUNJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795609973;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=7NH8ft/e4epQj0KyRs8wVLG7T+X8XhrNEgv4lK9MIVQ=;
	b=fuYrnR8K9u6H0bWyFxBMgUE//9oKv4IQwvpfrwB03s/0H5gHPYitvtQ8t7dF/pPAddw/
	 kRgyVtZLzMhyE62mXAOTjnS7BBdlqpcOqTfVpFpTaQvNFiiedR5GKeAdgihapkdClUoi5
	 inQWMy7xH4RTn5c0hQQHZmurcPC1UZUyCKrxXPKzk2KUd8nnk8B0yLJhMGU4pntbOZYKa
	 Y4LSBUAkCS/DtrvXarexhCYgfLY1lrx9NIQOhUtNBeyjyIak2NgHmAOciAoW5QPBycX9P
	 Xx3MW1E6fxzJOHPbH6Y2Nw5+Ag8Jv8gsnuYSxEd7QGHNvinpiHNw4QNehL4ej+JMTjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=huJ9Bkn9;
	arc=none smtp.remote-ip=209.85.216.42
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 348AE606A327
	for <linux-clk@vger.kernel.org>; Wed, 25 Nov 2026 12:32:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 348AE606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=huJ9Bkn9
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3b4cd193b50so1180107a91.1
        for <linux-clk@vger.kernel.org>; Wed, 25 Nov 2026 04:32:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795609971; x=1796214771; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7NH8ft/e4epQj0KyRs8wVLG7T+X8XhrNEgv4lK9MIVQ=;
        b=huJ9Bkn9l4a0nNnHPAyGkLOpH1AdktcWRDk5+QP6fEVu3lohg2CNxen6MT7yKJcIza
         m15zRQkLYdTZZRmc8WyGYJ6dmLxY5/U+PppjW4CtI2SfMkIZHgD+85IKyTj9toUwlwna
         ZkHLqoVFKmTkjm1kN5ZGp/qTq4yO3tU0qBIuYx0qyMC6JjkzetaDALRJUWnXSL01L+kA
         46+J85XFci/SWBuKboD1dEapYuM5kdvEymJGabzXAHCWClTxES9y7hrr1u3xcWOqnYpA
         MJn2i61zi423IGzFYVWVEF9RKtHp7po2EJolvRW3h+8EhA8Ao7/E+TpV79timeqdl6Mm
         XaAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795609971; x=1796214771;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7NH8ft/e4epQj0KyRs8wVLG7T+X8XhrNEgv4lK9MIVQ=;
        b=l2yjU/urrTH+aMHPvE4w2F3/01QBBNGZc1yxlNqFnS9gszTYoLZShQI86EIlygC1Jh
         2zWRMK6ZybP12/rH4hvJ0BykFrZNA459SQDeuNO894YcABeUh37G3UvbgfECd9ENKpM9
         Eo5jSBjGjVvVhaGh9nhUWFSL/KHnxCzu4L0R7uBGS+NnH2E3rRpHEtf4kKeNRymTFEEp
         TTkqju6apYC9zUgSYQH43uyVQiI5e1j4CA40/KHmZJXeukLRZeXsKKz70XPuAu3S5byc
         ibp+czMqH0A+YbUIrbBQpjaZh1FMZLxrAuo6VVlXUQnfPojmTfw+ZlfLGz6CZFym8EUm
         26vA==
X-Forwarded-Encrypted: i=1; AL+hErEAta788aiTbZqCCXN4j+m+6EY+k1g2rrU5D6W/YQ27bGxf8aSioo84ak7NnuKlfz+tSjDOKEpOpcU=@vger.kernel.org
X-Gm-Message-State: APuU4Z98qmwu0dZms6rQmXcpNQFdIxVbekXk3VXQZACQ8jYBTfLntsFH
	WqulbXtc/EIxiyriK6oKX9aLbkjNPu/HJ0Lk8fbr45rfJCmup8yWeIRb
X-Gm-Gg: AZFdTZfZ7HzUT3COjlRhg981L+c0KTRFJq9+DhIQSZ3bHUJkHsKEnJUrfKS+dFu8nzp
	Xm6xPQGHW3GP13ES3nWaOe8Kw9M7GIzGAFGFnO2qYXxTyDz2dqlFl4rUpov5F79/hcyFydjmkGt
	VQpeNQS+oWDdIFiejG0kIZRMKNOYs8093CKz52MIkWH0SA8sGxMsKGjUtRkzv+9lZvJskcrh6ze
	HmOVKFslt2lOgbW+BzvDycYo6FRYdaQw1rprdcJmYZCFJNEcN99vFfpcc7VCVCbmLtyjLvgUqAS
	CXmo2SVjyfEgdfySpPXf5Pmjtbp977qtjP6FJdTmohY+4H/PkqWGd0yRP3X2uHx0hZZpujbifCm
	m+i+NA0mTN3FDa+EEaared8tNwe/U3O0OzPCbBuJN0/HoSRjOa9nb4JottbJKMEJs21KPUnnCzt
	SDby8XfITx6JAg86C59wMILQ4BDcqdYJKMu/kEhv95+Faq49PuyopEZ8iXW/sJhqkYYB0U70sPb
	NvfV1jPur18TFkARA2z9zHW28Jpj7MetEMcJesMHS+POAudrn6kfCHKyycB9J7UjVvulyvpHKpI
	atF7BvKdXOvVkCpIu7gIYHmsVlKF7oeesInYEwXR+5112sA=
X-Received: by 2002:a17:90b:3cc7:b0:3b1:8300:f48e with SMTP id 98e67ed59e1d1-3b41c9715a7mr17836398a91.49.1795609971183;
        Wed, 25 Nov 2026 04:32:51 -0800 (PST)
Received: from localhost.localdomain ([103.118.130.202])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b44b792474sm12698366a91.3.2026.11.25.04.32.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 04:32:50 -0800 (PST)
From: Hikmah Gumelar <hikmahgumelar@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	u.kleine-koenig@baylibre.com,
	Hikmah Gumelar <hikmahgumelar@gmail.com>
Subject: [PATCH v4 3/7] media: i2c: add s5k5e8 image sensor driver
Date: Wed, 25 Nov 2026 19:31:42 +0700
Message-ID: <20261125123146.379057-4-hikmahgumelar@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261125123146.379057-1-hikmahgumelar@gmail.com>
References: <20261125123146.379057-1-hikmahgumelar@gmail.com>
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

Add V4L2 subdev driver for the Samsung S5K5E8 5-megapixel MIPI CSI-2

CMOS image sensor supporting 2592x1944 10-bit Bayer output.

Signed-off-by: Hikmah Gumelar <hikmahgumelar@gmail.com>
---
 drivers/media/i2c/Kconfig  |  62 +---
 drivers/media/i2c/Makefile |   2 +
 drivers/media/i2c/s5k5e8.c | 567 +++++++++++++++++++++++++++++++++++++
 3 files changed, 578 insertions(+), 53 deletions(-)
 create mode 100644 drivers/media/i2c/s5k5e8.c

diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
index 162b8ea02601..4ac9545f1581 100644
--- a/drivers/media/i2c/Kconfig
+++ b/drivers/media/i2c/Kconfig
@@ -43,7 +43,6 @@ config VIDEO_CCS_PLL
 
 config VIDEO_ALVIUM_CSI2
 	tristate "Allied Vision ALVIUM MIPI CSI-2 camera support"
-	select V4L2_CCI_I2C
 	help
 	  This is a Video4Linux2 sensor-level driver for the Allied Vision
 	  ALVIUM camera connected via MIPI CSI-2 interface.
@@ -62,7 +61,6 @@ config VIDEO_AR0521
 
 config VIDEO_GC0308
 	tristate "GalaxyCore GC0308 sensor support"
-	select V4L2_CCI_I2C
 	help
 	  This is a Video4Linux2 sensor driver for the GalaxyCore
 	  GC0308 camera.
@@ -72,7 +70,6 @@ config VIDEO_GC0308
 
 config VIDEO_GC0310
 	tristate "GalaxyCore GC0310 sensor support"
-	select V4L2_CCI_I2C
 	help
 	  This is a Video4Linux2 sensor-level driver for the Galaxycore
 	  GC0310 0.3MP sensor.
@@ -82,7 +79,6 @@ config VIDEO_GC0310
 
 config VIDEO_GC05A2
 	tristate "GalaxyCore gc05a2 sensor support"
-	select V4L2_CCI_I2C
 	help
 	  This is a Video4Linux2 sensor driver for the GalaxyCore gc05a2
 	  camera.
@@ -92,7 +88,6 @@ config VIDEO_GC05A2
 
 config VIDEO_GC08A3
 	tristate "GalaxyCore gc08a3 sensor support"
-	select V4L2_CCI_I2C
 	help
 	  This is a Video4Linux2 sensor driver for the GalaxyCore gc08a3
 	  camera.
@@ -101,7 +96,6 @@ config VIDEO_GC08A3
 	  module will be called gc08a3.
 
 config VIDEO_GC2145
-	select V4L2_CCI_I2C
 	tristate "GalaxyCore GC2145 sensor support"
 	help
 	  This is a V4L2 sensor-level driver for GalaxyCore GC2145
@@ -140,7 +134,6 @@ config VIDEO_HI847
 config VIDEO_HM1246
 	tristate "Himax HM1246 sensor support"
 	depends on OF
-	select V4L2_CCI_I2C
 	help
 	  This is a Video4Linux2 sensor driver for the Himax
 	  HM1246 camera.
@@ -150,7 +143,6 @@ config VIDEO_HM1246
 
 config VIDEO_IMX111
 	tristate "Sony IMX111 sensor support"
-	select V4L2_CCI_I2C
 	help
 	  This is a V4L2 sensor driver for the Sony IMX111 camera
 	  sensors.
@@ -171,7 +163,6 @@ config VIDEO_IMX214
 	tristate "Sony IMX214 sensor support"
 	depends on GPIOLIB
 	select REGMAP_I2C
-	select V4L2_CCI_I2C
 	select VIDEO_CCS_PLL
 	help
 	  This is a Video4Linux2 sensor driver for the Sony
@@ -182,7 +173,6 @@ config VIDEO_IMX214
 
 config VIDEO_IMX219
 	tristate "Sony IMX219 sensor support"
-	select V4L2_CCI_I2C
 	help
 	  This is a Video4Linux2 sensor driver for the Sony
 	  IMX219 camera.
@@ -192,7 +182,6 @@ config VIDEO_IMX219
 
 config VIDEO_IMX258
 	tristate "Sony IMX258 sensor support"
-	select V4L2_CCI_I2C
 	help
 	  This is a Video4Linux2 sensor driver for the Sony
 	  IMX258 camera.
@@ -209,7 +198,6 @@ config VIDEO_IMX274
 
 config VIDEO_IMX283
 	tristate "Sony IMX283 sensor support"
-	select V4L2_CCI_I2C
 	help
 	  This is a V4L2 sensor driver for the Sony IMX283
 	  CMOS image sensor.
@@ -220,7 +208,6 @@ config VIDEO_IMX283
 config VIDEO_IMX290
 	tristate "Sony IMX290 sensor support"
 	select REGMAP_I2C
-	select V4L2_CCI_I2C
 	help
 	  This is a Video4Linux2 sensor driver for the Sony
 	  IMX290 camera sensor.
@@ -249,7 +236,6 @@ config VIDEO_IMX319
 config VIDEO_IMX334
 	tristate "Sony IMX334 sensor support"
 	depends on OF
-	select V4L2_CCI_I2C
 	help
 	  This is a Video4Linux2 sensor driver for the Sony
 	  IMX334 camera.
@@ -260,7 +246,6 @@ config VIDEO_IMX334
 config VIDEO_IMX335
 	tristate "Sony IMX335 sensor support"
 	depends on OF
-	select V4L2_CCI_I2C
 	help
 	  This is a Video4Linux2 sensor driver for the Sony
 	  IMX335 camera.
@@ -270,7 +255,6 @@ config VIDEO_IMX335
 
 config VIDEO_IMX355
 	tristate "Sony IMX355 sensor support"
-	select V4L2_CCI_I2C
 	help
 	  This is a Video4Linux2 sensor driver for the Sony
 	  IMX355 camera.
@@ -281,7 +265,6 @@ config VIDEO_IMX355
 config VIDEO_IMX412
 	tristate "Sony IMX412 sensor support"
 	depends on OF
-	select V4L2_CCI_I2C
 	help
 	  This is a Video4Linux2 sensor driver for the Sony
 	  IMX412 camera.
@@ -292,7 +275,6 @@ config VIDEO_IMX412
 config VIDEO_IMX415
 	tristate "Sony IMX415 sensor support"
 	depends on OF
-	select V4L2_CCI_I2C
 	help
 	  This is a Video4Linux2 sensor driver for the Sony
 	  IMX415 camera.
@@ -302,7 +284,6 @@ config VIDEO_IMX415
 
 config VIDEO_IMX471
 	tristate "Sony IMX471 sensor support"
-	select V4L2_CCI_I2C
 	help
 	  This is a Video4Linux2 sensor driver for the Sony
 	  IMX471 camera.
@@ -312,7 +293,6 @@ config VIDEO_IMX471
 
 config VIDEO_IMX576
         tristate "Sony IMX576 sensor support"
-        select V4L2_CCI_I2C
 	select VIDEO_CCS_PLL
         help
           This is a Video4Linux2 sensor driver for the Sony
@@ -333,7 +313,6 @@ config VIDEO_IMX678
 config VIDEO_IMX908
 	tristate "Sony IMX908 sensor support"
 	depends on GPIOLIB
-	select V4L2_CCI_I2C
 	help
 	  This is a Video4Linux2 sensor driver for the Sony
 	  IMX908 CMOS image sensor.
@@ -345,7 +324,6 @@ config VIDEO_MIRA016
 	tristate "ams OSRAM MIRA016 sensor support"
 	depends on I2C && VIDEO_DEV
 	depends on GPIOLIB
-	select V4L2_CCI_I2C
 	help
 	  This is a Video4Linux2 sensor driver for the ams OSRAM
 	  MIRA016 camera.
@@ -360,7 +338,6 @@ config VIDEO_MIRA220
 	tristate "ams OSRAM MIRA220 sensor support"
 	depends on I2C && VIDEO_DEV
 	depends on GPIOLIB
-	select V4L2_CCI_I2C
 	help
 	  This is a Video4Linux2 sensor driver for the ams OSRAM
 	  MIRA220 camera.
@@ -382,7 +359,6 @@ config VIDEO_MT9M111
 
 config VIDEO_MT9M114
 	tristate "onsemi MT9M114 sensor support"
-	select V4L2_CCI_I2C
 	select VIDEO_APTINA_PLL
 	help
 	  This is a Video4Linux2 sensor-level driver for the onsemi MT9M114
@@ -433,7 +409,6 @@ config VIDEO_MT9V111
 
 config VIDEO_OG01A1B
 	tristate "OmniVision OG01A1B sensor support"
-	select V4L2_CCI_I2C
 	help
 	  This is a Video4Linux2 sensor driver for the OmniVision
 	  OG01A1B camera.
@@ -443,7 +418,6 @@ config VIDEO_OG01A1B
 
 config VIDEO_OG0VE1B
 	tristate "OmniVision OG0VE1B sensor support"
-	select V4L2_CCI_I2C
 	help
 	  This is a Video4Linux2 sensor driver for the OmniVision
 	  OG0VE1B camera.
@@ -453,7 +427,6 @@ config VIDEO_OG0VE1B
 
 config VIDEO_OS02G10
 	tristate "OmniVision OS02G10 sensor support"
-	select V4L2_CCI_I2C
 	help
 	  This is a Video4Linux2 sensor driver for Omnivision
 	  OS02G10 camera sensor.
@@ -463,7 +436,6 @@ config VIDEO_OS02G10
 
 config VIDEO_OS05B10
         tristate "OmniVision OS05B10 sensor support"
-        select V4L2_CCI_I2C
         help
           This is a Video4Linux2 sensor driver for Omnivision
           OS05B10 camera sensor.
@@ -473,7 +445,6 @@ config VIDEO_OS05B10
 
 config VIDEO_OV01A10
 	tristate "OmniVision OV01A10 sensor support"
-	select V4L2_CCI_I2C
 	help
 	  This is a Video4Linux2 sensor driver for the OmniVision
 	  OV01A10 camera.
@@ -492,7 +463,6 @@ config VIDEO_OV02A10
 
 config VIDEO_OV02E10
 	tristate "OmniVision OV02E10 sensor support"
-	select V4L2_CCI_I2C
 	help
 	  This is a Video4Linux2 sensor driver for the OmniVision
 	  OV02E10 camera.
@@ -502,7 +472,6 @@ config VIDEO_OV02E10
 
 config VIDEO_OV02C10
 	tristate "OmniVision OV02C10 sensor support"
-	select V4L2_CCI_I2C
 	help
 	  This is a Video4Linux2 sensor driver for the OmniVision
 	  OV02C10 camera.
@@ -512,7 +481,6 @@ config VIDEO_OV02C10
 
 config VIDEO_OV05C10
 	tristate "OmniVision OV05C10 sensor support"
-	select V4L2_CCI_I2C
 	help
 	  This is a Video4Linux2 sensor driver for the OmniVision
 	  OV05C10 camera.
@@ -538,6 +506,15 @@ config VIDEO_OV08X40
 	  To compile this driver as a module, choose M here: the
 	  module will be called ov08x40.
 
+config VIDEO_OV12A10
+	tristate "OmniVision OV12A10 sensor support"
+	help
+	  This is a Video4Linux2 sensor-level driver for the OmniVision
+	  OV12A10 12-megapixel MIPI CSI-2 CMOS image sensor.
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called ov12a10.
+
 config VIDEO_OV13858
 	tristate "OmniVision OV13858 sensor support"
 	help
@@ -571,7 +548,6 @@ config VIDEO_OV2659
 
 config VIDEO_OV2680
 	tristate "OmniVision OV2680 sensor support"
-	select V4L2_CCI_I2C
 	help
 	  This is a Video4Linux2 sensor driver for the OmniVision
 	  OV2680 camera.
@@ -592,7 +568,6 @@ config VIDEO_OV2732
 	tristate "OmniVision OV2732 sensor support"
 	depends on OF
 	select MEDIA_CONTROLLER
-	select V4L2_CCI_I2C
 	select VIDEO_V4L2_SUBDEV_API
 	help
 	  This is a Video4Linux2 sensor driver for the OmniVision
@@ -603,7 +578,6 @@ config VIDEO_OV2732
 
 config VIDEO_OV2735
 	tristate "OmniVision OV2735 sensor support"
-	select V4L2_CCI_I2C
 	help
 	  This is a Video4Linux2 sensor driver for the OmniVision
 	  OV2735 camera.
@@ -625,7 +599,6 @@ config VIDEO_OV2740
 config VIDEO_OV4689
 	tristate "OmniVision OV4689 sensor support"
 	depends on GPIOLIB
-	select V4L2_CCI_I2C
 	help
 	  This is a Video4Linux2 sensor-level driver for the OmniVision
 	  OV4689 camera.
@@ -653,7 +626,6 @@ config VIDEO_OV5645
 
 config VIDEO_OV5647
 	tristate "OmniVision OV5647 sensor support"
-	select V4L2_CCI_I2C
 	help
 	  This is a Video4Linux2 sensor driver for the OmniVision
 	  OV5647 camera.
@@ -691,7 +663,6 @@ config VIDEO_OV5675
 
 config VIDEO_OV5693
 	tristate "OmniVision OV5693 sensor support"
-	select V4L2_CCI_I2C
 	help
 	  This is a Video4Linux2 sensor driver for the OmniVision
 	  OV5693 camera.
@@ -710,7 +681,6 @@ config VIDEO_OV5695
 
 config VIDEO_OV6211
 	tristate "OmniVision OV6211 sensor support"
-	select V4L2_CCI_I2C
 	help
 	  This is a Video4Linux2 sensor driver for the OmniVision
 	  OV6211 camera.
@@ -720,7 +690,6 @@ config VIDEO_OV6211
 
 config VIDEO_OV64A40
 	tristate "OmniVision OV64A40 sensor support"
-	select V4L2_CCI_I2C
 	help
 	  This is a Video4Linux2 sensor driver for the OmniVision
 	  OV64A40 camera.
@@ -802,7 +771,6 @@ config VIDEO_OV8865
 config VIDEO_OV9282
 	tristate "OmniVision OV9282 sensor support"
 	depends on OF
-	select V4L2_CCI_I2C
 	help
 	  This is a Video4Linux2 sensor driver for the OmniVision
 	  OV9282 camera sensor.
@@ -871,7 +839,6 @@ config VIDEO_S5C73M3
 
 config VIDEO_S5K3M5
 	tristate "Samsung S5K3M5 sensor support"
-	select V4L2_CCI_I2C
 	help
 	  This is a V4L2 sensor driver for Samsung S5K3M5 13MP raw
 	  camera sensor.
@@ -893,7 +860,6 @@ config VIDEO_S5K6A3
 
 config VIDEO_S5KJN1
 	tristate "Samsung S5KJN1 sensor support"
-	select V4L2_CCI_I2C
 	help
 	  This is a V4L2 sensor driver for Samsung S5KJN1 50MP raw
 	  camera sensor.
@@ -904,7 +870,6 @@ config VIDEO_S5KJN1
 config VIDEO_S5KJN5
 	tristate "Samsung S5KJN5 sensor support"
 	depends on GPIOLIB
-	select V4L2_CCI_I2C
 	help
 	  This is a V4L2 sensor driver for Samsung S5KJN5 50MP
 	  10-bit RAW MIPI CSI-2 camera sensor.
@@ -915,7 +880,6 @@ config VIDEO_S5KJN5
 config VIDEO_SONY_STARVIS2
 	tristate "Sony Starvis 2 sensor support"
 	depends on GPIOLIB
-	select V4L2_CCI_I2C
 	help
 	  This is a Video4Linux2 sensor driver for the Sony Starvis
 	  2 image sensors.
@@ -927,7 +891,6 @@ config VIDEO_T4KA3
 	tristate "Toshiba T4KA3 sensor support"
 	depends on ACPI || COMPILE_TEST
 	depends on GPIOLIB
-	select V4L2_CCI_I2C
 	help
 	  This is a Video4Linux2 sensor driver for the Toshiba T4KA3 8 MP
 	  camera sensor.
@@ -937,7 +900,6 @@ config VIDEO_T4KA3
 
 config VIDEO_VD55G1
 	tristate "ST VD55G1 sensor support"
-	select V4L2_CCI_I2C
 	depends on GPIOLIB
 	help
 	  This is a Video4Linux2 sensor driver for the ST VD55G1
@@ -948,7 +910,6 @@ config VIDEO_VD55G1
 
 config VIDEO_VD56G3
 	tristate "ST VD56G3 sensor support"
-	select V4L2_CCI_I2C
 	depends on GPIOLIB
 	help
 	  This is a Video4Linux2 sensor driver for the ST VD56G3
@@ -959,7 +920,6 @@ config VIDEO_VD56G3
 
 config VIDEO_VGXY61
 	tristate "ST VGXY61 sensor support"
-	select V4L2_CCI_I2C
 	depends on OF && GPIOLIB
 	help
 	  This is a Video4Linux2 sensor driver for the ST VGXY61
@@ -979,7 +939,6 @@ config VIDEO_THP7312
 	select FW_LOADER
 	select FW_UPLOAD
 	select MEDIA_CONTROLLER
-	select V4L2_CCI_I2C
 	select V4L2_FWNODE
 	select VIDEO_V4L2_SUBDEV_API
 	help
@@ -1024,7 +983,6 @@ config VIDEO_DW9714
 
 config VIDEO_DW9719
 	tristate "DW9719 lens voice coil support"
-	select V4L2_CCI_I2C
 	help
 	  This is a driver for the DW9719 camera lens voice coil.
 	  This is designed for linear control of voice coil motors,
@@ -1421,7 +1379,6 @@ config VIDEO_LT6911UXE
 	tristate "Lontium LT6911UXE decoder"
 	depends on ACPI && VIDEO_DEV && I2C
 	select V4L2_FWNODE
-	select V4L2_CCI_I2C
 	select MEDIA_CONTROLLER
 	select VIDEO_V4L2_SUBDEV_API
 	help
@@ -1826,7 +1783,6 @@ config VIDEO_ST_MIPID02
 	depends on I2C && VIDEO_DEV
 	select MEDIA_CONTROLLER
 	select VIDEO_V4L2_SUBDEV_API
-	select V4L2_CCI_I2C
 	select V4L2_FWNODE
 	help
 	  Support for STMicroelectronics MIPID02 CSI-2 to PARALLEL bridge.
diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
index a750942e9c62..1ae704f57468 100644
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
@@ -137,6 +138,7 @@ obj-$(CONFIG_VIDEO_RJ54N1) += rj54n1cb0c.o
 obj-$(CONFIG_VIDEO_S5C73M3) += s5c73m3/
 obj-$(CONFIG_VIDEO_S5K3M5) += s5k3m5.o
 obj-$(CONFIG_VIDEO_S5K5BAF) += s5k5baf.o
+obj-$(CONFIG_VIDEO_S5K5E8) += s5k5e8.o
 obj-$(CONFIG_VIDEO_S5K6A3) += s5k6a3.o
 obj-$(CONFIG_VIDEO_S5KJN1) += s5kjn1.o
 obj-$(CONFIG_VIDEO_S5KJN5) += s5kjn5.o
diff --git a/drivers/media/i2c/s5k5e8.c b/drivers/media/i2c/s5k5e8.c
new file mode 100644
index 000000000000..d25b978d7eda
--- /dev/null
+++ b/drivers/media/i2c/s5k5e8.c
@@ -0,0 +1,567 @@
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
+#define S5K5E8_CHIP_ID_REG		0x0000
+#define S5K5E8_CHIP_ID			0x5e80
+#define S5K5E8_REG_MODE_SELECT		0x0100
+#define S5K5E8_MODE_STANDBY		0x00
+#define S5K5E8_REG_VTS			0x0340
+#define S5K5E8_REG_EXPOSURE		0x0202
+#define S5K5E8_REG_ANALOG_GAIN		0x0204
+#define S5K5E8_REG_TEST_PATTERN		0x0600
+#define S5K5E8_XVCLK_FREQ		24000000
+#define S5K5E8_LINK_FREQ_418MHZ		418000000ULL
+#define S5K5E8_PIXEL_RATE		167200000ULL
+
+struct s5k5e8_reg {
+	u16 address;
+	u8 val;
+};
+
+struct s5k5e8_mode {
+	u32 width, height, hts_def, num_regs;
+	const struct s5k5e8_reg *regs;
+};
+
+static const char * const s5k5e8_supply_names[] = { "avdd", "dvdd", "dovdd" };
+#define S5K5E8_NUM_SUPPLIES ARRAY_SIZE(s5k5e8_supply_names)
+
+/* Register initialization tables derived from Xiaomi Mi A1 vendor configuration */
+static const struct s5k5e8_reg s5k5e8_common_regs[] = {
+	{ 0x0100, 0x00 }, { 0x3906, 0x7e }, { 0x3c01, 0x0f }, { 0x3c14, 0x00 },
+	{ 0x3235, 0x08 }, { 0x3063, 0x2e }, { 0x307a, 0x10 }, { 0x307b, 0x0e },
+	{ 0x3079, 0x20 }, { 0x3070, 0x05 }, { 0x3067, 0x06 }, { 0x3071, 0x62 },
+	{ 0x3072, 0x16 }, { 0x3203, 0x43 }, { 0x3205, 0x43 }, { 0x320b, 0x42 },
+	{ 0x3007, 0x00 }, { 0x3008, 0x14 }, { 0x3020, 0x58 }, { 0x300d, 0x34 },
+	{ 0x300e, 0x17 }, { 0x3021, 0x02 }, { 0x3010, 0x59 }, { 0x3002, 0x01 },
+	{ 0x3005, 0x01 }, { 0x3008, 0x04 }, { 0x300f, 0x70 }, { 0x3010, 0x69 },
+	{ 0x3017, 0x10 }, { 0x3019, 0x19 }, { 0x300c, 0x62 }, { 0x3064, 0x10 },
+	{ 0x3c08, 0x0e }, { 0x3c09, 0x10 }, { 0x3c31, 0x0d }, { 0x3c32, 0xac },
+};
+
+static const struct s5k5e8_reg s5k5e8_2592x1944_regs[] = {
+	{ 0x0100, 0x00 }, { 0x0136, 0x18 }, { 0x0137, 0x00 }, { 0x0305, 0x06 },
+	{ 0x0306, 0x18 }, { 0x0307, 0xa8 }, { 0x0308, 0x34 }, { 0x0309, 0x42 },
+	{ 0x3c1f, 0x00 }, { 0x3c17, 0x00 }, { 0x3c0b, 0x04 }, { 0x3c1c, 0x47 },
+	{ 0x3c1d, 0x15 }, { 0x3c14, 0x04 }, { 0x3c16, 0x00 }, { 0x0820, 0x03 },
+	{ 0x0821, 0x44 }, { 0x0114, 0x01 }, { 0x0344, 0x00 }, { 0x0345, 0x08 },
+	{ 0x0346, 0x00 }, { 0x0347, 0x08 }, { 0x0348, 0x0a }, { 0x0349, 0x27 },
+	{ 0x034a, 0x07 }, { 0x034b, 0x9f }, { 0x034c, 0x0a }, { 0x034d, 0x20 },
+	{ 0x034e, 0x07 }, { 0x034f, 0x98 }, { 0x0900, 0x00 }, { 0x0901, 0x00 },
+	{ 0x0381, 0x01 }, { 0x0383, 0x01 }, { 0x0385, 0x01 }, { 0x0387, 0x01 },
+	{ 0x0340, 0x07 }, { 0x0341, 0xb0 }, { 0x0342, 0x0b }, { 0x0343, 0x28 },
+	{ 0x0200, 0x00 }, { 0x0201, 0x00 }, { 0x0202, 0x03 }, { 0x0203, 0xde },
+	{ 0x3303, 0x02 }, { 0x3400, 0x00 }, { 0x323b, 0x02 }, { 0x3301, 0x00 },
+	{ 0x3321, 0x04 }, { 0x3306, 0x00 }, { 0x3307, 0x08 }, { 0x3308, 0x0a },
+	{ 0x3309, 0x27 }, { 0x330a, 0x01 }, { 0x330b, 0x01 }, { 0x330e, 0x00 },
+	{ 0x330f, 0x08 }, { 0x3310, 0x07 }, { 0x3311, 0x9f }, { 0x3312, 0x01 },
+	{ 0x3313, 0x01 },
+};
+
+static const struct s5k5e8_mode default_mode = {
+		.width = 2592, .height = 1944, .hts_def = 2856,
+			.num_regs = ARRAY_SIZE(s5k5e8_2592x1944_regs),
+		.regs = s5k5e8_2592x1944_regs,
+	};
+
+static const s64 link_freq_menu_items[] = { S5K5E8_LINK_FREQ_418MHZ };
+
+struct s5k5e8 {
+	struct device *dev;
+	struct v4l2_subdev sd;
+	struct media_pad pad;
+	struct clk *xvclk;
+	struct gpio_desc *reset_gpio;
+	struct regulator_bulk_data supplies[S5K5E8_NUM_SUPPLIES];
+	struct v4l2_ctrl_handler ctrl_handler;
+	struct v4l2_ctrl *link_freq, *hblank, *exposure;
+	const struct s5k5e8_mode *cur_mode;
+	/* Serialize access to sensor registers and streaming state */
+	struct mutex mutex;
+	bool streaming;
+};
+
+static inline struct s5k5e8 *to_s5k5e8(struct v4l2_subdev *sd)
+{
+	return container_of(sd, struct s5k5e8, sd);
+}
+
+static int s5k5e8_read_reg(struct s5k5e8 *s5k5e8, u16 reg, u32 len, u32 *val)
+{
+	struct i2c_client *client = v4l2_get_subdevdata(&s5k5e8->sd);
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
+static int s5k5e8_write_reg(struct s5k5e8 *s5k5e8, u16 reg, u32 len, u32 val)
+{
+	struct i2c_client *client = v4l2_get_subdevdata(&s5k5e8->sd);
+	u8 buf[6];
+	int ret;
+
+	put_unaligned_be16(reg, buf);
+	put_unaligned_be32(val << (8 * (4 - len)), buf + 2);
+	ret = i2c_master_send(client, buf, len + 2);
+	return ret == len + 2 ? 0 : (ret < 0 ? ret : -EIO);
+}
+
+static int s5k5e8_write_regs(struct s5k5e8 *s5k5e8, const struct s5k5e8_reg *regs, u32 len)
+{
+	u32 i;
+	int ret;
+
+	for (i = 0; i < len; i++) {
+		ret = s5k5e8_write_reg(s5k5e8, regs[i].address, 1, regs[i].val);
+		if (ret)
+			return ret;
+	}
+	return 0;
+}
+
+static int s5k5e8_power_on(struct device *dev)
+{
+	struct s5k5e8 *s5k5e8 = to_s5k5e8(dev_get_drvdata(dev));
+	int ret = regulator_bulk_enable(S5K5E8_NUM_SUPPLIES, s5k5e8->supplies);
+
+	if (ret)
+		return ret;
+	ret = clk_prepare_enable(s5k5e8->xvclk);
+	if (ret) {
+		regulator_bulk_disable(S5K5E8_NUM_SUPPLIES, s5k5e8->supplies);
+		return ret;
+	}
+	gpiod_set_value_cansleep(s5k5e8->reset_gpio, 1);
+	usleep_range(1000, 2000);
+	gpiod_set_value_cansleep(s5k5e8->reset_gpio, 0);
+	usleep_range(3000, 5000);
+	return 0;
+}
+
+static int s5k5e8_power_off(struct device *dev)
+{
+	struct s5k5e8 *s5k5e8 = to_s5k5e8(dev_get_drvdata(dev));
+
+	if (s5k5e8->reset_gpio)
+		gpiod_set_value_cansleep(s5k5e8->reset_gpio, 1);
+	clk_disable_unprepare(s5k5e8->xvclk);
+	regulator_bulk_disable(S5K5E8_NUM_SUPPLIES, s5k5e8->supplies);
+	return 0;
+}
+
+static int s5k5e8_set_ctrl(struct v4l2_ctrl *ctrl)
+{
+	struct s5k5e8 *s5k5e8 = container_of(ctrl->handler, struct s5k5e8, ctrl_handler);
+	int ret = 0;
+
+	if (ctrl->id == V4L2_CID_VBLANK) {
+		s64 exp_max = s5k5e8->cur_mode->height + ctrl->val - 4;
+		s64 exp_def = min_t(s64, 1960, exp_max);
+
+		ret = __v4l2_ctrl_modify_range(s5k5e8->exposure, 4, exp_max, 1,
+					       exp_def);
+		if (ret)
+			return ret;
+	}
+
+	ret = pm_runtime_get_if_active(s5k5e8->dev);
+	if (ret <= 0)
+		return 0;
+	switch (ctrl->id) {
+	case V4L2_CID_ANALOGUE_GAIN:
+		ret = s5k5e8_write_reg(s5k5e8, S5K5E8_REG_ANALOG_GAIN, 2, ctrl->val);
+	break;
+	case V4L2_CID_EXPOSURE:
+		ret = s5k5e8_write_reg(s5k5e8, S5K5E8_REG_EXPOSURE, 2, ctrl->val);
+	break;
+	case V4L2_CID_VBLANK:
+		ret = s5k5e8_write_reg(s5k5e8, S5K5E8_REG_VTS, 2,
+				       s5k5e8->cur_mode->height + ctrl->val);
+	break;
+	case V4L2_CID_TEST_PATTERN:
+		ret = s5k5e8_write_reg(s5k5e8, S5K5E8_REG_TEST_PATTERN, 2, ctrl->val);
+	break;
+	}
+	pm_runtime_put(s5k5e8->dev);
+	return ret;
+}
+
+static const struct v4l2_ctrl_ops s5k5e8_ctrl_ops = { .s_ctrl = s5k5e8_set_ctrl };
+static const char * const s5k5e8_test_pattern_menu[] = {
+	"Disabled",
+	"Solid Color",
+	"100% Color Bars",
+	"Fade to Grey",
+	"PN9",
+};
+
+static int s5k5e8_init_controls(struct s5k5e8 *s5k5e8)
+{
+	struct v4l2_fwnode_device_properties props;
+	struct v4l2_ctrl_handler *hdl = &s5k5e8->ctrl_handler;
+	s64 hblank = s5k5e8->cur_mode->hts_def - s5k5e8->cur_mode->width;
+	int ret = v4l2_ctrl_handler_init(hdl, 8);
+
+	if (ret)
+		return ret;
+	hdl->lock = &s5k5e8->mutex;
+	s5k5e8->link_freq = v4l2_ctrl_new_int_menu(hdl, &s5k5e8_ctrl_ops, V4L2_CID_LINK_FREQ,
+						   0, 0, link_freq_menu_items);
+	if (s5k5e8->link_freq)
+		s5k5e8->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
+	v4l2_ctrl_new_std(hdl, &s5k5e8_ctrl_ops, V4L2_CID_PIXEL_RATE,
+			  S5K5E8_PIXEL_RATE, S5K5E8_PIXEL_RATE, 1, S5K5E8_PIXEL_RATE);
+	v4l2_ctrl_new_std(hdl, &s5k5e8_ctrl_ops, V4L2_CID_VBLANK, 24,
+			  0x7fff - s5k5e8->cur_mode->height, 1, 24);
+	s5k5e8->hblank = v4l2_ctrl_new_std(hdl, &s5k5e8_ctrl_ops, V4L2_CID_HBLANK, hblank,
+					   hblank, 1, hblank);
+	if (s5k5e8->hblank)
+		s5k5e8->hblank->flags |= V4L2_CTRL_FLAG_READ_ONLY;
+	v4l2_ctrl_new_std(hdl, &s5k5e8_ctrl_ops, V4L2_CID_ANALOGUE_GAIN, 0x20, 0x200, 1, 0x60);
+	s5k5e8->exposure = v4l2_ctrl_new_std(hdl, &s5k5e8_ctrl_ops, V4L2_CID_EXPOSURE, 4, 1964,
+					     1, 1960);
+	v4l2_ctrl_new_std_menu_items(hdl, &s5k5e8_ctrl_ops, V4L2_CID_TEST_PATTERN, 4, 0, 0,
+				     s5k5e8_test_pattern_menu);
+	if (hdl->error) {
+		ret = hdl->error;
+		goto err;
+	}
+	ret = v4l2_fwnode_device_parse(s5k5e8->dev, &props);
+	if (ret)
+		goto err;
+	ret = v4l2_ctrl_new_fwnode_properties(hdl, &s5k5e8_ctrl_ops, &props);
+	if (ret)
+		goto err;
+	s5k5e8->sd.ctrl_handler = hdl;
+	return 0;
+err:
+	v4l2_ctrl_handler_free(hdl);
+	return ret;
+}
+
+static void s5k5e8_update_pad_format(const struct s5k5e8_mode *mode,
+				     struct v4l2_mbus_framefmt *fmt)
+{
+	fmt->width = mode->width;
+	fmt->height = mode->height;
+	fmt->code = MEDIA_BUS_FMT_SGRBG10_1X10;
+	fmt->field = V4L2_FIELD_NONE;
+	fmt->colorspace = V4L2_COLORSPACE_SRGB;
+	fmt->ycbcr_enc = V4L2_MAP_YCBCR_ENC_DEFAULT(fmt->colorspace);
+	fmt->quantization = V4L2_MAP_QUANTIZATION_DEFAULT(true, fmt->colorspace,
+							  fmt->ycbcr_enc);
+	fmt->xfer_func = V4L2_MAP_XFER_FUNC_DEFAULT(fmt->colorspace);
+}
+
+static int s5k5e8_set_format(struct v4l2_subdev *sd,
+			     const struct v4l2_subdev_client_info *ci,
+			     struct v4l2_subdev_state *sd_state,
+			     struct v4l2_subdev_format *fmt)
+{
+	struct s5k5e8 *s5k5e8 = to_s5k5e8(sd);
+
+	if (fmt->which == V4L2_SUBDEV_FORMAT_ACTIVE && s5k5e8->streaming)
+		return -EBUSY;
+
+	s5k5e8_update_pad_format(&default_mode, &fmt->format);
+	*v4l2_subdev_state_get_format(sd_state, fmt->pad) = fmt->format;
+	if (fmt->which == V4L2_SUBDEV_FORMAT_ACTIVE)
+		s5k5e8->cur_mode = &default_mode;
+
+	return 0;
+}
+
+static int s5k5e8_enum_mbus_code(struct v4l2_subdev *sd, struct v4l2_subdev_state *sd_state,
+				 struct v4l2_subdev_mbus_code_enum *code)
+{
+	if (code->index > 0)
+		return -EINVAL;
+	code->code = MEDIA_BUS_FMT_SGRBG10_1X10;
+	return 0;
+}
+
+static int s5k5e8_enum_frame_size(struct v4l2_subdev *sd, struct v4l2_subdev_state *sd_state,
+				  struct v4l2_subdev_frame_size_enum *fse)
+{
+	if (fse->index > 0 ||
+	    fse->code != MEDIA_BUS_FMT_SGRBG10_1X10)
+		return -EINVAL;
+	fse->min_width = default_mode.width;
+	fse->max_width = default_mode.width;
+	fse->min_height = default_mode.height;
+	fse->max_height = default_mode.height;
+	return 0;
+}
+
+static int s5k5e8_set_stream(struct v4l2_subdev *sd, int enable)
+{
+	struct s5k5e8 *s5k5e8 = to_s5k5e8(sd);
+	int ret = 0;
+
+	mutex_lock(&s5k5e8->mutex);
+	if (s5k5e8->streaming == enable) {
+		mutex_unlock(&s5k5e8->mutex);
+		return 0;
+	}
+	if (enable) {
+		ret = pm_runtime_resume_and_get(s5k5e8->dev);
+		if (ret < 0)
+			goto out;
+		ret = s5k5e8_write_regs(s5k5e8, s5k5e8_common_regs,
+					ARRAY_SIZE(s5k5e8_common_regs));
+		if (!ret)
+			ret = s5k5e8_write_regs(s5k5e8, s5k5e8->cur_mode->regs,
+						s5k5e8->cur_mode->num_regs);
+		if (!ret)
+			ret = __v4l2_ctrl_handler_setup(s5k5e8->sd.ctrl_handler);
+		if (!ret) {
+			static const struct s5k5e8_reg stream_on_regs[] = {
+				{ 0x3c16, 0x00 },
+				{ 0x3c0d, 0x04 },
+				{ 0x0100, 0x01 },
+				{ 0x3c22, 0x00 },
+				{ 0x3c22, 0x00 },
+				{ 0x3c0d, 0x00 },
+			};
+			msleep(80);
+			ret = s5k5e8_write_regs(s5k5e8, stream_on_regs,
+						ARRAY_SIZE(stream_on_regs));
+		}
+		if (ret) {
+			pm_runtime_put(s5k5e8->dev);
+			goto out;
+		}
+	} else {
+		s5k5e8_write_reg(s5k5e8, S5K5E8_REG_MODE_SELECT, 1, S5K5E8_MODE_STANDBY);
+		pm_runtime_put(s5k5e8->dev);
+	}
+	s5k5e8->streaming = enable;
+out:
+	mutex_unlock(&s5k5e8->mutex);
+	return ret;
+}
+
+static int s5k5e8_init_state(struct v4l2_subdev *sd,
+			     struct v4l2_subdev_state *sd_state)
+{
+	s5k5e8_update_pad_format(&default_mode,
+				 v4l2_subdev_state_get_format(sd_state, 0));
+	return 0;
+}
+
+static const struct v4l2_subdev_video_ops s5k5e8_video_ops = { .s_stream = s5k5e8_set_stream };
+
+static int s5k5e8_get_selection(struct v4l2_subdev *sd, const struct v4l2_subdev_client_info *ci,
+				struct v4l2_subdev_state *sd_state,
+				struct v4l2_subdev_selection *sel)
+{
+	switch (sel->target) {
+	case V4L2_SEL_TGT_CROP:
+	case V4L2_SEL_TGT_CROP_DEFAULT:
+	case V4L2_SEL_TGT_CROP_BOUNDS:
+	case V4L2_SEL_TGT_NATIVE_SIZE:
+		sel->r.left = 0;
+		sel->r.top = 0;
+		sel->r.width = 2592;
+		sel->r.height = 1944;
+		return 0;
+	default:
+		return -EINVAL;
+	}
+}
+
+static const struct v4l2_subdev_pad_ops s5k5e8_pad_ops = {
+	.get_selection = s5k5e8_get_selection,
+	.set_fmt = s5k5e8_set_format, .get_fmt = v4l2_subdev_get_fmt,
+	.enum_mbus_code = s5k5e8_enum_mbus_code, .enum_frame_size = s5k5e8_enum_frame_size,
+};
+
+static const struct v4l2_subdev_ops s5k5e8_subdev_ops = {
+	.video = &s5k5e8_video_ops,
+	.pad = &s5k5e8_pad_ops,
+};
+
+static const struct media_entity_operations s5k5e8_entity_ops = {
+	.link_validate = v4l2_subdev_link_validate,
+};
+
+static const struct v4l2_subdev_internal_ops s5k5e8_internal_ops = {
+	.init_state = s5k5e8_init_state,
+};
+
+static int s5k5e8_probe(struct i2c_client *client)
+{
+	struct device *dev = &client->dev;
+	struct fwnode_handle *endpoint;
+	struct v4l2_fwnode_endpoint ep_cfg = {
+		.bus_type = V4L2_MBUS_CSI2_DPHY,
+	};
+	struct s5k5e8 *s5k5e8;
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
+	if (ep_cfg.bus.mipi_csi2.num_data_lanes != 2 ||
+	    ep_cfg.nr_of_link_frequencies != 1 ||
+	    ep_cfg.link_frequencies[0] != S5K5E8_LINK_FREQ_418MHZ) {
+		v4l2_fwnode_endpoint_free(&ep_cfg);
+		return dev_err_probe(dev, -EINVAL, "unsupported CSI-2 configuration\n");
+	}
+	v4l2_fwnode_endpoint_free(&ep_cfg);
+
+	s5k5e8 = devm_kzalloc(dev, sizeof(*s5k5e8), GFP_KERNEL);
+	if (!s5k5e8)
+		return -ENOMEM;
+
+	s5k5e8->dev = dev;
+	v4l2_i2c_subdev_init(&s5k5e8->sd, client, &s5k5e8_subdev_ops);
+
+	s5k5e8->xvclk = devm_v4l2_sensor_clk_get(dev, NULL);
+	if (IS_ERR(s5k5e8->xvclk))
+		return dev_err_probe(dev, PTR_ERR(s5k5e8->xvclk), "failed to get xvclk\n");
+
+	if (clk_get_rate(s5k5e8->xvclk) != S5K5E8_XVCLK_FREQ)
+		return dev_err_probe(dev, -EINVAL, "unexpected xvclk rate\n");
+
+	s5k5e8->reset_gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_HIGH);
+	if (IS_ERR(s5k5e8->reset_gpio))
+		return dev_err_probe(dev, PTR_ERR(s5k5e8->reset_gpio),
+				     "failed to get reset gpio\n");
+
+	for (i = 0; i < S5K5E8_NUM_SUPPLIES; i++)
+		s5k5e8->supplies[i].supply = s5k5e8_supply_names[i];
+
+	ret = devm_regulator_bulk_get(dev, S5K5E8_NUM_SUPPLIES, s5k5e8->supplies);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to get regulators\n");
+
+	ret = s5k5e8_power_on(dev);
+	if (ret)
+		return ret;
+
+	ret = s5k5e8_read_reg(s5k5e8, S5K5E8_CHIP_ID_REG, 2, &val);
+	if (ret || val != S5K5E8_CHIP_ID) {
+		ret = dev_err_probe(dev, ret ? ret : -ENODEV,
+				    "failed to identify s5k5e8 (id=0x%x)\n", val);
+		goto err_power;
+	}
+
+	s5k5e8->cur_mode = &default_mode;
+	mutex_init(&s5k5e8->mutex);
+
+	ret = s5k5e8_init_controls(s5k5e8);
+	if (ret)
+		goto err_mutex;
+
+	s5k5e8->sd.internal_ops = &s5k5e8_internal_ops;
+	s5k5e8->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
+	s5k5e8->sd.entity.ops = &s5k5e8_entity_ops;
+	s5k5e8->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
+	s5k5e8->pad.flags = MEDIA_PAD_FL_SOURCE;
+
+	ret = media_entity_pads_init(&s5k5e8->sd.entity, 1, &s5k5e8->pad);
+	if (ret)
+		goto err_ctrl;
+
+	s5k5e8->sd.state_lock = &s5k5e8->mutex;
+	ret = v4l2_subdev_init_finalize(&s5k5e8->sd);
+	if (ret)
+		goto err_media;
+
+	pm_runtime_set_active(dev);
+	pm_runtime_enable(dev);
+
+	ret = v4l2_async_register_subdev_sensor(&s5k5e8->sd);
+	if (ret)
+		goto err_subdev;
+
+	pm_runtime_idle(dev);
+	return 0;
+
+err_subdev:
+	pm_runtime_disable(dev);
+	pm_runtime_set_suspended(dev);
+	v4l2_subdev_cleanup(&s5k5e8->sd);
+err_media:
+	media_entity_cleanup(&s5k5e8->sd.entity);
+err_ctrl:
+	v4l2_ctrl_handler_free(s5k5e8->sd.ctrl_handler);
+err_mutex:
+	mutex_destroy(&s5k5e8->mutex);
+err_power:
+	s5k5e8_power_off(dev);
+	return ret;
+}
+
+static void s5k5e8_remove(struct i2c_client *client)
+{
+	struct v4l2_subdev *sd = i2c_get_clientdata(client);
+	struct s5k5e8 *s5k5e8 = to_s5k5e8(sd);
+
+	v4l2_async_unregister_subdev(sd);
+	v4l2_subdev_cleanup(sd);
+	media_entity_cleanup(&sd->entity);
+	v4l2_ctrl_handler_free(sd->ctrl_handler);
+	mutex_destroy(&s5k5e8->mutex);
+	pm_runtime_disable(&client->dev);
+	if (!pm_runtime_status_suspended(&client->dev))
+		s5k5e8_power_off(&client->dev);
+	pm_runtime_set_suspended(&client->dev);
+}
+
+static DEFINE_RUNTIME_DEV_PM_OPS(s5k5e8_pm_ops, s5k5e8_power_off, s5k5e8_power_on, NULL);
+
+static const struct of_device_id s5k5e8_of_match[] = {
+	{ .compatible = "samsung,s5k5e8" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, s5k5e8_of_match);
+
+static struct i2c_driver s5k5e8_i2c_driver = {
+	.driver = {
+		.name = "s5k5e8",
+		.pm = pm_ptr(&s5k5e8_pm_ops),
+		.of_match_table = s5k5e8_of_match,
+	},
+	.probe = s5k5e8_probe,
+	.remove = s5k5e8_remove,
+};
+
+module_i2c_driver(s5k5e8_i2c_driver);
+
+MODULE_DESCRIPTION("Samsung S5K5E8 5MP sensor driver");
+MODULE_LICENSE("GPL");
-- 
2.47.3

