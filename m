Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FE2321D3DF
	for <linux-clk@vger.kernel.org>; Fri, 28 Mar 2025 13:31:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743168686; cv=none; b=e8gzOXGJIpA/ouDZQyn6N59t+tazvYQ1yu7E8HIbyh5yn8Cvyv5K/J0Lqdl+kF+1UV5K60huAB4/ajNTPjYE5EitJVLjHb8BBa4CF4aBY2liOK47KeadgxvLJLrJKTgj1y8RVk2KglfzDhrQYTyXDqJyQoDSqXBMIF6OD84q4bg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743168686; c=relaxed/simple;
	bh=GESUUSr32C5v+JmyTkWMyaf4NO/174Vzhegyb1L9aRw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kXbB5E98BIixFFMpuZKRvf5F0YgqJri+I5hxLt2hHNjAcRYGSJs8DJI0DPU89fYAVM06FOH7WwQGK0CztYF4SyhGpcX7sfz5Q/w7MFH3i827ALubL+YoDQSBoudIWrb2gU/yNLIfK7S7EbS0q82Q31Wo4rVdkh196kaB9cCt1PE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=izLlhMIt; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="izLlhMIt"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5edc07c777eso1349768a12.3
        for <linux-clk@vger.kernel.org>; Fri, 28 Mar 2025 06:31:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743168671; x=1743773471; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PSEpA1j4+zmEauzOiOoF/mVKhD6CkjV25eyM5OWecNk=;
        b=izLlhMItkSCPPn04H12db6y4JXy1vE2dAPqkbZ4qaokCUOCDBrppNeqbMlgmOkqevT
         XlxPCKzrQx2BDyIQtCaNDAGlbEe/HBuMs2mdhZxjtVlqNPR25hYoKb/mkvxKOLHhINKG
         FSAbOJEMLhm8AM5Y9miRdPIwIx5cFBYy820uhg6hdf0bKv8mx0jrIcPoEriiIcXtXOaU
         iSXZWuWpE1M6XYYl2rXGB/I5AbNE3dFVTtYqdQBnAun87IntOCpMbVOXFzlKFnU1Xj+h
         e0YNOT31Qu8Nr97EfXcOa9pdxZ7C/CpdD6i63I+0O4RPojZbqpNLYqTa46L6AX0BGB60
         Pbog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743168671; x=1743773471;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PSEpA1j4+zmEauzOiOoF/mVKhD6CkjV25eyM5OWecNk=;
        b=B9lfmclH/X7P8saMUyn7MhFtqIt70BfvhyR4xu4JeC7h6+Ml2gDi1peVx2t9xRPtFu
         PD8WlCUqGlEWLAasS3C8Se3Pa/XllCxCHxQyyJW1fEgXYNxs5oncGNC52I39rHbkHmKM
         RYyWFdIAzMhESdZyDkjaUJrjd0Sap8Q0aiRMwi7LPcOCPJka/SGYmdMq5uoUHh4T6Nl0
         sge72R2H8PJsijF3xJBme80G3TDUf5uHHFCZw4IOjfPY54krE48EqhOfvAwosQCsLczI
         kOnexy3MfdSPvdnqHGuVH+3+UJrJt2Ng2Xoa+GXQ54gDVEESD4cbayWup7Is9whd6tcJ
         /cHw==
X-Forwarded-Encrypted: i=1; AJvYcCV1XN3iVYXPiudQ0faiP6KynllEoRgHAgV/WqqczYmUrgQ8XI9FBTwzE318n+90RjpbR5a+FOtS7PE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwInCNTkMLPllNBBXRNhZoLOX9d4AJu96yxn3z+E96Rly8m9u0W
	8UY3mTOEbyCVHRkFWT7A1qE5s1WSROaSIey3Iiv0HLydgsGi4BxXwYbAqTvGlB8=
X-Gm-Gg: ASbGncsfjkQemOvtRBzePMA1bd5+WVI5iF5HtH3f9gTEr3hU/Rzq/xlJOnUm/sJFR2c
	Q2qGIgaSBH1Mze/xrDpaRxd94IG+HbSGLfX2qILHffpS1ItQHka2dT53MqvUHpUBHtVLMmBWYWH
	Tdd7Vkwx414km4pSVmsqn8pBh4XxZNzrBi4p/3vYJdjlhTjYx6LJSxDcX6cKFw3Rxydg0hzkHu9
	32yHK5RrDZ/9DcAeGYLZV+PwMTglpHaBej3uDLag64lqxv+dH1jnD/U6U+uHX5pKeCMGZhwzZ+y
	qAIE0TYfgI2IjfrWKsQ70gmcMvt/nCkoWWhUH5woX9JAGffYV8o7R/0X5Z8eN03ClLPVZ5BfC0X
	3swfQhu0m3ZsbCV+cW5y/z+n07qls
X-Google-Smtp-Source: AGHT+IFSs1uiz+MYEgU+bUhAfh3+GZqO0SVgrjZOqgHDorj3bQXBjGPLvsOv5IgyeRPZA7NSU+kGow==
X-Received: by 2002:a05:6402:268c:b0:5e5:c3bc:f4e0 with SMTP id 4fb4d7f45d1cf-5ed8f80a51amr7531556a12.29.1743168670656;
        Fri, 28 Mar 2025 06:31:10 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5edc17e01f7sm1355284a12.79.2025.03.28.06.31.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 06:31:10 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 28 Mar 2025 13:29:17 +0000
Subject: [PATCH v2 31/32] rtc: s5m: replace open-coded read/modify/write
 registers with regmap helpers
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250328-s2mpg10-v2-31-b54dee33fb6b@linaro.org>
References: <20250328-s2mpg10-v2-0-b54dee33fb6b@linaro.org>
In-Reply-To: <20250328-s2mpg10-v2-0-b54dee33fb6b@linaro.org>
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

This makes the code easier to read, and avoids extra work in case the
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
2.49.0.472.ge94155a9ec-goog

