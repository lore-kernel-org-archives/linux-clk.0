Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E1691C5F11
	for <linux-clk@vger.kernel.org>; Sun, 23 Mar 2025 22:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742769569; cv=none; b=aTr5X60A14myYXnCmu5Z78Nxw1F2yEHQxpJ3BXEctB00NbrnfrO7g2+sEwMAziCZHZWktMcHAk9708VCX7D/JqtECVPZukdZGY48hUxVRJwtIf5tvNYm1NAanbAwi+AlmG6+bb0FK8DLCGO9YRDaR6g/2lAbOuikGML8xEmpWls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742769569; c=relaxed/simple;
	bh=yWyEsUV61SIUGSRUBs0R2s8QMDXNnM8dfUs8hI7iDhI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WFb1EuRCD7V/NsLKwKkdQ1Lt6h4PPDmBs+oXCZ5kQN/anm2oRZop1OFN21/aa4KZ6Idxs8ZolHqWOAvq8TPLt183n2elVWKJKt3ekTVHJNoH6UJOdz5owzmHXL7ANsFGh3frYUTQS6T4PUL1fkHahonl8wXEw4MJ+/3MpC590Lo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CYMGyJ2q; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CYMGyJ2q"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-ac2dfdf3c38so490782266b.3
        for <linux-clk@vger.kernel.org>; Sun, 23 Mar 2025 15:39:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742769565; x=1743374365; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9y2iwGfLCsw/LkK7ASOWMxlU+K/ybzYKfyvSxQC13dg=;
        b=CYMGyJ2qx/SSOxrxrYL05VEaM9hVN5UqiThK8rKWJri6u4f4SD6LRLAdiOFpf+c6Kw
         uYrw8msKNc6pSP0ZygXin8UgmGTqB0i+zAi7hsixnyQF4XpgDtxPngX1gyUCEs9uz1Xb
         B8YL/RT8A2KGqoU/a/9BBhvu/+1oR59eR8+iYzPPlCI+Ku5cLxCmP9qk8ItlVSf94Hk1
         164BzjnVaBuV0X9BwoDg+N/HUrmQWvuP4GtTnl6DbyXEk0OoqcWJO9cYJcjVS+LHL1Gx
         BlXxVIjNMeF0hTMd6Uxk997Ahc2z1kmk6+F663qfSoCkgG0wY5GEQjOr4m7stKAWpSfr
         yoDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742769565; x=1743374365;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9y2iwGfLCsw/LkK7ASOWMxlU+K/ybzYKfyvSxQC13dg=;
        b=ZsURvS3CA2cNb4ipxwTw0hPqcN2YiDIlWObOZ3YGaeinLIUVfz+33EwW3mgJY9/GXq
         Jnz+nuTFkk0I/+2WrKNSbj9c3icLeb5iIkKotcWvDhm2C7d9QMvqkCS2+btmFULG1kSG
         NMbuw2zX2vZ+hHjKW9jnEXMNxNFHIwbgI12DtH2WnRG2e+kl6G3Wy9m6kGmtnsuIqg31
         9W25Rf0Dp9sBZOUS+DOqRRlNkqE4WbWpM5S2hbrcEbo+EcQC/x9tdw9rI/b9/fJ40Qfc
         HdqHIKjpWFJEWrWBy0xcL+0IekMKvgUNaMP71j92FA75mHbpO/NkZcZrTFPz7tTgIY1x
         r4vg==
X-Forwarded-Encrypted: i=1; AJvYcCXje3R2Whw0P+fltEUsLXa3I38qTlHQhMV4WZpVtPPzn3UIcvOiBgl+KKn0G+h1fIKEYeaqpm3vWJQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzgmJmiKMRes0Jtv7EfC1Jtxy5hnIS8njrVgAIPsbyfqgSxGyUO
	SzIO61x9FLLMB4trIxaZ5rGT2BEUTyZo2dX58/r2I75MynYdxiFVoFb4jkHHwp4=
X-Gm-Gg: ASbGncvopqqsEfmeeEt8+DJ+ifKgFB/uPjZMAY2u/qZaXoBMwwHHY+a80OZVk8E1R5A
	6/FkXAd8J8Zb8M5y5TP0dqompqqbTI3qQMu4BjSN8dJDD/qoj67EvRKAIps+DLkmVrpj4I39r8V
	aEtMEf2yvU18QP6bW7ZZrSP2CJfcxFVUFccjTNF+ZhG/rv1H3FoRZmmZKOkUN0KkUJ4EDi/6Z9S
	ru3AYlXniSMpjBnEgAc79EPQOHf2YfAKQ7k8a/f1wWJMT1wF+uDCec7mfOa/xjyK9Lc5r78JafK
	XHXxaL2XztQHkoiXEIPSjP5plBNLfxmEOaehsz+ZF/MW+0asQDHvg0v8jQCIctjaVaMR0acbc4e
	MQ7JLvmSPHBEgp5J4httnrZsnR4xn
X-Google-Smtp-Source: AGHT+IGsAC+lKGhqNteT46jfSAPWq5SZvMmaurRX3KpVQHgnAMqrYltc7UBx62PPecd7JPcN0qJQgA==
X-Received: by 2002:a17:907:9805:b0:abf:4c82:22b1 with SMTP id a640c23a62f3a-ac3f2297ac8mr1130529166b.32.1742769565476;
        Sun, 23 Mar 2025 15:39:25 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3ef86e44dsm559686666b.31.2025.03.23.15.39.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Mar 2025 15:39:25 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Sun, 23 Mar 2025 22:39:19 +0000
Subject: [PATCH 03/34] firmware: exynos-acpm: export
 devm_acpm_get_by_phandle()
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250323-s2mpg10-v1-3-d08943702707@linaro.org>
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

The upcoming Samsung S2MPG10 PMIC driver will need this symbol to
communicate with the IC.

Export it.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/firmware/samsung/exynos-acpm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/samsung/exynos-acpm.c b/drivers/firmware/samsung/exynos-acpm.c
index a85b2dbdd9f0d7b1f327f54a0a283e4f32587a98..7525bee4c6715edb964fc770ac9d8b3dd2be2172 100644
--- a/drivers/firmware/samsung/exynos-acpm.c
+++ b/drivers/firmware/samsung/exynos-acpm.c
@@ -741,6 +741,7 @@ const struct acpm_handle *devm_acpm_get_by_phandle(struct device *dev,
 
 	return handle;
 }
+EXPORT_SYMBOL_GPL(devm_acpm_get_by_phandle);
 
 static const struct acpm_match_data acpm_gs101 = {
 	.initdata_base = ACPM_GS101_INITDATA_BASE,

-- 
2.49.0.395.g12beb8f557-goog

