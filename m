Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFFAF32C327
	for <linux-clk@vger.kernel.org>; Tue, 19 Aug 2025 11:45:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755603958; cv=none; b=ghQd18p7cV6WtdbOs/ZMqOwm5sSzjZ/otzFOJQ0/ZWtj/Dh2i0QV/Ym8VLBZ0BgDyDLF9AXqHU2ILeTOmhtw+v8+HZ8kI9H8M68ke+GPLxqsBzAOePh4aevMz8NQvEBkGeMDWC8qb0+HYQbDDlJxOGUpZKUdeMxWITPii1y2M2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755603958; c=relaxed/simple;
	bh=j0BnWAhDqW93980MJMTG4FCn6QvHbgEEGRYAeb0s4W0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dNVKs2OTFVnUQdsLYIaij7kW8NlArcwgZZQptic+KZoEy7YSYRPfz0AJTjq8CO9j+GAmiS36eauhUy7kL7ELpV+xg9zolUgvwII8YPro2WQs+PsbDuLKDkmF4MS3nv2RjoXkG+O7rReEV+e2xiCW/lE6eTWOmHr+6CD7V+5Czg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BvbYixqr; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BvbYixqr"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-45a1b065d58so39026215e9.1
        for <linux-clk@vger.kernel.org>; Tue, 19 Aug 2025 04:45:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755603955; x=1756208755; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mLJDOHFLAE+/7ofBBmeHWb5P/k7aXqaaIgt/JhlZZaU=;
        b=BvbYixqrhsDe7deVpve8gP2pdZCRmZYEf4lvWYaHCe5Q2VvxjPKiW17JTBw3/NLdFa
         0Rj5zxIoMevYH9qjo5+yz9LVP9CbxHVrmtrYLFwK+2AWRzh3Jb/IsUmkSxJjD37Wv4LC
         G/elAmAEm8V+sVd4mUhINJvZr2llCVVuMhi1BlA0Sm2e8GYtjqo524xaxUPosBrp95hl
         WQzuS1gFQTMDZjoaW4ij7TGxfbJPTMEJdaaVCfFeD/iGY6y2Qsg92gG9xyqfC3L7WBe1
         ZslehkeYn9gz9urIaZr5ZRpOUK5WS2ubd18nKc0/Mavo36OS8QD9TjEPJ63fjeoEAaVQ
         VoTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755603955; x=1756208755;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mLJDOHFLAE+/7ofBBmeHWb5P/k7aXqaaIgt/JhlZZaU=;
        b=sgNtzYeA+xM7AEeTKYa4iXQgk7/Sf24KKJ5FeFeP10YBqlFvxODHHbZxSST8ZSC0h1
         lNknQJ8Al/iOYjWeON7TxaUBxUhcciGFpoqwjf9W5IRFvRNVJusAlqsVk4I+RSE3J5bQ
         5glMsp+nZIFkkCNGCamR9RYB/2tZqyh2YuPlXv+MrlliFSY3x0xGwKlWpHfpSyuch63G
         Zy2m4Tdb1xNbc13sTg67s6yzkVgLmkPsxa3rSlHfGdEgvtGoCh3ZSWSpmODtLrkdwRu/
         bTbf5wvCg2UlYMHYlvRTUws00UthsWIxHEraqcPlMQYZFNYcFqsHu/amrSgVPVMnpLgd
         AXpg==
X-Forwarded-Encrypted: i=1; AJvYcCV9U/Nhy246+Ov8AMf8KLEBorK4UBIyyTL7It3Ow6hndMrP3KDerPfLndh3sS4s9xDVwTTseZDBTKo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzaz7JLtkBtOTNpcbrDlFy/fV3Em4b5NNdX44OHYuUO5NljM1bg
	i0vFO771xWYwpMp4MwxpSJpUVGSG72GFyA3krc4t0Y9V4PAqguY81YebuOBkeN104qE=
