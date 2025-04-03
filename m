Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8697224A064
	for <linux-clk@vger.kernel.org>; Thu,  3 Apr 2025 08:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743670760; cv=none; b=hF9oW8A1ChX9qdqT0o5B1LMtCnw/L8bELvgBbxAbyCvTA1OFYK2DEX1SJ1VQv8tznct3MlOFzDH9ln5EZWqNjl21uTNq7yvuSJRh7KJjh3mjcgU0qrUP6LOetjvzQqywiCwPBAt0ALx6jAjuIH6qG4pGxdu6lyWzNdNly1O0ZBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743670760; c=relaxed/simple;
	bh=uZPaCVbPHBGfSgOGE/h2z8oZIqJdXRNHkC3wOcm11eI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hg8Tu9jCXNlW5U0l37eZPNB1zbZN54twLFEe4iYn+ib0Sr1E1dLmbSAClaID7QF896iwXezEN5mGR/edwrK7XpZvM2PobOpqGec6kYoGVqtD0pGu4ipHCfBs5tMMunS2D1WGHVMXGyUvSLCK0Y9Btr9giwM8R2005/9CovBLRH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=r5DHmoiO; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="r5DHmoiO"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-ac345bd8e13so108742466b.0
        for <linux-clk@vger.kernel.org>; Thu, 03 Apr 2025 01:59:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743670753; x=1744275553; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AGZF3iY+lrce/peuoGWoI8dxWV9rSVtCllywJ68wEfI=;
        b=r5DHmoiODxaHsy2jUz9U6uGinpNsTG8t7Rgx05pLFXLsh1Vr5scyqvahIQXq9i776e
         h+v0ITFLa9aNuN03UKLIF6Jlq9A7/AHbxUlKN4UyNHV3DimYKzdd9I/StgLnRjbJDj6P
         rnbrMTpFM0ecFIHTtj5E+A+E8ANw3BynCMNDJtoKhQqxVIMgAKbAO5lEkNf0tv/3WeYl
         950Um8azpVGsFWTSJA44Y8yDZ8Bj+q4Lxt/839vNZ4XXYJKaMvhgAGhsI9FVri9eKE0o
         YIVo7OAKu5AWKKTfbuqUqenu0E+pwq+8fIjnUzM7WqR1gh3qYSAO4p3uuDgshPaQ0RRh
         W6Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743670753; x=1744275553;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AGZF3iY+lrce/peuoGWoI8dxWV9rSVtCllywJ68wEfI=;
        b=Om9WrrKfSMhlrK5xcs+TA2tyUnrQr1f9dzeNDiji3C27nspODx+fHF7qd1NIWwEKAT
         tj5RXAZuboC7Ctfrz7JLs/KXQ1WB6Zd41b/3pahq6n95kyBjpEt8ZSL+a4LwwUU0g/m4
         0npDkQ0WM6UBqr1oWnITq19NAeNv0q7zma/rGo0d2OhlPo58jIfzIVHUzTYFZww0iXuj
         SNM7/D1ZZiDkL0YKmCxa7gjS8QLlicRIhVXEEXXLMmMWntYtDzQd+wkrFlwT5TMLu3lX
         IVYndOUkKFZwgY94F1Oq2nQHInpUP+dAwN+Q5EIyKv3MO/Ma0tXHTMNy69KFEElMv1Lb
         lU6Q==
X-Forwarded-Encrypted: i=1; AJvYcCXLH0jj55B3w/2EsXcFq3EizcviSX7jUeL/oDOd40Y23PZG+Bbj5lDWWe4NByL0JCwHi67KE329Ml8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzq83wncgVJLTAv9VYRMcaouqY+D8jTR9GrB1pb9a04CX9+tK2t
	qIxqmLNDRuna/UONlzIQHAamCcngNs0I3IrcTvAt8uXYMhe5tJNrTlfGLc8LXPM=
X-Gm-Gg: ASbGnctAIrVeCjBm02yBrz9o/VdMW6oVbJIXbBvZsS7NXPPYlckNLQUE90A66qJueDH
	vu0S/7BGkeGvwBHGl0Y5qiKYZSupAv/SIQbmeaGPBlGTbNaHn14OJ5pXgZZkTSYABZGLyHoM+Bl
	VWWkvL6iaCH5q2AgOSkQxsv6gL3oOLKBGf76JJaaV480qYA/YQTXR0MqdE3VJz7eCTp9vBj6ZWd
	nkgnhFZqr53Ebb7+nV2p3nbujb/DZRMUgqGUY4r9l/vDbdt4tgtZ8ra7b163rwM6/Gs7oVXPFzP
	WHNzvI8eRN6mavB/KthcVdkX+H6ILgK122ms8dXkbrF3rddovcoiihUO7O5Z09m6HQNmsrruQZj
	1EAP8OUODIIyZej8OAfDzFNvACQ3V
X-Google-Smtp-Source: AGHT+IFRyOdwPcEz80NSYeNSO9OIEAqrNZz0SsyzqP2x0gvOEZiZralRMKMAb8SO2ti+oPAesT2BCw==
X-Received: by 2002:a17:907:cc1a:b0:ac7:c59e:fc3e with SMTP id a640c23a62f3a-ac7c59efdf6mr46064366b.25.1743670753150;
        Thu, 03 Apr 2025 01:59:13 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f0880a535fsm637614a12.80.2025.04.03.01.59.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 01:59:12 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 03 Apr 2025 09:59:13 +0100
Subject: [PATCH v3 21/32] mfd: sec: convert to using MFD_CELL macros
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250403-s2mpg10-v3-21-b542b3505e68@linaro.org>
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

