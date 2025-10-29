Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 574C33563FC
	for <linux-clk@vger.kernel.org>; Wed, 29 Oct 2025 13:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761746180; cv=none; b=nUIIEjroKTg8zxSMA/hJhWSKzwi++SHTdMZD8WUr4G0rkJURGiP+yJb2dK6EYauYVq4LuH0ESQXZ11wPRyu28SSHhdwMlBSjRnNPCfob7Kv7cjM/Zl+GSqA6lUPcEi4bt78O+zx2/YPbk36ZZo2FrZDiaIrWCs/5BEs6lzd0bT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761746180; c=relaxed/simple;
	bh=j3R2uXoM/Etft2azckQg/VwhpCxp23HVCKOSpioe9N8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KGAMozcI3SnPP65APtyougDqvy8RpI1jsY19nvhawAHfmD1Y3nhPSHCElitjXOUi1S4WaMgvjvDGZGlmVOGEtC3GUG6DdL/gwreIVghGqliAKJOrynVRdGkvc5zk7Bnol5Op251Ip7aIcyLuXL3BGt1ZWbcJEwMVyjaoXhWJBFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NlrVjYni; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NlrVjYni"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b70406feed3so80869666b.3
        for <linux-clk@vger.kernel.org>; Wed, 29 Oct 2025 06:56:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761746176; x=1762350976; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=424Af6Pbv8SbwK0/36n/ieiQLcjf42UYg5pYhDqtE64=;
        b=NlrVjYniQiN/x3qtgehSBIShnRogo0ZaTAmkdB334wsuPZ/mTmVBZhW6j+eVDFIJ0U
         xAjSzDSfn9IQCWbK7PZLFjB3jqYQ77kzx9NFDycPn1sLiwNjstngY6Yt4pNwLyxs1Fvz
         XaHXPBIRYM9Qo6zCr8brtLohEaL51l/ugt9YIN4djZTvFeZHno8umKpuZIaKk+44KLTg
         7EBjFiRXzVr1G71EFaduKx6P5gwRRE9NlpdzlEOIcpPJcdGEo3RZmILD0576Mgggi90h
         VNpxbpOghxi3HTA8vLs6BMB8VVRS+Q9HTWWXP62VZoWqJGgIovO0vJuD1gqYpQuIF1My
         mGCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761746177; x=1762350977;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=424Af6Pbv8SbwK0/36n/ieiQLcjf42UYg5pYhDqtE64=;
        b=hsNKj/SlUXeUPW8c5nkHZwg/xWmWx/CiC/QNFh14AUgS/+i/KbX9h1uw8kOhBVA4Sb
         sLSS5tt12SqNemQx7a37qURirD1AMqrhpj7StCD+bzeBHs2wJOy8beGLiTJ2kLUU/kj+
         pHgCwzO9AvJmksDSTrYfzzrFlwPorfIgTSFD9m5XHEFXALCVV7LVvXWcwIupy4IY6I58
         2UnJKHh5eROqALf8lni9QOOGzGES+cCPraAmmfPNmFmEV3XT7Zw9x0uTV/KhVlQqlF6T
         lEHq9mm2CNawzpxb3E8i+lULa35nFzZAypoRjQ2+5fsHMXyN3NMjQcM0OK5AYkpl3iaf
         phvA==
X-Gm-Message-State: AOJu0YwlPeJZNduAU4IhA/Smiv+TUYHkSIM5Wi6VTVlLbxawMZGkfuXN
	KpZ6OdlHKWPsNzirIqer80fLoMn36L2Ac3YaroKhlywz0ery7WqSZi27
X-Gm-Gg: ASbGncuRwMBoq0WJ/Wi3r/pDrkU4Szb1VNkMEidkwrUQZBcBd/oGR1job2ASMb6H4yH
	iK4x82UNnGxK8Oo64Ah1rIjMmqwp6j/VnXwOr6+LJs3U38MuFmC9mwjw9MSmgN2FBg/+vxVPIkK
	DsOFT4MqPtYPO2GQ4JYdNx5GImnchlrx4hv1i2i8V0BCXnGK/KcejaJYnrAC+ldQ81BYhrtTELV
	r8khgumNMqX0W9i5/8U1CjDo3t51PNjUWp7E0CN6x86N8B2r8R+GtVLA26nJJw2rmF9TqF5/zN5
	aaXfnyQeF7sQA3awd8eik6zPyvy/etKZkIDcEa1jzUyRLj8GC8ExXGfdkHydPBKxO+hH39R/HB6
	VLJ/PJxjPvNFhA8EaTAttDR8IdMjdivmZzm86xO2DwfkBodg5CJDuvqW3UrQCVqRPgNG0ZLzEsm
	oCIlUvIM9PNl5C9ov4t7MA3RRyJg==
