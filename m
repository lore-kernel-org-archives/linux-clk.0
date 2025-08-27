Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90B0934A304
	for <linux-clk@vger.kernel.org>; Wed, 27 Aug 2025 12:42:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756298540; cv=none; b=g+ghaJWHHKjXYg4coZVfrrB866S2UMAuLsmkkprF5xJmRGbwPWVg/YMshPXZIWnbY5z0TLc+jQevdfIUK4AeGPUCrYaIL7HfH64m0rcYZRQYAi5XE12iJ+0uYrZjljrrZ8GFnYxM/YwKyysu0HlBQTc9DGYEcwEWoYvPYGmU878=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756298540; c=relaxed/simple;
	bh=ivbLWWSo2AaBA+S6bzVV0jpPuv1cVq4qNDd5/EibisY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AFsPrRvfRMNVKU6arKuBojSQBruSeUdj/tbQ8MtBiBSuTyhKsi9vZOykx8LXPGLz/Opmwxl6Uw+ASLLidBwgT7ND7wW1zoB5H21hBjfQrqxu0YdVvTcR+BAwOVCYzlFV2N0Y+KAEtC9P8eZJl1O3WMF6HIWL0OfoXQCr16DySPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=woekt0vK; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="woekt0vK"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3c6df24f128so3363160f8f.3
        for <linux-clk@vger.kernel.org>; Wed, 27 Aug 2025 05:42:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756298537; x=1756903337; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kDye+gKIi/Rk3nYVOD84e7fdc0ZI2E6vHlmVYEwZkRM=;
        b=woekt0vKI/uu3QbE31cnhdrXNLQnjOd+Uf8H3NUndQVjON7AUEqUBBniISscj+ZKZd
         KlNj1Z6hpKZNuyTtB1nbw5mrrcrPzz2Hvtq4e219hzZkwcZSfTL2IqzQvL8z0IKCh5yF
         DI/kVE3RM0v3Le1gxxZ2GOtFU63F1tMllKVvmKhBgullNKOP6HC9uqpiSrgdd36/Sutp
         GyYg3FXW+ftownRaKiTal9500uhKBRJ8Rerwhp7HCoVy6qRrd8DWJveiV6DcEh1y09/d
         lnMeKNwH0Cn69XjTR1dcMmR8LH+UZsWT2AjJICd8MeclPkdgxCUGP6nzmUl6zjlRZCuD
         Mpgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756298537; x=1756903337;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kDye+gKIi/Rk3nYVOD84e7fdc0ZI2E6vHlmVYEwZkRM=;
        b=v2SUbYYjxan4e/bjjo75kDDrDqeOLMjbH1hkvhhGX4d2TC7H8cmyK9HcWHY/Ga81hz
         4kQC3ey2j35ktNSMYGpMEm4Kb2ZSfnUe46V9aryDfBpM5n9KQkEdlU72QrdTZ+xDBAz6
         AWNGs+qwW+JxC6apLo5cUYuH3ayKHZY8bZN7xyQF+tucgck6MX7aiNSQBDPtBEw0CMrc
         lHdXyx9fdo6EcFkLE+IcMNksgaotWrkzCe/ZoMXDtD3vAvNo6d0IIfqcuE7ggABZeyXo
         rLmwZKp9RPlk7ac6+KlkkC63Os/dgJGv8ocEWKBl11YlQ3Zjo1rTdXpKqsiiji6F5Vcn
         QhCA==
X-Forwarded-Encrypted: i=1; AJvYcCUSumK9458lxJI60UfmUoWQq2DUGpd20rwRQKuBQqNx1unod8d72ZmN+E8IlZx5lwZVUakPg3SkJes=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3HdPxklTvvwLKM7RfmL/xA8JIIAD+Uq0IhPma0mZIjP102LXc
	vMFWDoE78JEnMVK5fwSl1HFJtHx39577XIBUZbrESUaxZ84Fw2br9QtwQH1ZzaH7ZIE=
X-Gm-Gg: ASbGncs2KrnDR83+OY+hsWI9UHQd9H9V5g+DqtbB4vSTvjrbIkfSaBAJ3ki2tCNQ8e+
	QXBYt2Zp6en3mna9dmsJxE0SQn2mEVITRH0c9nrMsy31iGw6+vzb+rLs3BavucpRnsnCSXSYBn3
	I7SaibYGPQcvMSQdZvFcmHG1TR2I+yTDLBwBswaLOdrjRSablM79zWRzQZfmIJyi34kFLFcopt8
	tIXaXAhPumDUUvYE4YtUQuKffrw7fG+sJjAfAxOmp3xVXjKWYeYOmgLOkwRlsBZ13UNx1SGRQtZ
	zQFuO6aJkh5BY0gxTSjzgFF+ohqtREDYg3dAgCILwjB0wvWe2O9yNsHiIoxBt+srjANqoaUgyD7
	8T5uaNuYVqyYAsnYSBKm/fvgVJ6mpqvorKSbVeNnZU0PyQWjWb4fcVeyiD1+djwSRdD1gIIv2NH
	tAYA==
