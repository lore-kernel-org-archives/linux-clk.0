Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 494511AF0AE
	for <linux-clk@vger.kernel.org>; Wed,  4 Dec 2024 11:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733310239; cv=none; b=HlL0sSB9I/exQhIZHkRzZCZptRa9dBoNKqyuJ7xKitkwUr5wkq5Hl3U1rk9uWDIpCsPIffGZG8kpN+brubgOKv1a64+f7qEDZdQk+dnnXvdeXK8WaIdGJ/O1/AvGWHc6vt1PEo546Ygp6T8IbzOeXiMeaUBx0+n9TW5Y4Kmjyfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733310239; c=relaxed/simple;
	bh=eK2bc+r40bXRT3jb7mE/fHjz/uhul0CcsjUEp7wenxI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BiH35G9BjKkkoKPHrJxOygEit9fVI3eM4kRn+YF+8dvoXk5nCeMbe01gsJQeTJbGcaUT6R88fZbbHokX1ZFdBlpZQe+8tWvdIPRhJoWWK6rHi7/qVTGS20x8nm5uJ5VVFIaoodQXG88Szt9nz6Trxu83cH39+75L2a9Y0Izh6bY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VkJPK65k; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VkJPK65k"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-434a29ecbceso7868355e9.0
        for <linux-clk@vger.kernel.org>; Wed, 04 Dec 2024 03:03:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733310236; x=1733915036; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pXai8rhzVjBb9mfuCX2EknVygzx13+OAyvruaefap38=;
        b=VkJPK65kFYRAS2L6G88U29eMo0IsDIGiWhubGN4sHbC/3GuoUcdzjXWISI1fr2xB8H
         /MXQLXs0c0QiAEIoiqj6r/Gan4JdFQyspPoAYkfOZ3XrRo1WDrGJokAwtF5cN/DhAxkK
         X/0fiznTIr3VocvuvzP4ZZPEqXv/Y6rXz239nzYJJWyZqe72QkNGL/7Wgh1p9NFgiF0K
         3HEGI+4BY1F/noq6DEshXNXB4EZaMPO733HwcmmcQ2U8H4S7ctJ117WTwxP0BuRcHKD9
         AVOaYlkkEk8NfxaV8Ya5QU1FI0HW/oBOMtrAyz100DFGbztPoAVe3xCU4tHjpub20zRj
         SR/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733310236; x=1733915036;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pXai8rhzVjBb9mfuCX2EknVygzx13+OAyvruaefap38=;
        b=sYK79MwD9SBkHiwAz/RpbN3lTPs4QOXO96R5o2aI0Mh1S9imBkq3+1KSbi/M5cAd0G
         HCWaPnMG7Ov0xOz7FyFTsdOkIsNKISptdW88O5E5x3dOdQ1H6s719dwabAeoJFubv0Fc
         Ls0xFG9UH5UvwRPwPw2Od+qlCn1mWspiO64GEPgkpbS3Dzn4XHSErZkPBMckEO9fB8Z8
         RtmLXdxEgEF8+6WI7HxgXE7wc0oh4DNaTEgkwrG+phzaGZhzkCqOgRRGcP1+BiUHsthY
         pYQ4nUy2979Qqwbv8vwZGCRBK3Zz7ZBehkR4REicpjcjdEuT5/zJr+iNKQZbxzuA8Ab6
         RsWA==
X-Forwarded-Encrypted: i=1; AJvYcCV0DILZC2Ybt3nOx0KljoK7c6SL3M6gp91V6X0MZSCAioNY5YrWDi73+wT5h7KzP/emefDhLNeCtWY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz38XMTVpk2A7k++VqskKS93XQQpWklx4Pc4sJbQ4958I3e7o+c
	qaa8AW47mdnbQ3mebwvyjkrHyfmNcNwJl8+OzpkqJemBn+YXccqk4ObfqL8DsIk=
X-Gm-Gg: ASbGncu3lqtmY60ulzzBxPvBL2YhHkN+VaLPggx2PVbFmxMpofftkdcz2TTSc2pzz07
	OF+etf9khvoBe0TjY8xjs7nbacKc+jCsdcPliB973dTh7YQVEhtgRSOCoxVBMtnLD7d3vhm+wqQ
	0anEbwdgeJdt4VEFMDOXtUh7kskaMUONx+vqCh2g6pjrB8uul1r9se8/iI6W69vtzpEhOqXU/yF
	OZebsmk1YIvi150S3p6DvDM10ZEeZV1XQbNbgNPZ5yVZDObNSKn0aQ6yDHNuTMN
