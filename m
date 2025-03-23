Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E412A1C84D7
	for <linux-clk@vger.kernel.org>; Sun, 23 Mar 2025 22:39:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742769582; cv=none; b=BE6ersY41Msfa7yOCV1cVAVUOKHQjThwQAtu7XqBRTNhVBaKUlBduelPL/ZbQPJdCnrkwpMzi/jR9jLKHg8D0Hffu4TXPD81bAxtwyXKRzZ4hu7WZTsjpaoQ1/3G6QfvfIjMDe6Y4U3xkGIZPT23tkUkpOAidFjOI+Au06+mn0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742769582; c=relaxed/simple;
	bh=rN1LIX+ASOSby+v7Y66ac8wfq2CyeekWp2iiMY3xYgk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KeuW3klavo2m+SZvd0uJxKP+rX5eKPzxBVtkpT8Qtnt9lTF569Ry3JuOLvncBeovslxnmGfj9ZjMUWG24qZiJg0OOeUkkRb7fJzE3aAm9b6kH9AgK4Qx2H2xDTJCb3OkZXcJHV1NtICUWiqagG90215DSbBC0dqtZ+VUgFacRfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wgmFqBRf; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wgmFqBRf"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-abec8b750ebso702083966b.0
        for <linux-clk@vger.kernel.org>; Sun, 23 Mar 2025 15:39:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742769574; x=1743374374; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OvVG+h6exYVME9DrCs1LDYgxvlNyKrO2ZRoKATXeWAM=;
        b=wgmFqBRfZvGB3Wv2rdRMjAEYNdQIlob4VQBDT7YTLkRCOvKLvGlCZhggNK6fEXiXQy
         oOwf9mrRljMud8DglpoJOI+TCbW3SJ33FiwKrcoR1oIUNAgmSLaiV6bJbtQTZBnJahMB
         n893wqqDkBtBBlOJf6QB40NSrtVjjB614QhL0JUE9hlgmEXZYkJjt6mLtAQ2raSLF/N7
         u9ZcAE/V83DG4G3RGUCJ7Jc7P+LbxdmiTtMDukadyzBX+V6o/SJ4oHwiyXmPukuHvPWW
         ls35cq63wRxNS+6hbTZ+CJgsz9nISF5+VbaH1LDdCDbBWD/A8FQlVUcxnJc8BWCqRxI9
         euKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742769574; x=1743374374;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OvVG+h6exYVME9DrCs1LDYgxvlNyKrO2ZRoKATXeWAM=;
        b=i2oK+BsNbn0t9Lrho22qgfYjZmo+Vh/Y0JeRfJmpXGp7l89sEAx1p8IQ8WjALzxlqq
         W9k5ZfuC9+CYLpnp3VyD2by4cCQUlDmupFq7DlVXsad6o/EjBT9v80uMruOvZLzGjhiC
         nPOFS/Q57CKZdkYU2bt+UcSSPyryBM592shCvqv1EoqSldGJsKQDUZBwhf1rWk4s04Pg
         G+6Rc63NfN8YIQBfu17jIv15rezhxu9r/67ogJhos/QvZB6esEI9IncwxRk/IfJnWUJ5
         GmkvwFPSp52z3aFkExA0bxT/3qDkhp56vvpXl3Tr50WeX5k26UjAzEkdnG7HV9FX0IAH
         D3Jw==
X-Forwarded-Encrypted: i=1; AJvYcCUCw0Lo6ylyn/iGXzLXNha+X9Z8WRpVd84iRXCaznNV7oyb+EpWDjsYKCYKVGxFNkir5k8AVQ2/PHA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3wQKE9Lx+T8uSKmYo79mR7FHieRhNZ5khOm5yo5Yjzq84+r2z
	LWBADsHGTfkYlTp8KLE2NohJNTQ4sf7wltnYCZiG5OxW4ekuVnHyiR7LKigVvnQ=
