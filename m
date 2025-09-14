Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FC52271454
	for <linux-clk@vger.kernel.org>; Sun, 14 Sep 2025 12:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757853768; cv=none; b=cQfdDlR03qs6qt2s4Y1e2GFAMmBO3tHhrDjECBQHsfhxp8s8dfH+njZuD437ya+/U8V+7mxz+hnq8s89aohOnc03/bwsZpop4KRnHN0pL0fQk1eJzN/iE/0+vD5PZbXRtbXzvG8OpY4IWjmj3vb5n+D08MzdDo7pc4UM+lBZbq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757853768; c=relaxed/simple;
	bh=kyKrbyMlhOJaQK6nZpvShmo5GTsEoyiDjllRpRMHI4Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=A4rFFe0MZ3nuZVTQRlRLafdIWB/UI1ChzAhO69P4tvuVktcyTKb4ZmIH8x41yYE1tLVwEm+M6H96o8gDsoRAtOv1SDob9SYYZgUiLxEvIwZT8QrSZC9xxGMj8BPFJpRSpDVNzHe+4CzIUqKqmPazrDf7UUHsIVJUOVem31uwbQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HMHoUSCu; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HMHoUSCu"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3e92ce28278so654914f8f.2
        for <linux-clk@vger.kernel.org>; Sun, 14 Sep 2025 05:42:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757853765; x=1758458565; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cOU9R2Lnh0tpNOjgfaBNBcfWHtUekf92OIAIJIxr5KA=;
        b=HMHoUSCuy6iJWUw/2/Nm9Pc/RlZEgb/FXtrbfDpCmK3g6xJVHCR4wJ7GnbdIntbzO5
         ufHoDltYZDf0V3VJib6ZRgggXqFrZWNKbU1065jzOwIZGzhwLl0w9e/c9uAf2lKbMVPC
         r7rDRWANoe+v+CxJ/++VZ3KUvu0XXyyqazBCHtBqa1lKzkV/9bEY0Mz0sXwy0t1R3zTZ
         yyWYaXB+Pb84FVwMvHkZaOB1qRyyLg+G0MTIyErG2Oq2WNlyZw4j1wr25+gtfD194BwI
         ZVZUi0fcCdbumoyGp6x3sxESKjR+Kw1nTU2ADg1KAvgsrCk2ptDNcx+gJHvtNnmuqxsL
         mbIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757853765; x=1758458565;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cOU9R2Lnh0tpNOjgfaBNBcfWHtUekf92OIAIJIxr5KA=;
        b=QWJnlGg0jHRNH09JCpJFUOmDYDRGJ7/xHQEpkZDu4p8R6FmZhQwSkHMjUIML2d6yVt
         CzddFk/jBjTW98jumiXLB6YzPSyy8hLgW0skdeU2Zj/i9FZ2h3b2/p8MEiSsurgXy8E6
         sus+usqLk0lANrQTh8equA0i1agAK7KnpHrDzZ+kExB6b5CiN8kbUvHQpNKa7/TB5zrg
         PhS9SLvtNbXQYB16j66zWxkyv/mVk2RYJCO7xFKbCbdB+BeRsesD4oQDOpsoM5+i3Bh7
         u+kz1GiG3WVA1ph3mbDm2yvVgghnOhCA+eFUkG5+nYz8vhacDtZ0CCdyBGqt2ep61ZE3
         pHWA==
X-Forwarded-Encrypted: i=1; AJvYcCWmFADggULBsqLeFmckmoN9qnrB1b72HdzXUcWdbWXAK9JVbVDSt+CPYR02LEmUe/2IQrPX9594gus=@vger.kernel.org
X-Gm-Message-State: AOJu0YxVudznILEnmstotblHn+IgFykSmzNiLDiyWYbsPQDiL/+B+HfT
	M2y1SioNel+lJR+1zRov9ZsjhCgUfKJWr3/udGcxLc+ApkfdUzuGy0SG
X-Gm-Gg: ASbGnct8H7ucxpy8ADslvVjPx9t0h6OJ54NcnoBlc4ErVtmRiUotSLXu1agqgqibZsU
	FfQ9amzaOPv1DBvpG16SLsAJRWeLoORkAn5HYU8zNE3LXCFL8X479JcuKKlfuKJFJT6h5R+2WKo
	1BT/WdvCdsU8GZH9cstMv2qs0IqDCTOrO+AZnhlH8fUtqxSK+7drC3tYtbRvGxQRhoph9lgfaB5
	C5CER1CIELOVOWHkHKVtSPsLIrVH+7BIyr4yMBrvNlH3LWwXx4BGQLp0vNhFjMyElK9aUBGeB5f
	IwQsItYeQNNz9RjYDznV0bhDrtEHdhvDV+SoLDzGUGViL+iq52/tt42S3/sDJKhJ5nxp1U6SAbJ
	4cILyXMhHSKJxtI4OvK9J8o8oYwVAgyzN7w2dFwi30K6z55P166fn7XSxKCo56l4vGv3Pq1ZtDg
	==