X-Google-Smtp-Source: AGHT+IHWiRZoORgF6WlPwo4qs4jHYdRpmX8ARz8V02ny77m9pN0lXsWmbSkUvuTytBCsPVapmKBy5g==
X-Received: by 2002:a05:600c:3556:b0:431:4e33:98ae with SMTP id 5b1f17b1804b1-434d0a062bbmr20096375e9.5.1733310235583;
        Wed, 04 Dec 2024 03:03:55 -0800 (PST)
Received: from krzk-bin.. ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434d52a6aa9sm20445875e9.33.2024.12.04.03.03.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 03:03:54 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/2] clk: qcom: Include missing header includes
Date: Wed,  4 Dec 2024 12:03:48 +0100
Message-ID: <20241204110348.100841-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241204110348.100841-1-krzysztof.kozlowski@linaro.org>
References: <20241204110348.100841-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Include mod_devicetable.h for the 'struct of_device_id' and
clk-provider.h for the 'struct clk_hw'.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/clk/qcom/camcc-sc7180.c    | 1 +
 drivers/clk/qcom/camcc-sc7280.c    | 1 +
 drivers/clk/qcom/camcc-sdm845.c    | 1 +
 drivers/clk/qcom/camcc-sm6350.c    | 1 +
 drivers/clk/qcom/camcc-sm8150.c    | 1 +
 drivers/clk/qcom/camcc-sm8250.c    | 1 +
 drivers/clk/qcom/dispcc-qcm2290.c  | 2 ++
 drivers/clk/qcom/dispcc-sc7180.c   | 1 +
 drivers/clk/qcom/dispcc-sc7280.c   | 1 +
 drivers/clk/qcom/dispcc-sc8280xp.c | 1 +
 drivers/clk/qcom/dispcc-sdm845.c   | 1 +
 drivers/clk/qcom/dispcc-sm4450.c   | 1 +
 drivers/clk/qcom/dispcc-sm6115.c   | 2 ++
 drivers/clk/qcom/dispcc-sm6125.c   | 1 +
 drivers/clk/qcom/dispcc-sm6350.c   | 1 +
 drivers/clk/qcom/dispcc-sm6375.c   | 1 +
 drivers/clk/qcom/dispcc-sm8250.c   | 1 +
 drivers/clk/qcom/dispcc-sm8450.c   | 1 +
 drivers/clk/qcom/dispcc-sm8550.c   | 1 +
 drivers/clk/qcom/dispcc-sm8750.c   | 1 +
 drivers/clk/qcom/gpucc-msm8998.c   | 1 +
 drivers/clk/qcom/gpucc-sar2130p.c  | 1 +
 drivers/clk/qcom/gpucc-sc7180.c    | 1 +
 drivers/clk/qcom/gpucc-sc7280.c    | 1 +
 drivers/clk/qcom/gpucc-sc8280xp.c  | 1 +
 drivers/clk/qcom/gpucc-sdm660.c    | 1 +
 drivers/clk/qcom/gpucc-sdm845.c    | 1 +
 drivers/clk/qcom/gpucc-sm6350.c    | 1 +
 drivers/clk/qcom/gpucc-sm8150.c    | 1 +
 drivers/clk/qcom/gpucc-sm8250.c    | 1 +
 drivers/clk/qcom/gpucc-sm8350.c    | 1 +
 drivers/clk/qcom/mmcc-apq8084.c    | 1 +
 drivers/clk/qcom/mmcc-msm8960.c    | 1 +
 drivers/clk/qcom/mmcc-msm8974.c    | 1 +
 drivers/clk/qcom/mmcc-msm8994.c    | 1 +
 drivers/clk/qcom/mmcc-msm8996.c    | 1 +
 drivers/clk/qcom/mmcc-msm8998.c    | 1 +
 drivers/clk/qcom/mmcc-sdm660.c     | 1 +
 38 files changed, 40 insertions(+)

