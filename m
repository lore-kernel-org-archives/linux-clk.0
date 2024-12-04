Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D77E41B0F2E
	for <linux-clk@vger.kernel.org>; Wed,  4 Dec 2024 11:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733310239; cv=none; b=Di7nAG5KOaWC124Xwv07Jk73g4GO3oE3bursU2PUNG/O2AjB07WAGSjruUCCXqH39eqbnWNarhmyDilx1TI+SmN94J6h+0lX0L2bDQ5H8uTHh76Oc0DAZ5OquibzahW8ITeODo4DGvqcRB6zn7eOytANP4RkbjHtbe6QZObeMSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733310239; c=relaxed/simple;
	bh=HwQULjtZoCnIZhnviTpDylo0k0BrxR0OmasICKiucVQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=O50Rvf6VsZmumgifIfawvYUHTPr/sIFHQyN1/eeLA4B8LWFBSkdlC08YndvrjrL0Sdrwu/AfbNLWGKgr1doTl7PLWNd8meaYnuJYnKXLkgYzE9h7f9+82Yyvm5pWnBUToJGLKUMltQMBcX4NKzGwETGlBb+RIOysdd14ifXGbUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Zr+W4TVh; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Zr+W4TVh"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-434a0300d4cso5934295e9.3
        for <linux-clk@vger.kernel.org>; Wed, 04 Dec 2024 03:03:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733310234; x=1733915034; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pEtsPx1N9q/msevZzeL8uie551bRgE5h4Ujcp6NpSeo=;
        b=Zr+W4TVh1jDEWSyqU0E2HPafB3yGh+rCl8fh1+hTLIdCBPHvf+11OC4Kl5dLqhyhdL
         F1s9VG7AUvYdcVHH1mMGKrC4fS92gvRQGEtZITpUMdPDal/wmWCPNgQ9FN3vhsjHvE/k
         AS9g+aX+Lrwe5EFX72edZFFwQt+NoSx7T+FKlWIYdrrt8oYzjAUk8kMfoUbJWZzkHLSZ
         uiaLHn58rEjeLRKWn56ftt753p4eg6aCr0hEMG1NFFwF3XVcYtEgXxCuJkAI6yMFDe0R
         z8ZGS663MnSUaqbj3uIrk1rTN0OCWz5O33HfJUh/YDC70584XqJgCXQl3/8lMZHb3vKB
         UJ5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733310234; x=1733915034;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pEtsPx1N9q/msevZzeL8uie551bRgE5h4Ujcp6NpSeo=;
        b=K5Q89iagAJFD+JDqsZEz3v5P8eGg/bDc5Wi0Lx/cr55+WFQooomxJkG/SRXfydbLKn
         shTiWQVxVB1G0G5MigCqSLSttrNjfgQCVhBVXu0G+E4aaj4zAJPMV+9F1SgKVwLxsJhC
         TuhzAF+fghyZHqbzYhqvCgorXAQhWUEvaEPye37eZ8qHa5/MFGg+bggJaFFd/09wOXpv
         4G8jkJC6H0tT7sVLXFJxdgWqlXpp0zdn9GOLTcRCJuU26/S549x/72GGaqOy4HF1OViX
         DErmtKnfL8MsL7KCIfZPJxOkMyOKq1+AvreRfV5EqVNlh8zgIBmLPhEJSwygC2+Ja7H0
         o9bA==
X-Forwarded-Encrypted: i=1; AJvYcCW12Ii0UPhcPUGgSdkJmHenEwZbuCWZhNCoQ5rcnxLDtXOP90MUC1zno0tW/eARHae431HrDhPky0A=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8I9xHoFApT4mctKkGEbtnXu+fE0MxafqHJTp9U7Y60AjgYC6f
	TupswZxEhVwpwe0fnU0Q4eRQoG2jvsL6ISXbUCny7v4YI66bcSskv13Qgm+wWE0=
