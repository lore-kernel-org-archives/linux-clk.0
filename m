Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A98EE1C4A16
	for <linux-clk@vger.kernel.org>; Fri, 28 Mar 2025 13:31:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743168671; cv=none; b=lp4aCBaQDtx+xE80fHYeu3vhwqD2MaN4jbQMETkTUhtIyqenZf8uGNp8HIGZzFg/IPNlXke3QIJq4wp721KcZBT1+DG5Pr3qVBLuYEMkRtWDUjhxH9VbSsn4avC6AqTQE6DPBgwSp7cH2fkCxKUI8c3HbIw07OQxRKVoeSjzsDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743168671; c=relaxed/simple;
	bh=G2VDOjAPimv/kPRtxt/LX8SDH6NDkA0IsfX7EDPKEaQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=otYWyWdE8YeL5QP8AwezqmZzeCO7eGi0dTTkG8wzPcAomFn7EMzsKNNFBp6n1aeR2TOz4jCeFLmP4sNnnfDGLkw8522R9Hy27Zo5vOjHEJDM2XtSd4q+6br1ufm5vLIo8IbdZQaeAc32WTTgdkef/er86mTa5MOMJT2ztF0+neA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bNTT9IK3; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bNTT9IK3"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5e5cded3e2eso3366145a12.0
        for <linux-clk@vger.kernel.org>; Fri, 28 Mar 2025 06:31:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743168662; x=1743773462; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EqGhx5PJ7AN26XxBcQwRDT/hvBtSHvxnm6hLozkr74A=;
        b=bNTT9IK3d5KvOh4LkL5bwbUA0xwVp6rc8YlTIemkkKqSI3HneRgnFc50spAhVeq+y7
         atLwhSkREpPPIPxNQnT2FWbAe5nWC5yz9zjHEV9gb9qhZiPVq6v+uvDYQWvptBoova5/
         X5LMl3RwbGPnWMyyLO1xxgP0aLr3komhMLoAtoLwA6iRVg3y+sf16azZ/Y7xbwt/Xh6X
         QkXWfJ8qWjEXghiZPLWr1H/jxOZPCV7njBpVMsjO58LZ+7+JXpXQEYI6FksUx8Ptjvne
         2RYSiXjR5qumJZSDyfUeWD4PLeLfyl89w/FgwcL86R0J7D/VE7bEPx5Xf+0EmXBBONve
         pMTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743168662; x=1743773462;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EqGhx5PJ7AN26XxBcQwRDT/hvBtSHvxnm6hLozkr74A=;
        b=lJiNzrrfd24qjJRvEN7Mv6M4IoKaAccMcj1lfgrjPycAfQEzOw8+V1zaEG8KK1chpD
         77LgZXUFeZl9r8cXJ8EG1zLLJ0D2WlqtvVqvXEedRF2lNCwqvQoeIgCY4jmIehbC4kee
         GFxDEIPef+PSLr8i7XX9qlZiP/7w2LYE62Df++8x9jyYdhlmb1R+VPuuiszgb4CbRb15
         qZfEyD+SbfgikVXbFBp5P3XKmaiRkwBVYx/OMMst++uyoi7POC+tsyQuJcycj1j8Ndjl
         o+nDXUOZUbWD6+h3bf4ogIbxgDOy0f7z1kjqLMQdP42/MZyoJpSnfLXb91yXV1UGUQHI
         Gpsw==
X-Forwarded-Encrypted: i=1; AJvYcCXKsu3RCl997goy4aL28oRX+Se0PmNb9ascfJvtXpKQdftxyuJ2E+lcCDeqnbpcfojJL4JjoueFjiA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8xsjmz3SyacHU+UpRGJn0FAJnhyWl2y/dQqiyv64tCF+eGk9x
	810mxCxYPUX8+ij0g6pruH/sMEKCCEpyKTw8h1YW8f+jRjvx3QtxqZ5XHSGo+JM=
X-Gm-Gg: ASbGnctCmZW+2HJpOiW/1/Ja9Wa6rcHKVvzTFjTUcR7lIvTWVxQ1jnOkFEcr5gZ6nxp
	XxJjdZwrb7VxEAiZLDu2ElyrpVDT+u9BXY9pyffDBlQaAwrcnFj7Hco/rlbHzawbbGKykkmo2dF
	PfKi4LsCk5TvJcllfo/1fcIFaejB3y+qHLRwGyLQf3cNyxWxHi8vxH7k9XMVCLSITNoBGe8t13g
	SZ0hEZwTY9huJmMLc8x5k9e+/sscmf0IhDj6RzTXZxyDHdT2Py6Ja4JTDNxNNA1NxXv16nDnn5x
	c/uxCWXjJ0k0UPO63uhcPWy8i5RcsCNEMLCFL3Ohd3WuBb5sW2NeSEvOreegC6SD3nw7fT3aPXC
	MxA/HMG9CQzMjTxdBRYhGmFQHgpAY
X-Google-Smtp-Source: AGHT+IFFA9eoxZ8yzHOxTpOhNTpQABoRUZClQa2WX7rYpC3RMUD7CguVMWSVn/HPqyoqjb3+u3RckA==
X-Received: by 2002:a05:6402:5187:b0:5ec:922f:7a02 with SMTP id 4fb4d7f45d1cf-5ed8e496a71mr7840054a12.10.1743168661407;
        Fri, 28 Mar 2025 06:31:01 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5edc17e01f7sm1355284a12.79.2025.03.28.06.31.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 06:31:01 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 28 Mar 2025 13:29:01 +0000
Subject: [PATCH v2 15/32] mfd: sec: s2dos05: doesn't support interrupts (it
 seems)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250328-s2mpg10-v2-15-b54dee33fb6b@linaro.org>
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
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/mfd/sec-irq.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/mfd/sec-irq.c b/drivers/mfd/sec-irq.c
index 9f0173c48b0c8186a2cdc1d2179db081ef2e09c4..79a3b33441fa5ab48b4b233eb8d89b4c20c142ed 100644
--- a/drivers/mfd/sec-irq.c
+++ b/drivers/mfd/sec-irq.c
@@ -452,16 +452,12 @@ int sec_irq_init(struct sec_pmic_dev *sec_pmic)
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
@@ -492,6 +488,12 @@ int sec_irq_init(struct sec_pmic_dev *sec_pmic)
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
2.49.0.472.ge94155a9ec-goog

