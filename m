Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4914E21766C
	for <linux-clk@vger.kernel.org>; Mon,  9 Dec 2024 11:13:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733742808; cv=none; b=M15gl4BHqYH3Ae6QLcueEjVNUwBEiaI1Rz2mHtVSWLPBHiooL8vqCzQvR7cPsbrc/9fTCOvZqZLDjocF0652NLRq5GIVFkty4E4xZdiN1yaS7xZN3aVkmcPZMRq620+LL41RH9jNLBpfruOBOl5t+YZPQi5hR3g/aRryuOrz7GE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733742808; c=relaxed/simple;
	bh=5HkDyUB6ju9ODvYwhS71MQwj9LBibidawbEUoENvm7M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B9GeYkH1NdrlZKaUJ4GgjDE1IyxMJTJhIbqjNKTJmrK8+t5wHRzqhPgd2H4Ha/FRQ+GJQTGpoadyMNd9VKZmb27njm/3GqLfVGWEm52pGlj3DoGfv+wLrmdfktccf/wJpLMq6kSQxf6fCUxONuEzyF7udNOI9tcQd9DaxP0Qy+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wcMTyNZ6; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wcMTyNZ6"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-434faac720bso445815e9.1
        for <linux-clk@vger.kernel.org>; Mon, 09 Dec 2024 03:13:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733742804; x=1734347604; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i6ieInWvqzQEqO+/j5BOP0n4LEmkMSxoFtSfOm6DhI0=;
        b=wcMTyNZ6UbOOGrVMiOr3Bhbd8qClbhwy8+65SDQj/iCOvcGg0kpHtu4SWK19a1cVzL
         bwMSOZ9ZjFwov2JU146RsbPHEqITEryeRCK6P4R/mzKwG6/xeRUqm4pHG5383SB9hDoO
         zHRmv82QV/LgskwxSKCwMkzk61nEYvWHdsSeToo7RWUgeo8h81rvYL24iGIwGuOPGuQa
         OpxuvrCAtHuwi4ov0T37ue6TiP+N1YV1ro13BE/wNkbnWWRsjflGYus7DQHn2j3z6JgL
         Ud4eW726JWYNao5Qo+THKdp6wU+HppSCreJq59WgfHVxrnsKXav6V/G9AA3qLqaGA/pa
         4XqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733742804; x=1734347604;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i6ieInWvqzQEqO+/j5BOP0n4LEmkMSxoFtSfOm6DhI0=;
        b=Th7haQtpCBSovQLAG/t/wvhzMJ8B1G9i8YNMVuhtXrh8U5j+Og9aSHqiNaTBxbAWDu
         YpFJiQsilhb8/QDApQ6OAcOxPPIGrTW6FMvZHJgecy6uCkjDigmjBUkVSDOeohNxHYcf
         1t1DxDkfmwOao5zYm5P/lSyxe4iWDZbOlaBSaWXuT2JjwmPJBjP3O0OIUldw1ZW4/WLR
         gvsGLhFDVn3zQLAHAiTjaxseJ09eIlmdD5u52EjJOCoOLPXK+t7n1wvNUVNWc1qOjZpp
         jTcjHJrAcAcwZk9FGaraYK+4q4LsHTIzqPmAlmFX/XEJALmMK9VeGDwY6S80zjaT+YZq
         ok1w==
X-Forwarded-Encrypted: i=1; AJvYcCX3E0lgKV20aKHRM1pXlXBbTsbv63CmeD1dMgK+Ki+Rf2yYy1pFdzs9L98ASe+qMcJYfDRgZav7KFI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzOLVFdvdWjnYn9PNxSEFZauPwA7rj7peZV3rhkS9agNYt2Ieuq
	IkOpdNoFOB8Yt99c4iHDZnz0uvRNhieYrOz8vGSBZQ1aqQ7ZV6yPHTXG80vdZyU=
X-Gm-Gg: ASbGnctI2TxEmoVbMuDuEgZrY35gh8z7CI8toTRsqn/CZAak1NNApNLb46xwux7jjLa
	tpYBIEnJmMBjuQnFcu9yXEPWiuPXcFjVdZLGoUESbZoIJE7vt1LSegiDtYAp9kyhRo0IeMeYhpG
	PxKmmTXMw09v3THo6osPZZv0E3PUqOOg3RCujdfwOogLmO2FO4j5D2X1mimbOMXnn39XR+8X7H7
	qrb2fIbKkYYJHRHB192NUTmShKC3wgYyTH/5DeaCyvO1s5odY7iTOOSHzSaPfiq
X-Google-Smtp-Source: AGHT+IFJGUzUX5yg/Cq/0Gfcb5vubMdfnanpRcExUPHKSK1GIK2Wuz10nL99sjBE8Gu8PlHEShQizg==
X-Received: by 2002:a05:600c:1386:b0:434:9cb7:7321 with SMTP id 5b1f17b1804b1-434ddea7919mr38052905e9.1.1733742803596;
        Mon, 09 Dec 2024 03:13:23 -0800 (PST)
Received: from krzk-bin.. ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434fb9bf04esm19670445e9.26.2024.12.09.03.13.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2024 03:13:23 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Taniya Das <quic_tdas@quicinc.com>
Subject: [PATCH v2 2/2] clk: qcom: Add missing header includes
Date: Mon,  9 Dec 2024 12:13:15 +0100
Message-ID: <20241209111315.60776-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241209111315.60776-1-krzysztof.kozlowski@linaro.org>
References: <20241209111315.60776-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Include mod_devicetable.h for the 'struct of_device_id' and
clk-provider.h for the 'struct clk_hw'.

Reviewed-by: Taniya Das <quic_tdas@quicinc.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes in v2:
1. Rename subject (Include->Add)
2. Rb tag
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
 37 files changed, 39 insertions(+)

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