X-Gm-Gg: ASbGncv5XXGVzk1q1nxmXy1LqwR2tJqGCaOcjJD3RK7Pvr1u826rhKjM2YMAaDLpYbs
	bgSwsQEBEXGb6Jn8Y5N4aDKTcn6deZU2wrn++b+L82UEFHV6dEtQJ93qSrrqhKcgICmezGM0ZKb
	7m00s7FCVeyE8gJ+rzNVNr/ArZp97bzFW8ZAx7ty5UG1CoU/OPSDZivhOWWlp4GGLNttgELGXmg
	ZZ5/IAaXaUt8LoMX/b/RMprtH/DFAbpc3L0XRg9vBIaJqRLagnoQxumkaqNOxum
X-Google-Smtp-Source: AGHT+IF2Bul51lXYvpNGLu37H17FnxzETxdYp547y3amX+SfMaaNXNCLoRYGjnL49oQMT3OUagPHSA==
X-Received: by 2002:a05:600c:a07:b0:42c:aeee:80a with SMTP id 5b1f17b1804b1-434d11c7b9dmr19696715e9.7.1733310234134;
        Wed, 04 Dec 2024 03:03:54 -0800 (PST)
Received: from krzk-bin.. ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434d52a6aa9sm20445875e9.33.2024.12.04.03.03.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 03:03:53 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/2] clk: qcom: Drop unused header includes
Date: Wed,  4 Dec 2024 12:03:47 +0100
Message-ID: <20241204110348.100841-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drivers should include only headers they use so drop:
1. of.h and of_address.h: When no OF call is used (of_device_id is
   coming from mod_devicetable.h).
2. clk.h, property.h and reset-controller.h: No calls to clock consumer
   or reset framework, no fwnode/property calls.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/clk/qcom/camcc-sa8775p.c      | 1 -
 drivers/clk/qcom/camcc-sc7180.c       | 1 -
 drivers/clk/qcom/camcc-sc7280.c       | 1 -
 drivers/clk/qcom/camcc-sm4450.c       | 1 -
 drivers/clk/qcom/camcc-sm7150.c       | 1 -
 drivers/clk/qcom/camcc-sm8150.c       | 1 -
 drivers/clk/qcom/camcc-sm8250.c       | 1 -
 drivers/clk/qcom/dispcc-qcm2290.c     | 1 -
 drivers/clk/qcom/dispcc-sc8280xp.c    | 2 --
 drivers/clk/qcom/dispcc-sdm845.c      | 1 -
 drivers/clk/qcom/dispcc-sm4450.c      | 1 -
 drivers/clk/qcom/dispcc-sm6115.c      | 1 -
 drivers/clk/qcom/dispcc-sm7150.c      | 1 -
 drivers/clk/qcom/dispcc-sm8250.c      | 1 -
 drivers/clk/qcom/dispcc-sm8450.c      | 2 --
 drivers/clk/qcom/dispcc-sm8550.c      | 2 --
 drivers/clk/qcom/dispcc-sm8750.c      | 2 --
 drivers/clk/qcom/dispcc0-sa8775p.c    | 1 -
 drivers/clk/qcom/dispcc1-sa8775p.c    | 1 -
 drivers/clk/qcom/gcc-msm8960.c        | 1 -
 drivers/clk/qcom/gcc-msm8974.c        | 1 -
 drivers/clk/qcom/gpucc-msm8998.c      | 2 --
 drivers/clk/qcom/gpucc-sdm660.c       | 4 +---
 drivers/clk/qcom/gpucc-sm4450.c       | 1 -
 drivers/clk/qcom/gpucc-sm8350.c       | 1 -
 drivers/clk/qcom/kpss-xcc.c           | 1 -
 drivers/clk/qcom/krait-cc.c           | 1 -
 drivers/clk/qcom/lpasscc-sdm845.c     | 1 -
 drivers/clk/qcom/lpasscorecc-sc7180.c | 1 -
 drivers/clk/qcom/lpasscorecc-sc7280.c | 1 -
 drivers/clk/qcom/mmcc-apq8084.c       | 1 -
 drivers/clk/qcom/mmcc-msm8960.c       | 3 ---
 drivers/clk/qcom/mmcc-msm8974.c       | 1 -
 drivers/clk/qcom/mmcc-msm8994.c       | 2 --
 drivers/clk/qcom/mmcc-msm8996.c       | 3 ---
 drivers/clk/qcom/mmcc-msm8998.c       | 2 --
 drivers/clk/qcom/mmcc-sdm660.c        | 5 -----
 37 files changed, 1 insertion(+), 54 deletions(-)

