Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD9A6213244
	for <linux-clk@vger.kernel.org>; Wed,  9 Apr 2025 20:37:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744231059; cv=none; b=tqDX+UaqTaxnEPCYnz3PegoiZ9FNsfyoOt5vDsHkXtHWnYQGsgraUKLjSxDXDK6fmeXrUhOm3TmI4SuwKVyzah9fGuuqi1sibd5sM8QZ2mFJXMza/Iip72E8rylbpYXr0FgAJwcjLN8bg+tcwuhMKOqg3mv7X84Zfm2W/4yETBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744231059; c=relaxed/simple;
	bh=G2QuqVnFMg8y2zTjZxdmMu/QnwXErcjNOQU4yV6iUVc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gU83GritmH+/jgOVAcTpOH4S3MKjhzPhQ524qbYlvGYarOwew9UqnKCJpsUulrMnwiRUNONszxDysRaV0vgl1j0qk/kXsVT/Vzq3ZMs8G6+OhgZYxQaPlpJubrkSW+BrT3fwzzZ8fQO5GgoazQ/VcEfOHQ7ggCWFY95+yLCY/2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Q097XvRD; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Q097XvRD"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-ac2dfdf3c38so19181166b.3
        for <linux-clk@vger.kernel.org>; Wed, 09 Apr 2025 13:37:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744231052; x=1744835852; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZJ5xfpPt+Udr2klxgQkLdnjiXALVAMMpe1APzqbpdGM=;
        b=Q097XvRDDYtMidEVtgtFNl797DkTTk+NQ00daETce3y5PCoVWKI+muJw+lo+4teqyY
         1KUrI0+BcePBu66lz0iOkYYbCWmTdAcBtYUinYOtvjIGenbQDd73lntPoFBrq+bzFK9a
         2U/nhzV9MLpYhysPPpSWOzZRugSnoG0HkH4utVEOHjiiddrlWI+8qjH8LTDVtw8psZ6H
         noDfZpIKmyK9wZD+4aDazqwDjDESTI04Dkqn0YR3PcB16T1QJVvE0KTsQqPa71hVOvvI
         mxIT5ONJ5SX65+kMFTdaPuC69UknBCqfveqV4BTYTOxemX3J2n5HyO75np0j0Zb6eoe5
         WMZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744231052; x=1744835852;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZJ5xfpPt+Udr2klxgQkLdnjiXALVAMMpe1APzqbpdGM=;
        b=aH54nZu36DpLx6ocqF6vciQ4m/XREL0RqvQQhkI+6zs9aicAYcuvO36kkva1yH5d5F
         +50LUX7H+/WmtV5Ax3MBHlWICSozy7Bd0+zXII2qwtKOE8Q20yWwwgPY6j5lRmUH7ZoI
         97ABWQ3llZ5TJKH5J8M9kXAH/T888pEHgyJn0Te8AoCiCOQ5WVG+01EqfwkiqGQvltZ+
         gs4TVxXXOcwGHXdOaxqWK0fcrSmAFz8KBAz/eYy/fFIWInq3/aACQnp7xajCswBtMCkd
         /9FjedipQHrkte/DGyFGqG+53JZzMvHgpLQ5b9STh4nikiiY5QbeCsSTfvA640KU1VpJ
         TMSA==
X-Forwarded-Encrypted: i=1; AJvYcCUSLNSw4lFxdnC5MpKqEptLvTR10sziMQ8CqHFTRTlsnAI4GgK3lG7Kc/K6Qp5BwrvO4WWnconYaec=@vger.kernel.org
X-Gm-Message-State: AOJu0YwJ2qmOIFXxVDRsE6kjvjf+TBDILcUnKz/5D5oAHhvCU2Y0cPul
	0IyW2lutDVKRly1yF4IVvRjtJwbkobY0kpjX8xFIeqr338EZd28o7FapNNUETkg=
X-Gm-Gg: ASbGncsOfOjaE9dVLOQb7Nv8K13Dwruy206kc8eJbx70XQpti/aRVKX7N7MiXdAJnA8
	r87fdxBeI14V/w/8PWOf3/lkjTtvrEkH850xnAPKVPEQ9sZ4rDIK5pUL8NOPfKPxUkUL7yoFaVF
	Eg2939KH54LpqJKG3CWV+QGVL8dINTfnzbKLTuJEpdt5lRlitqxCWzJgBH6M7BM1XfdiHEFD9t0
	jUgFZjPBiRIuPrSc6DmEWKg8plG/9UwIC4Xx8r1ubdMeyoCKCA/707wpRSOvPalUdHLSPOnDLDP
	wIJvbMRIuEkluFpBOxETLVv79Wt5FVLh2cT6fQGVVM4UxnRCXtKs1lpkCIBp94bR32PzuPE5TOa
	BllaWpaZDbj6Rr8RkDfLRwHIG/AI=
