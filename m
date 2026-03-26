Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F4A619B5B1
	for <linux-clk@vger.kernel.org>; Thu, 26 Mar 2026 02:48:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774493296; cv=none; b=n8SgIX1YPtvhnWMIUCBnYBPLvMIKnz7YBXX/T6zX9U3baOEJfjES5v/A+8bu75rXZPq+z0o5g3PC7G8SIqJ4CTE6tESgxfDUdXCFhy5XGAPTP4l1x5Hv2Z0LCWQH1zHa78KzdpEBwXgSKGKydPb8C29ZJatiXwV/XWt/wEArshc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774493296; c=relaxed/simple;
	bh=RrqD1NoUe4djEyb0fe5dsQb/o25xg9vxMy7cCsdcd7U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Hf7WY02i4JK4ZL7nh2xnsPW1Wu3UQRIA8lJfLkhQgvgnXxsNlmEyxCuFodnx2mEORWC1SO+Nn9E/CnP9Dl1wR48VX6iFVBL1O7wGDOE7YV+tRpfN//MuKn/tb/TQswxvgAA2FpUB2qpwN4Yw6fZ28CxjduwiPps07dt/rxygK2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rl2PEuoi; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rl2PEuoi"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2aecefc7503so3305435ad.1
        for <linux-clk@vger.kernel.org>; Wed, 25 Mar 2026 19:48:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774493295; x=1775098095; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dMEzcnIaH8BHyFA6RpTtAAlerD4BYMa9dkJNVe48taA=;
        b=rl2PEuoizce2K29EK6r2vqeTUBfL6H5P8X+z8m/6spCgKm+v0Lnot03Y270GSVUTxJ
         O2Vtm61MiVljiRN5YUq+WuGh+VjvsvCldrvTA3cHd1jDJ87p+R1g5voINnIuHl3TJKfA
         N3eXliS3XuUtqUsgvU3ZVP3qYjWAO3AOW4Hl55ao9QwrIHjD28VQfASwWBACB/PHRwjx
         W7OYpZJ2jBTTsZ9Y33S8MSiKoEuruMVscMfMzEiNchgt32VsaofcffaVaaaUPQdgFtME
         9yRouzxLbqzEx7y14VZY7G6mGXeaOTKz5mYee27L17XU+NBIS86/RgV8lTh6eDfRl5+b
         yx3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774493295; x=1775098095;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dMEzcnIaH8BHyFA6RpTtAAlerD4BYMa9dkJNVe48taA=;
        b=e3GyMpRuqPAPfxeog1VHcWUFkQup2oCtUhSg0YHEfVJy/Hl9BZQ4jsU+BrgqIxO9T6
         0hpb/1EMsW4X+xUa9iFocwTVa6xvPO9dkXtI1yFhseoaZk3He/aaMzZ8kD825UoWboT0
         /RV9B0BuMnjbKe9hn8Od/aP/lq7fankhky2VCLQx0KBWKdUuuloozuMybXxaq6L6rhSH
         fQczSp2/Xy0x1Cu8UQvw7Ymw2+TGZQFRsuc+BDuzUJfiInvZ5xRDLzV184Pvth3V+1c9
         NdZh4mIbhbGMYeVLnHeC/Krjc+6N7DsTNtivEG9V5Kfyjf1orMPwQ5AakufQJMzOFN+n
         E62w==
X-Forwarded-Encrypted: i=1; AJvYcCUbsd5kvUzJVRVRB4xTY1yhRMbbclZsEtqN6eM48q0DrJ7LgifVi+wVxBe00OImOeMJ1NM+/0LCzIQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzTh5+oqUYLqaqtpzHBCtHoZ4y7ufJXlXcaHKL9pFf6vW7Ji0G5
	GZCE8ehGbiSvF8SNgI8c2djCGcH09pz6gnImG6aonABeJU3yt3uI/E5Q
