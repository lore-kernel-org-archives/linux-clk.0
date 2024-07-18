Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 860BE12F375
	for <linux-clk@vger.kernel.org>; Thu, 18 Jul 2024 09:58:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721296692; cv=none; b=VtRbKUpllHeXWYlEeqgU6rNGGKTtxPsjznIYNrmhw6U8OVeeb5m9d98o5XmTX5CVKqFVjOa/qIapYmiLq+IXnBPB4hZtZpR4G5RED1Qv4kqkSo7y/Wh/NxqLHCo4IEQsBThVWQGjO8Yb463hrD9ZaNpxyOWnBZbvkJDwTiiGOTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721296692; c=relaxed/simple;
	bh=X9P7ZeWymMLqFZGWrumCo8iBNn8RuORIPL0PHhhDpzI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C60rPJpJc/+CkP3H+eJDvP54RPLJBLlXYvcXjoDkHoV13ml2a4yZh2Lm+TMcz0zVO+M5UHgj0u5TWvedjgzn+YAhsE9rY+1MF+AO2Y62mqp9B70KIcixlbcOFi1miQo3X00ukJNl2XtH+0NT6+vt88wVqC3A82nF9MfRuzvgM8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=RfTljWYv; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="RfTljWYv"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-368380828d6so420477f8f.1
        for <linux-clk@vger.kernel.org>; Thu, 18 Jul 2024 02:58:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1721296689; x=1721901489; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/FraBsn5t4nMihNDzTPwopMxXwcMdzGEUC8JHsJV5Dk=;
        b=RfTljWYvQLwezfhk/m42037/Vys4IPtmlTiwmyNDbjd5CwAATkPlK1ZLZDPNbJBF4y
         eZoPOh+ud5i9qbpWw08J++J5ITcdw1Q2E56HlQFDtmwdg8COl0OeVXLXT0qydI4o2pSH
         rlOF24YBzc7qT9tGAZH2FtQolOQslpguolL3jfxdQw9xj8cxlcFl3VgyL8QjhvspZ0co
         Crkihe/0kUnCUggI2PSD3GZMqad2FSvPEemCT+dmbZhBE0mkXnHbo6ZFSz5H6BnZp/eT
         G2+ZFiFOEI9BySMr20BRbuuqGmxRvpTBOZR4zAzvRdh2EYB32dkTT8wGkkw6Z6PMYfot
         wadg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721296689; x=1721901489;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/FraBsn5t4nMihNDzTPwopMxXwcMdzGEUC8JHsJV5Dk=;
        b=s5FubkOh4UV/fYaoSFIl58cOEBxE8qmfwYuyC+KM2dp5OlhdKHnt8n0IOQDoAV7rI0
         9WlC7uk5hcCGykfHSlk1qeQUHwEk6ONUYN2ohV1iqWnROcsCaJ8dIAMHqrZ6cFJmpYpm
         F87wTaieRSTGZx6y3bHXERI+/+Mbaal8b64Q2ZNdxicHBMexpulN0a9oLMOXa1s7alu2
         baMZasXEHbV9lQwUROrGLhonkon2pQ4yN5P0A15O4+G1eE2I/4n7w+3RgvL8mNA3Jrhi
         fEJEEcS8fXMjjMUslfo38NzeTBhcZlDc6NXPo18xKzdpibxpPgfakq9mLpo9qMXk0RDx
         fq+A==
X-Forwarded-Encrypted: i=1; AJvYcCUUQhoFPWe15lYHvZWrQh+wRcpr4i8EfnBrSb43tqSldKU1NI71rn3h8aAAHrSnNvMFdWEnlvC4m0Os6ZobfwF2Ncwj9VSnN0xh
X-Gm-Message-State: AOJu0YxCt5vSKPlN/OkerLzhqKhLCrICzEkuLZetzbpRLAJtuGKjdRiY
	9R/+7IjEh644PImzFHuSlMKUt9rZwXcndCl/vfDqsr3+dCuYI8HWAD9K/bLnjco=
X-Google-Smtp-Source: AGHT+IFfFHtbCLCHhNC4eT72EfA+0uRA7O4pqzK1FiqFakwv+5WvN9D5HdNF0I2/90lf698t3MbycA==
X-Received: by 2002:a05:6000:2c8:b0:367:9639:66d3 with SMTP id ffacd0b85a97d-368315f3344mr3179887f8f.5.1721296688962;
        Thu, 18 Jul 2024 02:58:08 -0700 (PDT)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:8d37:f44a:c212:e320])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3680dab3be3sm13837155f8f.24.2024.07.18.02.58.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jul 2024 02:58:08 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Stephen Boyd <sboyd@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Jan Dakinevich <jan.dakinevich@salutedevices.com>,
	linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v2 7/9] reset: amlogic: move drivers to a dedicated directory
Date: Thu, 18 Jul 2024 11:57:51 +0200
Message-ID: <20240718095755.3511992-8-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240718095755.3511992-1-jbrunet@baylibre.com>
References: <20240718095755.3511992-1-jbrunet@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit

The meson reset driver will be split in two part, one implemeting the ops,
the other providing the platform driver support. This will be done to
facilitate the addition of the auxiliary bus support.