X-Google-Smtp-Source: AGHT+IHjirWHIybtv9mCOYpNHyYmTU6KD1TdSj+7K0HHxN3o9SAgZZYxV6t8b5P0L2dTzB7k1zUW7w==
X-Received: by 2002:a17:906:f595:b0:ac2:7cf9:71a0 with SMTP id a640c23a62f3a-acabd3bbf77mr8344766b.48.1744231051972;
        Wed, 09 Apr 2025 13:37:31 -0700 (PDT)
Received: from puffmais.c.googlers.com (40.162.204.35.bc.googleusercontent.com. [35.204.162.40])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1ccc001sm145850366b.126.2025.04.09.13.37.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 13:37:31 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 09 Apr 2025 21:37:26 +0100
Subject: [PATCH v4 05/32] mfd: sec: Sort includes alphabetically
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250409-s2mpg10-v4-5-d66d5f39b6bf@linaro.org>
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

Sorting headers alphabetically helps locating duplicates, and makes it
easier to figure out where to insert new headers.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/mfd/sec-core.c | 14 +++++++-------
 drivers/mfd/sec-irq.c  |  5 ++---
 2 files changed, 9 insertions(+), 10 deletions(-)

diff --git a/drivers/mfd/sec-core.c b/drivers/mfd/sec-core.c
index 3e9b65c988a7f08bf16d3703004a3d60cfcb1c75..e31b3a6fbc8922e04a8bfcb78c85b6dbaf395e37 100644
--- a/drivers/mfd/sec-core.c
+++ b/drivers/mfd/sec-core.c
@@ -3,16 +3,10 @@
 // Copyright (c) 2012 Samsung Electronics Co., Ltd
 //              http://www.samsung.com
 
-#include <linux/module.h>
-#include <linux/moduleparam.h>
-#include <linux/init.h>
 #include <linux/err.h>
-#include <linux/slab.h>
 #include <linux/i2c.h>
-#include <linux/of.h>
+#include <linux/init.h>
 #include <linux/interrupt.h>
-#include <linux/pm_runtime.h>
-#include <linux/mutex.h>
 #include <linux/mfd/core.h>
 #include <linux/mfd/samsung/core.h>
 #include <linux/mfd/samsung/irq.h>
@@ -23,7 +17,13 @@
 #include <linux/mfd/samsung/s2mps15.h>
 #include <linux/mfd/samsung/s2mpu02.h>
 #include <linux/mfd/samsung/s5m8767.h>
+#include <linux/module.h>
+#include <linux/moduleparam.h>
+#include <linux/mutex.h>
+#include <linux/of.h>
+#include <linux/pm_runtime.h>
 #include <linux/regmap.h>
+#include <linux/slab.h>
 
 static const struct mfd_cell s5m8767_devs[] = {
 	{ .name = "s5m8767-pmic", },
diff --git a/drivers/mfd/sec-irq.c b/drivers/mfd/sec-irq.c
index 047fc065fcf17f5bde84143d77a46749111ea5b8..5c0d949aa1a20f5538d8baf7a8aefc1160ffa14c 100644
--- a/drivers/mfd/sec-irq.c
+++ b/drivers/mfd/sec-irq.c
@@ -6,9 +6,6 @@
 #include <linux/device.h>
 #include <linux/interrupt.h>
 #include <linux/irq.h>
-#include <linux/module.h>
-#include <linux/regmap.h>
-
 #include <linux/mfd/samsung/core.h>
 #include <linux/mfd/samsung/irq.h>
 #include <linux/mfd/samsung/s2mps11.h>
@@ -16,6 +13,8 @@
 #include <linux/mfd/samsung/s2mpu02.h>
 #include <linux/mfd/samsung/s2mpu05.h>
 #include <linux/mfd/samsung/s5m8767.h>
+#include <linux/module.h>
+#include <linux/regmap.h>
 
 static const struct regmap_irq s2mps11_irqs[] = {
 	[S2MPS11_IRQ_PWRONF] = {

-- 
2.49.0.604.gff1f9ca942-goog

