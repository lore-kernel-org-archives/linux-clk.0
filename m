Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 328EB248880
	for <linux-clk@vger.kernel.org>; Thu,  3 Apr 2025 08:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743670763; cv=none; b=YCxBo0l2GEKCcC3G/ThP0+35dNGchSSB7zfQSt2ED3CYZa7uXJclJCBntsFCexkb50CSwPUgSEzyvpqJqeQeXHMt8DBA4XJtZbCXYZIvbM0GySsPYrMaqbCD8gQ/GBjuoBBGLS1DuWErsWzxnEkOjCyAriEqC0UM4Nvk72QbSHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743670763; c=relaxed/simple;
	bh=kEDFa+8UVBQzgPmv5eunRw1YTfTPcSizj/QHfDecNE8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kE3jxIySJf4xCjpXhNB5YScxMXIdp6oxioz0N+r0ynsl7uj7p2TicHG2V6hn6XKyYiVyxQHzulfxMnKP7at7gvV/xs7vR2DIPCF01icPxaMo4SjnnwFsbifaydAys7IfME6yqnARxN2auIyyQD5loi45OttTBrm/GUgEJcn9MWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=f8WdtEU9; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="f8WdtEU9"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5e5e0caa151so1272161a12.0
        for <linux-clk@vger.kernel.org>; Thu, 03 Apr 2025 01:59:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743670754; x=1744275554; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zep9f0d4foFUFHvL7+wCfhcQlnrOmBCem8a0X84Q4jI=;
        b=f8WdtEU9vO+BsAgldDW/lpOndPTa42kz0y+sHYdaQf5AqJBGzuENzPhiGdb/7TBlNg
         mcqbzmsZtGLzYoH4qkKw/ExxjDY4a5fUn4BV9S9QYinkUtXM8l76t3vncInOVTJVe3sO
         lavU/MyOYretXqAtBUsyfhuHHNjLOSWi5Wo5se+z+aEie9xvjLSjeMIIBSWdAIwwxWRA
         70O7G+LSOdBauY6bI5R/b8Fur/ZZZ9cMJ8jMBOW1hDLNxp3PTG1WzgONdtnr8XCxvgfU
         64tEBAQdjG2T3CVsPYwXzklq0C8S6haeaw7sWLWC9Mgr6BgzoY7V4pKlW3WDuEpdYWC3
         nctA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743670754; x=1744275554;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zep9f0d4foFUFHvL7+wCfhcQlnrOmBCem8a0X84Q4jI=;
        b=M9kIjeqGRj1DsMten+6gtOJSSsfUSqpRjKsHaqqjgPEzPx4BTDNmIL/vAvc9qPlcX5
         hQjZwcT9JCxKlTrjp3Muu9iXlSNqOGTMpB7F3sSRUAd9yCLybjzSprJDq6phGzGUFjUu
         5Lcv+rJsg0I/wRuSZrx/olXsTvRurjf9N4KP3/xWp5snbHAljmoYk6QDxQ7FT1ciQ572
         DkLpnqfGLjEpQeBS4N3mZtALWzB3rd9lKvUzpjicT4AVbhEE2LbJjycldKpfgemYcJl6
         W1/FHdlrmVMGvRHJnVP5Ftu3qBW4mfUH1bi4YYywgHEioARaLl/khSo3aiX6VXRfV1hR
         pltQ==
X-Forwarded-Encrypted: i=1; AJvYcCVQlyqAYSr4GK1G2xG75Wm8dud2e2kfvnFtakyeozoIEcbnDE3D4xBP0CWEexDSYSWsc7sl7f7bw7w=@vger.kernel.org
X-Gm-Message-State: AOJu0YyxuExXue1Hhf+8mWWvC0nM/VT0Y96H/q4fUJWQ9MbgpvHaf7hA
	sd4MTEtxA4lvhOrwtbmD4Em6J3h5AxWZ7a4Vs4vSBMppPRrz6U6lxl/FmI/pLKw=