X-Gm-Gg: ATEYQzxZonG/KRiDmKFka7brCsQtRVgTc7w7F1ir5DOS4pqgsVFrtO98Sqa1j4CtwmB
	DtJyeNYuIShTxyenB9khQL9Y3sJsSYKLebkguTpjGdT21ffg+xTWOHW+FjBi6kbqujgcjD9Ez2s
	Yx0aBrLBow/kv0mwaqfbKFnSfcs/rZUE6mHLqPKBr7QF0/es4eYkjgg4Pgme+06YVKJh5W7qvxF
	Gi1EbXBWVXVlmH5cUJusbH0pOKIl2YzRAW2/dUEnabOnhaPeTszVRRq6OHANrXaGxlDBll6qKhc
	4nximL4BxY5NDg/eIk1YB8tH7ojlyAsM5aoMm/MvQfpkCZu90QnjwecU32EbwHq8FCJCMCNShJE
	OvIkAXKSC36y1JLytP1SowQzeSrGytaGez5lbONp7PlYdKpvx7RUWga4nqr9hdrIcnPvjos8GHT
	u6jNTxXIAJpHCjI0FtsbBHPg6vQFiB7rvkIiCpFnTruuwbgM9iRnIOFx6/NdMEhsVTGA==
X-Received: by 2002:a17:902:ebcb:b0:2ae:5eab:132e with SMTP id d9443c01a7336-2b0b0a35055mr67436305ad.12.1774493294597;
        Wed, 25 Mar 2026 19:48:14 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d::8bd])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0bc76bbdcsm13039695ad.5.2026.03.25.19.48.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 19:48:14 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-tegra@vger.kernel.org
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCHv3] firmware/tegra: add COMPILE_TEST
Date: Wed, 25 Mar 2026 19:47:56 -0700
Message-ID: <20260326024756.63502-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For this driver specifically, there's no arch specific stuff needed.

Build the tegra clk stuff as tegra_bpmp_init_clocks is defined there.
CLK_TEGRA_BPMP also depends on TEGRA_BPMP.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v3: add a Kconfig symbol instead.
 v2: also build the tegra clk stuff.
 drivers/clk/Kconfig            | 7 +++++++
 drivers/clk/Makefile           | 2 +-
 drivers/firmware/tegra/Kconfig | 4 ++--
 3 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
index 8cc300b90b5f..56295cc2b74f 100644
--- a/drivers/clk/Kconfig
+++ b/drivers/clk/Kconfig
@@ -335,6 +335,13 @@ config CLK_LS1028A_PLLDIG
           features of the PLL are currently supported by the driver. By default,
           configured bypass mode with this PLL.

+config CLK_TEGRA
+	bool "Clock driver for Nvidia Tegra platforms"
+	depends on ARCH_TEGRA || COMPILE_TEST
+	help
+	  This adds the clock driver support for Nvidia Tegra platforms
+	  using common clock framework.
+
 config COMMON_CLK_XGENE
 	bool "Clock driver for APM XGene SoC"
 	default ARCH_XGENE
diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
index 3416eea558c6..0e1331bd6295 100644
--- a/drivers/clk/Makefile
+++ b/drivers/clk/Makefile
@@ -154,7 +154,7 @@ obj-$(CONFIG_ARCH_STM32)		+= stm32/
 obj-y					+= starfive/
 obj-$(CONFIG_ARCH_SUNXI)		+= sunxi/
 obj-y					+= sunxi-ng/
-obj-$(CONFIG_ARCH_TEGRA)		+= tegra/
+obj-$(CONFIG_CLK_TEGRA)			+= tegra/
 obj-y					+= tenstorrent/
 obj-$(CONFIG_ARCH_THEAD)		+= thead/
 obj-y					+= ti/
diff --git a/drivers/firmware/tegra/Kconfig b/drivers/firmware/tegra/Kconfig
index 91f2320c0d0f..ae21f460807d 100644
--- a/drivers/firmware/tegra/Kconfig
+++ b/drivers/firmware/tegra/Kconfig
@@ -3,7 +3,7 @@ menu "Tegra firmware driver"

 config TEGRA_IVC
 	bool "Tegra IVC protocol" if COMPILE_TEST
-	depends on ARCH_TEGRA
+	depends on ARCH_TEGRA || COMPILE_TEST
 	help
 	  IVC (Inter-VM Communication) protocol is part of the IPC
 	  (Inter Processor Communication) framework on Tegra. It maintains the
@@ -13,7 +13,7 @@ config TEGRA_IVC

 config TEGRA_BPMP
 	bool "Tegra BPMP driver"
-	depends on ARCH_TEGRA && TEGRA_HSP_MBOX
+	depends on (ARCH_TEGRA && TEGRA_HSP_MBOX) || COMPILE_TEST
 	depends on !CPU_BIG_ENDIAN
 	select TEGRA_IVC
 	help
--
2.53.0

