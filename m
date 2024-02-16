Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C01DE14A095
	for <linux-clk@vger.kernel.org>; Fri, 16 Feb 2024 22:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708122777; cv=none; b=TulGAqgLmAEbkZUddv28pZcK5y9sBIju7QuAAPjJBL5e0IPKm7mGkPdSyzjMpJJquFvp3smd8cihYhNoKSsxEOviigtkOfyqVn7LQgHDjzpOyxWx0rO+4v4ImcwrHuSV0fPlClSd5nzuNH4nmLTm/6j89+awpuyJ1JumHvvAksA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708122777; c=relaxed/simple;
	bh=5ZoYtRQ2HjiqGEQZUVOcP2ADlsbfU9MvFiIZ1YzKk+I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=AFhm8+xpJwtCdEFKh40l8tgvjzXE3IbWKm9rGPQoYIZoEHpsWj/829CK+TZa4YS6jLV/646aBnoqpRp8p6q2Px//qXCjrdiFu+P1JX3RtWNPpp/0fGClKPC0CEvsXlLZghHS1p2PuIK3Sg1buS/Y8K21LQZzrUxcZU7jK1u81No=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DBMVlEig; arc=none smtp.client-ip=209.85.161.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DBMVlEig"
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-5986d902ae6so1320404eaf.3
        for <linux-clk@vger.kernel.org>; Fri, 16 Feb 2024 14:32:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708122772; x=1708727572; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TdZ9WPH7Nl2aH1xgLChF6BzPk0ENAzSqqSLTSdJZTwM=;
        b=DBMVlEigKGHihYH4vHTOqa2xGoY5LAu+v3b+3DT+OmFF4Tm7FOSURfukWf8t2pVFAq
         Te2su/ak4htE/Xt8W630Ymmg1WsXrpiXWx8YFkGsgWOCI3W+v7ka8RIWIG8l0zYZc/D3
         6dasOe1n02caAX7Pkli3J3tVwmqq6sV29rBX64ItwYuvsu5rsa3naYF8lwOpQnk8TDTB
         CbOK20I2G9tHRnrt0a+5C36CYSm6J9aVB5NuGYbEFKartO9jv7zKMrw0paHUXxqFH8GS
         Y0D2AKiMbmBJvu/IwrbzMs3La5nYDH0A67czw+d1rYZui+JVTzudWQLBKmQ1UxQz/zoC
         S/yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708122772; x=1708727572;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TdZ9WPH7Nl2aH1xgLChF6BzPk0ENAzSqqSLTSdJZTwM=;
        b=eVK+wA9+gMp3wUibMRNCZas8b4rg7du3EW3x7JbiIlCoPdmfwO3/FkxAw/uXLPB0RD
         tgSxKshQ2FvfERhP54H3A7FBgQDq31qWZl9p7XARM5Hg6SRyUJBmkC6KZjJMBNEXI10c
         E/yuSIxtfm5i0RFvK+LwnHhqqQfQywrerK7btqc49sCqOMnKd3uIfdXyea5uCIqHFSCi
         vXZzsKNX8FWR2U1MH62GMaOUKOAb4fzLe38kdALV7llBj3uegEZBowOar/vZVO43DEIM
         YCLsi8MmXF2xZ583QTolUtioGRzbwzCcxg5vWgwBQPhyhnUrO4d7VwktB49TXkOwcEna
         HvYw==
X-Forwarded-Encrypted: i=1; AJvYcCUXXOaCWCzLQTrFbu4yYe0Nc7bxvbFPD4PcTRmumBmnm9vGjMbbSaZQ0FlVy8VEMzV1Kz9TEDZA15aOmEo1vvXbARj4VNnOOITy
X-Gm-Message-State: AOJu0YwObbn6oJhaB8YlyGsS9zrfgHjOx/rdKO+McDt/UbTUjfPh2X7Q
	tKf5YSZXVyw32YjO6nStbWIAwaKBXzuLp4l120GnrGIB92o1tTIExkYlDYHf5iw=
X-Google-Smtp-Source: AGHT+IEMIIixM6tZ8mov4ea8ABTWuLoN2rQ27ib9tS5wc4QS07D1l+RHgpL5ftrUdHkxPlwhEXPf7w==
X-Received: by 2002:a05:6820:2b11:b0:59f:aa2e:ef8b with SMTP id dt17-20020a0568202b1100b0059faa2eef8bmr1528834oob.0.1708122772629;
        Fri, 16 Feb 2024 14:32:52 -0800 (PST)
