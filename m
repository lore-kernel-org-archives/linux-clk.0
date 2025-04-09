Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C32DF21421B
	for <linux-clk@vger.kernel.org>; Wed,  9 Apr 2025 20:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744231058; cv=none; b=JUPEUIXKTO/oMjUjlT/nv/lCD1feO+aWoqmE9X3pYq99OLH9v8pENSqkpDVOPV6FkcI4j7Zw7N/WxAfiNumUudx1zkjH/FFPngT5B6om4DeBwgfRNZZ1JzEVwtNTq+bICAtE2bVAh2iWNSFnoH0XY7RWw0iDINVBHivP3FCqQWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744231058; c=relaxed/simple;
	bh=2foMlVQ/rrFhYchojsGnx6WEkHW4CBP5XOWmzyZJG5k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aLE8krbA6jDmbWuDZZ8C9BTjAn2UN84cpX59fwvu7nJ0WlV/jbAZBwRq83/r/0Nq8g0ZwKAeYUlqTK0kxwXKuRNDZHffxxFjhJhHANoz6V5MyBbKqYqclbR0xOfApImd7jl3reMoMnlPwYeb1dXnxyiTs35oqQr5alZbcY40JzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xaSuIRmi; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xaSuIRmi"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-ac7bd86f637so230705466b.1
        for <linux-clk@vger.kernel.org>; Wed, 09 Apr 2025 13:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744231053; x=1744835853; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2dUWnnbmvdHhYGfFFJml9oJoedUjXAR2wlXNtpTeJXc=;
        b=xaSuIRmi8kjsXYQ9y+82uGmTrNho26IN9SuOVRmXC9WFTSoT+u7XxWkYmUrErJMwy5
         auYVbPydBSlFzRzgu381KmgkS5H1JyIwu1hwRb391L7SR8mfkfU0sPLkk8tjnIlqFJjk
         /7t07kiTL3SFK69eleJmLIHPKXnu0USvsBTGas8grLTmvVLANGeeLr/qNvw4tbA0nmmK
         i7nNFbF06TbwPoO8nJd2vzF79eUOkdLTTUdjsLPzoGwisByssm1w0YJgH9042G529xuk
         EdNKRo8RQACtB+yW3kEscg6TMi3y0XFKHTECxnFa7doqw7cVZh+r48suOonQYASZqSh2
         j0bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744231053; x=1744835853;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2dUWnnbmvdHhYGfFFJml9oJoedUjXAR2wlXNtpTeJXc=;
        b=KnV7DDKEh08N5aZvsMTFCje/5Fj5DjuyzRiAq/0hG4F6DLatfj/vXxB/Bh2+1xZ5qG
         N/XGWcahPBlW6dw1lvheGaz2FPe3NUciPp8EBfbMGLccLIArlR/D7U24W7+QQlpFs/hm
         0SA60SZ+0GcoSRrxm18/BMqyYWtjUWlVI47qaWqNLB6HYMRcb2aiykv7b2qZM9JtfwyP
         MT4EmNdVvCBIeyZ2u4zrk2WisGSNmo0HX7jQEEHDTEK393pNSx4vZxY5N5m9ll0wlZhr
         1E+vlnkPSvndg9vhlHD8m+Xk0wVCKXI0b7LNnWH0/3IsukhCEINxugiGxvou8p5zkNf5
         5rxg==
X-Forwarded-Encrypted: i=1; AJvYcCXgOCIjPeoUXdEeBRcin+cDq/f3n1i784Qooi1Y0i9tByCadxHH+Korey4LvzYxMaXF7xOJFN/wEZU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwfT9D3hcR0gVQ9R72UNCqPQgxJtYB524nNI2NdOUdFPfUKBhAo
	2DmTsi0n0xZM2YQhV3jkt73aC1C0ATdVE25bCDPrSdny0gcZHHWR6kCrZZRahQs=
X-Gm-Gg: ASbGncvE02KU8i5zw6wFhCfh5DZ3V/N6LAJDL09Tuqih+wGcp5hnvlS883hZN0MlWG4
	8WbQ0/mOOdTrmOk2vXK034pXkygoUISyqYHBN+wta0YJq6D+S5VAZTq2GzJFxHcBZUsqEH1jgu2
	Kf1KaDmnHEUbaR04r9+0wvL8Uw+K7LoUSISyJZUE4/I9l15Ko/adbmQ7k+hLOIqedosLoB/cVaC
	ucvsmVsDKaiHM5ZwvPSLUusbuXK5yV/4ArUHfDeJzN71UKs5jrWk+8tBPWhWlguhfAvgreA2IYG
	VJwdLns8MIthPwgtoKggbnMKsDcj4Unnj2YpRSbd8VVouVgBpHEFQZJXUYU7HRIWLM5Yn+kVX0o
	HFE8gRivi8jKiB1kGILTRVhYtYGU=
