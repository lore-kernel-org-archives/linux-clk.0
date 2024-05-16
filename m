Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0278014E2DB
	for <linux-clk@vger.kernel.org>; Thu, 16 May 2024 15:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715872138; cv=none; b=dUDRucYhzqkBVFhvIVO5qWpZt+l0L5I33q8eQ5KLfKLfHbsQ4OjZSSgA3AiVDVyFBpHndBdhhpcvZg3Mu8tlJwJdKU2OQJjAyfUNUWHjPstQ98YLoU11cx/erf2w2mJn3OG/YnCmw+TvR1mmAFh2WKTiTzmql2PRK5idXxToFTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715872138; c=relaxed/simple;
	bh=YuEmKCYtjRzD28siL5Mef5H9DNeixjGQ8vzsFA0+0cI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oYdwmq2+iYyhq0OIFgGO0HEVVvyJp0SnsM51x+57uYwgG8Fx4+M/Z/S8y3M/HeiMIG8+5o0KxQOIYF5r6Vo56GF9DIJ3BvKGZ06oPnzUJm5f+AS6Ije81HEj4XBG7pd8su6tUgQqf1mnoBr4UW2VYQ4LBIXM3kn28J6N6ZQUe7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=wLgvbNR3; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="wLgvbNR3"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2e6f2534e41so8181061fa.0
        for <linux-clk@vger.kernel.org>; Thu, 16 May 2024 08:08:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1715872134; x=1716476934; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GDg+S33WfMWdi2lheaCvuNpDqmP/KU8F5TNkAy677Bw=;
        b=wLgvbNR3RKOhgFwV1r8erBg3jc0H/XlXJ6EODMTbFjGwOhoMK16+JXb3DeFhxwY926
         9dW3sQJCw0DcWyMQCBGPuGFFXTxlRkKVWAAjQRxF8zvxR91LfoHHFYbQTa/C7I3i88Us
         0g58nwZ+qbe6t+/PhfAVB4qRs7iyNjnsFBQ3h/H0alHPBfBcQtk+6SYfR3pXqoZBAZNg
         gqeeCTXe2G77J8A6vIUg08t7LGlRMvt8rn0EwXFl2vpzM97uC6JRjpbXaQaTgTWlxXtI
         3BYug6VhDAWUyusOdc0rgzzIAJplr+bd/cQ+VZiRaFpaaRUmGcG6wCy9aGie7Y/5SzdP
         ltIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715872134; x=1716476934;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GDg+S33WfMWdi2lheaCvuNpDqmP/KU8F5TNkAy677Bw=;
        b=rIWiaseol6n+sGR4xiCR7J9/ovrEXdMUx2BLSiLMh/u+7s6inWhshA17bX7TlvyHBb
         lTIDzVsJ5jyQ+ANP4JUE+61sXvPXnq6r41KxMV201NF2tH7j80Mn9GodZgh5eep18ZFP
         AxNvXVBs+zQNMCluKMQ2COuuL7OQ7Qp77zdGe3lmt5+cll4AHLBfGf0UnbbAb4vWbH3Y
         55Mvi32M6V43x2Mxc+Mb3utUdk9LlWPZODBtroYi2Uwhl7vttdrTmNAhGVBUbl4KKamL
         PlUgP1Kkvt+AIWlQheFP9PDBJ+xcbJn/uN6YOBoX57FUiclXyngHqL5ggyJexPapt2dK
         w/lQ==
X-Forwarded-Encrypted: i=1; AJvYcCWEYjZ1yS5RE8AhaBLGKWRNOGvdu4seYK3qeI11IGiXH7aUkeWMuW1n80BseqLHua/dLDtxjn1gv3GVE+h3tmWlpXqh24fEpPum
X-Gm-Message-State: AOJu0YxUDf6DBZsG9AEoOqEGOyMHrs+bbZVUV26twC0zcULJTHZHhTvJ
	/hU33uOwQWQN3K/ufj51pQvDZkKP6o3pvPeImPzkA+ftJ4jiYs/8Pg3SW9xH/CE=
X-Google-Smtp-Source: AGHT+IF1dSFKKcicuWhPp02H8rzX/qoi5Hi1Gh7DCEthhD2sCLusrICLNxjBEsCmmaWZJsCyOMO6+g==
X-Received: by 2002:a2e:8688:0:b0:2e6:f1f6:7ddb with SMTP id 38308e7fff4ca-2e6f1f6809dmr39824751fa.3.1715872134123;
        Thu, 16 May 2024 08:08:54 -0700 (PDT)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:1fce:7e5a:e201:edd5])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-41f87c25459sm309351725e9.18.2024.05.16.08.08.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 May 2024 08:08:53 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Stephen Boyd <sboyd@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Jan Dakinevich <jan.dakinevich@salutedevices.com>,
	linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: [RFC PATCH 7/9] reset: amlogic: add auxiliary reset driver support
Date: Thu, 16 May 2024 17:08:37 +0200
Message-ID: <20240516150842.705844-8-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240516150842.705844-1-jbrunet@baylibre.com>
References: <20240516150842.705844-1-jbrunet@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit

