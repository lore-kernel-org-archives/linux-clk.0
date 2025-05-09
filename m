Received: from mail-io1-f47.google.com (mail-io1-f47.google.com [209.85.166.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 798FF2900BF
	for <linux-clk@vger.kernel.org>; Fri,  9 May 2025 11:20:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746789648; cv=none; b=A34DYyFBM2W79y9F3nN80WB+yDtwzuzneIN7oSEYxwxFNxmPHkb/4JwhTfhRuWhhJTTGHsXFwY7usyEaYxTKvIJPC1a1DRChdSkrB2Dr+JFqd+KpiBy1EirHG2zODXqpCr9TjDsyWutViVzsk1Nie1UFbw1LofpRCgLqDDD4xqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746789648; c=relaxed/simple;
	bh=4Tfu7eRA9tB15PfqTMYDgMA8+kbtdVsDE7mPEFdrwJY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Bg0S+fHtXY5Dx43rAZJPvaB8ZoUYgNjxmWmFdes+MXZpt3ZjVtTOeMSdWMzqs0P782NLfkiKkz0PEM+J/UuCSF/2o8ZgFoj1zykfvEDKi/MnuP2D7CI+e+GpY+kl26EnXz5vEpix7SiXzT51CD2FfFzS0k5VoNy/7NExzAPn18o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=irwd+oPe; arc=none smtp.client-ip=209.85.166.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="irwd+oPe"
Received: by mail-io1-f47.google.com with SMTP id ca18e2360f4ac-8647e143f28so167670139f.1
        for <linux-clk@vger.kernel.org>; Fri, 09 May 2025 04:20:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1746789645; x=1747394445; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LypWPdgaVjchuyzEN8+eJ3ZeR9EetshiFPv+jfPk3YE=;
        b=irwd+oPecNryiL97GTacGHd+u+0HYrsgl362NhHff3EJpQLwbNNy8MfYQXJzlCvnDM
         dVf/4aHwGyURAPZiRkm6B4qqI4sfmovQWnK5nFOYoLB6KJJg1DGUGy/+Dy6cfEu0Sqi7
         RnE8KSX0nF6B4VWBaP+F+P/JPLtvWVOXPYwJZjf+obOFoZsR2DCZiCtmc4UCf47CgzEL
         OKZQIlArkuIsO86i3vMg3xbR46deIcrmG6gUwnCH6h/p0ujGaymhd+kNVMEyB1AZ4Jtj
         sTActueM88/2kSv98E28VIp5S+Kk71k7pQQEd5inCF1/Bx+HYgSfj9jVFm5mdyh+9ofw
         l3KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746789645; x=1747394445;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LypWPdgaVjchuyzEN8+eJ3ZeR9EetshiFPv+jfPk3YE=;
        b=h+KS5tvOuOnCA6cwXpnNV6WWJYJX7b1Si55C8sxtBOSof7tjvHOKyDjsOCxQgkuIZ0
         e/tXa2DZZI9u+CiiJqMCQxwASG5HnJxqdCaNyLjOxc1bFbqmclGuUnsCwVozqS/75SaO
         6/+q1nJLJz7qfqkL6tH2Z0XyvQiO2bbPxl3A61x828vTnik1VWKsYjvp50Ta/PZkvKSM
         aqra9cH0V0qw9ler0LPI+2DRIjKbLX2wtfu41rlconpBZueH6oA9+YO3NdSpm2GVgEcp
         Pe8DCeg16gCh6fZaPSz0Lyn9D1Z+nSb+D8l0ijesJMBFk00X18hoKPQ5xePlH74jhLzj
         OBHw==
X-Forwarded-Encrypted: i=1; AJvYcCVe3DALRtpLTRSc4Douv1ss1nRv1uj6gi0d3/0HtY+Jl0AWE4P/iqawIDE1JlVHs+C/xQxM7gq72lw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwIjyPVOeEjXZsjb1yWhdMYuvhrsKpVvovsfFuL0RTjUgylzpKd
	YHGEHKIw/ZlunWBxomkeCI60mIZqxj55hGhhQPHHpxP34hIlg4iY9pTneuBwa6o=
X-Gm-Gg: ASbGncsC+8Neu05xA5VG5ED8isU3wvkOHKhvCDmQtvozrVSM9BgVwGWx+32JB1WZnM+
	cen7FiKPdf+chJzBcvrNbEpbBGUeo7qATKwz1G9bUNVR7zwtlglL5T4OuSHuCYSFYFeBeQn7Z4N
	3aI0NSjq82C6tcmrTfn6IMHcl7xjvHBoEWl2Yukcy9MBQV0L/TB6a7m1Mk4+k4P7cm8W05+lv02
	FsVBBle3sG8ZnKmQ0u6fiB3fQ6ncWasf+bjcDVobL8lkwA/5lhFIgRJGUr4y0gmniXrfkez4bKn
	NtGmmWfiS2dh1WJ0/0Jo2JMZ3jX5C3xUUsJIcipenIwXWiCzDTGz+/FFY18xY6zCU651KgxJ9lV
	Bix+vaflxFmMrCA==
X-Google-Smtp-Source: AGHT+IEwX5C7RFwHQhMzAQSgpNJvAZGgDS9jyrcBkOYqMAOvEfsJfi0NZkXxGG1Ik7wGvFzbALhLCw==
X-Received: by 2002:a05:6e02:218a:b0:3d3:d00c:3602 with SMTP id e9e14a558f8ab-3da7e1e71abmr33874005ab.10.1746789645531;
        Fri, 09 May 2025 04:20:45 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3da7e10549fsm5136325ab.23.2025.05.09.04.20.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 04:20:44 -0700 (PDT)
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
Subject: [PATCH v8 5/6] reset: spacemit: define three more CCUs
Date: Fri,  9 May 2025 06:20:30 -0500
Message-ID: <20250509112032.2980811-6-elder@riscstar.com>
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

Three more CCUs on the SpacemiT K1 SoC implement only resets, not clocks.
Define these resets so they can be used.

Signed-off-by: Alex Elder <elder@riscstar.com>
---
 drivers/clk/spacemit/ccu-k1.c    | 24 +++++++++++++++
 drivers/reset/reset-spacemit.c   | 51 ++++++++++++++++++++++++++++++++
 include/soc/spacemit/k1-syscon.h | 30 +++++++++++++++++++
 3 files changed, 105 insertions(+)

diff --git a/drivers/clk/spacemit/ccu-k1.c b/drivers/clk/spacemit/ccu-k1.c
index 551df9d076859..5db7abbfeb9ea 100644
--- a/drivers/clk/spacemit/ccu-k1.c
+++ b/drivers/clk/spacemit/ccu-k1.c
@@ -940,6 +940,18 @@ static const struct spacemit_ccu_data k1_ccu_apmu_data = {
 	.num		= ARRAY_SIZE(k1_ccu_apmu_hws),
 };
 
+static const struct spacemit_ccu_data k1_ccu_rcpu_data = {
+	.reset_name	= "rcpu-reset",
+};
+
+static const struct spacemit_ccu_data k1_ccu_rcpu2_data = {
+	.reset_name	= "rcpu2-reset",
+};
+
+static const struct spacemit_ccu_data k1_ccu_apbc2_data = {
+	.reset_name	= "apbc2-reset",
+};
+
 static int spacemit_ccu_register(struct device *dev,
 				 struct regmap *regmap,
 				 struct regmap *lock_regmap,
@@ -1107,6 +1119,18 @@ static const struct of_device_id of_k1_ccu_match[] = {
 		.compatible	= "spacemit,k1-syscon-apmu",
 		.data		= &k1_ccu_apmu_data,
 	},
+	{
+		.compatible	= "spacemit,k1-syscon-rcpu",
+		.data		= &k1_ccu_rcpu_data,
+	},
+	{
+		.compatible	= "spacemit,k1-syscon-rcpu2",
+		.data		= &k1_ccu_rcpu2_data,
+	},
+	{
+		.compatible	= "spacemit,k1-syscon-apbc2",
+		.data		= &k1_ccu_apbc2_data,
+	},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, of_k1_ccu_match);
diff --git a/drivers/reset/reset-spacemit.c b/drivers/reset/reset-spacemit.c
index eff67bdc8adba..4137f4f8352d3 100644
--- a/drivers/reset/reset-spacemit.c
+++ b/drivers/reset/reset-spacemit.c
@@ -158,6 +158,54 @@ static const struct ccu_reset_controller_data k1_apmu_reset_data = {
 	.count		= ARRAY_SIZE(k1_apmu_resets),
 };
 
+static const struct ccu_reset_data k1_rcpu_resets[] = {
+	[RESET_RCPU_SSP0]	= RESET_DATA(RCPU_SSP0_CLK_RST,	0, BIT(0)),
+	[RESET_RCPU_I2C0]	= RESET_DATA(RCPU_I2C0_CLK_RST,	0, BIT(0)),
+	[RESET_RCPU_UART1]	= RESET_DATA(RCPU_UART1_CLK_RST, 0, BIT(0)),
+	[RESET_RCPU_IR]		= RESET_DATA(RCPU_CAN_CLK_RST,	0, BIT(0)),
+	[RESET_RCPU_CAN]	= RESET_DATA(RCPU_IR_CLK_RST,	0, BIT(0)),
+	[RESET_RCPU_UART0]	= RESET_DATA(RCPU_UART0_CLK_RST, 0, BIT(0)),
+	[RESET_RCPU_HDMI_AUDIO]	= RESET_DATA(AUDIO_HDMI_CLK_CTRL, 0, BIT(0)),
+};
+
+static const struct ccu_reset_controller_data k1_rcpu_reset_data = {
+	.reset_data	= k1_rcpu_resets,
+	.count		= ARRAY_SIZE(k1_rcpu_resets),
+};
+
+static const struct ccu_reset_data k1_rcpu2_resets[] = {
+	[RESET_RCPU2_PWM0]	= RESET_DATA(RCPU2_PWM9_CLK_RST, BIT(2), BIT(0)),
+	[RESET_RCPU2_PWM1]	= RESET_DATA(RCPU2_PWM9_CLK_RST, BIT(2), BIT(0)),
+	[RESET_RCPU2_PWM2]	= RESET_DATA(RCPU2_PWM9_CLK_RST, BIT(2), BIT(0)),
+	[RESET_RCPU2_PWM3]	= RESET_DATA(RCPU2_PWM9_CLK_RST, BIT(2), BIT(0)),
+	[RESET_RCPU2_PWM4]	= RESET_DATA(RCPU2_PWM9_CLK_RST, BIT(2), BIT(0)),
+	[RESET_RCPU2_PWM5]	= RESET_DATA(RCPU2_PWM9_CLK_RST, BIT(2), BIT(0)),
+	[RESET_RCPU2_PWM6]	= RESET_DATA(RCPU2_PWM9_CLK_RST, BIT(2), BIT(0)),
+	[RESET_RCPU2_PWM7]	= RESET_DATA(RCPU2_PWM9_CLK_RST, BIT(2), BIT(0)),
+	[RESET_RCPU2_PWM8]	= RESET_DATA(RCPU2_PWM9_CLK_RST, BIT(2), BIT(0)),
+	[RESET_RCPU2_PWM9]	= RESET_DATA(RCPU2_PWM9_CLK_RST, BIT(2), BIT(0)),
+};
+
+static const struct ccu_reset_controller_data k1_rcpu2_reset_data = {
+	.reset_data	= k1_rcpu2_resets,
+	.count		= ARRAY_SIZE(k1_rcpu2_resets),
+};
+
+static const struct ccu_reset_data k1_apbc2_resets[] = {
+	[RESET_APBC2_UART1]	= RESET_DATA(APBC2_UART1_CLK_RST, BIT(2), 0),
+	[RESET_APBC2_SSP2]	= RESET_DATA(APBC2_SSP2_CLK_RST, BIT(2), 0),
+	[RESET_APBC2_TWSI3]	= RESET_DATA(APBC2_TWSI3_CLK_RST, BIT(2), 0),
+	[RESET_APBC2_RTC]	= RESET_DATA(APBC2_RTC_CLK_RST,	BIT(2), 0),
+	[RESET_APBC2_TIMERS0]	= RESET_DATA(APBC2_TIMERS0_CLK_RST, BIT(2), 0),
+	[RESET_APBC2_KPC]	= RESET_DATA(APBC2_KPC_CLK_RST,	BIT(2), 0),
+	[RESET_APBC2_GPIO]	= RESET_DATA(APBC2_GPIO_CLK_RST, BIT(2), 0),
+};
+
+static const struct ccu_reset_controller_data k1_apbc2_reset_data = {
+	.reset_data	= k1_apbc2_resets,
+	.count		= ARRAY_SIZE(k1_apbc2_resets),
+};
+
 static int spacemit_reset_update(struct reset_controller_dev *rcdev,
 				 unsigned long id, bool assert)
 {
@@ -231,6 +279,9 @@ static const struct auxiliary_device_id spacemit_reset_ids[] = {
 	K1_AUX_DEV_ID(mpmu),
 	K1_AUX_DEV_ID(apbc),
 	K1_AUX_DEV_ID(apmu),
+	K1_AUX_DEV_ID(rcpu),
+	K1_AUX_DEV_ID(rcpu2),
+	K1_AUX_DEV_ID(apbc2),
 	{ },
 };
 MODULE_DEVICE_TABLE(auxiliary, spacemit_reset_ids);
diff --git a/include/soc/spacemit/k1-syscon.h b/include/soc/spacemit/k1-syscon.h
index 53eff7691f33d..c59bd7a38e5b4 100644
--- a/include/soc/spacemit/k1-syscon.h
+++ b/include/soc/spacemit/k1-syscon.h
@@ -127,4 +127,34 @@ to_spacemit_ccu_adev(struct auxiliary_device *adev)
 #define APMU_EMAC0_CLK_RES_CTRL		0x3e4
 #define APMU_EMAC1_CLK_RES_CTRL		0x3ec
 
+/* RCPU register offsets */
+#define RCPU_SSP0_CLK_RST		0x0028
+#define RCPU_I2C0_CLK_RST		0x0030
+#define RCPU_UART1_CLK_RST		0x003c
+#define RCPU_CAN_CLK_RST		0x0048
+#define RCPU_IR_CLK_RST			0x004c
+#define RCPU_UART0_CLK_RST		0x00d8
+#define AUDIO_HDMI_CLK_CTRL		0x2044
+
+/* RCPU2 register offsets */
+#define RCPU2_PWM0_CLK_RST		0x0000
+#define RCPU2_PWM1_CLK_RST		0x0004
+#define RCPU2_PWM2_CLK_RST		0x0008
+#define RCPU2_PWM3_CLK_RST		0x000c
+#define RCPU2_PWM4_CLK_RST		0x0010
+#define RCPU2_PWM5_CLK_RST		0x0014
+#define RCPU2_PWM6_CLK_RST		0x0018
+#define RCPU2_PWM7_CLK_RST		0x001c
+#define RCPU2_PWM8_CLK_RST		0x0020
+#define RCPU2_PWM9_CLK_RST		0x0024
+
+/* APBC2 register offsets */
+#define APBC2_UART1_CLK_RST		0x0000
+#define APBC2_SSP2_CLK_RST		0x0004
+#define APBC2_TWSI3_CLK_RST		0x0008
+#define APBC2_RTC_CLK_RST		0x000c
+#define APBC2_TIMERS0_CLK_RST		0x0010
+#define APBC2_KPC_CLK_RST		0x0014
+#define APBC2_GPIO_CLK_RST		0x001c
+
 #endif /* __SOC_K1_SYSCON_H__ */
-- 
2.45.2

