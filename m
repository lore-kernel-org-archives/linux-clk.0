Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94C042EFD91
	for <linux-clk@vger.kernel.org>; Fri, 10 Oct 2025 12:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760100410; cv=none; b=ZeMQpGURhmzIFAReSH4K3efqMiX/83lX2cXP+JU0RRp2X1FaS1lC9SUTEWvhEAqFUrRXEM4tO0BgqDJkQW4wd03pZEhY2U8AgqHbe/CB0TqeTbgW9DTsWydpcRmnMLvjYtL2QelDlKsunnchFhHqUzsHY5ofM+KFI81nKZng9tE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760100410; c=relaxed/simple;
	bh=nht+0cVmRWVB4+ce3RyGxQzs5Rulvm6JKBBRx7syrdQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SWU/1+H5Lgd8nmH9DVCYThozcfvI8JyHhPtaKXlH/h7r0WEDXCSmG1azHD1cmq/2NLb3LK3BMOv+RC/PDzjg9N4XD0xYDaW657j0h04fybGSAVUL4cbCmlyGPhlR6hu9DLmj/yegJ1qCtluM1xow0hRH0OYWN3Grq73t8kFx7B8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WeXbz5Bz; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WeXbz5Bz"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-46e3a50bc0fso15899345e9.3
        for <linux-clk@vger.kernel.org>; Fri, 10 Oct 2025 05:46:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760100406; x=1760705206; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z2nfE8+rIsshVHGW4LOPPJ8IkWn50qSI7r3Sg04LOS8=;
        b=WeXbz5BzYYzDKX8TpZIUnQgh9nEJiRPM0tI/HqtcTpFAltCCScc0uHhv157GddB7gF
         xiq0Kye74oF8VFLnfEellguY2pCRVgkoRZ1V5TJbyd6d6j+M4WM8z/IhfUXmnLLezjiD
         HoSHIS11Q84L9ej6M2YUji5AQcOs70Z5V1C3RiZTjSf7kAI7/6f+5rS24qZTjl0K4jS1
         e5FkO+H1gYwyy5AXdw8/hHzPW0EVkEX7fdAKTV3oUFZ8swnG+D/7mPwf3xtxP89gV0l9
         CNI6BAQ8J2CVC7RKfppbh0svaDtlTgEJqGyBDZBhTJoymzXflZpq29qnbdlV25tIulps
         c42Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760100406; x=1760705206;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z2nfE8+rIsshVHGW4LOPPJ8IkWn50qSI7r3Sg04LOS8=;
        b=F5hkZ6VTcu5TuuqC7eRPAwFjMHet0D8Py+c94Fh4PTho186734ly7U71TBWCx9sZ5k
         XNXCuKYqu9Rw0LbBlPX+RY23E9P9DJF0IaWFgtpNzLLbYCleu5dUfdvF6h5IbO94mxTU
         S9nEt06m4EmfYDPhIDvitl+u+eb7ScRVvf9aEV4FCFK4RYeFBjfBeG0PZL70rSPyRfhw
         Xb+Hf9egUYHMWafD1dzryGJALk3jY/ug5DPs5y1/eq6fin3JO6y5Ug28p748+iWg5tKD
         Hqp0RVZWsu12exOnDHPZEroaB2J71SP+/WGaHob0mOlmC3ErCjN761eXjePxP22UA/cD
         7xzA==
X-Forwarded-Encrypted: i=1; AJvYcCVHW6LfET4AfEQ+YB/iw5PcvB2hr3tWCGuVWIslGpt78SfufIK3EqB5U8VmROCv9P6qPfXcokxuGl0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw076axwD2uVNPlQ3LvIOk5+haPNuPaKxybSACRHdFNUdaDs1di
	aJmOoOoYGNWDyepMRKogAumEA2a/pNlgwSccPxkII93rkZnC16YRAYPn0lmFJI/TZVw=