diff --git a/drivers/clk/qcom/camcc-sc7180.c b/drivers/clk/qcom/camcc-sc7180.c
index a69b70ab1a70..5031df813b4a 100644
--- a/drivers/clk/qcom/camcc-sc7180.c
+++ b/drivers/clk/qcom/camcc-sc7180.c
@@ -5,6 +5,7 @@
 
 #include <linux/clk-provider.h>
 #include <linux/err.h>
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/pm_clock.h>
diff --git a/drivers/clk/qcom/camcc-sc7280.c b/drivers/clk/qcom/camcc-sc7280.c
index 5a9992a5b5ba..55545f5fdb98 100644
--- a/drivers/clk/qcom/camcc-sc7280.c
+++ b/drivers/clk/qcom/camcc-sc7280.c
@@ -7,6 +7,7 @@
 #include <linux/clk-provider.h>
 #include <linux/err.h>
 #include <linux/kernel.h>
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
diff --git a/drivers/clk/qcom/camcc-sdm845.c b/drivers/clk/qcom/camcc-sdm845.c
index 40022a10f8c0..cf60e8dd292a 100644
--- a/drivers/clk/qcom/camcc-sdm845.c
+++ b/drivers/clk/qcom/camcc-sdm845.c
@@ -4,6 +4,7 @@
  */
 
 #include <linux/clk-provider.h>
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
diff --git a/drivers/clk/qcom/camcc-sm6350.c b/drivers/clk/qcom/camcc-sm6350.c
index f6634cc8663e..1871970fb046 100644
--- a/drivers/clk/qcom/camcc-sm6350.c
+++ b/drivers/clk/qcom/camcc-sm6350.c
@@ -5,6 +5,7 @@
  */
 
 #include <linux/clk-provider.h>
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
diff --git a/drivers/clk/qcom/camcc-sm8150.c b/drivers/clk/qcom/camcc-sm8150.c
index ed96dcb885b3..f105534cb318 100644
--- a/drivers/clk/qcom/camcc-sm8150.c
+++ b/drivers/clk/qcom/camcc-sm8150.c
@@ -6,6 +6,7 @@
 #include <linux/clk-provider.h>
 #include <linux/err.h>
 #include <linux/kernel.h>
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
diff --git a/drivers/clk/qcom/camcc-sm8250.c b/drivers/clk/qcom/camcc-sm8250.c
index dcbc6c354e5a..2b84b1a0ac9c 100644
--- a/drivers/clk/qcom/camcc-sm8250.c
+++ b/drivers/clk/qcom/camcc-sm8250.c
@@ -4,6 +4,7 @@
  */
 
 #include <linux/clk-provider.h>
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
diff --git a/drivers/clk/qcom/dispcc-qcm2290.c b/drivers/clk/qcom/dispcc-qcm2290.c
index bf0ff76e0745..8b7eafa4e251 100644
--- a/drivers/clk/qcom/dispcc-qcm2290.c
+++ b/drivers/clk/qcom/dispcc-qcm2290.c
@@ -4,8 +4,10 @@
  * Copyright (c) 2021, Linaro Ltd.
  */
 
+#include <linux/clk-provider.h>
 #include <linux/err.h>
 #include <linux/kernel.h>
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
diff --git a/drivers/clk/qcom/dispcc-sc7180.c b/drivers/clk/qcom/dispcc-sc7180.c
index 4710247be530..ab1a8d419863 100644
--- a/drivers/clk/qcom/dispcc-sc7180.c
+++ b/drivers/clk/qcom/dispcc-sc7180.c
@@ -4,6 +4,7 @@
  */
 
 #include <linux/clk-provider.h>
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
diff --git a/drivers/clk/qcom/dispcc-sc7280.c b/drivers/clk/qcom/dispcc-sc7280.c
index db0745954894..8bdf57734a3d 100644
--- a/drivers/clk/qcom/dispcc-sc7280.c
+++ b/drivers/clk/qcom/dispcc-sc7280.c
@@ -4,6 +4,7 @@
  */
 
 #include <linux/clk-provider.h>
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
diff --git a/drivers/clk/qcom/dispcc-sc8280xp.c b/drivers/clk/qcom/dispcc-sc8280xp.c
index 0a810fc847ce..34fae823423a 100644
--- a/drivers/clk/qcom/dispcc-sc8280xp.c
+++ b/drivers/clk/qcom/dispcc-sc8280xp.c
@@ -5,6 +5,7 @@
  */
 
 #include <linux/clk-provider.h>
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/pm_clock.h>
diff --git a/drivers/clk/qcom/dispcc-sdm845.c b/drivers/clk/qcom/dispcc-sdm845.c
index 94079c54333f..2f9e9665d7e9 100644
--- a/drivers/clk/qcom/dispcc-sdm845.c
+++ b/drivers/clk/qcom/dispcc-sdm845.c
@@ -4,6 +4,7 @@
  */
 
 #include <linux/clk-provider.h>
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
diff --git a/drivers/clk/qcom/dispcc-sm4450.c b/drivers/clk/qcom/dispcc-sm4450.c
index 465725f9bfeb..cd8a284258b2 100644
--- a/drivers/clk/qcom/dispcc-sm4450.c
+++ b/drivers/clk/qcom/dispcc-sm4450.c
@@ -4,6 +4,7 @@
  */
 
 #include <linux/clk-provider.h>
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/mod_devicetable.h>
 #include <linux/platform_device.h>
