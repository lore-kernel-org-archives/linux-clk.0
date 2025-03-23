Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ECCC1E8329
	for <linux-clk@vger.kernel.org>; Sun, 23 Mar 2025 22:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742769592; cv=none; b=Whlwy9ni5PA7W/Jn5CkVYfcMvh8/1Yi8BrVdnwrAUaa5UIAymkAdUYBbfzXkYmMf9QydkLJt20Qz57w/01KuawxVQe5ZhRI/b0yJpGb+48MbFBMksyaLFjAbash5NyIxsp8g60yykk6jQRH1H3MKcWbvnAJrV3vE3mH7CUtMMzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742769592; c=relaxed/simple;
	bh=H9PnjiGdaPmfWukTzjrtFxLU+96UeMWEkuYWR2ErP7k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gBAHqkpyvwt94hXaSE7E8LspzRJ4+7/6uar6fzZNO8aCkh/zkDgwCSu17Xy9JDk+zsSIcdt31gMZE6ozOEt5Y1g2+sZIycBfyPmX/1p+rhpNGRmTFjOJFrGIv7yUhk+taOr/+olFepVDbQg5DRZBz8fa34RBZHMVkdu1AC3V+WI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sg/BoZUo; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sg/BoZUo"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-ab7430e27b2so806343066b.3
        for <linux-clk@vger.kernel.org>; Sun, 23 Mar 2025 15:39:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742769583; x=1743374383; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+9zuZxWNg3rbrJTairaqhANzxAqu72T6zzPhxq7UOmE=;
        b=sg/BoZUoO1vvhUz/iyXWR/MXNTeBGwofC6UNpxJQrUNNiw4KK7eE2KsY4y7RmEDrgc
         CJDWqICOsVStbXFUlcoIpWqaRqmNNCv3c12rcDsZ/VNGnK6VtAlsbYR3wNoU3zuaC46C
         fwz7FHf6mwR9L+LRktEj+XD8Vfg6qal8O9QomUJ2Tt536IPiTrdB1ffkNYE9bqYyKMlc
         tnWoNjR9gAQhM8yrQ9ooN+jhbYkfFc/NTsvVLHYDekiMBbo3Lw/btgm3ML3LS3PXwz/t
         kOBqxBnV5cVs/bHhMlwVsJk84DAfki4LbUB/W/IVthCI0pHuv19sX6FD39us8LONlxYz
         8GjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742769583; x=1743374383;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+9zuZxWNg3rbrJTairaqhANzxAqu72T6zzPhxq7UOmE=;
        b=ITkvsUhqecEOxwJ912vwZtvFiykc58Y/978/qJoRYsXPTLy+Xv06wzhrr/nEMXK01l
         IPEX4PULYZ2z1CTQmY8HDezkHK2tg5rb6Bi4uxFlRgGJIZeVJDl9Axw8ovWYjFGctv8A
         AJl6BguaMFDy1YdyLNDKn5Is6h/5SqklpXRDaqZLZwCLXxhiPrTBsBS0rJJb+/et0Uer
         DmzU9dt0BsHUj2fscLLVAQ8ChuxEVzioJ/AaNCv7C6UiXnn+r2Ak+ZMS7y4ca+UMZTXB
         ARuUdL9QKAEOGSNV0b0zTBo/oFgI2UKS6MGRWAOtIFbyZ8On/4QTubgU7fEJWDMyiD0Q
         p6aA==
X-Forwarded-Encrypted: i=1; AJvYcCXjAuwaQaJIuF+lZq5eDhUWqF9akdbzGsV8UpM9AVFV3anYcuSIyWewDEYfcWdejDV4t+/xRd0E4Hc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzRbYRY5UQU/EpAjBzYlrPSNuGGSNN+oJKB2p/OT3BS6UGU5bkz
	Bj1SEuhg4QrEuFqPGpeEBlbnLEfRv09uQaOGaVYLSfozpPMEEGcf1QxXxMHWMjM=
X-Gm-Gg: ASbGncuoAO/hcAoOiW9ElSsjNNLm1ricE8/F4t2T7BIqMxwp9qUv8psiwQ15hJ79fNb
	GamMcxBzcOk+NLiydjWde5/HTcbYXWmkPbCipFUxc7RW/PPC9BTnXWq9gYs+8mR0ZdT0bpioIxq
	NHxe0QIPuVXel0OHXkZKWBv63chddOB39weHMhci5JLAihWz/FZyx3VRVC+GyeBvbjObbBWrI4I
	WNtnKbjqPsr3QoWy6DUT++DdB+HKqVk1LQRTEpxYICrjCZqR2y32MHrMPLmXXbP5ACLZ6q8XHiF
	rQdED8GHA2yV+Jz2F7eK0HlK1ZtkBWzWDfI7fJlyEBU8y7rpf2/RMYdaUghjyb7Lhz7exzt93Jk
	oBRm3Yd7qrNKwAraRmMj4FqRZZgi9+6pkLQVDIzw=
