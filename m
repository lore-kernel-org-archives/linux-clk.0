Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C75321C84BC
	for <linux-clk@vger.kernel.org>; Sun, 23 Mar 2025 22:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742769577; cv=none; b=lsP6F2X94TRLk4CdWBzmdwhTtKlyYbHF4HO744z3g3mY67e20sMAw+uodTOf9bvZgLAVAMOMHmjZKRZbtNeh+26lpsTGhK66zC6I5NHx1yMWSeAVrS+jqd7kUB9gqzBZ77PQC6Y1KyFYJWrzBTjsltB2yjsAaSjuFeoyZseAg5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742769577; c=relaxed/simple;
	bh=H8JdpLkt9gjn8rcrkSJLgzbur0dmxI9LF5La3T8/4+0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=btAImBv6ikApCAtwUEsI7Jdnfyk51B7cIGsAibA5zSmJ45REXVVcknRjsnw0+aMtlDKm5YpkWVHYQjNGrqdVgXEGmmkgIgK5xkpQzSRSJjBT+cW37vPOO3m4BDZprbOSvz5+7X4Gs2ANj6MgiSkgMlqMa4tLRTYuV+s054egvxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EfN5de3p; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EfN5de3p"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-ac2bb7ca40bso838509266b.3
        for <linux-clk@vger.kernel.org>; Sun, 23 Mar 2025 15:39:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742769571; x=1743374371; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i5FeheMvzJmbwWW+zZr6R44NUMWEXy77OJnz7z8P8Mo=;
        b=EfN5de3pUHEWdjCzks+RAYj0koIZpp0Sb/fzfpalHCT8dWNDDtt6pS0ou5cHtJFZ/T
         +K3NzuugxktQnf9qQnGplv/1Zd35mMcUGDzrBSz0F10sPsviteJyh4rH2dHR76FlljsW
         1juhbKbIHfLgji6PP2VBrW7vap8/ELoR1+50ukGt8ZcsV66d/rio867pnuO8h5g5glCC
         JaysGBUUQJDbWaQFC5FvmsYVY6Z8nFIb9b1E1AkWnTZG+aJCGmishTvtAyyXzpKA9rbF
         ynAPfighPi0bhe58jcdSeXJkQCuO9zWXMXGWMtWOaUGTVaodHMoIKumWjNG+sOwVKbBZ
         GjSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742769571; x=1743374371;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i5FeheMvzJmbwWW+zZr6R44NUMWEXy77OJnz7z8P8Mo=;
        b=Qgjs2oWB1pHIyz+DJjOKQEoIaBWw195FgmrGgCzSV3QfNcCmJkE7q5KTzlnMSUNp91
         9H+O67vlTpTb63dlp8l4Sp+VynHKX1AyGrkpj6cfGreM3QZeua9psVbXgXG3yyf1FxH6
         QmMCBgXSRVBs1zrhD9mpjXeKs5tyWeo66BZmuTp6lzSdeOuLUn4Gbj0T1S79GGo6htD1
         qK0r0UitiLmJ9M9gqHoWcDhUDTzhGcXoEEmfCBOC1U2xMkI+E6tyCEJ6M8jv6PV2FULe
         F78p8agYdFZ6BqVoJRlV0kIC1/ZDKwSNbQfgriyXLNgQ6QO0FzMGiXNxCipEklRHc7oS
         N7ww==
X-Forwarded-Encrypted: i=1; AJvYcCXsyNuGV5otPrHiCm+1Xt2qZAlmBryfZbzKClWXokUXNB7wVAJ3pR0fNBTV/QXsHYywq/TDBv0eCC4=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywc66LGCoYLpuXsMApxoh5Kb5SX50wctSbl9OdcsOhcdgGSixfM
	uSyyfgiqc8Q1+k6lmTf5l0qqxTZdtOoYwl2k7kvr8Y8KuA5oboWpA31dKImLGwA=
X-Gm-Gg: ASbGnctb4SAetPXsdIb5dXR9K0kVxNZxAL/7aM6JBxr0kWXfC3FWK7eiEH5hFY7f28M
	C9j4iH2WkF6TuBXVqcptxTyMZMwVNCLTUU0NBJPQQ+oXa2vYOeNv4eue1RWOPBpxZ979Js+Ev/X
	aFZtwOPE06pQegCkDhpa1zi6vmlDNjR48af6FrF//29WLBB4cMJhw7+O+BNEFqtFjt4SP6lWqQk
	v3fDSxwQ3CeCQMKnwTiZtS83/nM8MKY/5ReIwnwH6l6neFr18FzNy8PCLOx0ENQvmJpcTbp7sCh
	fG1XC2P6OeZggHW5hU28CQHmEe2axeaNRIUS1vvYxL9vpsJrjXbX36yBZMIvz2jMlZ40KwNdxrP
	LIDYKj6U8mL1gZC+s1y2fY2yc1R+R
