Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2351024338F
	for <linux-clk@vger.kernel.org>; Thu,  3 Apr 2025 08:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743670765; cv=none; b=mzOhQ7YqVCvHlqOD0qYjHximHOCCAtQ7HbpxVza6BiHSe4GaHkOPIhG3U5+Hg5Z/iNwLTVTqivsvyRwofKeOIGcX/tBhQTzE+ns8Q8spXNAmLfFWHRzrYSVE11tP3Y12ikgGMTYTlRG5xEtUpY5d86KuJMPsUdKllqUqVrfXqZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743670765; c=relaxed/simple;
	bh=YO4AyBJQaRYJNR3M/qB00qaKZDbH/de1lTqDCM4IY8M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qg43FNN8vG6fq8n5Yc99bHHif1Y3M0E3PhFDGUXsX9HU05w0rKxkg23Hby6PH/Muog/yMenPGlExtf4G5W3HrMqAm41zmcux9QTUORMM20s7cC4kap0tdC8PwBZPSSb0Kghei2uCADe7BIwN+B7eAkhwdfhq9azRiyH7xKK6lAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=X1RH6upS; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="X1RH6upS"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5e673822f76so1167992a12.2
        for <linux-clk@vger.kernel.org>; Thu, 03 Apr 2025 01:59:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743670755; x=1744275555; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6KRr6Qm0gpuwraE+pyT1hJyit2ZkidoO0SCeL3UgR+0=;
        b=X1RH6upSsdAkhrGpjvWV0AGKa7tgjMzroifdz8pTqH6ypmDij0g7wIDQtWMZiEOleN
         iGwfYIBvgmhPs9fdN+NJcRskFUpHJhvpjwuCZFmG+t8m6qSoX7ut5vmuKHsadcArO45r
         +VQr+eSDc15poiMUVuzlqxKD9zielLTF8BaZwG2n/HC1s5PWdwmOw/Kdvc0EW/aJc2Qb
         9Z+OkwRrAJ1ZhVxffceK2m5Kr7bTvsTosDHahGF73rWXiRfyt6AB7wMGZeOT5/cPqt2C
         Kake5TGuBnd7Wg9cn6L8yi9BVCiVxp8Sd+YvsYHNAlmMT+3CbtB1bHfszg5hMfYoDsOt
         ttDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743670755; x=1744275555;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6KRr6Qm0gpuwraE+pyT1hJyit2ZkidoO0SCeL3UgR+0=;
        b=o+nJbIYh881/5RPHs3OUlcfn7rYq+wFOijzSwrs/1TxoYLrK6zW2ivtWJf9c0n7y4i
         brj5z2uZDtWgMNW6B3tmk3sC9GoIsdg+7QsjWwJOSr70Eo0180npW18osU6SKNvOtrZe
         ZDuETDt4hxf4lLNXjU2Yhb7nLePV07eC3zD8UKYslWw7nyU2ecHZGr01MwhaRnORoLKO
         keEfNNTmIEnOPXbd3RvS2yoT2TsJV755r8Tt6/hs8fU7fhDugKqtuuSXPX4B24KSFV7a
         N1fhfjFkP1AfoSZpF7tIG/0TuTLi3bIWoR0ZggBoLCFKz0V+fO3Q53H1jjVHJSS1QSYx
         T5NQ==
X-Forwarded-Encrypted: i=1; AJvYcCU/WuL45sRhxXRJ0poVWXozdF9tx/6rjybO+i5O5h2c0Mp1weAhVtbi0MFPGfujGcwIq9oQcWtGohA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxBd7n+XF34moUPZXSsMWwDCituJVEaDbl84oqM1ymEK/UlpUm8
	5sjUcP4AWn7OQbyswn7tUYVKRO2HjWi+B0alz/KTsz7S0x9e6JOYtAsJS6nbUlk=