X-Gm-Gg: ASbGnctlo/dJQf292VjRnIe0c0xpRcjRUhZCKSiBn6n7NG41/PEOODIkcHiZycFJk/w
	eh95BMncPK8dyhmRHhUz7YgJq+xd5493CSagFphX0ZIEQ+u0DlxhMEtf06dGM7HAo9L6BXN0aCo
	BKiW7ITq5KEdPTXCKmHx+K4DDJeX536XTrbNJ2lHKqjFvjcyYlSYXYclrsgfv/QGBbNBzUb9eX6
	WU4l3LYEg7lOWCyJY7XIcZImM7rA+Pxcq35Ev3bscbJauS1IecnGuUIdm4tv1wCjvH1YwThl4rL
	2K9AlK3rsIpBqNgBhChzvaKhOGbPLbRrPLYwW21IPA/WPB1gta6iTX7aYUdppMEEnBlWDAPxyJc
	gpzS90KWL82hsc+Q9oMw74UCtacUc
X-Google-Smtp-Source: AGHT+IGbu/jFjtqa9LSXFqPCJsAn/xbvTSf/7H1OcPEes32L8sKOj1rM+QLBV82JKfVyHX96sb/teQ==
X-Received: by 2002:a17:907:1b0d:b0:ac2:7a97:87fb with SMTP id a640c23a62f3a-ac3f229dcb7mr1140111466b.33.1742769574302;
        Sun, 23 Mar 2025 15:39:34 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3ef86e44dsm559686666b.31.2025.03.23.15.39.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Mar 2025 15:39:33 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Sun, 23 Mar 2025 22:39:34 +0000
Subject: [PATCH 18/34] mfd: sec: s2dos05: doesn't support interrupts (it
 seems)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250323-s2mpg10-v1-18-d08943702707@linaro.org>
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

The commit bf231e5febcf ("mfd: sec-core: Add support for the Samsung
s2dos05") adding s2dos05 support didn't add anything related to IRQ
support, so I assume this works without IRQs.

Rather than printing a warning message in sec_irq_init() due to the
missing IRQ number, or returning an error due to a missing irq chip
regmap, just return early explicitly.

This will become particularly important once errors from sec_irq_init()
aren't ignored anymore in an upcoming patch and helps the reader of
this code while reasoning about what the intention might be here.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/mfd/sec-irq.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/mfd/sec-irq.c b/drivers/mfd/sec-irq.c
index d05c8b66c35f2a1356d7c641484404628870ed42..dc5560a0c496917e847a40295c53e3f762b60998 100644
--- a/drivers/mfd/sec-irq.c
+++ b/drivers/mfd/sec-irq.c
@@ -453,16 +453,12 @@ int sec_irq_init(struct sec_pmic_dev *sec_pmic)
 	int type = sec_pmic->device_type;
 	const struct regmap_irq_chip *sec_irq_chip;
 
-	if (!sec_pmic->irq) {
-		dev_warn(sec_pmic->dev,
-			 "No interrupt specified, no interrupts\n");
-		return 0;
-	}
-
 	switch (type) {
 	case S5M8767X:
 		sec_irq_chip = &s5m8767_irq_chip;
 		break;
+	case S2DOS05:
+		return 0;
 	case S2MPA01:
 		sec_irq_chip = &s2mps14_irq_chip;
 		break;
@@ -493,6 +489,12 @@ int sec_irq_init(struct sec_pmic_dev *sec_pmic)
 				     sec_pmic->device_type);
 	}
 
+	if (!sec_pmic->irq) {
+		dev_warn(sec_pmic->dev,
+			 "No interrupt specified, no interrupts\n");
+		return 0;
+	}
+
 	ret = devm_regmap_add_irq_chip(sec_pmic->dev, sec_pmic->regmap_pmic,
 				       sec_pmic->irq, IRQF_ONESHOT,
 				       0, sec_irq_chip, &sec_pmic->irq_data);

-- 
2.49.0.395.g12beb8f557-goog