Received: from localhost ([136.62.192.75])
        by smtp.gmail.com with ESMTPSA id x11-20020a4a9b8b000000b0059d24cfb5e3sm137045ooj.4.2024.02.16.14.32.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Feb 2024 14:32:52 -0800 (PST)
From: Sam Protsenko <semen.protsenko@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>
Cc: Alim Akhtar <alim.akhtar@samsung.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Tomasz Figa <tomasz.figa@gmail.com>,
	linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 08/16] clk: samsung: Use clk.h as a single header for Samsung CCF
Date: Fri, 16 Feb 2024 16:32:37 -0600
Message-Id: <20240216223245.12273-9-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240216223245.12273-1-semen.protsenko@linaro.org>
References: <20240216223245.12273-1-semen.protsenko@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make both CPU and PLL clock headers to be included indirectly via clk.h.
All Samsung clock drivers already include clk.h, which provides API for
Samsung CCF clocks like muxes, gates, etc. Both CPU and PLL Samsung
clock are not that different. It makes sense to only use both clk-cpu.h
and clk-pll.h internally for Samsung CCF framework, and make clk.h the
facade for Samsung CCF. This way all clock drivers only have to include
clk.h.

No functional change.

Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
---
 drivers/clk/samsung/clk-cpu.c        | 1 -
 drivers/clk/samsung/clk-exynos3250.c | 2 --
 drivers/clk/samsung/clk-exynos4.c    | 1 -
 drivers/clk/samsung/clk-exynos5250.c | 1 -
 drivers/clk/samsung/clk-exynos5260.c | 1 -
 drivers/clk/samsung/clk-exynos5420.c | 1 -
 drivers/clk/samsung/clk-exynos5433.c | 2 --
 drivers/clk/samsung/clk-pll.c        | 2 +-
 drivers/clk/samsung/clk-s3c64xx.c    | 1 -
 drivers/clk/samsung/clk-s5pv210.c    | 1 -
 drivers/clk/samsung/clk.h            | 1 +
 11 files changed, 2 insertions(+), 12 deletions(-)

diff --git a/drivers/clk/samsung/clk-cpu.c b/drivers/clk/samsung/clk-cpu.c
index a59949990919..4c46416281a3 100644
--- a/drivers/clk/samsung/clk-cpu.c
+++ b/drivers/clk/samsung/clk-cpu.c
@@ -36,7 +36,6 @@
 #include <linux/clk-provider.h>
 
 #include "clk.h"
-#include "clk-cpu.h"
 
 struct exynos_cpuclk;
 
diff --git a/drivers/clk/samsung/clk-exynos3250.c b/drivers/clk/samsung/clk-exynos3250.c
index bf149fae04c3..d1b72a75bc5a 100644
--- a/drivers/clk/samsung/clk-exynos3250.c
+++ b/drivers/clk/samsung/clk-exynos3250.c
@@ -14,8 +14,6 @@
 #include <dt-bindings/clock/exynos3250.h>
 
 #include "clk.h"
-#include "clk-cpu.h"
-#include "clk-pll.h"
 
 #define SRC_LEFTBUS		0x4200
 #define DIV_LEFTBUS		0x4500
diff --git a/drivers/clk/samsung/clk-exynos4.c b/drivers/clk/samsung/clk-exynos4.c
index d5b1e9f49d8b..3d57020a620f 100644
--- a/drivers/clk/samsung/clk-exynos4.c
+++ b/drivers/clk/samsung/clk-exynos4.c
@@ -16,7 +16,6 @@
 #include <linux/of_address.h>
 
 #include "clk.h"
-#include "clk-cpu.h"
 
 /* Exynos4 clock controller register offsets */
 #define SRC_LEFTBUS		0x4200
diff --git a/drivers/clk/samsung/clk-exynos5250.c b/drivers/clk/samsung/clk-exynos5250.c
index 58df80de52ef..4953da754994 100644
--- a/drivers/clk/samsung/clk-exynos5250.c
+++ b/drivers/clk/samsung/clk-exynos5250.c
@@ -14,7 +14,6 @@
 #include <linux/of_address.h>
 
 #include "clk.h"