X-Gm-Gg: ASbGnctGjqmTXcmbB+VQVRXq0h+ZAje5JazvH+nNekWej84QgGpocc71slYWluAojRm
	waI3KSQCwByTkcMweVDSBa8InMvUkbLqAqhNPFkRQ1M6QZGb98VnxCE+ABPsTsM0iorwXgPIEpA
	aCcslRqCB2e2GVRU7kjD1SitqJX2hjl3HgFqTQGTQMRh25cM4HYrNfxK6uIbWTEDzMlCZF1d2IR
	q61+VKmUdhhOYDjlBfTXVhGbdVVB6BpG7br4UqMYIMgg0ahijcj/6seplhCk7JJ2lfecHFtuGJ2
	oBn1zR+E6uIfaFrwzN0+DKQqUzfgmMGGVdWySekc9hkkK5/wT/Mybfp/5/VLUniw32g6x5BX3uA
	eqVo+R6K2rD31aQp6v/Aviuha1zt+
X-Google-Smtp-Source: AGHT+IHEdGFmSr6KJkifyjVrc0xIRhrTNMltNPXKgSl8ywP+14sm3GrLINtRDwSb2RF2kU14UFLFrw==
X-Received: by 2002:a05:6402:40d3:b0:5e5:437c:1daf with SMTP id 4fb4d7f45d1cf-5edfd156c0amr18247266a12.16.1743670754722;
        Thu, 03 Apr 2025 01:59:14 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f0880a535fsm637614a12.80.2025.04.03.01.59.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 01:59:14 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 03 Apr 2025 09:59:16 +0100
Subject: [PATCH v3 24/32] clk: s2mps11: add support for S2MPG10 PMIC clock
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250403-s2mpg10-v3-24-b542b3505e68@linaro.org>
References: <20250403-s2mpg10-v3-0-b542b3505e68@linaro.org>
In-Reply-To: <20250403-s2mpg10-v3-0-b542b3505e68@linaro.org>
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

Add support for Samsung's S2MPG10 PMIC clock, which is similar to the
existing PMIC clocks supported by this driver.

S2MPG10 has three clock outputs @ 32kHz: AP, peri1 and peri2.

Acked-by: Stephen Boyd <sboyd@kernel.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/clk/clk-s2mps11.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/clk/clk-s2mps11.c b/drivers/clk/clk-s2mps11.c
index 8ddf3a9a53dfd5bb52a05a3e02788a357ea77ad3..92c8d36dafcf8a448873567fb3541a1b90cd9837 100644
--- a/drivers/clk/clk-s2mps11.c
+++ b/drivers/clk/clk-s2mps11.c
@@ -11,6 +11,7 @@
 #include <linux/regmap.h>
 #include <linux/clk-provider.h>
 #include <linux/platform_device.h>
+#include <linux/mfd/samsung/s2mpg10.h>
 #include <linux/mfd/samsung/s2mps11.h>
 #include <linux/mfd/samsung/s2mps13.h>
 #include <linux/mfd/samsung/s2mps14.h>
@@ -140,6 +141,9 @@ static int s2mps11_clk_probe(struct platform_device *pdev)
 	clk_data->num = S2MPS11_CLKS_NUM;
 
 	switch (hwid) {
+	case S2MPG10:
+		s2mps11_reg = S2MPG10_PMIC_RTCBUF;
+		break;
 	case S2MPS11X:
 		s2mps11_reg = S2MPS11_REG_RTC_CTRL;
 		break;
@@ -221,6 +225,7 @@ static void s2mps11_clk_remove(struct platform_device *pdev)
 }
 
 static const struct platform_device_id s2mps11_clk_id[] = {
+	{ "s2mpg10-clk", S2MPG10},
 	{ "s2mps11-clk", S2MPS11X},
 	{ "s2mps13-clk", S2MPS13X},
 	{ "s2mps14-clk", S2MPS14X},
@@ -241,6 +246,9 @@ MODULE_DEVICE_TABLE(platform, s2mps11_clk_id);
  */
 static const struct of_device_id s2mps11_dt_match[] __used = {
 	{
+		.compatible = "samsung,s2mpg10-clk",
+		.data = (void *)S2MPG10,
+	}, {
 		.compatible = "samsung,s2mps11-clk",
 		.data = (void *)S2MPS11X,
 	}, {

-- 
2.49.0.472.ge94155a9ec-goog

