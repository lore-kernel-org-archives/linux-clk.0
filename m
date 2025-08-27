Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76CCB34DCFB
	for <linux-clk@vger.kernel.org>; Wed, 27 Aug 2025 12:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756298543; cv=none; b=qOT8b/X28QApwC/OEB4PPunK3LQbKJiHJ2N/uf+Lu0J3UImccDvyn1+6LmEH2G8Wd/PAVOCaBip5fsTg5DA5gF4qps5EObOD+SYUAXja4AamYaGsczpM78zlqe1atqF6lTQhmEpQudmWqqrp8i+yNQQBt/kZQZOyoOvfukN/0WQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756298543; c=relaxed/simple;
	bh=hxMcE7MRiIJXv//ASvuI744f53HEqEa5zNpqOkTvDes=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GLXuOtq1PnmlJ273xnIjbSR8XuVxONbFvNdm/NL2CJ0OJcUt8Cdwn6b9n2OSFGdVgj93c7T6htp2UA5LiDuA+g2l7Xm4SG4BiNOj35VjCZTE/A51IuJ+oL2VyJF0vBqVrcbH8mW6ME9uaob+4rkltotX1JkQMoBgzdoS9iRSOns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VRfPZF9Y; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VRfPZF9Y"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3c79f0a5c5fso2974964f8f.1
        for <linux-clk@vger.kernel.org>; Wed, 27 Aug 2025 05:42:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756298537; x=1756903337; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1Bu9WwllI1/aHetTdCVAc781r3085wkHxA8POFybn3Q=;
        b=VRfPZF9YmlvgAFEU2eXOAnDy+KAJdxvIdYjvry27XU0gL3ZqurF8k4kvJtWF8gb/Ix
         FPEYm/v0jKT/RCpU2bfGOcumouW+WFfkFGTzP1VsKH9srvL9++6buvKpI5HfDjzZ0wDT
         5rwbCM24EgQGXYgDhm2B6i0gVHSLkCJOgrqd7VfCL5uAtKP0cbxBs69fYvfMI3Cog6y5
         xH0DQ1jhGiUnf6oZ/U7uZkWjvgvdq/wlIo25YbVDtBlNMd5uuY/A3BmxIfpLRD8GPfdn
         lxTB7m8jWupnloMlkIWDf6u5hiFU+luGhfnrvGRmeEjyALKNarS7uejhH6lll9c3xjQR
         WonA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756298537; x=1756903337;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1Bu9WwllI1/aHetTdCVAc781r3085wkHxA8POFybn3Q=;
        b=jYA+5IbdgUFlVc8h9nnHtSImdX9loEonnZvtQnEu9YBA64fqA92b8RIsi5qKciPQjs
         B7w/4pHsjRUiT0h+H6SaoRuvfteeLkPSo69HWoajuC70+Hp4xe4aILH8WTzXtaiE1WOb
         BwCKMM/iWSq9RvjptwCtiiqc8XimSOIjSIWaJelrOKRwMc1f4FBFB/8c4EbBgbAMWI3h
         dc6dVm4icpsVj9t9IPn/xbS3s30HoBuENBnEJnosdGAxXMH9/E8kC511lar/2sh7rErb
         LXckLlRDdUDmiE6z0T/TOgX28pKquN9/QUEkE8J06DxRO6Do3U3NU6ccKZoyTYeFDUXA
         WJYw==
X-Forwarded-Encrypted: i=1; AJvYcCVtzB0WkBkJ6tizfzAgcIx+Tf52ndXrILzi+Kk5VKOIBsHsa7tPkjXey/IGugAE41YMHZSSBrwxqN4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzhTtdQpNmSH9KL9CQVGa+61e5MEy741bBJj9AzLS6m58LvrzUg
	HM4cwAZIboz+LbX3Gx19YUcJ+DwL6feQX0SQ2oA5xS9Z4u7eevgp/zdvnlccnG2W8sY=
X-Gm-Gg: ASbGnctaS/j5f9u8PgskxxojRVO5WcqfTQyOvquRTOwzT/zKTwgaBZg7QbiN+UGnccQ
	81gO9Lqu3eRqtaHtKYofwqapJfCmHR4zZVE1n9L38IidNni5BFuNVBuYa7znly1y0IXHGn7sKxK
	fRBb+dpHYq2VqMtxYJ1xAFo2Q/t23VgnqfQ0jiLZ7JWLBFwXxBzhTwJry8rg1Ow0nCEt6lpAVWG
	tgPTh6D6Fdh9qwrS+A5mL0okytmBh5s6qALb9cDoSxypZ2rqz5hX/dKDaI8nUgeIHGFE5D5pfU3
	NPQAQcHrKJPLdf0LjvUxDyyemAdOK9ANbpL8lxtyqoYZpV5VLPn0BBH9qo16yFi76NGroLvq1Yk
	5tuEiCSUkq4Gpel4XOKeDsHgzu7syUj+muc6nWzpAKZEIOLBkkyU/z6ad8MjKUS4u6mXANCLwIW
	mn0Q==
X-Google-Smtp-Source: AGHT+IF/FdwyOkdXL4ST8U1Wn2IVLM4p7Ba2HIcJYHc0uZKghdayDs6IHiT63SZ5m/flo+ZpCk+YxQ==
X-Received: by 2002:a5d:64cb:0:b0:3cc:d0ae:ae1a with SMTP id ffacd0b85a97d-3ccd0aeaed6mr1794228f8f.55.1756298537468;
        Wed, 27 Aug 2025 05:42:17 -0700 (PDT)
Received: from ta2.c.googlers.com (219.43.233.35.bc.googleusercontent.com. [35.233.43.219])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3cbab3ead0dsm6439420f8f.29.2025.08.27.05.42.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Aug 2025 05:42:17 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Wed, 27 Aug 2025 12:42:12 +0000
Subject: [PATCH v2 2/5] firmware: exynos-acpm: add DVFS protocol
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250827-acpm-clk-v2-2-de5c86b49b64@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756298535; l=6599;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=hxMcE7MRiIJXv//ASvuI744f53HEqEa5zNpqOkTvDes=;
 b=zAssuZW+Qm18GDKV7k/CCeZa4oZUq1Cp8+cLNEmuG2PU8y4tEzF6A7NhtFDCQBNSggLFOv4dd
 op5WdKZEfQ9BjgU8kgo+CAkoHlDHN63EOUyS010qA+9NOzP4Fs+0URa
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

Add ACPM DVFS protocol handler. It constructs DVFS messages that
the APM firmware can understand.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/firmware/samsung/Makefile                  |  4 +-
 drivers/firmware/samsung/exynos-acpm-dvfs.c        | 83 ++++++++++++++++++++++
 drivers/firmware/samsung/exynos-acpm-dvfs.h        | 21 ++++++
 drivers/firmware/samsung/exynos-acpm.c             |  5 ++
 .../linux/firmware/samsung/exynos-acpm-protocol.h  | 10 +++
 5 files changed, 122 insertions(+), 1 deletion(-)

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
index 0000000000000000000000000000000000000000..a8763bf9374d41952a8d26124cc77baae0f1c723
--- /dev/null
+++ b/drivers/firmware/samsung/exynos-acpm-dvfs.c
@@ -0,0 +1,83 @@
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
+#define ACPM_DVFS_FREQ_REQ		0
+#define ACPM_DVFS_FREQ_GET		1
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
2.51.0.261.g7ce5a0a67e-goog

