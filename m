Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8357C216386
	for <linux-clk@vger.kernel.org>; Wed,  9 Apr 2025 20:37:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744231072; cv=none; b=HWZBMmaGB9q92EwCFhi+5vPKHMpmxoZ4yipxSG5rFpbJmDahrT4P8yxlx39kKXTuCfGaj1XMfu3liovFcz4mQlQe5bR62ckwr0nQYxj9t2bHefa45dH2VJMvOaAPBlqWFOJ75F/gDPlzeepsnMkddN9vnOkANYORqRMgwSQ+jwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744231072; c=relaxed/simple;
	bh=A9x4QRTRgUNIGXpjcMRyDI9R/QUKGRcSDlVPrGn61fc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fw30frzckAStEi/bnfYsD8UCjkuV7bmId8A8RajgZGsnIyhoGYbS5y1eUrHZi2hpb7uigTL+/6OvtZxyKTDBGH76wZpvI9kU2RwbxKIAtAhDSMGjshM+BFpwwXAPiQbaEIAkhCs50nDai32QcBZGYI28EBsBlzTzfsaiMnQUU7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JwGfu0L0; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JwGfu0L0"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-ac6e8cf9132so18750566b.2
        for <linux-clk@vger.kernel.org>; Wed, 09 Apr 2025 13:37:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744231061; x=1744835861; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jI8JhkQt5M0C3/UdNCND2uJaFFyLk5YIBZciiyMnzdw=;
        b=JwGfu0L0UKldZbOQi8KwIVefxSDJcHDq5yVAltDl/ZMfHd+GrPa91vT1T90V5Xp3Do
         BAupXHo8iXxj3pz66sJ2LplvCm+uav2U2exS4GHllma/n7UztLwZ0hgjStCGjuIjsGbF
         zDfcg/5QaeGNxqw7BRXWTeMTd5hO5UJRxBtfW9tdaSAZqd7a4wz1KgRM6l8xOECndpxf
         IJokSetxQg4eF1hSnf+m8SUX408meL6V9Vwf6bVFZo8ohId7xnofoDpjBadXhtQUzYBP
         TawfjNkuuTzEv74x6mMeScXwFtysbRCJPVZRP6vukIUJNrwz6ZVCWdVug9+dtfsGSRBW
         z3tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744231061; x=1744835861;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jI8JhkQt5M0C3/UdNCND2uJaFFyLk5YIBZciiyMnzdw=;
        b=To6u/5smw8CXnaKn3DykqmDqFC5/YAhrL20vBnChr587p8+CobuvnJGlhFO6+saz3d
         HpbN3EpOXPG0fMglVJFoYxSRGjylNKeUBq6r32lv1gLelRpHjNjMLTMolM3wFQyySjxJ
         QWV08MYGp8irtxM6QC6GJTfz/YB9jkTx/5cQf2QgwtNqHSHD9/tEuZ6JjygH39hOF8ru
         1nQUJZl75vW0nwigf8uO8B/EBBUSCscJssJO/wDV9EJWRP4zTNIUmDxaWNd3sWAtWBZw
         qic65iTlIAXbyU39/rtYHzRLaVthjC4Z3qhckHFLpgq5NuOJZ0FDO/kpxyA8Lvj7jP9z
         wBGw==
X-Forwarded-Encrypted: i=1; AJvYcCUGFYlWZIdJ6z0lHO3THfb46ZUr5U6hNjbWI69tDQVAt2axSivapJUViyDwBmFl+PrRr9cIJzlJ00k=@vger.kernel.org
X-Gm-Message-State: AOJu0Yymn9U8G2wNFVBpDnSDf98wg4Y70J3g9F+0sI+PwNqnVrpj0FUb
	76eB6riaFmR3zV+M43PJ4RB5uktf5DIw01scRsgwC5o5Qlhb4tY4qTSVCJYjgBc=