X-Google-Smtp-Source: AGHT+IGJa/ivtNwr9Cn8nr8S19TCpPlSe2lNev3w6PEXYrBlk05kENqWzqwjRqOSSx/1cACZlesaXw==
X-Received: by 2002:a05:6000:1a88:b0:3c4:bc55:65d8 with SMTP id ffacd0b85a97d-3c5dd7b4175mr15803099f8f.62.1756298536777;
        Wed, 27 Aug 2025 05:42:16 -0700 (PDT)
Received: from ta2.c.googlers.com (219.43.233.35.bc.googleusercontent.com. [35.233.43.219])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3cbab3ead0dsm6439420f8f.29.2025.08.27.05.42.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Aug 2025 05:42:16 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Wed, 27 Aug 2025 12:42:11 +0000
Subject: [PATCH v2 1/5] dt-bindings: firmware: google,gs101-acpm-ipc: add
 #clock-cells
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250827-acpm-clk-v2-1-de5c86b49b64@linaro.org>
References: <20250827-acpm-clk-v2-0-de5c86b49b64@linaro.org>
In-Reply-To: <20250827-acpm-clk-v2-0-de5c86b49b64@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-clk@vger.kernel.org, willmcvicker@google.com, kernel-team@android.com, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756298535; l=2754;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=ivbLWWSo2AaBA+S6bzVV0jpPuv1cVq4qNDd5/EibisY=;
 b=jl6fjNfftMkX+rPDiw2pF9HsB0qXrHHMzr8xpgTmZfEOJY03K4MIPCWkyzWB/j3LgkvZrBT68
 GDx/C3dBu+4A66KQUUz7VWUAOuuKPFIsClt1SzgoiSICpAyQE4+ChYq
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

The firmware exposes clocks that can be controlled via the
Alive Clock and Power Manager (ACPM) interface.

Make the ACPM node a clock provider by adding the mandatory
"#clock-cells" property, which allows devices to reference its
clock outputs.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 .../bindings/firmware/google,gs101-acpm-ipc.yaml          | 11 +++++++++++
 include/dt-bindings/clock/google,gs101.h                  | 15 +++++++++++++++
 2 files changed, 26 insertions(+)

diff --git a/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml b/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml
index 9785aac3b5f34955bbfe2718eec48581d050954f..d3bca6088d128485618bb2b538ed8596b4ba14f0 100644
--- a/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml
+++ b/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml
@@ -24,6 +24,15 @@ properties:
   compatible:
     const: google,gs101-acpm-ipc
 
+  "#clock-cells":
+    const: 1
+    description:
+      Clocks that are variable and index based. These clocks don't provide
+      an entire range of values between the limits but only discrete points
+      within the range. The firmware also manages the voltage scaling
+      appropriately with the clock scaling. The argument is the ID of the
+      clock contained by the firmware messages.
+
   mboxes:
     maxItems: 1
 
@@ -45,6 +54,7 @@ properties:
 
 required:
   - compatible
+  - "#clock-cells"
   - mboxes
   - shmem
 
@@ -56,6 +66,7 @@ examples:
 
     power-management {
         compatible = "google,gs101-acpm-ipc";
+        #clock-cells = <1>;
         mboxes = <&ap2apm_mailbox>;
         shmem = <&apm_sram>;
 
diff --git a/include/dt-bindings/clock/google,gs101.h b/include/dt-bindings/clock/google,gs101.h
index 442f9e9037dc33198a1cee20af62fc70bbd96605..f1d0df412fdd49b300db4ba88bc0b1674cf0cdf8 100644
--- a/include/dt-bindings/clock/google,gs101.h
+++ b/include/dt-bindings/clock/google,gs101.h
@@ -634,4 +634,19 @@
 #define CLK_GOUT_PERIC1_CLK_PERIC1_USI9_USI_CLK		45
 #define CLK_GOUT_PERIC1_SYSREG_PERIC1_PCLK		46
 
+#define CLK_ACPM_DVFS_MIF				0
+#define CLK_ACPM_DVFS_INT				1
+#define CLK_ACPM_DVFS_CPUCL0				2
+#define CLK_ACPM_DVFS_CPUCL1				3
+#define CLK_ACPM_DVFS_CPUCL2				4
+#define CLK_ACPM_DVFS_G3D				5
+#define CLK_ACPM_DVFS_G3DL2				6
+#define CLK_ACPM_DVFS_TPU				7
+#define CLK_ACPM_DVFS_INTCAM				8
+#define CLK_ACPM_DVFS_TNR				9
+#define CLK_ACPM_DVFS_CAM				10
+#define CLK_ACPM_DVFS_MFC				11
+#define CLK_ACPM_DVFS_DISP				12
+#define CLK_ACPM_DVFS_BO				13
+
 #endif /* _DT_BINDINGS_CLOCK_GOOGLE_GS101_H */

-- 
2.51.0.261.g7ce5a0a67e-goog

