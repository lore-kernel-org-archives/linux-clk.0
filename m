Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED6E221A44D
	for <linux-clk@vger.kernel.org>; Wed,  9 Apr 2025 20:37:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744231071; cv=none; b=E2zHZmJ0omRfC/5etSgCUXYohKTeKIUqQ394oSF55RMkZmcH2UqIXh3lPrgbxiCVgsswHaSkzVrRrskEJDA6Q+VeExxrv4UgK8v1X0W2RCWPwHApwoxCNwiKdbDnXCiTnlZKtGFGXwrOCvZYv0fn72PE8dGegOSsYrV7qGu8FWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744231071; c=relaxed/simple;
	bh=3OWU4PadtGYnTOgmPw8gXiDUPGbaAd/UPB8FUmZS3tg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QIWO55cLpUQ8z9+j9uhXEKrNHBfJa6D6BTpbrzBQiKRjB4KUWV4B1vqgqX0zTpI569FUEENU+X1pNzyMw9iHDMdIfN8MI9n5CBbjaOlgh9YcHIYaXwf5UF07ZfVImQKOg4k/Ai/m2W9oHq6Vte0Wk5iWqLbfGjqN/KrXJ07Ddew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ft4Jz9jb; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ft4Jz9jb"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-ac7bd86f637so230723066b.1
        for <linux-clk@vger.kernel.org>; Wed, 09 Apr 2025 13:37:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744231060; x=1744835860; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2K+kGSEI7CbW62pffu4JaosdNeVJj1iuYtYl/IPqMzs=;
        b=Ft4Jz9jbMd1y08XA5sIYuyQpoPqAntACey9vUeLu+HxanYGg5jA/mMLzJ/F60Ch7oQ
         ekqCc+VOJWz6PFIpIedCa9OsZeQt3S7ZFeCNhIYoLGZe86yu/stCpTTBUMTcvYyHP+/Q
         2hTmIKTa2WwGDaqDmVyhPTJIpV0dRnsZRck1d+0Iq76t2LDdBQ2BHr9dlyDUZ6jslh+V
         R6NFBhcYaw/eXa9ZAjR+3sjCfNPjq+kjvf4g64pq9HKcMDJHPeOOFwjXm/TuRgfiX/h/
         Zr5UIpsqfshMA5sBwoLFtrV4ZXx7Ejy9gHJz3IdL/h5CAn+Zr5bPlh6iLfnWRvyfoSWe
         kXtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744231060; x=1744835860;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2K+kGSEI7CbW62pffu4JaosdNeVJj1iuYtYl/IPqMzs=;
        b=VMiyfW8FHHK1t42d9NUJsLiKKZPPyLsxucqKrV+fRPdwCichtQUmPm+8e5KL7btOeT
         SqG85sRYmdjmKDqAA8fw6ktI6j5JZ+OQ5suQvE3zPG+fr0tI4MRvMPdXBGkQ7YuC8XZT
         Fnc4AIQnjIv8+H3UjNsH5jopRN/oX2Zg7P9XE5bqNmnlSNZcFeWfbp1Fxm9+YRPkvdxV
         TqJFSMFnE/WE8/CkaZYkQECvsSMAYPEjdefYXMagx2+vL7A4FgE31FsGftBxFTeve/5B
         v/MF4IxzGatKgwYhpHiy0LzVlR5YBF9MmoALpLXibmozK/qmEdWqbXns1DdGKJWcbt8I
         AOhw==
X-Forwarded-Encrypted: i=1; AJvYcCXVZEIIWxvPYUxPXhWxmYXpAhlQRKO5eAjXxJsZPJcKRkAFs/ykhGwI8EJP3ZjZKkWSwQ0Qf/kt8TI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwwQCqiJGmWsTcEP+oddYu2x1q/tMe1A62dsiOjzZy7upsz1RVA
	i8/aLyCQXnc8pxx0kwvUpQyWzRNqBQm9HJ1RaZXkPhHKr8wdSi6p5B0nUID7Xc0=
X-Gm-Gg: ASbGncuq45yEa8K4hq6YnSCFgj0KRUClZ5Jcm9XYKH9uaFmttckQg0ZXojxrZPkdsKX
	VzCBnJKKHOoMX7uwZb29QKJlyYAxGp344z8PMiEPME0cQQW2ozGk0NMMHip+KcBseD3z5cM7gDT
	qHuocdviN8LlDulyXjAootfA/vevG6zAqw7EaEscTGTs1zMH7UfCokzRVbJN4ndaBw/b/1DO5RC
	/SZq5YOeItWvjWjA5a0B95HB9MzXHtZTVw6saavoivpNrk8KFViJSVPRDep109cvTcyCubGdKF0
	jNf/Z055mxInKcQk/uaGMOyHf2pBHcCbmBWHtFAas7nurVmC78p2IBr8CgiUfqkIupmpi2bh5Do
	TURy7RnJN4nKeUKerfjz9vRXD86I=
X-Google-Smtp-Source: AGHT+IEEu5frM78xjaYtfvJpOfPA05D1eB7ySMJAK47y8ri2kTuUJkGDYBSO/DNVkH448CBSxwwKIQ==
X-Received: by 2002:a17:906:dc8d:b0:aca:b45a:7c85 with SMTP id a640c23a62f3a-acabd39ea82mr7993866b.19.1744231060332;
        Wed, 09 Apr 2025 13:37:40 -0700 (PDT)
