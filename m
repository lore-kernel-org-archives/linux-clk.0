Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C5D51DE4C3
	for <linux-clk@vger.kernel.org>; Sun, 23 Mar 2025 22:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742769587; cv=none; b=CrsSnb1KGvZcnfOImn4TmmU75Uftk7KogyxaXPKy7DWwelGjCPzk8cQhddGaAaqgo5W2zBZrUBsKcb4kyJa7FfeUTG6YPDuk0PyE51rhhg+k18RmkYAYjBvFe1hcsAJWRc+i447f2snF72pQ724IBl2xFJSCFVhR8CbWgUXxAPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742769587; c=relaxed/simple;
	bh=6qUMnnrlHHUbgLCde/zD0N2oNsEsgjH7lEf2K9i3EHI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uobZufrpC5FoZh/GNFaKwrnNJt+t+F5zYd7GhRuAmwcQ/tPcAT+ANQqWnfx2iB2AlZ0RrmpWEhOuT/iaTFDvDznxOT0u0clOYug1+WUZ0n2Y4srVnXeJT/YKfnYu2OI8Qjmci/D4M6D+4y62fcSIK0z+X6OxvfgZf5Yx9vu035g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KHbphFSY; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KHbphFSY"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-ac2aeada833so704466166b.0
        for <linux-clk@vger.kernel.org>; Sun, 23 Mar 2025 15:39:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742769579; x=1743374379; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DHaTbCMsBXEPy+wffmMjNGPy/wKjQsHouvVH+3/pTJ8=;
        b=KHbphFSYz2QnhFS2dmIqOpu+K5CNichuxCqtiNn6yUUuNlTOlfkUmuag1+FWiGgf83
         jrfmeBlM7IGsZBEEx0n3r68Kco+iUvayvCZLPznhRebIelrrBk6Kuh1ExlFXJ4gupnVf
         tIVaee/3Tzsizl7n7kd9j+bW6bFkZ4s7AKpb6R09opWwGO4s6lGUUVB43NF4tcpAIwV3
         /2vRKbc2PIh6FsOBs6eHyaqeZi4GwjBT7yKdyh2b/EQVFAdJjOvIXi3Z5RdmPd4Rb2Wy
         BxZZTVWEHOdTWmQAys6XzyjM5HOzheakCF3MrVvj7nSuL4K7pLwdfUV2tWnVZLida5CA
         08Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742769579; x=1743374379;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DHaTbCMsBXEPy+wffmMjNGPy/wKjQsHouvVH+3/pTJ8=;
        b=C7sqnZKIulpQVl3wSz9mwv3cnZgfn8J7HBjtP6/fDy62+o7t7RiumYTokk02G5j3zW
         g+JzrUcWuTP3M85/9ZlC5PoiDU9dyXmgOZUWKORgGjml7/1o6Efw2W5ieJ1crN75FWcQ
         UJdNfesIsEgbhH+dwyijEAO+x2zm8hqRZotUcnhSnWx8sjk3b7MvJRixROQnCdiFAYpi
         LrIW79slPnxTpVWBbHa9MeBXTadaGoC2c1qwMv2UndT8wFRb7olJSmlL7578Fne0dbVy
         TC/cwYYmCj6w2snzB0Lyul61odBJwTgam0Ghc9RqIsHgLxT2c7RP0cRdxBv7HaET4T6j
         0gbQ==
X-Forwarded-Encrypted: i=1; AJvYcCU00rr3JcsCOZAjeqogVtx0aZ1IBol4vMnuf2xe1NqhkWKbEWhhbdYnr09/M/SB4FO2o1QLqWaPwZc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzrd6PrimyN+8dsDiLPV06TaoAZ2tgE1DM9diTI+CTT3AgQ6ZfX
	iYsHWLSUAmB6eAeD903FdatKNEYi+B3FrHnNJPFUj1rI3jjRPCL11kQtRXJmqk4=
X-Gm-Gg: ASbGncuqn9rWAhRqAVmhB7f4IHjcvORTYBIhTWFQEs01bB/VS6qry2gvunNbU/vQ3Ef
	/rvAMqnuwLs+wv0pZUBKYwx5QDtn8KbjfTcQ2GxdLy0ZkA+JXKSEynK4CzBzjjq506so8MVjg4N
	XYU2pdydF9nluHQG+Qpv7A5MQiBbyxAzeg1T8AF3uf2RrE9ap3ji0UdgNtacTksyJUeb4326UvT
	H5sfNOgndLEeKs/9thQZJHhB1BJEhxe689QMhd1usb7whMPdCGEdWKEqi70tQU52ceqTJ6SkRrY
	6Yj9IYXI9Gh8pHTr9FH2/IuAplX0Q+3KB3nEilZI6DTnLgLwCabMEQFEJBTfund7LONWeqrBewp
	Zw05CBjR4f3Hiv7G6Byzdc7rRjEdb
X-Google-Smtp-Source: AGHT+IE8DhyAI41xwJ1273XUXoV37Lt8dbT+04E2oAAFhJgLPXY5M4zmkgkE92YY51ZbbO2cYsb3Mg==
X-Received: by 2002:a17:907:d84d:b0:ac1:e18d:a738 with SMTP id a640c23a62f3a-ac3f00af8famr1143082266b.3.1742769579059;
        Sun, 23 Mar 2025 15:39:39 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3ef86e44dsm559686666b.31.2025.03.23.15.39.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Mar 2025 15:39:38 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Sun, 23 Mar 2025 22:39:42 +0000
Subject: [PATCH 26/34] clk: s2mps11: add support for S2MPG10 PMIC clock
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250323-s2mpg10-v1-26-d08943702707@linaro.org>
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

Add support for Samsung's S2MPG10 PMIC clock, which is similar to the
existing PMIC clocks supported by this driver.

S2MPG10 has three clock outputs @ 32kHz: AP, peri1 and peri2.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/clk/clk-s2mps11.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/clk/clk-s2mps11.c b/drivers/clk/clk-s2mps11.c
index 014db6386624071e173b5b940466301d2596400a..e86a762f80ccd7485a9f2a6f567b81bafe119874 100644
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
@@ -138,6 +139,9 @@ static int s2mps11_clk_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	switch (hwid) {
+	case S2MPG10:
+		s2mps11_reg = S2MPG10_PMIC_RTCBUF;
+		break;
 	case S2MPS11X:
 		s2mps11_reg = S2MPS11_REG_RTC_CTRL;
 		break;
@@ -220,6 +224,7 @@ static void s2mps11_clk_remove(struct platform_device *pdev)
 }
 
 static const struct platform_device_id s2mps11_clk_id[] = {
+	{ "s2mpg10-clk", S2MPG10},
 	{ "s2mps11-clk", S2MPS11X},
 	{ "s2mps13-clk", S2MPS13X},
 	{ "s2mps14-clk", S2MPS14X},
@@ -240,6 +245,9 @@ MODULE_DEVICE_TABLE(platform, s2mps11_clk_id);
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
2.49.0.395.g12beb8f557-goog