diff --git a/drivers/clk/qcom/camcc-sa8775p.c b/drivers/clk/qcom/camcc-sa8775p.c
index c04801a5af35..1df86da41940 100644
--- a/drivers/clk/qcom/camcc-sa8775p.c
+++ b/drivers/clk/qcom/camcc-sa8775p.c
@@ -6,7 +6,6 @@
 #include <linux/clk-provider.h>
 #include <linux/module.h>
 #include <linux/mod_devicetable.h>
-#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
diff --git a/drivers/clk/qcom/camcc-sc7180.c b/drivers/clk/qcom/camcc-sc7180.c
index 10e924cd533d..a69b70ab1a70 100644
--- a/drivers/clk/qcom/camcc-sc7180.c
+++ b/drivers/clk/qcom/camcc-sc7180.c
@@ -6,7 +6,6 @@
 #include <linux/clk-provider.h>
 #include <linux/err.h>
 #include <linux/module.h>
-#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/pm_clock.h>
 #include <linux/pm_runtime.h>
diff --git a/drivers/clk/qcom/camcc-sc7280.c b/drivers/clk/qcom/camcc-sc7280.c
index accd257632df..5a9992a5b5ba 100644
--- a/drivers/clk/qcom/camcc-sc7280.c
+++ b/drivers/clk/qcom/camcc-sc7280.c
@@ -8,7 +8,6 @@
 #include <linux/err.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
-#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 
diff --git a/drivers/clk/qcom/camcc-sm4450.c b/drivers/clk/qcom/camcc-sm4450.c
index f8503ced3d05..e51590d89a3c 100644
--- a/drivers/clk/qcom/camcc-sm4450.c
+++ b/drivers/clk/qcom/camcc-sm4450.c
@@ -6,7 +6,6 @@
 #include <linux/clk-provider.h>
 #include <linux/module.h>
 #include <linux/mod_devicetable.h>
-#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 
diff --git a/drivers/clk/qcom/camcc-sm7150.c b/drivers/clk/qcom/camcc-sm7150.c
index 39033a6bb616..4a3baf5d8e85 100644
--- a/drivers/clk/qcom/camcc-sm7150.c
+++ b/drivers/clk/qcom/camcc-sm7150.c
@@ -7,7 +7,6 @@
 #include <linux/clk-provider.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
-#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 
diff --git a/drivers/clk/qcom/camcc-sm8150.c b/drivers/clk/qcom/camcc-sm8150.c
index bb3009818ad7..ed96dcb885b3 100644
--- a/drivers/clk/qcom/camcc-sm8150.c
+++ b/drivers/clk/qcom/camcc-sm8150.c
@@ -8,7 +8,6 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
-#include <linux/of.h>
 #include <linux/regmap.h>
 #include <linux/pm_runtime.h>
 
diff --git a/drivers/clk/qcom/camcc-sm8250.c b/drivers/clk/qcom/camcc-sm8250.c
index 34d2f17520dc..dcbc6c354e5a 100644
--- a/drivers/clk/qcom/camcc-sm8250.c
+++ b/drivers/clk/qcom/camcc-sm8250.c
@@ -7,7 +7,6 @@
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
-#include <linux/reset-controller.h>
 
 #include <dt-bindings/clock/qcom,camcc-sm8250.h>
 
diff --git a/drivers/clk/qcom/dispcc-qcm2290.c b/drivers/clk/qcom/dispcc-qcm2290.c
index 449ffea2295d..bf0ff76e0745 100644
--- a/drivers/clk/qcom/dispcc-qcm2290.c
+++ b/drivers/clk/qcom/dispcc-qcm2290.c
@@ -7,7 +7,6 @@
 #include <linux/err.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
-#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 
diff --git a/drivers/clk/qcom/dispcc-sc8280xp.c b/drivers/clk/qcom/dispcc-sc8280xp.c
index f1ca9ae0b33f..0a810fc847ce 100644
--- a/drivers/clk/qcom/dispcc-sc8280xp.c
+++ b/drivers/clk/qcom/dispcc-sc8280xp.c
@@ -7,11 +7,9 @@
 #include <linux/clk-provider.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
