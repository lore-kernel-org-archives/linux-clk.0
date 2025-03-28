Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E4CA21B9FE
	for <linux-clk@vger.kernel.org>; Fri, 28 Mar 2025 13:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743168675; cv=none; b=YY8OS/JZ98+Ab+iqZsqztq5hvTi7BDS/4Jq2c6+Hk5rEztYUTpX8QGPPeLeA03rLYM0AkYZhqj5qTxHjrIi218LMs1YELMBNsQ/+wkHxjFm3Kk24ZSS9gR4xTjnzM1OVRIp/YFxN97SIKUVWPQ3GgIzKmIu/TGWCXOm1OeSxSxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743168675; c=relaxed/simple;
	bh=acDeJKyeAKIRosg5ADxV9Zz9Wij86n9v8Z9fpq/Qhv4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=anYgjgoGoaIxhdsSQ6Shjcpj80c1k1OTNsqcoAItk+pHGx7tLyC/y8PredRhQkGlJtAdpdHYEzASCYd0bAJ204UEsFBan+YzGfcqp0/VVBLj8UJ/bAEikiJpJoKz6BxR0wIQsQt5d3gTRYy0+PrJrQV9dq/DpMf2STgydYcvTbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=j27llQuQ; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="j27llQuQ"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5e61d91a087so3544613a12.0
        for <linux-clk@vger.kernel.org>; Fri, 28 Mar 2025 06:31:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743168663; x=1743773463; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GcW1mWBfWGvNcEl9sJWjMnkVLrjIE7eEENFwEaEA4Go=;
        b=j27llQuQRU/bETT2iAfWxnwiO8mMAlB31JPpTmkucq7bh4bjZBPLWUy5s1BGHXietg
         KTZntdetcP2p4lao3ntZe1DYDSzMZYcAdRDALe9u7FamTAlf+2gSwDCE8qLB6NX0wVcw
         R9NZnAer9kUQXm2JsPpcCV6AFGUKbc2IfezVLQLmOpQSPH2D09kWZIF1r0hU7r8IiLu2
         ebWee+ayGkDN9kvXv7Q4TG4b0VkLNi/SUSLe2DMdMMgBMESw5dKIS6l3OoF6FTS324rT
         GwWVL7x9z8v1v4gNABjO+96ukWJGy/xkzEL2fyAM145d0nEvP5Su+ax9a3aiAVdasm/g
         Q3hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743168663; x=1743773463;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GcW1mWBfWGvNcEl9sJWjMnkVLrjIE7eEENFwEaEA4Go=;
        b=vY6D3XRCQyFDZHrmKdgYd8RUdiLj6POCxr6pk8A03VgaC0zqeqtumyCOeRwdBk9cHo
         gXdRrXWrnovoJBP2LIh3EL+DGsrx0dQUstXEYb0jDYVjHdILTpEDs9gCSFP1YtNCL5vw
         j41M+Os24muTQsPrdIj9j4F+vKZgyc4qt0pQQ7lozVBuBDt43ffCW3xxpFf46EJrSMFn
         A8YQhSgdp6hHxQt1mKsSs6ESEkFlBK4yF7450VP6mpt3KFqEaV0A4JXIQfu812xCyDHf
         jUe/IaO6RN2U1ttOXlxdcGUtHO1IX6Hvh9SS+CsWsqKEXy4vqUH4DSnHjfKuY+JqbXsT
         9yGw==
X-Forwarded-Encrypted: i=1; AJvYcCXOb657QKgTG0xTmjWQgFjwuViYeB1tLwJ/s09VDaLF+SMLQN0IWTrvH7UP5p9fGrItaXiCTaS6C6c=@vger.kernel.org
X-Gm-Message-State: AOJu0YxKAidbd9SLcxn8+PCozt96zRoCZejUVJzv1nJDZUGh4pVmrUOl
	feYgUOxtU+RB+2zWaNg7JzH2EyBdW5byoHR2Hz0UviRAtaePYy/vqIiYayi4P3Y=
X-Gm-Gg: ASbGnctRRNQBj6IImtPcBXYV7InHBg52U+sDGsWFRiUbQRzTlYiFnCoJDaPzt7JZ/RO
	hAJshaMOimFiBu33fyUD2cwAo9M+It8fTa9Vf17EOUhVLDTBD59gLFZma6LSpQUzE4xRHb5kIZS
	oY2uXOdNx+rzuLULOXwHFpT8DKEM7XpCl4J1rYOCOmvd+G3+1iMxv3ke5yB/hindeai5BVBylxJ
	bfmeaPi2avrhXx6nF1MGOiqPBFaivLVXlogvDeSKTgvF8i4vwKsUSDCmoPcCR/csfsDAsJl70O/
	Uh9C7s2Hvr6vCj50bgNUFPkeGJ2zNqZTQ0VyMa2mJL7H8Bf8qExQfFAspiP8ooHAbIf8+eXuezK
	84wgVlihUlybb1klA3DXZ1DrkoD4S
X-Google-Smtp-Source: AGHT+IFoyjCdv6rnlWEUloFhpOSmsaTb0sh0cSCSk2tmwmMxrnGI+F5Pjs7eau9btRCy52IBbxAE/A==
X-Received: by 2002:a05:6402:1d4a:b0:5e5:ba77:6f24 with SMTP id 4fb4d7f45d1cf-5ed8e59e28cmr8076694a12.16.1743168660911;
        Fri, 28 Mar 2025 06:31:00 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5edc17e01f7sm1355284a12.79.2025.03.28.06.31.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 06:31:00 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 28 Mar 2025 13:29:00 +0000
Subject: [PATCH v2 14/32] mfd: sec: s2dos05/s2mpu05: use explicit regmap
 config and drop default
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250328-s2mpg10-v2-14-b54dee33fb6b@linaro.org>
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
2.49.0.472.ge94155a9ec-goog