X-Google-Smtp-Source: AGHT+IHKPyqKkOQl1VeMSZiViKNNp2YZh/sxu3Ut5v80bTjVlkCkL3GxyPP6wMwuQ/pmeL4UatLsMg==
X-Received: by 2002:a17:906:6a13:b0:ac8:1bb3:894 with SMTP id a640c23a62f3a-acabd25168fmr6274466b.7.1744231052992;
        Wed, 09 Apr 2025 13:37:32 -0700 (PDT)
Received: from puffmais.c.googlers.com (40.162.204.35.bc.googleusercontent.com. [35.204.162.40])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1ccc001sm145850366b.126.2025.04.09.13.37.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 13:37:32 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 09 Apr 2025 21:37:28 +0100
Subject: [PATCH v4 07/32] mfd: sec: Move private internal API to internal
 header
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250409-s2mpg10-v4-7-d66d5f39b6bf@linaro.org>
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
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2

sec_irq_init() is an internal API for the core driver, and doesn't
belong into the public header.

Due to an upcoming split of the driver into a core and i2c driver,
we'll also be adding more internal APIs, which again shouldn't be in
the public header.

Move it into a new internal include.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 MAINTAINERS                      |  2 +-
 drivers/mfd/sec-core.c           |  1 +
 drivers/mfd/sec-core.h           | 15 +++++++++++++++
 drivers/mfd/sec-irq.c            |  1 +
 include/linux/mfd/samsung/core.h |  2 --
 5 files changed, 18 insertions(+), 3 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 322ee00547f6e494a96d2495092f72148da22bd0..d4d577b54d798938b7a8ff0c2bdbd0b61f87650f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21407,7 +21407,7 @@ F:	Documentation/devicetree/bindings/mfd/samsung,s5m*.yaml
 F:	Documentation/devicetree/bindings/regulator/samsung,s2m*.yaml
 F:	Documentation/devicetree/bindings/regulator/samsung,s5m*.yaml
 F:	drivers/clk/clk-s2mps11.c
-F:	drivers/mfd/sec*.c
+F:	drivers/mfd/sec*.[ch]
 F:	drivers/regulator/s2m*.c
 F:	drivers/regulator/s5m*.c
 F:	drivers/rtc/rtc-s5m.c
diff --git a/drivers/mfd/sec-core.c b/drivers/mfd/sec-core.c
index b12020c416aa8bf552f3d3b7829f6a38a773f674..83693686567df61b5e09f7129dc6b01d69156ff3 100644
--- a/drivers/mfd/sec-core.c
+++ b/drivers/mfd/sec-core.c
@@ -23,6 +23,7 @@
 #include <linux/pm.h>
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
+#include "sec-core.h"
 
 static const struct mfd_cell s5m8767_devs[] = {
 	{ .name = "s5m8767-pmic", },
diff --git a/drivers/mfd/sec-core.h b/drivers/mfd/sec-core.h
new file mode 100644
index 0000000000000000000000000000000000000000..b3fded5f02a0ddc09a9508fd49a5d335f7ad0ee7
--- /dev/null
+++ b/drivers/mfd/sec-core.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * Copyright 2012 Samsung Electronics Co., Ltd
+ *                http://www.samsung.com
+ * Copyright 2025 Linaro Ltd.
+ *
+ * Samsung SxM core driver internal data
+ */
+
+#ifndef __SEC_CORE_INT_H
+#define __SEC_CORE_INT_H
+
+int sec_irq_init(struct sec_pmic_dev *sec_pmic);
+
+#endif /* __SEC_CORE_INT_H */
diff --git a/drivers/mfd/sec-irq.c b/drivers/mfd/sec-irq.c
index 3ed2902c3a2634a6ea656d890ecea934053bd192..4d49bb42bd0d109263f485c8b58e88cdd8d598d9 100644
--- a/drivers/mfd/sec-irq.c
+++ b/drivers/mfd/sec-irq.c
@@ -18,6 +18,7 @@
 #include <linux/mfd/samsung/s5m8767.h>
 #include <linux/module.h>
 #include <linux/regmap.h>
+#include "sec-core.h"
 
 static const struct regmap_irq s2mps11_irqs[] = {
 	[S2MPS11_IRQ_PWRONF] = {
diff --git a/include/linux/mfd/samsung/core.h b/include/linux/mfd/samsung/core.h
index b7008b50392ab857751b89e0a05d2c27f6306906..8a4e660854bbc955b812b4d61d4a52a0fc2f2899 100644
--- a/include/linux/mfd/samsung/core.h
+++ b/include/linux/mfd/samsung/core.h
@@ -71,8 +71,6 @@ struct sec_pmic_dev {
 	struct regmap_irq_chip_data *irq_data;
 };
 
-int sec_irq_init(struct sec_pmic_dev *sec_pmic);
-
 struct sec_platform_data {
 	struct sec_regulator_data	*regulators;
 	struct sec_opmode_data		*opmode;

-- 
2.49.0.604.gff1f9ca942-goog