-#include <linux/property.h>
 #include <linux/pm_clock.h>
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
-#include <linux/reset-controller.h>
 
 #include <dt-bindings/clock/qcom,dispcc-sc8280xp.h>
 
diff --git a/drivers/clk/qcom/dispcc-sdm845.c b/drivers/clk/qcom/dispcc-sdm845.c
index e6139e8f74dc..94079c54333f 100644
--- a/drivers/clk/qcom/dispcc-sdm845.c
+++ b/drivers/clk/qcom/dispcc-sdm845.c
@@ -7,7 +7,6 @@
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
-#include <linux/reset-controller.h>
 
 #include <dt-bindings/clock/qcom,dispcc-sdm845.h>
 
diff --git a/drivers/clk/qcom/dispcc-sm4450.c b/drivers/clk/qcom/dispcc-sm4450.c
index 98ba016bc57f..465725f9bfeb 100644
--- a/drivers/clk/qcom/dispcc-sm4450.c
+++ b/drivers/clk/qcom/dispcc-sm4450.c
@@ -6,7 +6,6 @@
 #include <linux/clk-provider.h>
 #include <linux/module.h>
 #include <linux/mod_devicetable.h>
-#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 
diff --git a/drivers/clk/qcom/dispcc-sm6115.c b/drivers/clk/qcom/dispcc-sm6115.c
index 939887f82ecc..5790253e7d89 100644
--- a/drivers/clk/qcom/dispcc-sm6115.c
+++ b/drivers/clk/qcom/dispcc-sm6115.c
@@ -8,7 +8,6 @@
 #include <linux/err.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
-#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 
diff --git a/drivers/clk/qcom/dispcc-sm7150.c b/drivers/clk/qcom/dispcc-sm7150.c
index d32bd7df1433..bdfff246ed3f 100644
--- a/drivers/clk/qcom/dispcc-sm7150.c
+++ b/drivers/clk/qcom/dispcc-sm7150.c
@@ -8,7 +8,6 @@
 #include <linux/clk-provider.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
-#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 
diff --git a/drivers/clk/qcom/dispcc-sm8250.c b/drivers/clk/qcom/dispcc-sm8250.c
index 884bbd3fb305..1f48e79acfac 100644
--- a/drivers/clk/qcom/dispcc-sm8250.c
+++ b/drivers/clk/qcom/dispcc-sm8250.c
@@ -8,7 +8,6 @@
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
-#include <linux/reset-controller.h>
 
 #include <dt-bindings/clock/qcom,dispcc-sm8250.h>
 
diff --git a/drivers/clk/qcom/dispcc-sm8450.c b/drivers/clk/qcom/dispcc-sm8450.c
index a1f183e6c636..96987d8445cb 100644
--- a/drivers/clk/qcom/dispcc-sm8450.c
+++ b/drivers/clk/qcom/dispcc-sm8450.c
@@ -4,12 +4,10 @@
  * Copyright (c) 2022, Linaro Ltd.
  */
 
-#include <linux/clk.h>
 #include <linux/clk-provider.h>
 #include <linux/err.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
-#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 #include <linux/pm_runtime.h>
diff --git a/drivers/clk/qcom/dispcc-sm8550.c b/drivers/clk/qcom/dispcc-sm8550.c
index e41d4104d770..4c5feb96ae53 100644
--- a/drivers/clk/qcom/dispcc-sm8550.c
+++ b/drivers/clk/qcom/dispcc-sm8550.c
@@ -4,12 +4,10 @@
  * Copyright (c) 2023, Linaro Ltd.
  */
 
-#include <linux/clk.h>
 #include <linux/clk-provider.h>
 #include <linux/err.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
-#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 #include <linux/pm_runtime.h>
diff --git a/drivers/clk/qcom/dispcc-sm8750.c b/drivers/clk/qcom/dispcc-sm8750.c
index ff64ff93c4db..a085a9e67f3b 100644
--- a/drivers/clk/qcom/dispcc-sm8750.c
+++ b/drivers/clk/qcom/dispcc-sm8750.c
@@ -4,12 +4,10 @@
  * Copyright (c) 2023-2024, Linaro Ltd.
  */
 