To avoid making a mess in drivers/reset/ while doing so, move the amlogic
reset drivers to a dedicated directory.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/reset/Kconfig                             | 15 +--------------
 drivers/reset/Makefile                            |  3 +--
 drivers/reset/amlogic/Kconfig                     | 13 +++++++++++++
 drivers/reset/amlogic/Makefile                    |  2 ++
 .../reset/{ => amlogic}/reset-meson-audio-arb.c   |  0
 drivers/reset/{ => amlogic}/reset-meson.c         |  0
 6 files changed, 17 insertions(+), 16 deletions(-)
 create mode 100644 drivers/reset/amlogic/Kconfig
 create mode 100644 drivers/reset/amlogic/Makefile
 rename drivers/reset/{ => amlogic}/reset-meson-audio-arb.c (100%)
 rename drivers/reset/{ => amlogic}/reset-meson.c (100%)

diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
index 36cfdb81cd34..3015fb8bb6e5 100644
--- a/drivers/reset/Kconfig
+++ b/drivers/reset/Kconfig
@@ -139,20 +139,6 @@ config RESET_MCHP_SPARX5
 	help
 	  This driver supports switch core reset for the Microchip Sparx5 SoC.
 
-config RESET_MESON
-	tristate "Meson Reset Driver"
-	depends on ARCH_MESON || COMPILE_TEST
-	default ARCH_MESON
-	help
-	  This enables the reset driver for Amlogic Meson SoCs.
-
-config RESET_MESON_AUDIO_ARB
-	tristate "Meson Audio Memory Arbiter Reset Driver"
-	depends on ARCH_MESON || COMPILE_TEST
-	help
-	  This enables the reset driver for Audio Memory Arbiter of
-	  Amlogic's A113 based SoCs
-
 config RESET_NPCM
 	bool "NPCM BMC Reset Driver" if COMPILE_TEST
 	default ARCH_NPCM
@@ -342,6 +328,7 @@ config RESET_ZYNQMP
 	help
 	  This enables the reset controller driver for Xilinx ZynqMP SoCs.
 
+source "drivers/reset/amlogic/Kconfig"
 source "drivers/reset/starfive/Kconfig"
 source "drivers/reset/sti/Kconfig"
 source "drivers/reset/hisilicon/Kconfig"
diff --git a/drivers/reset/Makefile b/drivers/reset/Makefile
index 27b0bbdfcc04..bf089176c9f4 100644
--- a/drivers/reset/Makefile
+++ b/drivers/reset/Makefile
@@ -1,5 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 obj-y += core.o
+obj-y += amlogic/
 obj-y += hisilicon/
 obj-y += starfive/
 obj-y += sti/
@@ -20,8 +21,6 @@ obj-$(CONFIG_RESET_K210) += reset-k210.o
 obj-$(CONFIG_RESET_LANTIQ) += reset-lantiq.o
 obj-$(CONFIG_RESET_LPC18XX) += reset-lpc18xx.o
 obj-$(CONFIG_RESET_MCHP_SPARX5) += reset-microchip-sparx5.o
-obj-$(CONFIG_RESET_MESON) += reset-meson.o
-obj-$(CONFIG_RESET_MESON_AUDIO_ARB) += reset-meson-audio-arb.o
 obj-$(CONFIG_RESET_NPCM) += reset-npcm.o
 obj-$(CONFIG_RESET_NUVOTON_MA35D1) += reset-ma35d1.o
 obj-$(CONFIG_RESET_PISTACHIO) += reset-pistachio.o
diff --git a/drivers/reset/amlogic/Kconfig b/drivers/reset/amlogic/Kconfig
new file mode 100644
index 000000000000..7ed9cf50f038
--- /dev/null
+++ b/drivers/reset/amlogic/Kconfig
@@ -0,0 +1,13 @@
+config RESET_MESON
+	tristate "Meson Reset Driver"
+	depends on ARCH_MESON || COMPILE_TEST
+	default ARCH_MESON
+	help
+	  This enables the reset driver for Amlogic Meson SoCs.
+
+config RESET_MESON_AUDIO_ARB
+	tristate "Meson Audio Memory Arbiter Reset Driver"
+	depends on ARCH_MESON || COMPILE_TEST
+	help
+	  This enables the reset driver for Audio Memory Arbiter of
+	  Amlogic's A113 based SoCs
diff --git a/drivers/reset/amlogic/Makefile b/drivers/reset/amlogic/Makefile
new file mode 100644
index 000000000000..55509fc78513
--- /dev/null
+++ b/drivers/reset/amlogic/Makefile
@@ -0,0 +1,2 @@
+obj-$(CONFIG_RESET_MESON) += reset-meson.o
+obj-$(CONFIG_RESET_MESON_AUDIO_ARB) += reset-meson-audio-arb.o
diff --git a/drivers/reset/reset-meson-audio-arb.c b/drivers/reset/amlogic/reset-meson-audio-arb.c
similarity index 100%
rename from drivers/reset/reset-meson-audio-arb.c
rename to drivers/reset/amlogic/reset-meson-audio-arb.c
diff --git a/drivers/reset/reset-meson.c b/drivers/reset/amlogic/reset-meson.c
similarity index 100%
rename from drivers/reset/reset-meson.c
rename to drivers/reset/amlogic/reset-meson.c
-- 
2.43.0