-#include "clk-cpu.h"
 #include "clk-exynos5-subcmu.h"
 
 #define APLL_LOCK		0x0
diff --git a/drivers/clk/samsung/clk-exynos5260.c b/drivers/clk/samsung/clk-exynos5260.c
index 16da6ef5ca0c..280330ded100 100644
--- a/drivers/clk/samsung/clk-exynos5260.c
+++ b/drivers/clk/samsung/clk-exynos5260.c
@@ -11,7 +11,6 @@
 
 #include "clk-exynos5260.h"
 #include "clk.h"
-#include "clk-pll.h"
 
 #include <dt-bindings/clock/exynos5260-clk.h>
 
diff --git a/drivers/clk/samsung/clk-exynos5420.c b/drivers/clk/samsung/clk-exynos5420.c
index bd7b304d2c00..531ef1c3fa30 100644
--- a/drivers/clk/samsung/clk-exynos5420.c
+++ b/drivers/clk/samsung/clk-exynos5420.c
@@ -15,7 +15,6 @@
 #include <linux/clk.h>
 
 #include "clk.h"
-#include "clk-cpu.h"
 #include "clk-exynos5-subcmu.h"
 
 #define APLL_LOCK		0x0
diff --git a/drivers/clk/samsung/clk-exynos5433.c b/drivers/clk/samsung/clk-exynos5433.c
index d3779eefb438..379744f0a5b6 100644
--- a/drivers/clk/samsung/clk-exynos5433.c
+++ b/drivers/clk/samsung/clk-exynos5433.c
@@ -17,9 +17,7 @@
 #include <dt-bindings/clock/exynos5433.h>
 
 #include "clk.h"
-#include "clk-cpu.h"
 #include "clk-exynos-arm64.h"
-#include "clk-pll.h"
 
 /* NOTE: Must be equal to the last clock ID increased by one */
 #define CLKS_NR_TOP			(CLK_SCLK_HDMI_SPDIF_DISP + 1)
diff --git a/drivers/clk/samsung/clk-pll.c b/drivers/clk/samsung/clk-pll.c
index 4bbdf5e91650..37aa7beb547a 100644
--- a/drivers/clk/samsung/clk-pll.c
+++ b/drivers/clk/samsung/clk-pll.c
@@ -14,8 +14,8 @@
 #include <linux/timekeeping.h>
 #include <linux/clk-provider.h>
 #include <linux/io.h>
+
 #include "clk.h"
-#include "clk-pll.h"
 
 #define PLL_TIMEOUT_US		20000U
 #define PLL_TIMEOUT_LOOPS	1000000U
diff --git a/drivers/clk/samsung/clk-s3c64xx.c b/drivers/clk/samsung/clk-s3c64xx.c
index d27a1f73f077..8ee3ffdf2b8d 100644
--- a/drivers/clk/samsung/clk-s3c64xx.c
+++ b/drivers/clk/samsung/clk-s3c64xx.c
@@ -14,7 +14,6 @@
 #include <dt-bindings/clock/samsung,s3c64xx-clock.h>
 
 #include "clk.h"
-#include "clk-pll.h"
 
 /* S3C64xx clock controller register offsets. */
 #define APLL_LOCK		0x000
diff --git a/drivers/clk/samsung/clk-s5pv210.c b/drivers/clk/samsung/clk-s5pv210.c
index cd85342e4ddb..29f2531fd5d3 100644
--- a/drivers/clk/samsung/clk-s5pv210.c
+++ b/drivers/clk/samsung/clk-s5pv210.c
@@ -13,7 +13,6 @@
 #include <linux/of_address.h>
 
 #include "clk.h"
-#include "clk-pll.h"
 
 #include <dt-bindings/clock/s5pv210.h>
 
diff --git a/drivers/clk/samsung/clk.h b/drivers/clk/samsung/clk.h
index 516b716407e5..8157479f45eb 100644
--- a/drivers/clk/samsung/clk.h
+++ b/drivers/clk/samsung/clk.h
@@ -11,6 +11,7 @@
 #define __SAMSUNG_CLK_H
 
 #include <linux/clk-provider.h>
+#include "clk-cpu.h"
 #include "clk-pll.h"
 
 /**
-- 
2.39.2