-#include <linux/clk.h>
 #include <linux/clk-provider.h>
 #include <linux/err.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
-#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 #include <linux/pm_runtime.h>
diff --git a/drivers/clk/qcom/dispcc0-sa8775p.c b/drivers/clk/qcom/dispcc0-sa8775p.c
index 6e399b5f1383..bf9de92a5dd2 100644
--- a/drivers/clk/qcom/dispcc0-sa8775p.c
+++ b/drivers/clk/qcom/dispcc0-sa8775p.c
@@ -6,7 +6,6 @@
 #include <linux/clk-provider.h>
 #include <linux/module.h>
 #include <linux/mod_devicetable.h>
-#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
diff --git a/drivers/clk/qcom/dispcc1-sa8775p.c b/drivers/clk/qcom/dispcc1-sa8775p.c
index 30ccea59415a..cd2f2eb7ffb4 100644
--- a/drivers/clk/qcom/dispcc1-sa8775p.c
+++ b/drivers/clk/qcom/dispcc1-sa8775p.c
@@ -6,7 +6,6 @@
 #include <linux/clk-provider.h>
 #include <linux/module.h>
 #include <linux/mod_devicetable.h>
-#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
diff --git a/drivers/clk/qcom/gcc-msm8960.c b/drivers/clk/qcom/gcc-msm8960.c
index 9ddce11db6df..c2e4fa5d63ad 100644
--- a/drivers/clk/qcom/gcc-msm8960.c
+++ b/drivers/clk/qcom/gcc-msm8960.c
@@ -7,7 +7,6 @@
 #include <linux/bitops.h>
 #include <linux/err.h>
 #include <linux/platform_device.h>
-#include <linux/property.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_platform.h>
diff --git a/drivers/clk/qcom/gcc-msm8974.c b/drivers/clk/qcom/gcc-msm8974.c
index b32e66714951..92ad35cfb75e 100644
--- a/drivers/clk/qcom/gcc-msm8974.c
+++ b/drivers/clk/qcom/gcc-msm8974.c
@@ -7,7 +7,6 @@
 #include <linux/bitops.h>
 #include <linux/err.h>
 #include <linux/platform_device.h>
-#include <linux/property.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/clk-provider.h>
diff --git a/drivers/clk/qcom/gpucc-msm8998.c b/drivers/clk/qcom/gpucc-msm8998.c
index 9efeab2691ba..066793e47f79 100644
--- a/drivers/clk/qcom/gpucc-msm8998.c
+++ b/drivers/clk/qcom/gpucc-msm8998.c
@@ -8,10 +8,8 @@
 #include <linux/err.h>
 #include <linux/platform_device.h>
 #include <linux/module.h>
-#include <linux/of.h>
 #include <linux/clk-provider.h>
 #include <linux/regmap.h>
-#include <linux/reset-controller.h>
 
 #include <dt-bindings/clock/qcom,gpucc-msm8998.h>
 
diff --git a/drivers/clk/qcom/gpucc-sdm660.c b/drivers/clk/qcom/gpucc-sdm660.c
index 3ae1b80e38d9..6d37b3d8d1a4 100644
--- a/drivers/clk/qcom/gpucc-sdm660.c
+++ b/drivers/clk/qcom/gpucc-sdm660.c
@@ -6,15 +6,13 @@
  */
 
 #include <linux/bitops.h>
-#include <linux/clk.h>
 #include <linux/clk-provider.h>
 #include <linux/err.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
-#include <linux/of.h>
 #include <linux/regmap.h>
-#include <linux/reset-controller.h>
+
 #include <dt-bindings/clock/qcom,gpucc-sdm660.h>
 
 #include "clk-alpha-pll.h"
diff --git a/drivers/clk/qcom/gpucc-sm4450.c b/drivers/clk/qcom/gpucc-sm4450.c
index a14d0bb031ac..34c7ba0c7d55 100644
--- a/drivers/clk/qcom/gpucc-sm4450.c
+++ b/drivers/clk/qcom/gpucc-sm4450.c
@@ -6,7 +6,6 @@
 #include <linux/clk-provider.h>
 #include <linux/module.h>
 #include <linux/mod_devicetable.h>