Add support for the reset controller present in the audio clock
controller of the g12 and sm1 SoC families, using the auxiliary bus.

This is expected to replace the driver currently present directly
within the related clock driver.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/reset/Kconfig                         |  1 +
 drivers/reset/reset-meson.c                   | 46 ++++++++++++++++++-
 include/soc/amlogic/meson8b-auxiliary-reset.h | 17 +++++++
 3 files changed, 63 insertions(+), 1 deletion(-)
 create mode 100644 include/soc/amlogic/meson8b-auxiliary-reset.h

diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
index 85b27c42cf65..4ceb4dc48fbc 100644
--- a/drivers/reset/Kconfig
+++ b/drivers/reset/Kconfig
@@ -134,6 +134,7 @@ config RESET_MCHP_SPARX5
 config RESET_MESON
 	tristate "Meson Reset Driver"
 	depends on ARCH_MESON || COMPILE_TEST
+	depends on AUXILIARY_BUS
 	default ARCH_MESON
 	help
 	  This enables the reset driver for Amlogic Meson SoCs.
diff --git a/drivers/reset/reset-meson.c b/drivers/reset/reset-meson.c
index e34a10b15593..b5ddb85296ec 100644
--- a/drivers/reset/reset-meson.c
+++ b/drivers/reset/reset-meson.c
@@ -5,6 +5,7 @@
  * Copyright (c) 2016 BayLibre, SAS.
  * Author: Neil Armstrong <narmstrong@baylibre.com>
  */
+#include <linux/auxiliary_bus.h>
 #include <linux/err.h>
 #include <linux/init.h>
 #include <linux/io.h>
@@ -16,6 +17,8 @@
 #include <linux/slab.h>
 #include <linux/types.h>
 
+#include <soc/amlogic/meson8b-auxiliary-reset.h>
+
 struct meson_reset_param {
 	const struct reset_control_ops *reset_ops;
 	unsigned int reset_num;
@@ -218,6 +221,47 @@ static struct platform_driver meson_reset_pltf_driver = {
 };
 module_platform_driver(meson_reset_pltf_driver);
 
-MODULE_DESCRIPTION("Amlogic Meson Reset Controller driver");
+static const struct meson_reset_param meson_g12a_audio_param = {
+	.reset_ops	= &meson_reset_toggle_ops,
+	.reset_num	= 26,
+	.level_offset	= 0x24,
+};
+
+static const struct meson_reset_param meson_sm1_audio_param = {
+	.reset_ops	= &meson_reset_toggle_ops,
+	.reset_num	= 39,
+	.level_offset	= 0x28,
+};
+
+static const struct auxiliary_device_id meson_reset_aux_ids[] = {
+	{
+		.name = "axg-audio-clkc.rst-g12a",
+		.driver_data = (kernel_ulong_t)&meson_g12a_audio_param,
+	}, {
+		.name = "axg-audio-clkc.rst-sm1",
+		.driver_data = (kernel_ulong_t)&meson_sm1_audio_param,
+	},
+};
+MODULE_DEVICE_TABLE(auxiliary, meson_reset_aux_ids);
+
+static int meson_reset_aux_probe(struct auxiliary_device *adev,
+				 const struct auxiliary_device_id *id)
+{
+	const struct meson_reset_param *param =
+		(const struct meson_reset_param *)(id->driver_data);
+	struct meson8b_reset_adev *raux =
+		to_meson8b_reset_adev(adev);
+
+	return meson_reset_probe(&adev->dev, raux->map, param);
+}
+
+static struct auxiliary_driver meson_reset_aux_driver = {
+	.probe		= meson_reset_aux_probe,
+	.id_table	= meson_reset_aux_ids,
+};
+module_auxiliary_driver(meson_reset_aux_driver);
+
+MODULE_DESCRIPTION("Amlogic Meson Reset driver");
 MODULE_AUTHOR("Neil Armstrong <narmstrong@baylibre.com>");
+MODULE_AUTHOR("Jerome Brunet <jbrunet@baylibre.com>");
 MODULE_LICENSE("Dual BSD/GPL");
diff --git a/include/soc/amlogic/meson8b-auxiliary-reset.h b/include/soc/amlogic/meson8b-auxiliary-reset.h
new file mode 100644
index 000000000000..0a465deb4440
--- /dev/null
+++ b/include/soc/amlogic/meson8b-auxiliary-reset.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __SOC_AMLOGIC_MESON8B_AUX_RESET_H
+#define __SOC_AMLOGIC_MESON8B_AUX_RESET_H
+
+#include <linux/auxiliary_bus.h>
+#include <linux/container_of.h>
+#include <linux/regmap.h>
+
+struct meson8b_reset_adev {
+	struct auxiliary_device adev;
+	struct regmap *map;
+};
+
+#define to_meson8b_reset_adev(_adev) \
+	container_of((_adev), struct meson8b_reset_adev, adev)
+
+#endif /* __SOC_AMLOGIC_MESON8B_AUX_RESET_H */
-- 
2.43.0