X-Gm-Gg: ASbGncs9Oay7zON4xb3ZPAHjN8OeYU7k+gO4HQaHMH/xybGLVqDFJugJrO5kJGBxSNo
	Ii9AECsX3KF71PocfB4beR2p0DdpVDogiGl0o0Yf9ZZf02Ox1yLPUIiwHXALYASy/jSH8lkuH6J
	Y2sd4owbZha0Xg5GhUb/81htV7zm6wQ7mMvB290fOFImCRdi9BtcDH4ZUhlV4md0HrmFgiTCKA5
	wJoSa1yqpZao3jMnns9As6uMK5vpwGGcvbTAAG/UZ1bDB8JRQAm7mVI1WbdwrYE8ZCvzX97C/yL
	1/nnjADYLZqzL2R8b+YiTOKwih7AWKhEhOXG+Z4aBh9Gup9an20dsr61e8j3lJxWoUhH+CJqW2n
	xWCyogrv2yLHGXa3VvJh+uLGhwSqNze0qjrGIaAQiHEQnosknPMHI3pyWEbNiQsYcRHSzJ1RJu0
	8diw==
X-Google-Smtp-Source: AGHT+IESX1PPZElxnFttFv84eb1J/CkA8TVR6xWv74teidOy3fiZPcwgJofWE17WBQlXCHAWQn7osA==
X-Received: by 2002:a05:6000:4383:b0:3b7:8473:31c3 with SMTP id ffacd0b85a97d-3c0e00a105fmr325000f8f.9.1755603954886;
        Tue, 19 Aug 2025 04:45:54 -0700 (PDT)
Received: from ta2.c.googlers.com (245.92.187.35.bc.googleusercontent.com. [35.187.92.245])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c077788df7sm3430817f8f.48.2025.08.19.04.45.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 04:45:54 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Tue, 19 Aug 2025 11:45:37 +0000
Subject: [PATCH 2/3] firmware: exynos-acpm: add DVFS protocol
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250819-acpm-clk-v1-2-6bbd97474671@linaro.org>
References: <20250819-acpm-clk-v1-0-6bbd97474671@linaro.org>
In-Reply-To: <20250819-acpm-clk-v1-0-6bbd97474671@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-clk@vger.kernel.org, willmcvicker@google.com, kernel-team@android.com, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755603952; l=6621;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=j0BnWAhDqW93980MJMTG4FCn6QvHbgEEGRYAeb0s4W0=;
 b=KTiIalOm1UBeH7L/m3ZP8PgxAwNUu4gW37VVDI7lJrJMmvBPyeXjemeUn04pDogpe84GEjvVP
 QLEWsW4HaFSAa3LCLpnOovFdrk8Ou6Qwe8TRNrqJYzNzY0FnEyM9Ce1
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

Add ACPM DVFS protocol handler. It constructs DVFS messages that
the APM firmware can understand.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/firmware/samsung/Makefile                  |  4 +-
 drivers/firmware/samsung/exynos-acpm-dvfs.c        | 85 ++++++++++++++++++++++
 drivers/firmware/samsung/exynos-acpm-dvfs.h        | 21 ++++++
 drivers/firmware/samsung/exynos-acpm.c             |  5 ++
 .../linux/firmware/samsung/exynos-acpm-protocol.h  | 10 +++
 5 files changed, 124 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/samsung/Makefile b/drivers/firmware/samsung/Makefile
index 7b4c9f6f34f54fd731886d97a615fe1aa97ba9a0..80d4f89b33a9558b68c9083da675c70ec3d05f19 100644
--- a/drivers/firmware/samsung/Makefile
+++ b/drivers/firmware/samsung/Makefile
@@ -1,4 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
-acpm-protocol-objs			:= exynos-acpm.o exynos-acpm-pmic.o
+acpm-protocol-objs			:= exynos-acpm.o
+acpm-protocol-objs			+= exynos-acpm-pmic.o
+acpm-protocol-objs			+= exynos-acpm-dvfs.o
 obj-$(CONFIG_EXYNOS_ACPM_PROTOCOL)	+= acpm-protocol.o