-#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 
diff --git a/drivers/clk/qcom/gpucc-sm8350.c b/drivers/clk/qcom/gpucc-sm8350.c
index f3b6bdc24485..6d2660bdd825 100644
--- a/drivers/clk/qcom/gpucc-sm8350.c
+++ b/drivers/clk/qcom/gpucc-sm8350.c
@@ -9,7 +9,6 @@
 #include <linux/err.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
-#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 
diff --git a/drivers/clk/qcom/kpss-xcc.c b/drivers/clk/qcom/kpss-xcc.c
index e7cfa8d22044..97bfb21a5e5e 100644
--- a/drivers/clk/qcom/kpss-xcc.c
+++ b/drivers/clk/qcom/kpss-xcc.c
@@ -5,7 +5,6 @@
 #include <linux/init.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
-#include <linux/property.h>
 #include <linux/err.h>
 #include <linux/io.h>
 #include <linux/of.h>
diff --git a/drivers/clk/qcom/krait-cc.c b/drivers/clk/qcom/krait-cc.c
index ae325f4e1047..f29d6dd1f3ac 100644
--- a/drivers/clk/qcom/krait-cc.c
+++ b/drivers/clk/qcom/krait-cc.c
@@ -5,7 +5,6 @@
 #include <linux/init.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
-#include <linux/property.h>
 #include <linux/err.h>
 #include <linux/io.h>
 #include <linux/of.h>
diff --git a/drivers/clk/qcom/lpasscc-sdm845.c b/drivers/clk/qcom/lpasscc-sdm845.c
index 7040da952728..5c1ea75f9ba8 100644
--- a/drivers/clk/qcom/lpasscc-sdm845.c
+++ b/drivers/clk/qcom/lpasscc-sdm845.c
@@ -6,7 +6,6 @@
 #include <linux/clk-provider.h>
 #include <linux/platform_device.h>
 #include <linux/module.h>
-#include <linux/of_address.h>
 #include <linux/regmap.h>
 
 #include <dt-bindings/clock/qcom,lpass-sdm845.h>
diff --git a/drivers/clk/qcom/lpasscorecc-sc7180.c b/drivers/clk/qcom/lpasscorecc-sc7180.c
index 726c6378752f..605516d03993 100644
--- a/drivers/clk/qcom/lpasscorecc-sc7180.c
+++ b/drivers/clk/qcom/lpasscorecc-sc7180.c
@@ -9,7 +9,6 @@
 #include <linux/platform_device.h>
 #include <linux/pm_clock.h>
 #include <linux/pm_runtime.h>
-#include <linux/of.h>
 #include <linux/regmap.h>
 
 #include <dt-bindings/clock/qcom,lpasscorecc-sc7180.h>
diff --git a/drivers/clk/qcom/lpasscorecc-sc7280.c b/drivers/clk/qcom/lpasscorecc-sc7280.c
index b0888cd2460b..56882c202376 100644
--- a/drivers/clk/qcom/lpasscorecc-sc7280.c
+++ b/drivers/clk/qcom/lpasscorecc-sc7280.c
@@ -6,7 +6,6 @@
 #include <linux/clk-provider.h>
 #include <linux/err.h>
 #include <linux/module.h>
-#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/pm_clock.h>
 #include <linux/pm_runtime.h>
diff --git a/drivers/clk/qcom/mmcc-apq8084.c b/drivers/clk/qcom/mmcc-apq8084.c
index cc03722596a4..3affa525b875 100644
--- a/drivers/clk/qcom/mmcc-apq8084.c
+++ b/drivers/clk/qcom/mmcc-apq8084.c
@@ -8,7 +8,6 @@
 #include <linux/platform_device.h>
 #include <linux/module.h>
 #include <linux/regmap.h>
-#include <linux/reset-controller.h>
 
 #include <dt-bindings/clock/qcom,mmcc-apq8084.h>
 #include <dt-bindings/reset/qcom,mmcc-apq8084.h>
diff --git a/drivers/clk/qcom/mmcc-msm8960.c b/drivers/clk/qcom/mmcc-msm8960.c
index 3f41249c5ae4..c0adb2b86718 100644
--- a/drivers/clk/qcom/mmcc-msm8960.c
+++ b/drivers/clk/qcom/mmcc-msm8960.c
@@ -8,13 +8,10 @@
 #include <linux/err.h>
 #include <linux/delay.h>
 #include <linux/platform_device.h>
