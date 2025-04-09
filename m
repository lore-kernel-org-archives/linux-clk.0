Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FF492192EE
	for <linux-clk@vger.kernel.org>; Wed,  9 Apr 2025 20:37:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744231072; cv=none; b=cUf+Gs4LH8s6vZ3309EJL+NYqExldrTLAsvaI3nZWXxJjKcQj7bDjV4sP+AVOk8qRioqvQkQ7F5eBIwym/7K7EQvjnNLQv4FMCFWytRR0KMsBYt9AYsFHZeyKPKirTGWcOkYvIr7Id8fnwWaQNsoSf8M85wa0IM5J0CYFXqBlJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744231072; c=relaxed/simple;
	bh=qSv5/qRfekv1BXqCAyoLS9fhjEPlxat67lwDh+L/ZJw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sfaZUndCussoZW03T7zf2g96t02c1XQFsHqpz9ijDZUjWOn9uvvZaqifQxqer+NJmlUIquljpRp5CeiBKmJAgmxWYVB4XCGmOrqysCz5GLYEmeNd41BOnfr/qUs4tVPsuJpsQL5eYxz9Bd/DGrPtI3XS2y/RZEtEiKVhUVeeEkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fgT8kvhz; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fgT8kvhz"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-ac2963dc379so17811866b.2
        for <linux-clk@vger.kernel.org>; Wed, 09 Apr 2025 13:37:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744231062; x=1744835862; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Yvl4l0Ok5PkRG0EWi21Y82ldA8DtM3z/BsTax0kidDk=;
        b=fgT8kvhztDK9j2B9NsFMoMoAPRlJ2/YjAyQuCPArIwJ2Nt87a9nP6Sgn+V/2kAIuts
         GWy/ZrxjXDgTeW6Qb0JZK0zvvwhbXpCV/vdZZSs1N6bFRIJoeVkGIy8SJ2uuQ7v4cBmv
         I4zXU6W4VJFK1mRaTPqXllhJ6zE+gFaRo62S7u7EeudWjinb8zfBnMJkaWqM/5SMFf6t
         sIJIQO6ihhYbT2yIOlCdnBJO7hfjcmG5skj9Vhn5LruF8yMMm9odJpb5po+5QWNRmeti
         rX5iwXDJegPHB6rYdcSCU74JzIKlb6eaMXJui5IVDwP61o2VrxOkF05vTTSrMF2VPu/V
         ofAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744231062; x=1744835862;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Yvl4l0Ok5PkRG0EWi21Y82ldA8DtM3z/BsTax0kidDk=;
        b=Mg0GzD3mrTPKM/t0e6WhksP+lMZGDxdf7rCunyGktNyKiN+66eJGzt3UwluZpL/uhf
         bqUY5ekMaxBrawmH04gNo58nU9hEEuniy7pUEUr+/N9mvB6RREuz0z7Zwf4dZ6W/wASl
         NjdyZ+gdoN5DXLMXh+QuxXuYDSf6pPU/PzBnJpSW6WZeZ1LtNRD5KeKHNILNvZR6Lm0U
         PSY0DdFVpUAp1LZwf7Cv9z1PY8XVr/iVyvO2eRSjPE4EmhQyFARVX7kUdH7W9X1ljAyn
         iKrFrpzPIMNt8G9PzNv1hxGzys4hwBpR/bZ8zx1zmCbPnZBa/StBEYHnLF/Iep7u9oN6
         bfzw==
X-Forwarded-Encrypted: i=1; AJvYcCVhYOR3tWEpT1DwlY1yD0K1lNENVKjvl5rlJntf9kg9yYmiv8l6Mt4csKiQt77KC07rkHnHWF+4oB8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxxzUa0COjiOcs9UdGYfsD7S9Mr9gsy2Yub1u39R87Sbr2RqpU1
	Jafc8XsRO1N7rlPkuUBrnI2H8uhMNRBluzqL/HOM2IxGJVDOepxzw18JC8VoRO8=