diff --git a/drivers/firmware/samsung/exynos-acpm-dvfs.c b/drivers/firmware/samsung/exynos-acpm-dvfs.c
new file mode 100644
index 0000000000000000000000000000000000000000..ee457c1a3de2ff2e4395d9fc3ff4c13294473b2d
--- /dev/null
+++ b/drivers/firmware/samsung/exynos-acpm-dvfs.c
@@ -0,0 +1,85 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright 2020 Samsung Electronics Co., Ltd.
+ * Copyright 2020 Google LLC.
+ * Copyright 2025 Linaro Ltd.
+ */
+
+#include <linux/bitfield.h>
+#include <linux/firmware/samsung/exynos-acpm-protocol.h>
+#include <linux/ktime.h>
+#include <linux/types.h>
+#include <linux/units.h>
+
+#include "exynos-acpm.h"
+#include "exynos-acpm-dvfs.h"
+
+#define ACPM_DVFS_ID			GENMASK(11, 0)
+#define ACPM_DVFS_REQ_TYPE		GENMASK(15, 0)
+
+enum exynos_acpm_dvfs_func {
+	ACPM_DVFS_FREQ_REQ,
+	ACPM_DVFS_FREQ_GET,
+};
+
+static void acpm_dvfs_set_xfer(struct acpm_xfer *xfer, u32 *cmd, size_t cmdlen,
+			       unsigned int acpm_chan_id, bool response)
+{
+	xfer->acpm_chan_id = acpm_chan_id;
+	xfer->txd = cmd;
+	xfer->txlen = cmdlen;
+
+	if (response) {
+		xfer->rxd = cmd;
+		xfer->rxlen = cmdlen;
+	}
+}
+
+static void acpm_dvfs_init_set_rate_cmd(u32 cmd[4], unsigned int clk_id,
+					unsigned long rate)
+{
+	cmd[0] = FIELD_PREP(ACPM_DVFS_ID, clk_id);
+	cmd[1] = rate / HZ_PER_KHZ;
+	cmd[2] = FIELD_PREP(ACPM_DVFS_REQ_TYPE, ACPM_DVFS_FREQ_REQ);
+	cmd[3] = ktime_to_ms(ktime_get());
+}
+
+int acpm_dvfs_set_rate(const struct acpm_handle *handle,
+		       unsigned int acpm_chan_id, unsigned int clk_id,
+		       unsigned long rate)
+{
+	struct acpm_xfer xfer = {0};
+	u32 cmd[4];
+
+	acpm_dvfs_init_set_rate_cmd(cmd, clk_id, rate);
+	acpm_dvfs_set_xfer(&xfer, cmd, sizeof(cmd), acpm_chan_id, false);
+
+	return acpm_do_xfer(handle, &xfer);
+}
+
+static void acpm_dvfs_init_get_rate_cmd(u32 cmd[4], unsigned int clk_id,
+					u32 dbg_val)
+{
+	cmd[0] = FIELD_PREP(ACPM_DVFS_ID, clk_id);
+	cmd[1] = dbg_val;
+	cmd[2] = FIELD_PREP(ACPM_DVFS_REQ_TYPE, ACPM_DVFS_FREQ_GET);
+	cmd[3] = ktime_to_ms(ktime_get());
+}
+
+unsigned long acpm_dvfs_get_rate(const struct acpm_handle *handle,
+				 unsigned int acpm_chan_id, unsigned int clk_id,
+				 u32 dbg_val)
+{
+	struct acpm_xfer xfer;
+	unsigned int cmd[4];
+	int ret;
+
+	acpm_dvfs_init_get_rate_cmd(cmd, clk_id, dbg_val);
+	acpm_dvfs_set_xfer(&xfer, cmd, sizeof(cmd), acpm_chan_id, true);
+
+	ret = acpm_do_xfer(handle, &xfer);
+	if (ret)
+		return 0;
+
+	return xfer.rxd[1] * HZ_PER_KHZ;
+}
diff --git a/drivers/firmware/samsung/exynos-acpm-dvfs.h b/drivers/firmware/samsung/exynos-acpm-dvfs.h
new file mode 100644
index 0000000000000000000000000000000000000000..85a10bd535d118f2f36e9888e41b9b705b08ea59
--- /dev/null
+++ b/drivers/firmware/samsung/exynos-acpm-dvfs.h
@@ -0,0 +1,21 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright 2020 Samsung Electronics Co., Ltd.
+ * Copyright 2020 Google LLC.
+ * Copyright 2025 Linaro Ltd.
+ */
+#ifndef __EXYNOS_ACPM_DVFS_H__
+#define __EXYNOS_ACPM_DVFS_H__
+
+#include <linux/types.h>
+
+struct acpm_handle;
+
+int acpm_dvfs_set_rate(const struct acpm_handle *handle,
+		       unsigned int acpm_chan_id, unsigned int id,
+		       unsigned long rate);
+unsigned long acpm_dvfs_get_rate(const struct acpm_handle *handle,
+				 unsigned int acpm_chan_id, unsigned int clk_id,
+				 u32 dbg_val);
+
+#endif /* __EXYNOS_ACPM_DVFS_H__ */
diff --git a/drivers/firmware/samsung/exynos-acpm.c b/drivers/firmware/samsung/exynos-acpm.c
index 3a69fe3234c75e0b5a93cbea6bb210dc6f69d2a6..9fa0335ccf5db32892fdf09e8d4b0a885a8f8fb5 100644
--- a/drivers/firmware/samsung/exynos-acpm.c
+++ b/drivers/firmware/samsung/exynos-acpm.c
@@ -29,6 +29,7 @@
 #include <linux/types.h>
 
 #include "exynos-acpm.h"