X-Google-Smtp-Source: AGHT+IG99f1RlRObwRO3ZVgbqbD8FEXYcOCWgQZx2Y0pKAQ0TG8WDRZi1Xh0wpZoEZCKRmVP1u9ogg==
X-Received: by 2002:a5d:5f50:0:b0:3e9:d0a5:e436 with SMTP id ffacd0b85a97d-3e9d0a622f1mr1712381f8f.23.1757853765242;
        Sun, 14 Sep 2025 05:42:45 -0700 (PDT)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e9511abbccsm3727773f8f.9.2025.09.14.05.42.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Sep 2025 05:42:44 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 6/7] rtc: s5m: add support for S2MPS16 RTC
Date: Sun, 14 Sep 2025 15:42:26 +0300
Message-ID: <20250914124227.2619925-7-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250914124227.2619925-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250914124227.2619925-1-ivo.ivanov.ivanov1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for Samsung's S2MPS16 PMIC RTC, which has pretty much
identical functionality to the existing S2MPS15 support, with the
difference being the ST2 register.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 drivers/rtc/rtc-s5m.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/rtc/rtc-s5m.c b/drivers/rtc/rtc-s5m.c
index a7220b4d0..910248731 100644
--- a/drivers/rtc/rtc-s5m.c
+++ b/drivers/rtc/rtc-s5m.c
@@ -18,6 +18,7 @@
 #include <linux/mfd/samsung/irq.h>
 #include <linux/mfd/samsung/rtc.h>
 #include <linux/mfd/samsung/s2mps14.h>
+#include <linux/mfd/samsung/s2mps16.h>
 
 /*
  * Maximum number of retries for checking changes in UDR field
@@ -254,6 +255,11 @@ static int s5m_check_pending_alarm_interrupt(struct s5m_rtc_info *info,
 		ret = regmap_read(info->regmap, S5M_RTC_STATUS, &val);
 		val &= S5M_ALARM0_STATUS;
 		break;
+	case S2MPS16X:
+		ret = regmap_read(info->s5m87xx->regmap_pmic, S2MPS16_REG_ST2,
+				  &val);
+		val &= S2MPS_ALARM0_STATUS;
+		break;
 	case S2MPG10:
 	case S2MPS15X:
 	case S2MPS14X:
@@ -303,6 +309,7 @@ static int s5m8767_rtc_set_alarm_reg(struct s5m_rtc_info *info)
 		udr_mask |= S5M_RTC_TIME_EN_MASK;
 		break;
 	case S2MPG10:
+	case S2MPS16X:
 	case S2MPS15X:
 	case S2MPS14X:
 	case S2MPS13X:
@@ -354,6 +361,7 @@ static int s5m_rtc_read_time(struct device *dev, struct rtc_time *tm)
 	switch (info->device_type) {
 	case S5M8767X:
 	case S2MPG10:
+	case S2MPS16X:
 	case S2MPS15X:
 	case S2MPS14X:
 	case S2MPS13X:
@@ -378,6 +386,7 @@ static int s5m_rtc_set_time(struct device *dev, struct rtc_time *tm)
 	switch (info->device_type) {
 	case S5M8767X:
 	case S2MPG10:
+	case S2MPS16X:
 	case S2MPS15X:
 	case S2MPS14X:
 	case S2MPS13X:
@@ -416,6 +425,7 @@ static int s5m_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alrm)
 	switch (info->device_type) {
 	case S5M8767X:
 	case S2MPG10:
+	case S2MPS16X:
 	case S2MPS15X:
 	case S2MPS14X:
 	case S2MPS13X:
@@ -455,6 +465,7 @@ static int s5m_rtc_stop_alarm(struct s5m_rtc_info *info)
 	switch (info->device_type) {
 	case S5M8767X:
 	case S2MPG10:
+	case S2MPS16X:
 	case S2MPS15X:
 	case S2MPS14X:
 	case S2MPS13X:
@@ -494,6 +505,7 @@ static int s5m_rtc_start_alarm(struct s5m_rtc_info *info)
 	switch (info->device_type) {
 	case S5M8767X:
 	case S2MPG10:
+	case S2MPS16X:
 	case S2MPS15X:
 	case S2MPS14X:
 	case S2MPS13X:
@@ -532,6 +544,7 @@ static int s5m_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alrm)
 	switch (info->device_type) {
 	case S5M8767X:
 	case S2MPG10:
+	case S2MPS16X:
 	case S2MPS15X:
 	case S2MPS14X:
 	case S2MPS13X:
@@ -613,6 +626,7 @@ static int s5m8767_rtc_init_reg(struct s5m_rtc_info *info)
 		break;
 
 	case S2MPG10:
+	case S2MPS16X:
 	case S2MPS15X:
 	case S2MPS14X:
 	case S2MPS13X:
@@ -680,6 +694,7 @@ static int s5m_rtc_probe(struct platform_device *pdev)
 		struct i2c_client *i2c;
 
 		switch (device_type) {
+		case S2MPS16X:
 		case S2MPS15X:
 			regmap_cfg = &s2mps14_rtc_regmap_config;
 			info->regs = &s2mps15_rtc_regs;
@@ -817,6 +832,7 @@ static const struct platform_device_id s5m_rtc_id[] = {
 	{ "s2mps13-rtc",	S2MPS13X },
 	{ "s2mps14-rtc",	S2MPS14X },
 	{ "s2mps15-rtc",	S2MPS15X },
+	{ "s2mps16-rtc",	S2MPS16X },
 	{ },
 };
 MODULE_DEVICE_TABLE(platform, s5m_rtc_id);
-- 
2.43.0

