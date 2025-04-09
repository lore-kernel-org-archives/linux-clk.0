Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C67F4215782
	for <linux-clk@vger.kernel.org>; Wed,  9 Apr 2025 20:37:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744231067; cv=none; b=rxt1A6zaALnWy8OiH5kIYeS5SZZ4R8Q4iBthhTPu1kmodCilZqonasZ+gknpUXKuYmxnPB6LbvY5rjpm/Loe9/kRKDLdDAwSGxij999LRzYSqcHvYUjpyeZsgfD4wAdLQnVvYFtrCHgpkJQypS7md/inq0axjhXLSCeKAL0KJIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744231067; c=relaxed/simple;
	bh=XNPLpibedDTSu7S33NUIPTJnGACKRxAom0wu7hI1PCg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PF7+RbNw7hJRSXpr/MzaabbDg0ETicBcnOAYdZMH7cAKeV2wTOAZ8GlHpLJZa1SYTpidpZEL8d+e9L+vzvoyrH3/1wV8goQQxfanLP9UYPd+V81vcxo8BroXjkQoQgUrSgNg/KhNZfa/J1GGuJtld8UWO0HYzl/5zcut9khqQ+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OTdhWDRD; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OTdhWDRD"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-ac345bd8e13so18110466b.0
        for <linux-clk@vger.kernel.org>; Wed, 09 Apr 2025 13:37:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744231057; x=1744835857; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VzEjXNkLNu9GbyJRrsPm3OGWMuRzZZwPEzkpfwqOZVo=;
        b=OTdhWDRDj8cUyEoBcRy7n2oKEqS8SgsRPrT6JDTUeTBOAMtzCua5No5Q6xxgkkjQ30
         ySFmmvi/cjO70Cux0AUtba6idIXfriM/xq0dEAeX2uJTeaA7ykRJ4PephyEEdtXyuB1p
         SWeee4xi5TdhVVehwgKKaiTo+k3Pc9xccaLl/pS9H+2MhcZLNxCSvreS0WAR9IapoLM8
         3mu1bBm9SlQv0x5/Gwjp6IinFBKpCn0aMxdsrBAZZJyUoAUrd8H/AOf66634XKwo47IM
         XTo/OABATYwfv/mfMFBnarXmOCfk5+HKV9ux4YldAG7mBKTmISLFOgKENqHiShYIXf0O
         8HZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744231057; x=1744835857;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VzEjXNkLNu9GbyJRrsPm3OGWMuRzZZwPEzkpfwqOZVo=;
        b=fNxA4lqOo9hhxyuSOHxN8NMBewUljYmN2nJGMT47Zu2HPvu+xVkNvPh/BvWtjx77ju
         YJRtV+LPinFmG8NubkXsXcqfkfgk9J+3ilUP/nAKNox/8eD5O/ojXiIrVPhTQ/AY9qq/
         +8YisJnOp4ysjJlAkuLiNkv7g/QNggKbxqp/PaW/o1ceMsNHyBQovwtKQu8FNldhK4vy
         2AWV88APtbLgZ3lbZ0DY1Z1cmEfLiz7Fxca03Suxhw/mE9QqkHCRynuoaOmpMYOMY088
         1LrEyc+occNARDJV/q4lwIMPS3w+E1Nfuvm/NM1dAPcZ4MH9WQdU+vizRtSb08ge/rlH
         IQxg==
X-Forwarded-Encrypted: i=1; AJvYcCVSTMvOjDveBvwACfUHJ0wvSmgkHrIvafhCRd5Uynpo45/v2yCNHVSSjSwRGtdY+TjJ0fFqvoMPDOQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxasxy1yLvLgkX01gXEJSkze8fNaKczJy+DLEdHdiBsKeuztjqc
	tpfyC6l7N+aAgOnZpqXQZsY/bFY40Sc6fsK2Ql5QDzg8xikf3iL5G3O0QZOJzkc=
X-Gm-Gg: ASbGncuaJ8KVltLY+5T81vaaiRjfalAAGyhEr3ThLfLXTdmlkpYXHFugiq2t014O3xf
	v3vC/FHXRMdfdbIAZxWkqRjKqPeYP006XinHnGbjKCJ0o5xKlUCqDqGuB3BQXQthMLrCO/lUz/U
	8GvvZvLQCn+4aF4YtJJqZpFUGCXXuGyupN7FLDRQ7FaPFv3fD8weEyzsShdXh/mmmnXbYEbJ/ER
	U3qsnGWKlrofBvaLpli6eSk8DzCvvuKnWd4OGWpmLBjkCWf7cdy6+2Qx2bwV6HwrHa4HJemIGCZ
	8jqdst1Em/Z261djQQtobddm1vOXYIKs/FphtRcZF7mDeQVlcLzFavBPHxXMd2uGlji3xP3tXZi
	P70oToIsdRBWclc/z1ql8V5BIJFbKAt6dITFAiw==
