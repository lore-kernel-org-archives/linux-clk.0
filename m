Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 644552D3EEB
	for <linux-clk@vger.kernel.org>; Sun, 19 Jul 2026 21:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784497340; cv=none; b=PcfaSXHhjeHwEk7fW/aMRjPqHXVF0VTN7E9QOACZ8kQfQsDXzfijMIlfH5VOAvJiseCHJcWXtLCOKM346Qw4mBbT5nDdybLZEIdc6qNlpdmHloTeqv3RcK+bXy2C+GRsOkE9b/1I62ALGe3OiO7eP5FydJfZTuUqaZiA0uhGuRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784497340; c=relaxed/simple;
	bh=EuOv9jLcMZp+voyDhegfUoXXaygT7in+e8n6hogqH5Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UFb70H+H9YjvdEvpqgmADXvohG2jvbx6RiXzHBH3K1qs8LE6vt4sac6qyswX+bBxlDdWlntmlMmzI5XO3WRlrsdckvbcfvBnFqlbGDZrrpxZCvGpgnai4tNHwpAcy6zcAHjNQVBJ/OS+yHsNBn1nhRJQTx5tJPjrtvcFdjM6R54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HLGbAwjS; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HLGbAwjS"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-51c0c68aa31so63978951cf.3
        for <linux-clk@vger.kernel.org>; Sun, 19 Jul 2026 14:42:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784497338; x=1785102138; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mZBhm6/Xnm6eUcP6ISkUBaaWhYGrLtJvYNKbqJ3t7Vo=;
        b=HLGbAwjSLPRdXYMoT5qKeWnpdAObE1Hzb2DtLL6Z8tMzcuvw0QzWt/0SQoMzSoa+t+
         BahTisNgvIFqsuwFZHfFNO/sA2n8iBUCBZ5S+0nMDxJYqWAG9mphDYwayEZNtYiJPnAx
         e/rvVSayw/4xiTTXagk+Lr2xEwbhmG96y80hfRaVwVcbKAh/gUj8NGqLFAFNa3R8cWDg
         OgdLSYDCm02dOnEVtV5gUiaLHch/Horo7GsLzRqMebalsvUkrXD/TXyBCQQxldw8uMF0
         ucbOjRd9l/AZ5XUngQ1RqsVz4tY4kR9NfBUT1oo4TtY6meBmrgSOFNbDnp/lBjDEF5ME
         khfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784497338; x=1785102138;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mZBhm6/Xnm6eUcP6ISkUBaaWhYGrLtJvYNKbqJ3t7Vo=;
        b=rrYy7Xp+3POsOnUPfBGiWM6u6sxxw+2cqk3wCBTgUMjPTwcKvFWLdHqc6u0UK0gCqY
         4bAPnHWLNUNuBNFw5nd4Y3jOs3n3bN7tvMo/ybcPOoPFA9b34rB3A+8P1UZ8z3H4uGgv
         8TlkGZINxIoAveTin9ri6oSL4NuxXZCNniE3mEgAVS3lyGa3E4koGdqUgJkyO2AG4gf4
         nrey21LY8fi1d5o+iMZwvKprSIkNyxMz5HN5Zr0ea35bZWGsXt6iIwt7vZ6yKvxeDsg7
         kLqMAgwTOxNz9rY3Wu2Yt701Y3/MeJiHceETvaBPszURHdpcycWpoJobKL90/BbkgkVW
         1y5Q==
X-Gm-Message-State: AOJu0YwXCaqnedkBYsfhcNiEiAMMQOOaPY5JMp1GFZ8oCdiGPgD7w3ZG
	QDap/JTP4p10OYAPGgJhQTDvIMzkmrDPJtD9jvAhB9tYr6oeFvS9/P8gH16Auw==
X-Gm-Gg: AfdE7cny8vcUcBKEajYyRZb9/FIYLQLGEXlT9ST59CCLahi1SIUJ6NkyFQAUbgaiK2K
	5dlUE0M94ZoQSqD5gcKr/bpYBfHcwp0velMU/NeIyNB9Nawb5YwMGcrSsXA399+RA6ppxBC9DQG
	MgftPpgGr1CAxd/xoN9INnHuZd/JLk9osLepRinfKt7c9JloUytcKD6FbzfE1uqZc29/jDmTL3b
	7U0/OtAFtBMOByWzi//AfEG0cemQhWltIRl/1H5nJKiAwVSyOMDCwderLDik3GbuxyVKu3OMx89
	eRty9HjA1CUqlEdI1hxTiXGA8g4FFHK5PVXd9RqDFIhneTr02w2zmHJABeWr337cRBq3hWKJuz7
	bZL6I/81wAURuO/gafXkzdHPwH/xw7+taT7kVXd+jrZokHfTkVRWNgByf7hdgh6doylWS997vnE
	n+mJK5rDU+H10XglgbXNjHtzKd5rcOvp941ASlhj2GxKUGJ+cjgDOUICSNSoQ6z/D4KQ4w0h7X6
	wFANwTk0s45QzoXDzjiIo1XVn3+5CDDnP8f7zd87qGTaFtRYY2AZaI=