X-Google-Smtp-Source: AGHT+IGW71s06HOeamIvGEWwmfCKA0lO2ind9hiNyNeFinhDdkAcMBYKLqyvdDoCQ0vzL31+LZ8kKg==
X-Received: by 2002:a17:907:1b22:b0:b6d:6c11:e9fe with SMTP id a640c23a62f3a-b703d5b0deemr281105666b.64.1761746176434;
        Wed, 29 Oct 2025 06:56:16 -0700 (PDT)
Received: from SMW024614.wbi.nxp.com ([128.77.115.157])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d8534d99dsm1444960766b.21.2025.10.29.06.56.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 06:56:16 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: linux-clk@vger.kernel.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: [PATCH v3 7/8] reset: imx8mp-audiomix: Support i.MX8ULP SIM LPAV
Date: Wed, 29 Oct 2025 06:52:28 -0700
Message-ID: <20251029135229.890-8-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251029135229.890-1-laurentiumihalcea111@gmail.com>
References: <20251029135229.890-1-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Support i.MX8ULP's SIM LPAV by adding its reset map definition.

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 drivers/reset/reset-imx8mp-audiomix.c | 45 +++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/drivers/reset/reset-imx8mp-audiomix.c b/drivers/reset/reset-imx8mp-audiomix.c
index 5ee5a32c6950..4e420c6b8fdc 100644
--- a/drivers/reset/reset-imx8mp-audiomix.c
+++ b/drivers/reset/reset-imx8mp-audiomix.c
@@ -3,6 +3,7 @@
  * Copyright 2024 NXP
  */
 
+#include <dt-bindings/reset/fsl,imx8ulp-sim-lpav.h>
 #include <dt-bindings/reset/imx8mp-reset-audiomix.h>
 
 #include <linux/auxiliary_bus.h>
@@ -17,6 +18,8 @@
 #define IMX8MP_AUDIOMIX_EARC_RESET_OFFSET	0x200
 #define IMX8MP_AUDIOMIX_DSP_RUNSTALL_OFFSET	0x108
 
+#define IMX8ULP_SIM_LPAV_SYSCTRL0_OFFSET	0x8
+
 struct imx8mp_reset_map {
 	unsigned int offset;
 	unsigned int mask;
@@ -51,6 +54,44 @@ static const struct imx8mp_reset_info imx8mp_reset_info = {
 	.num_lines = ARRAY_SIZE(imx8mp_reset_map),
 };
 
+static const struct imx8mp_reset_map imx8ulp_reset_map[] = {
+	[IMX8ULP_SIM_LPAV_HIFI4_DSP_DBG_RST] = {
+		.offset = IMX8ULP_SIM_LPAV_SYSCTRL0_OFFSET,
+		.mask = BIT(25),
+		.active_low = false,
+	},
+	[IMX8ULP_SIM_LPAV_HIFI4_DSP_RST] = {
+		.offset = IMX8ULP_SIM_LPAV_SYSCTRL0_OFFSET,
+		.mask = BIT(16),
+		.active_low = false,
+	},
+	[IMX8ULP_SIM_LPAV_HIFI4_DSP_STALL] = {
+		.offset = IMX8ULP_SIM_LPAV_SYSCTRL0_OFFSET,
+		.mask = BIT(13),
+		.active_low = false,
+	},
+	[IMX8ULP_SIM_LPAV_DSI_RST_BYTE_N] = {
+		.offset = IMX8ULP_SIM_LPAV_SYSCTRL0_OFFSET,
+		.mask = BIT(5),
+		.active_low = true,
+	},
+	[IMX8ULP_SIM_LPAV_DSI_RST_ESC_N] = {
+		.offset = IMX8ULP_SIM_LPAV_SYSCTRL0_OFFSET,
+		.mask = BIT(4),
+		.active_low = true,
+	},
+	[IMX8ULP_SIM_LPAV_DSI_RST_DPI_N] = {
+		.offset = IMX8ULP_SIM_LPAV_SYSCTRL0_OFFSET,
+		.mask = BIT(3),
+		.active_low = true,
+	},
+};
+
+static const struct imx8mp_reset_info imx8ulp_reset_info = {
+	.map = imx8ulp_reset_map,
+	.num_lines = ARRAY_SIZE(imx8ulp_reset_map),
+};
+
 struct imx8mp_audiomix_reset {
 	struct reset_controller_dev rcdev;
 	void __iomem *base;
@@ -179,6 +220,10 @@ static const struct auxiliary_device_id imx8mp_audiomix_reset_ids[] = {
 		.name = "clk_imx8mp_audiomix.reset",
 		.driver_data = (kernel_ulong_t)&imx8mp_reset_info,
 	},
+	{
+		.name = "clk_imx8ulp_sim_lpav.reset",
+		.driver_data = (kernel_ulong_t)&imx8ulp_reset_info,
+	},
 	{ }
 };
 MODULE_DEVICE_TABLE(auxiliary, imx8mp_audiomix_reset_ids);
-- 
2.43.0