X-Google-Smtp-Source: AGHT+IGzaRFtKWEVWYdD0lu6CSjddwUa5mqgDytfA0O5AR616wmqNvg2sZQEFHwPTrDOE7dwUEpCcw==
X-Received: by 2002:a17:907:3d09:b0:ac7:edc4:3d42 with SMTP id a640c23a62f3a-acabd24cb8amr9037566b.24.1744231056790;
        Wed, 09 Apr 2025 13:37:36 -0700 (PDT)
Received: from puffmais.c.googlers.com (40.162.204.35.bc.googleusercontent.com. [35.204.162.40])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1ccc001sm145850366b.126.2025.04.09.13.37.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 13:37:36 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 09 Apr 2025 21:37:35 +0100
Subject: [PATCH v4 14/32] mfd: sec-i2c: s2dos05/s2mpu05: Use explicit
 regmap config and drop default
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250409-s2mpg10-v4-14-d66d5f39b6bf@linaro.org>
References: <20250409-s2mpg10-v4-0-d66d5f39b6bf@linaro.org>
In-Reply-To: <20250409-s2mpg10-v4-0-d66d5f39b6bf@linaro.org>
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
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2

When support for PMICs without compatibles was removed in
commit f736d2c0caa8 ("mfd: sec: Remove PMICs without compatibles"),
sec_regmap_config effectively became an orphan, because S5M8763X was
the only user left of it before removal, using the default: case of the
switch statement.

When s2dos05 and s2mpu05 support was added in commit bf231e5febcf
("mfd: sec-core: Add support for the Samsung s2dos05") and commit
ed33479b7beb ("mfd: sec: Add support for S2MPU05 PMIC"), they ended up
using that orphaned regmap_config in a non-obvious way due to the
default: case of the device type switch matching statement taking
effect again.

To make things more obvious, and to help the reader of this code while
reasoning about what the intention might be here, and to ensure future
additions to support new devices in this driver don't forget to add a
regmap config, add an explicit regmap config for these two devices, and
completely remove the generic regmap config as it becomes an orphan
again that shouldn't be used by any device.

Note that this commit doesn't fix the issue that s2dos05_regmap_config
ands2mpu05_regmap_config really are incomplete, but I have no
documentation on them.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
v2:
* squash two previously separate patches into this one (Krzysztof)
---
 drivers/mfd/sec-i2c.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/mfd/sec-i2c.c b/drivers/mfd/sec-i2c.c
index a107a9c1e760f90fcb59a9944b74e9a39a0d946c..81f90003eea2a40f2caaebb49fc9494b89370e7f 100644
--- a/drivers/mfd/sec-i2c.c
+++ b/drivers/mfd/sec-i2c.c
@@ -61,7 +61,7 @@ static bool s2mpu02_volatile(struct device *dev, unsigned int reg)
 	}
 }
 
-static const struct regmap_config sec_regmap_config = {
+static const struct regmap_config s2dos05_regmap_config = {
 	.reg_bits = 8,
 	.val_bits = 8,
 };
@@ -120,6 +120,11 @@ static const struct regmap_config s2mpu02_regmap_config = {
 	.cache_type = REGCACHE_FLAT,
 };
 
+static const struct regmap_config s2mpu05_regmap_config = {
+	.reg_bits = 8,
+	.val_bits = 8,
+};
+
 static const struct regmap_config s5m8767_regmap_config = {
 	.reg_bits = 8,
 	.val_bits = 8,
@@ -138,6 +143,9 @@ static int sec_pmic_i2c_probe(struct i2c_client *client)
 	device_type = (unsigned long)of_device_get_match_data(&client->dev);
 
 	switch (device_type) {
+	case S2DOS05:
+		regmap = &s2dos05_regmap_config;
+		break;
 	case S2MPA01:
 		regmap = &s2mpa01_regmap_config;
 		break;
@@ -156,12 +164,16 @@ static int sec_pmic_i2c_probe(struct i2c_client *client)
 	case S2MPU02:
 		regmap = &s2mpu02_regmap_config;
 		break;
+	case S2MPU05:
+		regmap = &s2mpu05_regmap_config;
+		break;
 	case S5M8767X:
 		regmap = &s5m8767_regmap_config;
 		break;
 	default:
-		regmap = &sec_regmap_config;
-		break;
+		return dev_err_probe(&client->dev, -ENODEV,
+				     "Unsupported device type %lu\n",
+				     device_type);
 	}
 
 	regmap_pmic = devm_regmap_init_i2c(client, regmap);

-- 
2.49.0.604.gff1f9ca942-goog