+#include "exynos-acpm-dvfs.h"
 #include "exynos-acpm-pmic.h"
 
 #define ACPM_PROTOCOL_SEQNUM		GENMASK(21, 16)
@@ -590,8 +591,12 @@ static int acpm_channels_init(struct acpm_info *acpm)
  */
 static void acpm_setup_ops(struct acpm_info *acpm)
 {
+	struct acpm_dvfs_ops *dvfs_ops = &acpm->handle.ops.dvfs_ops;
 	struct acpm_pmic_ops *pmic_ops = &acpm->handle.ops.pmic_ops;
 
+	dvfs_ops->set_rate = acpm_dvfs_set_rate;
+	dvfs_ops->get_rate = acpm_dvfs_get_rate;
+
 	pmic_ops->read_reg = acpm_pmic_read_reg;
 	pmic_ops->bulk_read = acpm_pmic_bulk_read;
 	pmic_ops->write_reg = acpm_pmic_write_reg;
diff --git a/include/linux/firmware/samsung/exynos-acpm-protocol.h b/include/linux/firmware/samsung/exynos-acpm-protocol.h
index f628bf1862c25fa018a2fe5e7e123bf05c5254b9..e41055316bb578bb8250a1b1177f1059eeeb2611 100644
--- a/include/linux/firmware/samsung/exynos-acpm-protocol.h
+++ b/include/linux/firmware/samsung/exynos-acpm-protocol.h
@@ -13,6 +13,15 @@
 struct acpm_handle;
 struct device_node;
 
+struct acpm_dvfs_ops {
+	int (*set_rate)(const struct acpm_handle *handle,
+			unsigned int acpm_chan_id, unsigned int clk_id,
+			unsigned long rate);
+	unsigned long (*get_rate)(const struct acpm_handle *handle,
+				  unsigned int acpm_chan_id,
+				  unsigned int clk_id, u32 dbg_val);
+};
+
 struct acpm_pmic_ops {
 	int (*read_reg)(const struct acpm_handle *handle,
 			unsigned int acpm_chan_id, u8 type, u8 reg, u8 chan,
@@ -32,6 +41,7 @@ struct acpm_pmic_ops {
 };
 
 struct acpm_ops {
+	struct acpm_dvfs_ops dvfs_ops;
 	struct acpm_pmic_ops pmic_ops;
 };
 

-- 
2.51.0.rc1.167.g924127e9c0-goog

