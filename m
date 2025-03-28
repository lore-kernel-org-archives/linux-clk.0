Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3DBF21CFF4
	for <linux-clk@vger.kernel.org>; Fri, 28 Mar 2025 13:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743168676; cv=none; b=XhIuYg6zVZ38ZE2nHrshZtTgo7v2g0chLPW4q0EYO8QBgk3Fs1DFuQ7cTP/C2rs6riO/usybkbVjWye9489qWFJAILpOhOQWPJYTcPFiQsCSXERvmb2Eke5fp7RV/RSOkFfObWFARKonqloVa9d23ZZoSPqiH76n0e7/kHolnvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743168676; c=relaxed/simple;
	bh=uZPaCVbPHBGfSgOGE/h2z8oZIqJdXRNHkC3wOcm11eI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rvV6LpLDfUCrUVOCMckCK6ukdYTzQ2ltCtexVXGBq9aZGRxcd4XTGFAl1M3LTTbqzOZUbN5xlhVUygOTlCiSjiK+vCI8XMJ9A6e8LKm8D+MiluKSGvAjQaQlppLzKQMiK03S8fB4vWajFuinV6yawjM87+CzsaZ3x+PDHhjSV8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WKdGgX/v; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WKdGgX/v"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-ac25d2b2354so369069966b.1
        for <linux-clk@vger.kernel.org>; Fri, 28 Mar 2025 06:31:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743168665; x=1743773465; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AGZF3iY+lrce/peuoGWoI8dxWV9rSVtCllywJ68wEfI=;
        b=WKdGgX/vbRvtc46zIAT4ZFk9eSDjIKPd6yrk8cQKrNQfjVkTIDKVmZPmC7UjgR3//n
         U5fsrnhBk1WgcOMd9C1gCTDovWHak8Y5dVuO4QYKuH7OiLSb/XDICkok1TgUBD3wzwM9
         VuRhLTVuiT4hMtz8NsZ/Aizbm2KhE8UfXxbiaP7buvfPcRNSn7VMPrYSpRNngjZEGWq/
         EoTnUp9trY8IIxuu+WCiWZSc9GvgDSPeOi+K/WkKfuv8qK+ieaGFKMHYuqAAHD7+QElH
         WaVIdGkSJ5MPzzMLT00ZgMyVNTydtbSQ8BA2X6Fw4px26Uc+Ndi0//IHldkuEofIV++Z
         0z9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743168665; x=1743773465;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AGZF3iY+lrce/peuoGWoI8dxWV9rSVtCllywJ68wEfI=;
        b=XHGtNj8hKoGNdrjtdM3VF4dRe/xDCdrYvFKZBQBzV0UZNdNCmOTRFPmRjOugfYGmVR
         tDLIMThiuIZkjj5bTxjZpvitM6QgUEoikFjszpsIIZBFWqmorxFr44FKvJNa1R8+2VsM
         TQRZxqV04sBfI+RhJN6x38Q/AkzZQfCNeAl6j2/b+JLhrmkfFTmXsi8PnDJI+T+07MeU
         RI6xJS6DzErg6lWTKioKjO0fs8wq/sp5e85gPhGZkpKoMrXVHKZYBPjJ44X4zlDEK2Um
         1+GVIh9YVJlAzIj9WGjEb2qNEebGbliMJcuYkAOZ5pA8AlpaaBfa+gUbcZcafszjdHUv
         yAEA==
X-Forwarded-Encrypted: i=1; AJvYcCWUNHrPa0lx6TqkimoVm71s8swwHlQun7ELTy+EQoehceJYoJsYFXYJ6+r32hYPumrdJ7+jxCyYgHg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzsprUtxpP2qBQrpd8dU8qVabzBcVL+coZhG+YxFhGBgl6GdG9/
	PYU1yi96uspxIK3YKXNbb048gBKGU/W+Wyf8GqIuIOuxl6S0BCkBbvbz+Oxqr6c=
X-Gm-Gg: ASbGncu0nPFpMfmUXgzq7ujdG0f+uP5MP/OBzZnfePw5x4c261o7wby3/hnz7hT6DLw
	OTiCUEbB7O0kVhuqlaAdUDFqhfqu0zHF9HjfBipYVZSLz8wpf5esflNMfuCt/JpDAo16MT3rCty
	QZcd4WJhQ5N9qYik/PEGqldxG42vDK6WP+fMricx7XGRONzh8XSgDjmtlrluHXp4BS2xJ/ikyY+
	RgjYFjaLIoBco/rJdpHF73TQgCJBycbUd111aFdT0gaqKyEK5kQNolppAhofY8WWxMPXssLT9Qn
	qan+epE5lk6Y/T1+sxFOW7xTchyjuGoGTuhlM097Px6pyLW/eh+LUOW1S5d4qItW9eu3PMT0cum
	fQe6MiUrAgxgztZokQsizH7shnigb
X-Google-Smtp-Source: AGHT+IE/8XexhkCjt++gZyl4aQeO3RmSnHYdltcD1RaSzcc8eBzKzYT4GuhaF+2UqXAsXXHHf+aEJg==
X-Received: by 2002:a17:907:84a:b0:ac7:31d5:20de with SMTP id a640c23a62f3a-ac731d52b5fmr47028466b.50.1743168664749;
        Fri, 28 Mar 2025 06:31:04 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5edc17e01f7sm1355284a12.79.2025.03.28.06.31.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 06:31:04 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 28 Mar 2025 13:29:07 +0000
Subject: [PATCH v2 21/32] mfd: sec: convert to using MFD_CELL macros
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250328-s2mpg10-v2-21-b54dee33fb6b@linaro.org>
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
2.49.0.472.ge94155a9ec-goog