X-Google-Smtp-Source: AGHT+IGUlU/bQ4EEwEZ8SvxfGdwz6JP0ixr4oFBkCNhTZdri22pju1M/NgGRE9XtZE8yWlr6k3maUQ==
X-Received: by 2002:a17:907:3d88:b0:ac3:8d24:a7e with SMTP id a640c23a62f3a-ac3f22b476amr1025053966b.26.1742769571302;
        Sun, 23 Mar 2025 15:39:31 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3ef86e44dsm559686666b.31.2025.03.23.15.39.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Mar 2025 15:39:30 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Sun, 23 Mar 2025 22:39:29 +0000
Subject: [PATCH 13/34] mfd: sec: merge separate core and irq modules
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250323-s2mpg10-v1-13-d08943702707@linaro.org>
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

There is no reason to have these two kernel modules separate. Having
them merged into one kernel module also slightly reduces memory
consumption and module load times a little.

mapped size (lsmod):
         before:             after:
    sec_core   20480    sec_core   24576
    sec_irq    16384
    ----------------
    total      36864

Section sizes (size -A):
         before:             after:
    sec_core    6780    sec_core   13239
    sec_irq     8046
    ----------------
    Total      14826

Signed-off-by: André Draszik <andre.draszik@linaro.org>

---
Checkpatch suggests to update MAINTAINERS, but the new file is covered
already due to using a wildcard.
---
 drivers/mfd/Makefile                     | 3 ++-
 drivers/mfd/{sec-core.c => sec-common.c} | 2 ++
 drivers/mfd/sec-irq.c                    | 8 --------
 3 files changed, 4 insertions(+), 9 deletions(-)

diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
index 8a8c678134a9721c7f78e432ddd0df33b2b0de69..67fac46c8eeb9c7b4429e8a496a1d7d40d2b7b31 100644
--- a/drivers/mfd/Makefile
+++ b/drivers/mfd/Makefile
@@ -232,7 +232,8 @@ obj-$(CONFIG_MFD_RK8XX)		+= rk8xx-core.o
 obj-$(CONFIG_MFD_RK8XX_I2C)	+= rk8xx-i2c.o
 obj-$(CONFIG_MFD_RK8XX_SPI)	+= rk8xx-spi.o
 obj-$(CONFIG_MFD_RN5T618)	+= rn5t618.o
-obj-$(CONFIG_MFD_SEC_CORE)	+= sec-core.o sec-irq.o
+sec-core-objs			:= sec-common.o sec-irq.o
+obj-$(CONFIG_MFD_SEC_CORE)	+= sec-core.o
 obj-$(CONFIG_MFD_SEC_ACPM)	+= sec-acpm.o
 obj-$(CONFIG_MFD_SEC_I2C)	+= sec-i2c.o
 obj-$(CONFIG_MFD_SYSCON)	+= syscon.o
diff --git a/drivers/mfd/sec-core.c b/drivers/mfd/sec-common.c
similarity index 98%
rename from drivers/mfd/sec-core.c
rename to drivers/mfd/sec-common.c
index 27f5036ffa1009304147755c91d00be333dd206a..fcf7668efd3215ad70d81916ede249ed5f9d45ae 100644
--- a/drivers/mfd/sec-core.c
+++ b/drivers/mfd/sec-common.c
@@ -290,6 +290,8 @@ DEFINE_SIMPLE_DEV_PM_OPS(sec_pmic_pm_ops, sec_pmic_suspend, sec_pmic_resume);
 EXPORT_SYMBOL_GPL(sec_pmic_pm_ops);
 
 MODULE_AUTHOR("André Draszik <andre.draszik@linaro.org>");
+MODULE_AUTHOR("Chanwoo Choi <cw00.choi@samsung.com>");
+MODULE_AUTHOR("Krzysztof Kozlowski <krzk@kernel.org>");
 MODULE_AUTHOR("Sangbeom Kim <sbkim73@samsung.com>");
 MODULE_DESCRIPTION("Core driver for the Samsung S5M");
 MODULE_LICENSE("GPL");
diff --git a/drivers/mfd/sec-irq.c b/drivers/mfd/sec-irq.c
index bf86281401ac6ff05c90c2d71c84744709ed79cb..4afac3aa0a582994bf04c41768c1c788c54ee2e9 100644
--- a/drivers/mfd/sec-irq.c
+++ b/drivers/mfd/sec-irq.c
@@ -6,7 +6,6 @@
 #include <linux/array_size.h>
 #include <linux/build_bug.h>
 #include <linux/dev_printk.h>
-#include <linux/export.h>
 #include <linux/interrupt.h>
 #include <linux/irq.h>
 #include <linux/mfd/samsung/core.h>
@@ -510,10 +509,3 @@ int sec_irq_init(struct sec_pmic_dev *sec_pmic)
 
 	return 0;
 }
-EXPORT_SYMBOL_GPL(sec_irq_init);
-
-MODULE_AUTHOR("Sangbeom Kim <sbkim73@samsung.com>");
-MODULE_AUTHOR("Chanwoo Choi <cw00.choi@samsung.com>");
-MODULE_AUTHOR("Krzysztof Kozlowski <krzk@kernel.org>");
-MODULE_DESCRIPTION("Interrupt support for the S5M MFD");
-MODULE_LICENSE("GPL");

-- 
2.49.0.395.g12beb8f557-goog