diff --git a/drivers/clk/qcom/dispcc-sm6115.c b/drivers/clk/qcom/dispcc-sm6115.c
index 5790253e7d89..185a8f54bde1 100644
--- a/drivers/clk/qcom/dispcc-sm6115.c
+++ b/drivers/clk/qcom/dispcc-sm6115.c
@@ -5,8 +5,10 @@
  * Copyright (c) 2021, Linaro Ltd.
  */
 
+#include <linux/clk-provider.h>
 #include <linux/err.h>
 #include <linux/kernel.h>
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
diff --git a/drivers/clk/qcom/dispcc-sm6125.c b/drivers/clk/qcom/dispcc-sm6125.c
index 51c7492816fb..851d38a487d3 100644
--- a/drivers/clk/qcom/dispcc-sm6125.c
+++ b/drivers/clk/qcom/dispcc-sm6125.c
@@ -4,6 +4,7 @@
  */
 
 #include <linux/clk-provider.h>
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
diff --git a/drivers/clk/qcom/dispcc-sm6350.c b/drivers/clk/qcom/dispcc-sm6350.c
index 50facb36701a..ede3552fde9e 100644
--- a/drivers/clk/qcom/dispcc-sm6350.c
+++ b/drivers/clk/qcom/dispcc-sm6350.c
@@ -5,6 +5,7 @@
  */
 
 #include <linux/clk-provider.h>
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
diff --git a/drivers/clk/qcom/dispcc-sm6375.c b/drivers/clk/qcom/dispcc-sm6375.c
index 167dd369a794..ec9dbb1f4a7c 100644
--- a/drivers/clk/qcom/dispcc-sm6375.c
+++ b/drivers/clk/qcom/dispcc-sm6375.c
@@ -5,6 +5,7 @@
  */
 
 #include <linux/clk-provider.h>
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
diff --git a/drivers/clk/qcom/dispcc-sm8250.c b/drivers/clk/qcom/dispcc-sm8250.c
index 1f48e79acfac..8f433e1e7028 100644
--- a/drivers/clk/qcom/dispcc-sm8250.c
+++ b/drivers/clk/qcom/dispcc-sm8250.c
@@ -4,6 +4,7 @@
  */
 
 #include <linux/clk-provider.h>
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
diff --git a/drivers/clk/qcom/dispcc-sm8450.c b/drivers/clk/qcom/dispcc-sm8450.c
index 96987d8445cb..0b76cddbeb94 100644
--- a/drivers/clk/qcom/dispcc-sm8450.c
+++ b/drivers/clk/qcom/dispcc-sm8450.c
@@ -7,6 +7,7 @@
 #include <linux/clk-provider.h>
 #include <linux/err.h>
 #include <linux/kernel.h>
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
diff --git a/drivers/clk/qcom/dispcc-sm8550.c b/drivers/clk/qcom/dispcc-sm8550.c
index 4c5feb96ae53..a373c92a10aa 100644
--- a/drivers/clk/qcom/dispcc-sm8550.c
+++ b/drivers/clk/qcom/dispcc-sm8550.c
@@ -7,6 +7,7 @@
 #include <linux/clk-provider.h>
 #include <linux/err.h>
 #include <linux/kernel.h>
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
diff --git a/drivers/clk/qcom/dispcc-sm8750.c b/drivers/clk/qcom/dispcc-sm8750.c
index a085a9e67f3b..9216c37246ab 100644
--- a/drivers/clk/qcom/dispcc-sm8750.c
+++ b/drivers/clk/qcom/dispcc-sm8750.c
@@ -7,6 +7,7 @@
 #include <linux/clk-provider.h>
 #include <linux/err.h>
 #include <linux/kernel.h>
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
diff --git a/drivers/clk/qcom/gpucc-msm8998.c b/drivers/clk/qcom/gpucc-msm8998.c
index 066793e47f79..7fce70503141 100644
--- a/drivers/clk/qcom/gpucc-msm8998.c
+++ b/drivers/clk/qcom/gpucc-msm8998.c
@@ -7,6 +7,7 @@
 #include <linux/bitops.h>
 #include <linux/err.h>
 #include <linux/platform_device.h>
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/clk-provider.h>
 #include <linux/regmap.h>