X-Gm-Gg: ASbGncv8dmewcBzrpNW2+a7aqe4c/7SBtJf7lAG+R4C0nfgD2F2aqA1U5Gj1A9TJ3q6
	dl3k7Ria844Wfcd1m4gFy/zTQfcFPLvo7o92RGiEf878s/xvJHt8sYMb238ruN+rZMW5n/jujbA
	pJBmSVTDxYcfo5He4aoUsftnDT43vAwBv1BYMJ//1RJvgVFgDF8xgu9is/5vmJ+oXmM8ugTHzoU
	cexzp11X4VvD26Bsq9ohuQisAbdPqPc0OlDaNPL/vNUwhoQWBOoxPVSEn+cSwXDg6/bu07f9HjC
	aeKnx/CsXf8oOl4RYsoEvQDYBD2u+JqTBDhH18VmSqYCbjkcO+dtvKBzCm7xzSV15XW97FoIXQo
	TAITW35tQYnBuIqJCNQnRWv8nVB0=
X-Google-Smtp-Source: AGHT+IHbuLfVklw/YEV595LIDXkT6NJfGZ8tsFxVvFej7hgAnnMJK0l8IFDXzmywh/fHAbSmWr9RuQ==
X-Received: by 2002:a17:906:dc89:b0:aaf:103a:e6e3 with SMTP id a640c23a62f3a-acabd3c36a7mr7622566b.43.1744231062434;
        Wed, 09 Apr 2025 13:37:42 -0700 (PDT)
Received: from puffmais.c.googlers.com (40.162.204.35.bc.googleusercontent.com. [35.204.162.40])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1ccc001sm145850366b.126.2025.04.09.13.37.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 13:37:42 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 09 Apr 2025 21:37:46 +0100
Subject: [PATCH v4 25/32] rtc: s5m: cache device type during probe
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250409-s2mpg10-v4-25-d66d5f39b6bf@linaro.org>
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
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2

platform_get_device_id() is called mulitple times during probe to
retrieve the device type. This makes the code harder to read than
necessary.

Just get the type once, which also trims the lengths of the lines
involved.

Signed-off-by: André Draszik <andre.draszik@linaro.org>

---
v4:
- cache the driver data, i.e. the enum type (Krzysztof)
---
 drivers/rtc/rtc-s5m.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/rtc/rtc-s5m.c b/drivers/rtc/rtc-s5m.c
index db5c9b641277213aa1371776c63e2eda3f223465..c7636738b797b8087a0ed6844df62d47427e33b8 100644
--- a/drivers/rtc/rtc-s5m.c
+++ b/drivers/rtc/rtc-s5m.c
@@ -637,6 +637,8 @@ static int s5m8767_rtc_init_reg(struct s5m_rtc_info *info)
 static int s5m_rtc_probe(struct platform_device *pdev)
 {
 	struct sec_pmic_dev *s5m87xx = dev_get_drvdata(pdev->dev.parent);
+	enum sec_device_type device_type =
+		platform_get_device_id(pdev)->driver_data;
 	struct s5m_rtc_info *info;
 	struct i2c_client *i2c;
 	const struct regmap_config *regmap_cfg;
@@ -646,7 +648,7 @@ static int s5m_rtc_probe(struct platform_device *pdev)
 	if (!info)
 		return -ENOMEM;
 
-	switch (platform_get_device_id(pdev)->driver_data) {
+	switch (device_type) {
 	case S2MPS15X:
 		regmap_cfg = &s2mps14_rtc_regmap_config;
 		info->regs = &s2mps15_rtc_regs;
@@ -669,8 +671,8 @@ static int s5m_rtc_probe(struct platform_device *pdev)
 		break;
 	default:
 		return dev_err_probe(&pdev->dev, -ENODEV,
-				     "Device type %lu is not supported by RTC driver\n",
-				     platform_get_device_id(pdev)->driver_data);
+				     "Device type %d is not supported by RTC driver\n",
+				     device_type);
 	}
 
 	i2c = devm_i2c_new_dummy_device(&pdev->dev, s5m87xx->i2c->adapter,
@@ -686,7 +688,7 @@ static int s5m_rtc_probe(struct platform_device *pdev)
 
 	info->dev = &pdev->dev;
 	info->s5m87xx = s5m87xx;
-	info->device_type = platform_get_device_id(pdev)->driver_data;
+	info->device_type = device_type;
 
 	if (s5m87xx->irq_data) {
 		info->irq = regmap_irq_get_virq(s5m87xx->irq_data, alarm_irq);

-- 
2.49.0.604.gff1f9ca942-goog