-#include <linux/property.h>
 #include <linux/module.h>
-#include <linux/of.h>
 #include <linux/clk.h>
 #include <linux/clk-provider.h>
 #include <linux/regmap.h>
-#include <linux/reset-controller.h>
 
 #include <dt-bindings/clock/qcom,mmcc-msm8960.h>
 #include <dt-bindings/reset/qcom,mmcc-msm8960.h>
diff --git a/drivers/clk/qcom/mmcc-msm8974.c b/drivers/clk/qcom/mmcc-msm8974.c
index 169e85f60550..f2e802cf6afc 100644
--- a/drivers/clk/qcom/mmcc-msm8974.c
+++ b/drivers/clk/qcom/mmcc-msm8974.c
@@ -11,7 +11,6 @@
 #include <linux/of.h>
 #include <linux/clk-provider.h>
 #include <linux/regmap.h>
-#include <linux/reset-controller.h>
 
 #include <dt-bindings/clock/qcom,mmcc-msm8974.h>
 #include <dt-bindings/reset/qcom,mmcc-msm8974.h>
diff --git a/drivers/clk/qcom/mmcc-msm8994.c b/drivers/clk/qcom/mmcc-msm8994.c
index f70d080bf51c..0a273630e852 100644
--- a/drivers/clk/qcom/mmcc-msm8994.c
+++ b/drivers/clk/qcom/mmcc-msm8994.c
@@ -11,8 +11,6 @@
 #include <linux/of.h>
 #include <linux/clk-provider.h>
 #include <linux/regmap.h>
-#include <linux/reset-controller.h>
-#include <linux/clk.h>
 
 #include <dt-bindings/clock/qcom,mmcc-msm8994.h>
 
diff --git a/drivers/clk/qcom/mmcc-msm8996.c b/drivers/clk/qcom/mmcc-msm8996.c
index a742f848e4ee..3426e3dde924 100644
--- a/drivers/clk/qcom/mmcc-msm8996.c
+++ b/drivers/clk/qcom/mmcc-msm8996.c
@@ -8,11 +8,8 @@
 #include <linux/err.h>
 #include <linux/platform_device.h>
 #include <linux/module.h>
-#include <linux/of.h>
 #include <linux/clk-provider.h>
 #include <linux/regmap.h>
-#include <linux/reset-controller.h>
-#include <linux/clk.h>
 
 #include <dt-bindings/clock/qcom,mmcc-msm8996.h>
 
diff --git a/drivers/clk/qcom/mmcc-msm8998.c b/drivers/clk/qcom/mmcc-msm8998.c
index 5738445a8656..5c37be700fa7 100644
--- a/drivers/clk/qcom/mmcc-msm8998.c
+++ b/drivers/clk/qcom/mmcc-msm8998.c
@@ -8,10 +8,8 @@
 #include <linux/err.h>
 #include <linux/platform_device.h>
 #include <linux/module.h>
-#include <linux/of.h>
 #include <linux/clk-provider.h>
 #include <linux/regmap.h>
-#include <linux/reset-controller.h>
 
 #include <dt-bindings/clock/qcom,mmcc-msm8998.h>
 
diff --git a/drivers/clk/qcom/mmcc-sdm660.c b/drivers/clk/qcom/mmcc-sdm660.c
index 98ba5b4518fb..b3beeabe39ed 100644
--- a/drivers/clk/qcom/mmcc-sdm660.c
+++ b/drivers/clk/qcom/mmcc-sdm660.c
@@ -9,14 +9,9 @@
 #include <linux/bitops.h>
 #include <linux/err.h>
 #include <linux/platform_device.h>
-#include <linux/property.h>
 #include <linux/module.h>
-#include <linux/of.h>
 #include <linux/clk-provider.h>
 #include <linux/regmap.h>
-#include <linux/reset-controller.h>
-#include <linux/clk.h>
-
 
 #include <dt-bindings/clock/qcom,mmcc-sdm660.h>
 
-- 
2.43.0