X-Google-Smtp-Source: AGHT+IFs4xHKZtefwGlVOQ1hTfmO2hUQ+8e+EVgI4+xRTbfzM8/S+AZdGH6X4/sL+XMu2751zvkyBQ==
X-Received: by 2002:a17:907:7f0d:b0:ac3:3cfc:a59c with SMTP id a640c23a62f3a-ac3f20b9b10mr1154328366b.11.1742769583314;
        Sun, 23 Mar 2025 15:39:43 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3ef86e44dsm559686666b.31.2025.03.23.15.39.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Mar 2025 15:39:42 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Sun, 23 Mar 2025 22:39:49 +0000
Subject: [PATCH 33/34] rtc: s5m: replace open-coded read/modify/write
 registers with regmap helpers
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250323-s2mpg10-v1-33-d08943702707@linaro.org>
References: <20250323-s2mpg10-v1-0-d08943702707@linaro.org>
In-Reply-To: <20250323-s2mpg10-v1-0-d08943702707@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2

Instead of the open-coded read/modify/write sequence, we can simply use
the regmap helpers regmap_set_bits() and regmap_update_bits()
respectively.

This makes the code easier to read, and avoids extra works in case the
underlying bus supports updating bits via
struct regmap_bus::reg_update_bits() directly (which is the case for
S2MPG10 on gs101 where this driver communicates via ACPM).

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/rtc/rtc-s5m.c | 28 +++++++---------------------
 1 file changed, 7 insertions(+), 21 deletions(-)

diff --git a/drivers/rtc/rtc-s5m.c b/drivers/rtc/rtc-s5m.c
index fb65a8e439d72d9070751c00f5826a403ac0b416..2ad01fb3bc72fe9259a8307584c9cf3a839bd492 100644
--- a/drivers/rtc/rtc-s5m.c
+++ b/drivers/rtc/rtc-s5m.c
@@ -279,17 +279,9 @@ static int s5m_check_pending_alarm_interrupt(struct s5m_rtc_info *info,
 static int s5m8767_rtc_set_time_reg(struct s5m_rtc_info *info)
 {
 	int ret;
-	unsigned int data;
-
-	ret = regmap_read(info->regmap, info->regs->udr_update, &data);
-	if (ret < 0) {
-		dev_err(info->dev, "failed to read update reg(%d)\n", ret);
-		return ret;
-	}
-
-	data |= info->regs->write_time_udr_mask;
 
-	ret = regmap_write(info->regmap, info->regs->udr_update, data);
+	ret = regmap_set_bits(info->regmap, info->regs->udr_update,
+			      info->regs->write_time_udr_mask);
 	if (ret < 0) {
 		dev_err(info->dev, "failed to write update reg(%d)\n", ret);
 		return ret;
@@ -303,19 +295,12 @@ static int s5m8767_rtc_set_time_reg(struct s5m_rtc_info *info)
 static int s5m8767_rtc_set_alarm_reg(struct s5m_rtc_info *info)
 {
 	int ret;
-	unsigned int data;
-
-	ret = regmap_read(info->regmap, info->regs->udr_update, &data);
-	if (ret < 0) {
-		dev_err(info->dev, "%s: fail to read update reg(%d)\n",
-			__func__, ret);
-		return ret;
-	}
+	unsigned int udr_mask;
 
-	data |= info->regs->write_alarm_udr_mask;
+	udr_mask = info->regs->write_alarm_udr_mask;
 	switch (info->device_type) {
 	case S5M8767X:
-		data &= ~S5M_RTC_TIME_EN_MASK;
+		udr_mask |= S5M_RTC_TIME_EN_MASK;
 		break;
 	case S2MPG10:
 	case S2MPS15X:
@@ -327,7 +312,8 @@ static int s5m8767_rtc_set_alarm_reg(struct s5m_rtc_info *info)
 		return -EINVAL;
 	}
 
-	ret = regmap_write(info->regmap, info->regs->udr_update, data);
+	ret = regmap_update_bits(info->regmap, info->regs->udr_update,
+				 udr_mask, info->regs->write_alarm_udr_mask);
 	if (ret < 0) {
 		dev_err(info->dev, "%s: fail to write update reg(%d)\n",
 			__func__, ret);

-- 
2.49.0.395.g12beb8f557-goog