X-Gm-Gg: ASbGnctHyb8PkauxPl5Vp7LKuSf+2AwUptuqb/NudQbom0Ld1rRBuuqbH/5bpQ+gQI/
	dc1v6Y8t2rceWLss8o621+tsTvyRE3stVa1HDZcLLYQfQkWo/8txYDaaUjNtlXsfUp5ifPXSQ0+
	qS+O9g4/kiDe4G/V6FKVhFy5QrhefUYG1Q4bA0sdv6vl26p0+T6VC5kAD5VOaINh534ixWodOV4
	caY3wMCW8DOuU+GstkQDynMlXCL75yCy9P0+0nHiSgbCfoJCYXap0e2ACrxdCBPocQ/2K9uulMn
	9CZj7PHxw7vyS3ZciI88ighrwFh/ALh2DCBG91lUqHE/zMptUYc3YyGhwUQ1xvTqN0Bhnnnulvd
	zBYlrY+kEKcQw/C9bWAhbqr+Qjx4h
X-Google-Smtp-Source: AGHT+IHPaEYedqVEDLo93ujbRrtVNCm/mxpEYABRhJlFkwLFXs8WrbrWDofWHLr/5jqHegGOehX8ag==
X-Received: by 2002:a05:6402:5112:b0:5e6:17e6:9510 with SMTP id 4fb4d7f45d1cf-5edfcbe92b8mr15687119a12.6.1743670754243;
        Thu, 03 Apr 2025 01:59:14 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f0880a535fsm637614a12.80.2025.04.03.01.59.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 01:59:13 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 03 Apr 2025 09:59:15 +0100
Subject: [PATCH v3 23/32] mfd: sec: add myself as module author
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250403-s2mpg10-v3-23-b542b3505e68@linaro.org>
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

Add myself as module author, so people know whom to complain to about
after the recent updates :-)

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/mfd/sec-common.c | 1 +
 drivers/mfd/sec-i2c.c    | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/mfd/sec-common.c b/drivers/mfd/sec-common.c
index 448300ab547c10d81f9f2b2798d54c8a03c714d8..05658f05cb857a784c7d01b1cf25de4870e1a95e 100644
--- a/drivers/mfd/sec-common.c
+++ b/drivers/mfd/sec-common.c
@@ -293,6 +293,7 @@ static int sec_pmic_resume(struct device *dev)
 DEFINE_SIMPLE_DEV_PM_OPS(sec_pmic_pm_ops, sec_pmic_suspend, sec_pmic_resume);
 EXPORT_SYMBOL_GPL(sec_pmic_pm_ops);
 
+MODULE_AUTHOR("André Draszik <andre.draszik@linaro.org>");
 MODULE_AUTHOR("Chanwoo Choi <cw00.choi@samsung.com>");
 MODULE_AUTHOR("Krzysztof Kozlowski <krzk@kernel.org>");
 MODULE_AUTHOR("Sangbeom Kim <sbkim73@samsung.com>");
diff --git a/drivers/mfd/sec-i2c.c b/drivers/mfd/sec-i2c.c
index 2ccb494c8c024361c78e92be71ce9c215757dd89..74fd28a6bc9a42879fc1eb05546777f60e0062e9 100644
--- a/drivers/mfd/sec-i2c.c
+++ b/drivers/mfd/sec-i2c.c
@@ -233,6 +233,7 @@ static struct i2c_driver sec_pmic_i2c_driver = {
 };
 module_i2c_driver(sec_pmic_i2c_driver);
 
+MODULE_AUTHOR("André Draszik <andre.draszik@linaro.org>");
 MODULE_AUTHOR("Sangbeom Kim <sbkim73@samsung.com>");
 MODULE_DESCRIPTION("I2C driver for the Samsung S5M");
 MODULE_LICENSE("GPL");

-- 
2.49.0.472.ge94155a9ec-goog