X-Received: by 2002:ac8:5705:0:b0:51c:1cf8:ca4d with SMTP id d75a77b69052e-5213aa6cc57mr107585901cf.13.1784497338222;
        Sun, 19 Jul 2026 14:42:18 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5214d09bb08sm60054541cf.12.2026.07.19.14.42.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 14:42:16 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-clk@vger.kernel.org
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	David Lechner <david@lechnology.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCHv2] clk: davinci: add COMPILE_TEST support
Date: Sun, 19 Jul 2026 14:42:14 -0700
Message-ID: <20260719214214.726826-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add driver-scoped Kconfig symbols for the DaVinci clock drivers so they can
be built through COMPILE_TEST without selecting the ARM DaVinci platform
symbols.

Keep the existing ARM platform behavior by defaulting the new symbols from
the corresponding ARCH_DAVINCI symbols, and use the new symbols for the
davinci clock Makefile entries.

Assisted-by: Codex:GPT-5.5
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v2: use COMMON_CLK prefix.
 drivers/clk/Kconfig          |  1 +
 drivers/clk/Makefile         |  2 +-
 drivers/clk/davinci/Kconfig  | 29 +++++++++++++++++++++++++++++
 drivers/clk/davinci/Makefile |  8 +++-----
 4 files changed, 34 insertions(+), 6 deletions(-)
 create mode 100644 drivers/clk/davinci/Kconfig

diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
index 40e2451ee1d8..16191b297150 100644
--- a/drivers/clk/Kconfig
+++ b/drivers/clk/Kconfig
@@ -516,6 +516,7 @@ source "drivers/clk/actions/Kconfig"
 source "drivers/clk/analogbits/Kconfig"
 source "drivers/clk/aspeed/Kconfig"
 source "drivers/clk/bcm/Kconfig"
+source "drivers/clk/davinci/Kconfig"
 source "drivers/clk/eswin/Kconfig"
 source "drivers/clk/hisilicon/Kconfig"
 source "drivers/clk/imgtec/Kconfig"
diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
index 087893f77bec..d90b15bb8e74 100644
--- a/drivers/clk/Makefile
+++ b/drivers/clk/Makefile
@@ -119,7 +119,7 @@ obj-$(CONFIG_ARCH_ARTPEC)		+= axis/
 obj-$(CONFIG_ARC_PLAT_AXS10X)		+= axs10x/
 obj-y					+= bcm/
 obj-$(CONFIG_ARCH_BERLIN)		+= berlin/
-obj-$(CONFIG_ARCH_DAVINCI)		+= davinci/
+obj-$(CONFIG_COMMON_CLK_DAVINCI)	+= davinci/
 obj-$(CONFIG_COMMON_CLK_ESWIN)		+= eswin/
 obj-$(CONFIG_ARCH_HISI)			+= hisilicon/
 obj-y					+= imgtec/
diff --git a/drivers/clk/davinci/Kconfig b/drivers/clk/davinci/Kconfig
new file mode 100644
index 000000000000..5bbe2b98db5d
--- /dev/null
+++ b/drivers/clk/davinci/Kconfig
@@ -0,0 +1,29 @@
+# SPDX-License-Identifier: GPL-2.0-only
+config COMMON_CLK_DAVINCI
+	bool "Clock drivers for TI DaVinci SoCs"
+	depends on ARCH_DAVINCI || COMPILE_TEST
+	depends on HAS_IOMEM
+	select REGMAP_MMIO
+	select RESET_CONTROLLER
+	default ARCH_DAVINCI
+	help
+	  Support for the clock controllers found on TI DaVinci SoCs.
+
+if COMMON_CLK_DAVINCI
+
+config COMMON_CLK_DAVINCI_DA8XX_CFGCHIP
+	bool "TI DA8xx CFGCHIP clock driver"
+	default ARCH_DAVINCI_DA8XX
+	help
+	  Support for the CFGCHIP clock gates found on TI DA8xx/OMAP-L13x
+	  SoCs.
+
+config COMMON_CLK_DAVINCI_DA850
+	bool "TI DA850/OMAP-L138/AM18x clock support"
+	select COMMON_CLK_DAVINCI_DA8XX_CFGCHIP
+	default ARCH_DAVINCI_DA850
+	help
+	  Support for the PLL and PSC clocks found on TI DA850/OMAP-L138/AM18x
+	  SoCs.
+
+endif
diff --git a/drivers/clk/davinci/Makefile b/drivers/clk/davinci/Makefile
index f9d5c9a392e4..4899cdf04bd6 100644
--- a/drivers/clk/davinci/Makefile
+++ b/drivers/clk/davinci/Makefile
@@ -1,11 +1,9 @@
 # SPDX-License-Identifier: GPL-2.0
 
-ifeq ($(CONFIG_COMMON_CLK), y)
-obj-$(CONFIG_ARCH_DAVINCI_DA8XX)	+= da8xx-cfgchip.o
+obj-$(CONFIG_COMMON_CLK_DAVINCI_DA8XX_CFGCHIP)	+= da8xx-cfgchip.o
 
 obj-y += pll.o
-obj-$(CONFIG_ARCH_DAVINCI_DA850)	+= pll-da850.o
+obj-$(CONFIG_COMMON_CLK_DAVINCI_DA850)		+= pll-da850.o
 
 obj-y += psc.o
-obj-$(CONFIG_ARCH_DAVINCI_DA850)	+= psc-da850.o
-endif
+obj-$(CONFIG_COMMON_CLK_DAVINCI_DA850)		+= psc-da850.o
-- 
2.55.0

