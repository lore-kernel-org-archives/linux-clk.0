Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13E311DEFE8
	for <linux-clk@vger.kernel.org>; Sun, 23 Mar 2025 22:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742769579; cv=none; b=Rp1BQFRXEXKKjCleJGB2o+QgKSFMmPRRt+b+A0WWC1Kyadq+kRAwjIgDh/N3aAzjM6iuCpcyhKKMiD9W3TUfDdN36u9+F6Pc3Q77CannYbDR+KWyK7aGzxt7coYaPw+QSVzgGOPajHup579awkI36ecoBamGxzXOPWXhPHeqOhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742769579; c=relaxed/simple;
	bh=mYouhjAoSbLSn92zFo7mSaGFj9cCPHa2OyFJJEwMdw8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=n9ECD56F4PdeVBCI5yZGOUp12miIQXMjpV1OgOxP0aArHO+i9eYMXpFhioR5YaU8T9cfDGpoHkiu9hxj1qj4wzE6Jvol+eXgcbpGyTUfhv8v/IRt+Jgo8GoqCVWEUgUUq7bWZiT3o4XiwZAN7T5DmCn2qsGvu8j4VQq6SuJhojo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QcQaQ/4W; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QcQaQ/4W"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-ac2a9a74d9cso776698866b.1
        for <linux-clk@vger.kernel.org>; Sun, 23 Mar 2025 15:39:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742769572; x=1743374372; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vmds4rrDLrfKJmwR2Z+ZSZKx1qRT0gZntXalkJpQH7Y=;
        b=QcQaQ/4WkIkk+hlhTXnQ2KRnW3VAX2TNN6AhASfAlkd9xfsucnkhv9KDGQ5Cp2obuC
         R88XvwFmR2f+zbcMhEgSngCGoWb9ruRURZT7BYQjfxRvU34FrGP3cyXvQEPbMYBp74xh
         +U+OaLjjzBiYT2br160bRnAcczHdwQCDTzIJqLozpiOXEmjPB00zaL1N1AVoEJTeZ99Y
         Eig4wBR9U7BLcSkNt0hOSqXH04CtIJNHMUBIpsjR+AUcGB4dDdvlYq+K8vRAbGhL+nm7
         VSz1PhJFLEPaWCDQLwG0vy0Q7Zdsa6XmkmhZtWxV6RBqZEZVncX1iaubDm757rEepJeV
         WRkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742769572; x=1743374372;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vmds4rrDLrfKJmwR2Z+ZSZKx1qRT0gZntXalkJpQH7Y=;
        b=Z4Wr99z6LrK0AwBVBspdcKXnKjQWZF7csVhJgUebJauTjQem/Q0sFHmf1S2Jm5v9Ft
         jxo6/o9dyub9604BcAPxWTye+xd2WLOzwkHauj11ojAoos0N8t6KeeeHRBHjIgmZ1gm+
         LeQDsGs1+fmsoZeKuht2kyqRYVcQZ0yK+YgEPh5uv9AlfJT4I6pHAfKCj6jWhh+zd+60
         JQwuXcZHlH/SWOmKVVmUFGiDX+pm8f+GreuOIDNC+efXNuJWFqz3PEOlCgrnXWSNIYuD
         9YnLyI4iag8FEB+CmB2M3ODmAuKLfqvezd30BaFXBfVl0oTUaGDpsYoK0/swYPBI2UNz
         M9Qw==
X-Forwarded-Encrypted: i=1; AJvYcCVixR8J7haHsyUVrxBny0x68xRagysZgtM7w091wBKdklsgm3jIGuhHN+qolGLiVI4IbSEPEkgTj+I=@vger.kernel.org
X-Gm-Message-State: AOJu0YwJ9lNT4fTsifUGR7MWNiGJt8TQmHWAuWPskDGJ1EwHPtIYt/te
	eZ/W8i6NmbMW8yns5L62FyH7OW1r2jZHzcd+02kJZqbZ/c8+UTUR/MIw14tbi/g=