X-Gm-Gg: ASbGnctCKtjf+JaKg53ieVgjcZoymBWNeaCL/ggo+h42TUfKBbUG2vjAH1y9h1KIUT1
	jBUCdtQkFJ88Tc6AuMGBcP+XF7jdSdNGjQJmeUNb/hS/8LosacsZKL4z5YQMPI29HTHlqWIkYh/
	6oLuqCs8Y8OnFA0Y+qJn3B5r6KAol66HBoSCfPv1hEx3qD5+bJPg54MjwA8CEdzrIK4gl6y9fD5
	p2fTyfRLj2s7A6Y9+15ay8QV0DMfrPWQ4tf7UoLcyUfSi3yr1g/jD9QgkUVnmWrgqnGiJInCWoO
	jt8mlOXMwoFWz1X1tLrZmOcggCUt9tY8i7cc6iXO8w/BOGlKyUhXgqw76IyUmdlTf3GRaqXVVaH
	Y18p+7nc03SguO4IF7ODd1otZMC6Hyl9Vw4gtGHkJKmm0xMjasF7LmYBTG9MzZCifwPgD8bbOhc
	w1loDlJZznOdexueoDZTB3mg==
X-Google-Smtp-Source: AGHT+IEATMDjPVaW6xtHUuRAhcGKgkJK9KTgPht87/yGSDwr3glJqlrPD+XxdOBxV2tQdcqhsHLjjw==
X-Received: by 2002:a05:600c:c0c3:20b0:46e:39ef:be77 with SMTP id 5b1f17b1804b1-46faef4161fmr41056625e9.14.1760100406013;
        Fri, 10 Oct 2025 05:46:46 -0700 (PDT)
Received: from ta2.c.googlers.com (213.53.77.34.bc.googleusercontent.com. [34.77.53.213])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46fb484d056sm46376895e9.9.2025.10.10.05.46.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Oct 2025 05:46:45 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Fri, 10 Oct 2025 12:46:32 +0000
Subject: [PATCH v6 2/6] firmware: exynos-acpm: add DVFS protocol
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251010-acpm-clk-v6-2-321ee8826fd4@linaro.org>
References: <20251010-acpm-clk-v6-0-321ee8826fd4@linaro.org>
In-Reply-To: <20251010-acpm-clk-v6-0-321ee8826fd4@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760100401; l=6635;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=nht+0cVmRWVB4+ce3RyGxQzs5Rulvm6JKBBRx7syrdQ=;
 b=Ypmn0zfN5S3D+Z1XySnzwHo/8CvSXRu297Zid604jR7WgDqUN2+K8z+acuLkiRU/DSEpo3Eps
 598dHHMz/tSBPsYJVHKFhgTw6oRHWWPj0AQGWOxJ+HLXlgQVixyW1+w
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

Add ACPM DVFS protocol handler. It constructs DVFS messages that
the APM firmware can understand.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
Tested-by: Peter Griffin <peter.griffin@linaro.org> # on gs101-oriole
---
 drivers/firmware/samsung/Makefile                  |  4 +-
 drivers/firmware/samsung/exynos-acpm-dvfs.c        | 80 ++++++++++++++++++++++
 drivers/firmware/samsung/exynos-acpm-dvfs.h        | 21 ++++++
 drivers/firmware/samsung/exynos-acpm.c             |  5 ++
 .../linux/firmware/samsung/exynos-acpm-protocol.h  | 10 +++
 5 files changed, 119 insertions(+), 1 deletion(-)

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
index 0000000000000000000000000000000000000000..1c5b2b143bcc3fa2d1f92146206a2351fe0b9e95
--- /dev/null
+++ b/drivers/firmware/samsung/exynos-acpm-dvfs.c
@@ -0,0 +1,80 @@
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
+static void acpm_dvfs_init_get_rate_cmd(u32 cmd[4], unsigned int clk_id)
+{
+	cmd[0] = FIELD_PREP(ACPM_DVFS_ID, clk_id);
+	cmd[2] = FIELD_PREP(ACPM_DVFS_REQ_TYPE, ACPM_DVFS_FREQ_GET);
+	cmd[3] = ktime_to_ms(ktime_get());
+}
+
+unsigned long acpm_dvfs_get_rate(const struct acpm_handle *handle,
+				 unsigned int acpm_chan_id, unsigned int clk_id)
+{
+	struct acpm_xfer xfer;
+	unsigned int cmd[4] = {0};
+	int ret;
+
+	acpm_dvfs_init_get_rate_cmd(cmd, clk_id);
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
index 0000000000000000000000000000000000000000..9f2778e649c9d806646467c3f3f1425333b6acd8
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
+				 unsigned int acpm_chan_id,
+				 unsigned int clk_id);
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
index f628bf1862c25fa018a2fe5e7e123bf05c5254b9..b1e95435240fdb895a03f178d4fb3789411b1583 100644
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
+				  unsigned int clk_id);
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
2.51.0.740.g6adb054d12-goog