diff --git a/drivers/clk/qcom/gpucc-sar2130p.c b/drivers/clk/qcom/gpucc-sar2130p.c
index dd72b2a48c42..c2903179ac85 100644
--- a/drivers/clk/qcom/gpucc-sar2130p.c
+++ b/drivers/clk/qcom/gpucc-sar2130p.c
@@ -6,6 +6,7 @@
 
 #include <linux/clk-provider.h>
 #include <linux/kernel.h>
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
diff --git a/drivers/clk/qcom/gpucc-sc7180.c b/drivers/clk/qcom/gpucc-sc7180.c
index 08f3983d016f..a7bf44544b95 100644
--- a/drivers/clk/qcom/gpucc-sc7180.c
+++ b/drivers/clk/qcom/gpucc-sc7180.c
@@ -4,6 +4,7 @@
  */
 
 #include <linux/clk-provider.h>
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
diff --git a/drivers/clk/qcom/gpucc-sc7280.c b/drivers/clk/qcom/gpucc-sc7280.c
index bd699a624517..f81289fa719d 100644
--- a/drivers/clk/qcom/gpucc-sc7280.c
+++ b/drivers/clk/qcom/gpucc-sc7280.c
@@ -5,6 +5,7 @@
  */
 
 #include <linux/clk-provider.h>
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
diff --git a/drivers/clk/qcom/gpucc-sc8280xp.c b/drivers/clk/qcom/gpucc-sc8280xp.c
index c96be61e3f47..913e17f10196 100644
--- a/drivers/clk/qcom/gpucc-sc8280xp.c
+++ b/drivers/clk/qcom/gpucc-sc8280xp.c
@@ -5,6 +5,7 @@
 
 #include <linux/clk-provider.h>
 #include <linux/kernel.h>
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
diff --git a/drivers/clk/qcom/gpucc-sdm660.c b/drivers/clk/qcom/gpucc-sdm660.c
index 6d37b3d8d1a4..28db307b6717 100644
--- a/drivers/clk/qcom/gpucc-sdm660.c
+++ b/drivers/clk/qcom/gpucc-sdm660.c
@@ -9,6 +9,7 @@
 #include <linux/clk-provider.h>
 #include <linux/err.h>
 #include <linux/kernel.h>
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
diff --git a/drivers/clk/qcom/gpucc-sdm845.c b/drivers/clk/qcom/gpucc-sdm845.c
index ef26690cf504..0d63b110a1fb 100644
--- a/drivers/clk/qcom/gpucc-sdm845.c
+++ b/drivers/clk/qcom/gpucc-sdm845.c
@@ -4,6 +4,7 @@
  */
 
 #include <linux/clk-provider.h>
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
diff --git a/drivers/clk/qcom/gpucc-sm6350.c b/drivers/clk/qcom/gpucc-sm6350.c
index 1e12ad8948db..35ed0500bc59 100644
--- a/drivers/clk/qcom/gpucc-sm6350.c
+++ b/drivers/clk/qcom/gpucc-sm6350.c
@@ -5,6 +5,7 @@
  */
 
 #include <linux/clk-provider.h>
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
diff --git a/drivers/clk/qcom/gpucc-sm8150.c b/drivers/clk/qcom/gpucc-sm8150.c
index d711464a71b6..7ce91208c0bc 100644
--- a/drivers/clk/qcom/gpucc-sm8150.c
+++ b/drivers/clk/qcom/gpucc-sm8150.c
@@ -4,6 +4,7 @@
  */
 
 #include <linux/clk-provider.h>
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
diff --git a/drivers/clk/qcom/gpucc-sm8250.c b/drivers/clk/qcom/gpucc-sm8250.c
index 113b486a6d2f..ca0a1681d352 100644
--- a/drivers/clk/qcom/gpucc-sm8250.c
+++ b/drivers/clk/qcom/gpucc-sm8250.c
@@ -4,6 +4,7 @@
  */
 
 #include <linux/clk-provider.h>
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
diff --git a/drivers/clk/qcom/gpucc-sm8350.c b/drivers/clk/qcom/gpucc-sm8350.c
index 6d2660bdd825..4025dab0a1ca 100644
--- a/drivers/clk/qcom/gpucc-sm8350.c
+++ b/drivers/clk/qcom/gpucc-sm8350.c
@@ -8,6 +8,7 @@
 #include <linux/clk.h>
 #include <linux/err.h>
 #include <linux/kernel.h>
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
diff --git a/drivers/clk/qcom/mmcc-apq8084.c b/drivers/clk/qcom/mmcc-apq8084.c
index 3affa525b875..2d334977d783 100644
--- a/drivers/clk/qcom/mmcc-apq8084.c
+++ b/drivers/clk/qcom/mmcc-apq8084.c
@@ -6,6 +6,7 @@
 #include <linux/clk-provider.h>
 #include <linux/kernel.h>
 #include <linux/platform_device.h>
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/regmap.h>
 