X-Gm-Gg: ASbGncubxaVhGx/hNgzRRumZ28eiVNlJZc5DOaI38BON0CbfGUXvi53BFYZSsZp+e53
	vntJpcKIOqp1QM/YlACW9bGRAXei7iz0tlZaQrrOHOpvv/6RNEOlq0MV9kKmixXphepGMmTHIxl
	YwAo5Y296kk2NPzWfMyUd3UbVJycsURQMrahvTC/aJvxRNpUhv0fcxoTfUAA+enthVPjlS1HGE4
	DB0px7zsEr66UUxwsQqb6hTvq6KBYjkX5efgnRUjHacYRaB/rdCXcXUvCxiBpAWmupq+/8HJa1j
	xOzJt//q0jseTiCza8dx9PVgPHZDIS8Phse/fomkNSIr9LWxRnopJQbUCz6Q7FiAFceJyoPgUn3
	UBFj1/Ljo0ZQLSDhD1/QKm7SPj28B
X-Google-Smtp-Source: AGHT+IEN5dOxnNTTla9a5uamRe8PZKZsb3egHapeEJMQ/eCTIADM/0J2Xb8LBoxvBHWdtuRNYkVBpg==
X-Received: by 2002:a17:907:bd88:b0:ac4:2ae:c970 with SMTP id a640c23a62f3a-ac402aec9f2mr753664066b.21.1742769571904;
        Sun, 23 Mar 2025 15:39:31 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3ef86e44dsm559686666b.31.2025.03.23.15.39.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Mar 2025 15:39:31 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Sun, 23 Mar 2025 22:39:30 +0000
Subject: [PATCH 14/34] mfd: sec: sort struct of_device_id entries and the
 device type switch
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250323-s2mpg10-v1-14-d08943702707@linaro.org>
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

Sort struct of_device_id entries and the device type switch in _probe()
alphabetically, which makes it easier to find the right place where to
insert new entries in the future.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/mfd/sec-i2c.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/mfd/sec-i2c.c b/drivers/mfd/sec-i2c.c
index 803a46e657a5a1a639014d442941c0cdc60556a5..ba0efb30877bf668fed7476a5e247e0dd4095806 100644
--- a/drivers/mfd/sec-i2c.c
+++ b/drivers/mfd/sec-i2c.c
@@ -174,12 +174,12 @@ static int sec_pmic_i2c_probe(struct i2c_client *client)
 	case S2MPS15X:
 		regmap = &s2mps15_regmap_config;
 		break;
-	case S5M8767X:
-		regmap = &s5m8767_regmap_config;
-		break;
 	case S2MPU02:
 		regmap = &s2mpu02_regmap_config;
 		break;
+	case S5M8767X:
+		regmap = &s5m8767_regmap_config;
+		break;
 	default:
 		regmap = &sec_regmap_config;
 		break;
@@ -204,11 +204,11 @@ static void sec_pmic_i2c_shutdown(struct i2c_client *i2c)
 
 static const struct of_device_id sec_pmic_i2c_of_match[] = {
 	{
-		.compatible = "samsung,s5m8767-pmic",
-		.data = (void *)S5M8767X,
-	}, {
 		.compatible = "samsung,s2dos05",
 		.data = (void *)S2DOS05,
+	}, {
+		.compatible = "samsung,s2mpa01-pmic",
+		.data = (void *)S2MPA01,
 	}, {
 		.compatible = "samsung,s2mps11-pmic",
 		.data = (void *)S2MPS11X,
@@ -221,15 +221,15 @@ static const struct of_device_id sec_pmic_i2c_of_match[] = {
 	}, {
 		.compatible = "samsung,s2mps15-pmic",
 		.data = (void *)S2MPS15X,
-	}, {
-		.compatible = "samsung,s2mpa01-pmic",
-		.data = (void *)S2MPA01,
 	}, {
 		.compatible = "samsung,s2mpu02-pmic",
 		.data = (void *)S2MPU02,
 	}, {
 		.compatible = "samsung,s2mpu05-pmic",
 		.data = (void *)S2MPU05,
+	}, {
+		.compatible = "samsung,s5m8767-pmic",
+		.data = (void *)S5M8767X,
 	},
 	{ },
 };

-- 
2.49.0.395.g12beb8f557-goog

