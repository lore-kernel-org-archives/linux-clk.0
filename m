Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F09F1E51E7
	for <linux-clk@vger.kernel.org>; Sun, 23 Mar 2025 22:39:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742769584; cv=none; b=ULImM4MqZu++h6QFDGDeiM3ukZz/XcIzvXKp/rUwA0oi72Wgu2SM9jz5xHgR46XJku/T1L1ZGcsvFiFQx5RXTSQ95A0FmzbQ9wiW3mzVXpOzbpC8HPPmRT5az4MPlEZ4qMcjTl4SYOkjc0wPKWSDbb3ME4IfoJYU2BAJjys8oKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742769584; c=relaxed/simple;
	bh=CNr8O5YK2JQvgLnYqrPn1/s+31iKPD62ZA/NdspWTmA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UeOXIlS6yGOMI0TMoYLFlrWTLd5ciHYpGZ4YWYTL5xo3MUY9uBkVf6nPHEqGKAX8Qdv5SAoW891J2rDbvIIqOt8MF8ZiMacNL1lrLwQW8NJMGkWoVVQALsgiGmZMHD7DOtLJc6PCbmdcGVECNUG7Mgmp3dAhW8ZW6uX8+82cGuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ytCHdf13; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ytCHdf13"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-ac29fd22163so654478466b.3
        for <linux-clk@vger.kernel.org>; Sun, 23 Mar 2025 15:39:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742769574; x=1743374374; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ma2h8YcPyNzHzzZtNTsrMSq+4WFWkERbNAUqbwhG/XE=;
        b=ytCHdf13wQ6wy9w2OC+acXO/7QQuQ964Lje7iCXaJKOv5ibrRpLS397TcfRJR1kq7u
         PbKza7+Uyomr8s+8ztSGfVZw/Nbf0nhi2lv/16WaVGbdKhKdI6ifWqXtKbo0KsseLr1d
         olViCTOQvQenLyUjQzkPyfTmTlk4F7LjSDoThJoTkHYv0hERy8wl8Fj6AiApIK483BTi
         S9TSqX6zG24ms89OZcRG2kK/gtpI82ihdfAFTpk3QCWwRXBkfxp/X0gX71r0l+LLX144
         YzEGBviX+jBTOmnS/oZL/Z+6kAWCvkTDVryEmVCth79Ks/ALcUNRO7qtZJt4gDgzunDP
         p5eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742769574; x=1743374374;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ma2h8YcPyNzHzzZtNTsrMSq+4WFWkERbNAUqbwhG/XE=;
        b=uh+lJBBNB6GtKDoFS7pvZ0dGg5xkxpcUJZ2s19cBHWs5YyI5CVFQ7wPF1+oYNEB+Mq
         q9y6JpqLsIlr79AQqao0drH0RnERIr3c+u6Vj4rBLmWs4rzYN+V73WlP1fMiSfLCoVyt
         O/SFV/duNUzK80jqfRCTvFqDAmKG/MJgTDBhEQKTbCz2e92ezIfnD8wG2NwcqPBuvcZF
         zDWml5VuSRHlJUiCjKFofjYrjieLA5a5t9qlHIRrcPF/jKBp05u5OmU3pIbdu10Hlbdr
         8mB2PkOFXZw+6j6bTa/mCMroiStN5xuI+V1OW93ixosqgprCmdoDZCa1gNt80ukBFBol
         RzVQ==
X-Forwarded-Encrypted: i=1; AJvYcCU0JIgZCZq9sPfaKPSNdcw0WFdPmhFuRAyl/4eu4fA2DFkPWuX7GpkbAg4QOm9jNCA+yZ/0TVWCBNM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyV/nNX9NYsdElnelwAIATM7GCzl4NFC33KoUKW3crsHHpKMMll
	iY9gg072z43YvdAtPzZU7EQKl2cowZ+TSY10F//rJpCcpcKHO1Ktdqs8flXcfdQUVWJRxh+gPBr
	K5Sw=
X-Gm-Gg: ASbGncuPvfQjXBQkvMTMIlUspYxl/PUoUT9haEt2PlDuqwWRn3y/pieJjuSr/SYAiEb
	z2gi+N5Obu61KgN2NGtx1MzIZQZx019xpJnFCKLfDaWA5LyawMiMwIbhNb92Sy0/DRhOA2O8tjy
	Qw8xvcv+6jES3okhAeYnktHgspR0h642MYJUpLtfWvThSpgTuOu5bcnkqnVGFa0mpGWYmpJQYJC
	WENCQY4TpMtf9Tx+KSCpX4DlVQuD6QPIAQv+N6ab6JBOMREiFL72lzogdYNkhRrJsxrHpUrcy3Z
	pm7aiGsoZmt1P4dzzOC2w1WIVtB1nxnvHWiFXT8uAqLu1LnOa9F2D6hmX3bb3MYp75NYoZc9fKf
	Y/DICzBOvro2iJVh2scaZU0LWy1rD
X-Google-Smtp-Source: AGHT+IEAdjv9xEbMYB+Oz8xJ1E35q2wdeD2HNBvV+6r3g5vXOlzMcwWya0yXpD0Ui6X7vYMMVnjHVw==
X-Received: by 2002:a17:907:d91:b0:ac2:a4c2:604f with SMTP id a640c23a62f3a-ac3f24a7838mr974893166b.46.1742769573704;
        Sun, 23 Mar 2025 15:39:33 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3ef86e44dsm559686666b.31.2025.03.23.15.39.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Mar 2025 15:39:33 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Sun, 23 Mar 2025 22:39:33 +0000
Subject: [PATCH 17/34] mfd: sec: drop generic regmap config
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250323-s2mpg10-v1-17-d08943702707@linaro.org>
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

When support for PMICs without compatibles was removed in
commit f736d2c0caa8 ("mfd: sec: Remove PMICs without compatibles"),
sec_regmap_config effectively became an orphan, because S5M8763X was
the only user left of it before removal, using the default: case of the
switch statement.

Subsequently, the accidental new users have been updated, so
sec_regmap_config is an orphan again, and can and should be removed
from the code. Doing so will also ensure future additions to support
new devices in this driver don't forget to add a regmap config.

Drop this fallback regmap config.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/mfd/sec-i2c.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/mfd/sec-i2c.c b/drivers/mfd/sec-i2c.c
index 3912baa5c2f918b7ad345e2bbbbe4daf2e49ca6d..1bdd6ea36fcd9f56ea5ec1159a87723f4c09a0bd 100644
--- a/drivers/mfd/sec-i2c.c
+++ b/drivers/mfd/sec-i2c.c
@@ -61,11 +61,6 @@ static bool s2mpu02_volatile(struct device *dev, unsigned int reg)
 	}
 }
 
-static const struct regmap_config sec_regmap_config = {
-	.reg_bits = 8,
-	.val_bits = 8,
-};
-
 static const struct regmap_config s2dos05_regmap_config = {
 	.reg_bits = 8,
 	.val_bits = 8,
@@ -196,8 +191,9 @@ static int sec_pmic_i2c_probe(struct i2c_client *client)
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
2.49.0.395.g12beb8f557-goog