diff --git a/drivers/clk/qcom/mmcc-msm8960.c b/drivers/clk/qcom/mmcc-msm8960.c
index c0adb2b86718..595cc065ab9c 100644
--- a/drivers/clk/qcom/mmcc-msm8960.c
+++ b/drivers/clk/qcom/mmcc-msm8960.c
@@ -8,6 +8,7 @@
 #include <linux/err.h>
 #include <linux/delay.h>
 #include <linux/platform_device.h>
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/clk.h>
 #include <linux/clk-provider.h>
diff --git a/drivers/clk/qcom/mmcc-msm8974.c b/drivers/clk/qcom/mmcc-msm8974.c
index f2e802cf6afc..12bbc49c87af 100644
--- a/drivers/clk/qcom/mmcc-msm8974.c
+++ b/drivers/clk/qcom/mmcc-msm8974.c
@@ -7,6 +7,7 @@
 #include <linux/bitops.h>
 #include <linux/err.h>
 #include <linux/platform_device.h>
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/clk-provider.h>
diff --git a/drivers/clk/qcom/mmcc-msm8994.c b/drivers/clk/qcom/mmcc-msm8994.c
index 0a273630e852..7c0b959a4aa2 100644
--- a/drivers/clk/qcom/mmcc-msm8994.c
+++ b/drivers/clk/qcom/mmcc-msm8994.c
@@ -7,6 +7,7 @@
 #include <linux/bitops.h>
 #include <linux/err.h>
 #include <linux/platform_device.h>
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/clk-provider.h>
diff --git a/drivers/clk/qcom/mmcc-msm8996.c b/drivers/clk/qcom/mmcc-msm8996.c
index 3426e3dde924..7d67c6f73fe1 100644
--- a/drivers/clk/qcom/mmcc-msm8996.c
+++ b/drivers/clk/qcom/mmcc-msm8996.c
@@ -7,6 +7,7 @@
 #include <linux/bitops.h>
 #include <linux/err.h>
 #include <linux/platform_device.h>
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/clk-provider.h>
 #include <linux/regmap.h>
diff --git a/drivers/clk/qcom/mmcc-msm8998.c b/drivers/clk/qcom/mmcc-msm8998.c
index 5c37be700fa7..e2f198213b21 100644
--- a/drivers/clk/qcom/mmcc-msm8998.c
+++ b/drivers/clk/qcom/mmcc-msm8998.c
@@ -7,6 +7,7 @@
 #include <linux/bitops.h>
 #include <linux/err.h>
 #include <linux/platform_device.h>
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/clk-provider.h>
 #include <linux/regmap.h>
diff --git a/drivers/clk/qcom/mmcc-sdm660.c b/drivers/clk/qcom/mmcc-sdm660.c
index b3beeabe39ed..e5bdcc75a36e 100644
--- a/drivers/clk/qcom/mmcc-sdm660.c
+++ b/drivers/clk/qcom/mmcc-sdm660.c
@@ -9,6 +9,7 @@
 #include <linux/bitops.h>
 #include <linux/err.h>
 #include <linux/platform_device.h>
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/clk-provider.h>
 #include <linux/regmap.h>
-- 
2.43.0