Received: from puffmais.c.googlers.com (40.162.204.35.bc.googleusercontent.com. [35.204.162.40])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1ccc001sm145850366b.126.2025.04.09.13.37.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 13:37:39 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 09 Apr 2025 21:37:42 +0100
Subject: [PATCH v4 21/32] mfd: sec-common: Convert to using MFD_CELL macros
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250409-s2mpg10-v4-21-d66d5f39b6bf@linaro.org>
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

Use MFD_CELL macro helpers instead of open coding. This makes the code
a bit shorter and more obvious.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/mfd/sec-common.c | 57 ++++++++++++++++++------------------------------
 1 file changed, 21 insertions(+), 36 deletions(-)

diff --git a/drivers/mfd/sec-common.c b/drivers/mfd/sec-common.c
index e8e35f7d5f06b522a953e8f21603e6904401c983..448300ab547c10d81f9f2b2798d54c8a03c714d8 100644
--- a/drivers/mfd/sec-common.c
+++ b/drivers/mfd/sec-common.c
@@ -24,16 +24,13 @@
 #include "sec-core.h"
 
 static const struct mfd_cell s5m8767_devs[] = {
-	{ .name = "s5m8767-pmic", },
-	{ .name = "s5m-rtc", },
-	{
-		.name = "s5m8767-clk",
-		.of_compatible = "samsung,s5m8767-clk",
-	},
+	MFD_CELL_NAME("s5m8767-pmic"),
+	MFD_CELL_NAME("s5m-rtc"),
+	MFD_CELL_OF("s5m8767-clk", NULL, NULL, 0, 0, "samsung,s5m8767-clk"),
 };
 
 static const struct mfd_cell s2dos05_devs[] = {
-	{ .name = "s2dos05-regulator", },
+	MFD_CELL_NAME("s2dos05-regulator"),
 };
 
 static const struct mfd_cell s2mpg10_devs[] = {
@@ -45,53 +42,41 @@ static const struct mfd_cell s2mpg10_devs[] = {
 };
 
 static const struct mfd_cell s2mps11_devs[] = {
-	{ .name = "s2mps11-regulator", },
-	{ .name = "s2mps14-rtc", },
-	{
-		.name = "s2mps11-clk",
-		.of_compatible = "samsung,s2mps11-clk",
-	},
+	MFD_CELL_NAME("s2mps11-regulator"),
+	MFD_CELL_NAME("s2mps14-rtc"),
+	MFD_CELL_OF("s2mps11-clk", NULL, NULL, 0, 0, "samsung,s2mps11-clk"),
 };
 
 static const struct mfd_cell s2mps13_devs[] = {
-	{ .name = "s2mps13-regulator", },
-	{ .name = "s2mps13-rtc", },
-	{
-		.name = "s2mps13-clk",
-		.of_compatible = "samsung,s2mps13-clk",
-	},
+	MFD_CELL_NAME("s2mps13-regulator"),
+	MFD_CELL_NAME("s2mps13-rtc"),
+	MFD_CELL_OF("s2mps13-clk", NULL, NULL, 0, 0, "samsung,s2mps13-clk"),
 };
 
 static const struct mfd_cell s2mps14_devs[] = {
-	{ .name = "s2mps14-regulator", },
-	{ .name = "s2mps14-rtc", },
-	{
-		.name = "s2mps14-clk",
-		.of_compatible = "samsung,s2mps14-clk",
-	},
+	MFD_CELL_NAME("s2mps14-regulator"),
+	MFD_CELL_NAME("s2mps14-rtc"),
+	MFD_CELL_OF("s2mps14-clk", NULL, NULL, 0, 0, "samsung,s2mps14-clk"),
 };
 
 static const struct mfd_cell s2mps15_devs[] = {
-	{ .name = "s2mps15-regulator", },
-	{ .name = "s2mps15-rtc", },
-	{
-		.name = "s2mps13-clk",
-		.of_compatible = "samsung,s2mps13-clk",
-	},
+	MFD_CELL_NAME("s2mps15-regulator"),
+	MFD_CELL_NAME("s2mps15-rtc"),
+	MFD_CELL_OF("s2mps13-clk", NULL, NULL, 0, 0, "samsung,s2mps13-clk"),
 };
 
 static const struct mfd_cell s2mpa01_devs[] = {
-	{ .name = "s2mpa01-pmic", },
-	{ .name = "s2mps14-rtc", },
+	MFD_CELL_NAME("s2mpa01-pmic"),
+	MFD_CELL_NAME("s2mps14-rtc"),
 };
 
 static const struct mfd_cell s2mpu02_devs[] = {
-	{ .name = "s2mpu02-regulator", },
+	MFD_CELL_NAME("s2mpu02-regulator"),
 };
 
 static const struct mfd_cell s2mpu05_devs[] = {
-	{ .name = "s2mpu05-regulator", },
-	{ .name = "s2mps15-rtc", },
+	MFD_CELL_NAME("s2mpu05-regulator"),
+	MFD_CELL_NAME("s2mps15-rtc"),
 };
 
 static void sec_pmic_dump_rev(struct sec_pmic_dev *sec_pmic)

-- 
2.49.0.604.gff1f9ca942-goog