X-Gm-Gg: ASbGncsFj3JYsOh4L/wpWIfKxskpT2ejxvW6RdTlnkzjavPBicHkjI0RMnHQdr5dsoq
	1m70NwOnqJmr1U7AIdB+YmL3rS0doYC5Q/2hFF4qwwCkB17Hk4AbLaHugukUuxuMVqbtvSjecuC
	P4hsP5tQclTosYBHoK+cuNzc9QV96RFoamA5W39qqVgnWRDfWBvEhET352wDW8xrl58QJgfJ0V7
	465lTg+DASCU9zmZMTRzs7hGfK/NYrkNCyIsUlpQ8/9XFtuFZX/SNZND2FdvDHxFYQisfyg42nP
	2tFOkLCCzfKK1rzjIjctaH68RrwL88Z+8yYJ/aT7j5OZPW5xb55cAdhDIUSIG/snQ/zdN442bU1
	YncwF93+Rp3EFftCuUt839L3Ecr4=
X-Google-Smtp-Source: AGHT+IEBr6kEi5N0kVfrU69c2eMzZPUUcJ4BYVystn83LFyvx9TUXz1zdc7j3nGfMkGEvg+haxQNUQ==
X-Received: by 2002:a17:906:478d:b0:ac7:e36e:545a with SMTP id a640c23a62f3a-acabd3ba014mr6923966b.37.1744231061352;
        Wed, 09 Apr 2025 13:37:41 -0700 (PDT)
Received: from puffmais.c.googlers.com (40.162.204.35.bc.googleusercontent.com. [35.204.162.40])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1ccc001sm145850366b.126.2025.04.09.13.37.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 13:37:41 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 09 Apr 2025 21:37:44 +0100
Subject: [PATCH v4 23/32] mfd: sec: Add myself as module author
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250409-s2mpg10-v4-23-d66d5f39b6bf@linaro.org>
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

Add myself as module author, so people know whom to complain to about
after the recent updates.

Signed-off-by: André Draszik <andre.draszik@linaro.org>

---
v4:
- Lee:
  - don't sort module_author entries alphabetically
  - update commit message
---
 drivers/mfd/sec-common.c | 1 +
 drivers/mfd/sec-i2c.c    | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/mfd/sec-common.c b/drivers/mfd/sec-common.c
index 448300ab547c10d81f9f2b2798d54c8a03c714d8..42d55e70e34c8d7cd68cddaecc88017e259365b4 100644
--- a/drivers/mfd/sec-common.c
+++ b/drivers/mfd/sec-common.c
@@ -296,5 +296,6 @@ EXPORT_SYMBOL_GPL(sec_pmic_pm_ops);
 MODULE_AUTHOR("Chanwoo Choi <cw00.choi@samsung.com>");
 MODULE_AUTHOR("Krzysztof Kozlowski <krzk@kernel.org>");
 MODULE_AUTHOR("Sangbeom Kim <sbkim73@samsung.com>");
+MODULE_AUTHOR("André Draszik <andre.draszik@linaro.org>");
 MODULE_DESCRIPTION("Core driver for the Samsung S5M");
 MODULE_LICENSE("GPL");
diff --git a/drivers/mfd/sec-i2c.c b/drivers/mfd/sec-i2c.c
index 2ccb494c8c024361c78e92be71ce9c215757dd89..3132b849b4bc445cf18b2ef362092137a9b618c9 100644
--- a/drivers/mfd/sec-i2c.c
+++ b/drivers/mfd/sec-i2c.c
@@ -234,5 +234,6 @@ static struct i2c_driver sec_pmic_i2c_driver = {
 module_i2c_driver(sec_pmic_i2c_driver);
 
 MODULE_AUTHOR("Sangbeom Kim <sbkim73@samsung.com>");
+MODULE_AUTHOR("André Draszik <andre.draszik@linaro.org>");
 MODULE_DESCRIPTION("I2C driver for the Samsung S5M");
 MODULE_LICENSE("GPL");

-- 
2.49.0.604.gff1f9ca942-goog

