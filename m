Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795539727;
	b=WhsB/5pjglqAC299EBvUtOPucbj1q2oiPT0Lxcb6dUOJt6WCSlUgjXD8Mbpl+DsUGgnf
	 LlSoxcBeTA5b61f7XNGh73Mg3oXaKuYrgGL2/VuqOmCiClJn1MMEAzjC2Z7laU+TjRcSh
	 Mti6xwH226EvC1I+6epPzDPiHCE7xS5e2H3FWVuZh0rDgUIktduhRWWZEiHMhP1naZMjv
	 EU3KiCEUixw6baUBBC1kNPJzzhKfFOzD43uyjBVOp9gv6c5GSxb5kv/ZxoKJyafQbRxoG
	 VBY+Iiov3Qj5DX7Irq3923SwrH2JfAOMvnOgnYJex8TAyFd823PIVgzCu3B8a/WguHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795539727;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=aCvzZwm+9ljV38lpo/M02YolG+L8KM9fgp+Syl5zvqo=;
	b=j4K/NqAEPJ8ECTmppjePylNrXvSx91vLsKeYJ4cswez1Gg2234fdlKPXu6Q1JXyKr55a
	 Nb0ffXP/CoOPrM4o5LIHNugiQVIgWmucSIV84KBGyhWeMK+gluqABTZhTCT/MJaswGV2A
	 wCtBewLI7qIGeJ7Xm8goDl1CLJ7Xj5oAwevRnz0xmf5K9IooVX4dSskrb8DDhmWMJji2E
	 5mWNevdjENmjIq56MltLbLTOhv05N2ed4crNHVoPIHeWLrB1PeJ2KC2Uf3ldh9EmGaqBZ
	 pD0EXgaZys0bTqxjasJGodB41rR/urUbT8TI3Rk3wTp8AyA7EyQ0dWrmI1xoxDJEW/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=BzBAnNi1;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81519606A330
	for <linux-clk@vger.kernel.org>; Tue, 24 Nov 2026 17:02:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81519606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=BzBAnNi1
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4bb6886d30aso45914085e9.3
        for <linux-clk@vger.kernel.org>; Tue, 24 Nov 2026 09:02:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795539725; x=1796144525; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aCvzZwm+9ljV38lpo/M02YolG+L8KM9fgp+Syl5zvqo=;
        b=BzBAnNi11V3tH/Gh1SNCRHsButPMkJiVE6Os3J5Rj8KQIpik77NKvAQHLs6oiOYriQ
         U9Waferqz1FD35DbAJeRUVqkhRBRz1dE85b7ZH47R6Zy3Q7w0WeqNb5WTl6pklIzFWwK
         Hl2kc2Y1sOPSPwXQ9paVS2hy401yTts7ycnsq/ISd5sA8l9nh8LGr72d0REa3dK+yTFF
         pdsn77yZxjKeScv413HNx8aYcXtjty7XjwKzNOMpQSEPy+tjj11FD6C1d74xrpB9Mvzf
         mRh6o1giN0NywL1jz/+neuvKoP/kueSBWJYyx0K913QanqSnV/pnqJqOES4uNdQw48or
         ckng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795539725; x=1796144525;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aCvzZwm+9ljV38lpo/M02YolG+L8KM9fgp+Syl5zvqo=;
        b=cslgrVjFwYNn0PNMKaO0Ln0ZPAXW1lQ8mAL3jxW38XNLh+HySk7qaVhRwD/JvUiLQc
         dhaN6zaMpvv8VDz433DWA/Maa79i9iDRzMX4x1ooA0tEbC9KxoncFlpq3tl6WtqA5GLT
         AcFlDcfIIuATjTGbB7y/0bCzB0NYSrukoCpd7eEPyPzKF2UpCkkS2g5Ob3Qasab9ZmSy
         8nkxUEkBOjGqx5Jch1d2yy5TUWOvP0NMDT0dKKyM7e5d3ea2wC1DRHZQjM0VIXULdWtC
         8/97Y7ejUn+RaHMez8Fdq38eHo7jkZAUYYvIe7IFxQ7q9A+isFYL6LH+ZBnw94Ttm88N
         iQ7A==
X-Forwarded-Encrypted: i=1; AL+hErGWMRBnO2LoEyYVyPn+ljrt8xLnmQf2a+gl1DVUMhoUGP1UgsmjdGqEb2/woMs76QTwZDGRnsyRkjQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8aTYssFrVfA8lmNYCmdLXoq98o7lZwHKIb58EqqE+lHXjwTKqS
	KXlb/HmbqA+zzkWeXOzy7xSXjzVX9PoFTld5342l0dfH1JXgx2bAj2EYY1lywfAjGeI=
X-Gm-Gg: AZFdTZdyd+A9Utp8f4Rs7/5Zu0KBrc+JTH3t6EnN9Kr7v69EKiJzHgXqcBQcMGSCKrG
	Ph6xMwleDrURv2qwWn6U7RO3KoXnNx38xHN7PNWXZlWqnVoLPjTZ2IjcXiB5/LVRLrjIiItnBnY
	k1GN6lXxCWjEqi+LR24NzGbesxaFOlpqO3Z4xKe3PtjtbV9D1LnlP/cpmqK2zH/C9d7tVq/80DB
	VQMBygormmbrBx1oZS6PQhNszY1n4q8o1wyjBD+n4YkIoTYCO7Rk9RD1/6CuUTTJAghl0IdnDxT
	xqB+mGwyeJhMixYTcIwWQhiRYmWT0X212+1YBXD+0jmqVkolqf/BJaVi9Hayud3iHgrZM7jUoE2
	XlvqVueGyjfYcnic2q22aQ+mYipyTQqTARaIyes330YuOOiEsJCS5KV7R7ozUZUlptPAk3xC5h6
	T4XsuzFJKQefTqGH4vc49kPMLF3zPhV3T3qZrhDC7Ib8/Ap+hNSTOb2so+zBl4tFvJ7XyJY8gnP
	nq8zecXdfc5NfrRJsKR1gLgj9i7VIUESgpTaUArvSqrH+nAX1tbvR6XCyHLc7HJAoPxjjrz6e3W
	tpyuOwQb+xatvMxQV9LzSnCibnK70Lbv72qO26GR5anyVy2v73Y=
X-Received: by 2002:a05:600c:e41a:b0:4bb:9959:54b8 with SMTP id 5b1f17b1804b1-4bb9959552emr123760155e9.32.1795539724542;
        Tue, 24 Nov 2026 09:02:04 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab65cb42absm30778526f8f.1.2026.11.24.09.02.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 09:02:04 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 24 Nov 2026 18:01:55 +0100
Subject: [PATCH v2 2/2] clk: qcom: add SM8650 LPASS core & audio clock
 controllers
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261124-topic-sm8650-el2-clks-v2-2-8086440e2c09@linaro.org>
References: <20261124-topic-sm8650-el2-clks-v2-0-8086440e2c09@linaro.org>
In-Reply-To: <20261124-topic-sm8650-el2-clks-v2-0-8086440e2c09@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=40898;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=1Qp7tzJ8+oMOHvrlsvjOnCaC+xk4mi1E1ev2LE4kS7w=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBrBcMJBOfL7hPhboSdhJ5h8FDWpV2llgVGU7oSro59
 /Vkdz4WJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCawXDCQAKCRB33NvayMhJ0fq4D/
 9RVaT8ziAbfxUyy1Xoxru9g4NElP2fpIzVW5kIU61CxxC1SQIaNm7Q42CpXMT5n3pTtzi39Dv+fARB
 LGmyh10la7/Co3rGobR40vuxV/AVZ7yRVaxxUAhPJQbc8c9PbnoKarY2VIRYj3iZEvjNy3SVlvgafM
 NVRiBis0u0Hg7bi8fpJNkMtdX4iZveDqyqfz8Lvi22u0/J1e0PqkwlKOCVdC5eX6ZF9hONQ3jbYEz7
 +yuGY11HlH9lOxdP1DC6Cc2QStEnqxEwqmZ7seNOcWyd0h6+x2gFXMXxM46cUrKUzX0VTPqLhdCwd1
 XzqmaWd8NWxDgbTZMZBNusF+rQXS10EFZqplOS1GukY0pzZwVC4Sa1mtJP0yT911dz7m3nUVokIUPR
 /i+o/kCEaBcWJsWZ4HPyk2kIYj97ygNKBX5v0BvMEcdhaONnVCJBWPVbcyLy0kmHV9scABnwk6kKNx
 Oq20Un4+6GzqKlAy60B64i50LnmEoYAC2exSJJsuAjoBFVApCoeCC84gnRSX+evpW0uzvJU+uKK1m8
 uh/Xik5JJWKxT9Z1zUXZ5LM6r6DNFT/Sa7n0rCz4Qb1BNQtz5z3+xAyHIxYAR5BNgTYR/JIszrnd7h
 wFeXg2cZhIs1dNZKKNJTbI2uPerJcaTxJHrrrjkf1mxg2vvOzIjgNYgVeJFA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Without the ADSP firmware, the LPASS clocks (MI2S bit clocks, codec
macro MCLKs, LPM memory clocks...) must be controlled by Linux.

Add drivers for the SM8650 LPASS HM, core, audio and AON clock
controllers, the HM, audio and AON controllers keeping their iface clock
enabled while in use, LPASS HM's being the GCC LPASS config NoC clock.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/clk/qcom/Kconfig               |  12 +
 drivers/clk/qcom/Makefile              |   1 +
 drivers/clk/qcom/lpassaudiocc-sm8650.c | 761 +++++++++++++++++++++++++++++++++
 drivers/clk/qcom/lpasscorecc-sm8650.c  | 506 ++++++++++++++++++++++
 4 files changed, 1280 insertions(+)

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index e6c58e8b1849..b81e8c90b810 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -1981,6 +1981,18 @@ config SM_GPUCC_8750
 	  Say Y if you want to support graphics controller devices and
 	  functionality such as 3D graphics.
 
+config SM_LPASS_CORECC_8650
+	tristate "SM8650 LPASS Core & Audio Clock Controller"
+	depends on ARM64 || COMPILE_TEST
+	select SM_GCC_8650
+	select QCOM_GDSC
+	default m if ARCH_QCOM
+	help
+	  Support for the LPASS(Low Power Audio Subsystem) core and audio clock
+	  controller on SM8650 devices.
+	  Say Y if you want to use LPASS clocks and power domains of the LPASS
+	  core clock controller.
+
 config SM_LPASSCC_6115
 	tristate "SM6115 Low Power Audio Subsystem (LPASS) Clock Controller"
 	depends on ARM64 || COMPILE_TEST
diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
index f84d7343a3a4..ee6ac528b365 100644
--- a/drivers/clk/qcom/Makefile
+++ b/drivers/clk/qcom/Makefile
@@ -215,6 +215,7 @@ obj-$(CONFIG_SM_GPUCC_8550) += gpucc-sm8550.o
 obj-$(CONFIG_SM_GPUCC_8650) += gpucc-sm8650.o
 obj-$(CONFIG_SM_GPUCC_8750) += gpucc-sm8750.o gxclkctl-kaanapali.o
 obj-$(CONFIG_SM_GPUCC_MILOS) += gpucc-milos.o gxclkctl-kaanapali.o
+obj-$(CONFIG_SM_LPASS_CORECC_8650) += lpasscorecc-sm8650.o lpassaudiocc-sm8650.o
 obj-$(CONFIG_SM_LPASSCC_6115) += lpasscc-sm6115.o
 obj-$(CONFIG_SM_TCSRCC_8550) += tcsrcc-sm8550.o
 obj-$(CONFIG_SM_TCSRCC_8650) += tcsrcc-sm8650.o
diff --git a/drivers/clk/qcom/lpassaudiocc-sm8650.c b/drivers/clk/qcom/lpassaudiocc-sm8650.c
new file mode 100644
index 000000000000..abd0258d9e72
--- /dev/null
+++ b/drivers/clk/qcom/lpassaudiocc-sm8650.c
@@ -0,0 +1,761 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2021, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2025, Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/err.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/pm_clock.h>
+#include <linux/pm_runtime.h>
+#include <linux/regmap.h>
+
+#include <dt-bindings/clock/qcom,lpassaudiocc-sm8650.h>
+
+#include "clk-branch.h"
+#include "clk-rcg.h"
+#include "clk-regmap.h"
+#include "clk-regmap-divider.h"
+#include "clk-regmap-mux.h"
+#include "common.h"
+#include "gdsc.h"
+#include "reset.h"
+
+enum {
+	P_BI_TCXO,
+};
+
+static const struct parent_map lpass_audio_cc_parent_map_0[] = {
+	{ P_BI_TCXO, 0 },
+};
+
+static const struct clk_parent_data lpass_audio_cc_parent_data_0[] = {
+	{ .index = 0 },
+};
+
+static const struct parent_map lpass_aon_cc_parent_map_0[] = {
+	{ P_BI_TCXO, 0 },
+};
+
+static const struct clk_parent_data lpass_aon_cc_parent_data_0[] = {
+	{ .index = 0 },
+};
+
+/* XO only for now: the ADSP plan also uses the audio CC PLLs for MCLKs */
+static const struct freq_tbl ftbl_lpass_mclk_clk_src[] = {
+	F(9600000, P_BI_TCXO, 2, 0, 0),
+	F(19200000, P_BI_TCXO, 1, 0, 0),
+	{ }
+};
+
+/* XO only for now: the ADSP plan feeds these from the audio CC DIG PLL */
+static const struct freq_tbl ftbl_lpass_cc_ext_clk_src[] = {
+	F(1536000, P_BI_TCXO, 1, 2, 25),
+	F(2304000, P_BI_TCXO, 1, 3, 25),
+	F(3072000, P_BI_TCXO, 1, 4, 25),
+	F(9600000, P_BI_TCXO, 2, 0, 0),
+	F(19200000, P_BI_TCXO, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 lpass_aon_cc_ext_if1_clk_src = {
+	.cmd_rcgr = 0xb004,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = lpass_aon_cc_parent_map_0,
+	.freq_tbl = ftbl_lpass_cc_ext_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data){
+		.name = "lpass_aon_cc_ext_if1_clk_src",
+		.parent_data = lpass_aon_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(lpass_aon_cc_parent_data_0),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 lpass_aon_cc_main_rcg_clk_src = {
+	.cmd_rcgr = 0x19000,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = lpass_aon_cc_parent_map_0,
+	.freq_tbl = ftbl_lpass_cc_ext_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data){
+		.name = "lpass_aon_cc_main_rcg_clk_src",
+		.parent_data = lpass_aon_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(lpass_aon_cc_parent_data_0),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 lpass_aon_cc_tx_mclk_clk_src = {
+	.cmd_rcgr = 0x1b004,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = lpass_aon_cc_parent_map_0,
+	.freq_tbl = ftbl_lpass_mclk_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data){
+		.name = "lpass_aon_cc_tx_mclk_clk_src",
+		.parent_data = lpass_aon_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(lpass_aon_cc_parent_data_0),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 lpass_audio_cc_ext_if1_clk_src = {
+	.cmd_rcgr = 0x18004,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = lpass_audio_cc_parent_map_0,
+	.freq_tbl = ftbl_lpass_cc_ext_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data){
+		.name = "lpass_audio_cc_ext_if1_clk_src",
+		.parent_data = lpass_audio_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(lpass_audio_cc_parent_data_0),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 lpass_audio_cc_ext_if2_clk_src = {
+	.cmd_rcgr = 0x19004,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = lpass_audio_cc_parent_map_0,
+	.freq_tbl = ftbl_lpass_cc_ext_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data){
+		.name = "lpass_audio_cc_ext_if2_clk_src",
+		.parent_data = lpass_audio_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(lpass_audio_cc_parent_data_0),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 lpass_audio_cc_ext_if4_clk_src = {
+	.cmd_rcgr = 0x1c004,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = lpass_audio_cc_parent_map_0,
+	.freq_tbl = ftbl_lpass_cc_ext_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data){
+		.name = "lpass_audio_cc_ext_if4_clk_src",
+		.parent_data = lpass_audio_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(lpass_audio_cc_parent_data_0),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 lpass_audio_cc_ext_if5_clk_src = {
+	.cmd_rcgr = 0x1d004,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = lpass_audio_cc_parent_map_0,
+	.freq_tbl = ftbl_lpass_cc_ext_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data){
+		.name = "lpass_audio_cc_ext_if5_clk_src",
+		.parent_data = lpass_audio_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(lpass_audio_cc_parent_data_0),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 lpass_audio_cc_wsa_mclk_clk_src = {
+	.cmd_rcgr = 0x2a004,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = lpass_audio_cc_parent_map_0,
+	.freq_tbl = ftbl_lpass_mclk_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data){
+		.name = "lpass_audio_cc_wsa_mclk_clk_src",
+		.parent_data = lpass_audio_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(lpass_audio_cc_parent_data_0),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 lpass_audio_cc_rx_mclk_clk_src = {
+	.cmd_rcgr = 0x2c004,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = lpass_audio_cc_parent_map_0,
+	.freq_tbl = ftbl_lpass_mclk_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data){
+		.name = "lpass_audio_cc_rx_mclk_clk_src",
+		.parent_data = lpass_audio_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(lpass_audio_cc_parent_data_0),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+/* MCLK = RCG / CDIV (reset value: divide by 2), the 2X clocks are the RCG */
+static struct clk_regmap_div lpass_audio_cc_cdiv_rx_mclk_div_clk_src = {
+	.reg = 0x2c0d0,
+	.shift = 0,
+	.width = 4,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "lpass_audio_cc_cdiv_rx_mclk_div_clk_src",
+		.parent_hws = (const struct clk_hw*[]){
+			&lpass_audio_cc_rx_mclk_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_regmap_div_ro_ops,
+	},
+};
+
+static struct clk_regmap_div lpass_audio_cc_cdiv_wsa_mclk_div_clk_src = {
+	.reg = 0x2a0d0,
+	.shift = 0,
+	.width = 4,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "lpass_audio_cc_cdiv_wsa_mclk_div_clk_src",
+		.parent_hws = (const struct clk_hw*[]){
+			&lpass_audio_cc_wsa_mclk_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_regmap_div_ro_ops,
+	},
+};
+
+static struct clk_regmap_div lpass_aon_cc_cdiv_tx_mclk_div_clk_src = {
+	.reg = 0x1b010,
+	.shift = 0,
+	.width = 4,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "lpass_aon_cc_cdiv_tx_mclk_div_clk_src",
+		.parent_hws = (const struct clk_hw*[]){
+			&lpass_aon_cc_tx_mclk_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_regmap_div_ro_ops,
+	},
+};
+
+static struct clk_branch lpass_aon_cc_audio_hm_h_clk;
+
+static struct clk_branch lpass_audio_cc_codec_mem_clk = {
+	.halt_reg = 0x2e000,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x2e000,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data){
+			.name = "lpass_audio_cc_codec_mem_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&lpass_aon_cc_audio_hm_h_clk.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch lpass_audio_cc_codec_mem0_clk = {
+	.halt_reg = 0x2e004,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x2e004,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data){
+			.name = "lpass_audio_cc_codec_mem0_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&lpass_aon_cc_audio_hm_h_clk.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch lpass_audio_cc_codec_mem1_clk = {
+	.halt_reg = 0x2e010,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x2e010,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data){
+			.name = "lpass_audio_cc_codec_mem1_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&lpass_aon_cc_audio_hm_h_clk.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch lpass_audio_cc_codec_mem2_clk = {
+	.halt_reg = 0x2e01c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x2e01c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data){
+			.name = "lpass_audio_cc_codec_mem2_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&lpass_aon_cc_audio_hm_h_clk.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch lpass_audio_cc_codec_mem3_clk = {
+	.halt_reg = 0x2e028,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x2e028,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data){
+			.name = "lpass_audio_cc_codec_mem3_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&lpass_aon_cc_audio_hm_h_clk.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch lpass_audio_cc_rx_mclk_clk = {
+	.halt_reg = 0x2c0d4,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x2c0d4,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data){
+			.name = "lpass_audio_cc_rx_mclk_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&lpass_audio_cc_cdiv_rx_mclk_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch lpass_audio_cc_ext_if1_ibit_clk = {
+	.halt_reg = 0x1801c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x1801c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data){
+			.name = "lpass_audio_cc_ext_if1_ibit_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&lpass_audio_cc_ext_if1_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch lpass_audio_cc_ext_if2_ibit_clk = {
+	.halt_reg = 0x1901c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x1901c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data){
+			.name = "lpass_audio_cc_ext_if2_ibit_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&lpass_audio_cc_ext_if2_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch lpass_audio_cc_ext_if4_ibit_clk = {
+	.halt_reg = 0x1c01c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x1c01c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data){
+			.name = "lpass_audio_cc_ext_if4_ibit_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&lpass_audio_cc_ext_if4_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch lpass_audio_cc_ext_if5_ibit_clk = {
+	.halt_reg = 0x1d01c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x1d01c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data){
+			.name = "lpass_audio_cc_ext_if5_ibit_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&lpass_audio_cc_ext_if5_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch lpass_audio_cc_wsa_mclk_clk = {
+	.halt_reg = 0x2a0d4,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x2a0d4,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data){
+			.name = "lpass_audio_cc_wsa_mclk_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&lpass_audio_cc_cdiv_wsa_mclk_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch lpass_audio_cc_wsa2_mclk_clk = {
+	.halt_reg = 0x2d004,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x2d004,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data){
+			.name = "lpass_audio_cc_wsa2_mclk_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&lpass_audio_cc_wsa_mclk_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch lpass_audio_cc_tx_mclk_wsa_clk = {
+	.halt_reg = 0x2a0f4,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x2a0f4,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data){
+			.name = "lpass_audio_cc_tx_mclk_wsa_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&lpass_aon_cc_tx_mclk_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch lpass_audio_cc_tx_mclk_rx_clk = {
+	.halt_reg = 0x2c0e0,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x2c0e0,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data){
+			.name = "lpass_audio_cc_tx_mclk_rx_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&lpass_aon_cc_tx_mclk_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch lpass_audio_cc_tx_mclk_wsa2_clk = {
+	.halt_reg = 0x2d00c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x2d00c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data){
+			.name = "lpass_audio_cc_tx_mclk_wsa2_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&lpass_aon_cc_tx_mclk_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch lpass_aon_cc_ext_if1_ibit_clk = {
+	.halt_reg = 0xb01c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0xb01c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data){
+			.name = "lpass_aon_cc_ext_if1_ibit_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&lpass_aon_cc_ext_if1_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch lpass_aon_cc_audio_hm_h_clk = {
+	.halt_reg = 0x11014,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x11014,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data){
+			.name = "lpass_aon_cc_audio_hm_h_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&lpass_aon_cc_main_rcg_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_aon_ops,
+		},
+	},
+};
+
+static struct clk_branch lpass_aon_cc_va_mem0_clk = {
+	.halt_reg = 0x11060,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x11060,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data){
+			.name = "lpass_aon_cc_va_mem0_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&lpass_aon_cc_main_rcg_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch lpass_aon_cc_tx_mclk_clk = {
+	.halt_reg = 0x1b014,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x1b014,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data){
+			.name = "lpass_aon_cc_tx_mclk_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&lpass_aon_cc_cdiv_tx_mclk_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct gdsc lpass_aon_cc_lpass_audio_hm_gdsc = {
+	.gdscr = 0x11090,
+	.pd = {
+		.name = "lpass_aon_cc_lpass_audio_hm_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = RETAIN_FF_ENABLE,
+};
+
+static struct clk_regmap *lpass_aon_cc_sm8650_clocks[] = {
+	[LPASS_AON_CC_MAIN_RCG_CLK_SRC] = &lpass_aon_cc_main_rcg_clk_src.clkr,
+	[LPASS_AON_CC_AUDIO_HM_H_CLK] = &lpass_aon_cc_audio_hm_h_clk.clkr,
+	[LPASS_AON_CC_VA_MEM0_CLK] = &lpass_aon_cc_va_mem0_clk.clkr,
+	[LPASS_AON_CC_TX_MCLK_CLK_SRC] = &lpass_aon_cc_tx_mclk_clk_src.clkr,
+	[LPASS_AON_CC_TX_MCLK_CLK] = &lpass_aon_cc_tx_mclk_clk.clkr,
+	[LPASS_AON_CC_CDIV_TX_MCLK_DIV_CLK_SRC] = &lpass_aon_cc_cdiv_tx_mclk_div_clk_src.clkr,
+	[LPASS_AON_CC_EXT_IF1_CLK_SRC] = &lpass_aon_cc_ext_if1_clk_src.clkr,
+	[LPASS_AON_CC_EXT_IF1_IBIT_CLK] = &lpass_aon_cc_ext_if1_ibit_clk.clkr,
+};
+
+static struct gdsc *lpass_aon_cc_sm8650_gdscs[] = {
+	[LPASS_AON_CC_LPASS_AUDIO_HM_GDSC] = &lpass_aon_cc_lpass_audio_hm_gdsc,
+};
+
+static struct clk_regmap *lpass_audio_cc_sm8650_clocks[] = {
+	[LPASS_AUDIO_CC_WSA_MCLK_CLK_SRC] = &lpass_audio_cc_wsa_mclk_clk_src.clkr,
+	[LPASS_AUDIO_CC_RX_MCLK_CLK] = &lpass_audio_cc_rx_mclk_clk.clkr,
+	[LPASS_AUDIO_CC_RX_MCLK_CLK_SRC] = &lpass_audio_cc_rx_mclk_clk_src.clkr,
+	[LPASS_AUDIO_CC_WSA_MCLK_CLK] = &lpass_audio_cc_wsa_mclk_clk.clkr,
+	[LPASS_AUDIO_CC_WSA2_MCLK_CLK] = &lpass_audio_cc_wsa2_mclk_clk.clkr,
+	[LPASS_AUDIO_CC_CODEC_MEM_CLK] = &lpass_audio_cc_codec_mem_clk.clkr,
+	[LPASS_AUDIO_CC_CODEC_MEM0_CLK] = &lpass_audio_cc_codec_mem0_clk.clkr,
+	[LPASS_AUDIO_CC_CODEC_MEM1_CLK] = &lpass_audio_cc_codec_mem1_clk.clkr,
+	[LPASS_AUDIO_CC_CODEC_MEM2_CLK] = &lpass_audio_cc_codec_mem2_clk.clkr,
+	[LPASS_AUDIO_CC_CODEC_MEM3_CLK] = &lpass_audio_cc_codec_mem3_clk.clkr,
+	[LPASS_AUDIO_CC_TX_MCLK_WSA_CLK] = &lpass_audio_cc_tx_mclk_wsa_clk.clkr,
+	[LPASS_AUDIO_CC_TX_MCLK_RX_CLK] = &lpass_audio_cc_tx_mclk_rx_clk.clkr,
+	[LPASS_AUDIO_CC_TX_MCLK_WSA2_CLK] = &lpass_audio_cc_tx_mclk_wsa2_clk.clkr,
+	[LPASS_AUDIO_CC_CDIV_RX_MCLK_DIV_CLK_SRC] = &lpass_audio_cc_cdiv_rx_mclk_div_clk_src.clkr,
+	[LPASS_AUDIO_CC_CDIV_WSA_MCLK_DIV_CLK_SRC] = &lpass_audio_cc_cdiv_wsa_mclk_div_clk_src.clkr,
+	[LPASS_AUDIO_CC_EXT_IF1_CLK_SRC] = &lpass_audio_cc_ext_if1_clk_src.clkr,
+	[LPASS_AUDIO_CC_EXT_IF1_IBIT_CLK] = &lpass_audio_cc_ext_if1_ibit_clk.clkr,
+	[LPASS_AUDIO_CC_EXT_IF2_CLK_SRC] = &lpass_audio_cc_ext_if2_clk_src.clkr,
+	[LPASS_AUDIO_CC_EXT_IF2_IBIT_CLK] = &lpass_audio_cc_ext_if2_ibit_clk.clkr,
+	[LPASS_AUDIO_CC_EXT_IF4_CLK_SRC] = &lpass_audio_cc_ext_if4_clk_src.clkr,
+	[LPASS_AUDIO_CC_EXT_IF4_IBIT_CLK] = &lpass_audio_cc_ext_if4_ibit_clk.clkr,
+	[LPASS_AUDIO_CC_EXT_IF5_CLK_SRC] = &lpass_audio_cc_ext_if5_clk_src.clkr,
+	[LPASS_AUDIO_CC_EXT_IF5_IBIT_CLK] = &lpass_audio_cc_ext_if5_ibit_clk.clkr,
+};
+
+static const struct regmap_config lpass_audio_cc_sm8650_regmap_config = {
+	.name = "lpasscc_audio",
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = 0x2f000,
+	.fast_io = true,
+};
+
+static const struct qcom_cc_desc lpass_audio_cc_sm8650_desc = {
+	.config = &lpass_audio_cc_sm8650_regmap_config,
+	.clks = lpass_audio_cc_sm8650_clocks,
+	.num_clks = ARRAY_SIZE(lpass_audio_cc_sm8650_clocks),
+};
+
+static const struct of_device_id lpass_audio_cc_sm8650_match_table[] = {
+	{ .compatible = "qcom,sm8650-lpassaudiocc" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, lpass_audio_cc_sm8650_match_table);
+
+static int lpass_cc_sm8650_probe(struct platform_device *pdev,
+				 const struct qcom_cc_desc *desc)
+{
+	int ret;
+
+	ret = devm_pm_runtime_enable(&pdev->dev);
+	if (ret)
+		return ret;
+
+	ret = devm_pm_clk_create(&pdev->dev);
+	if (ret)
+		return ret;
+
+	ret = pm_clk_add(&pdev->dev, "iface");
+	if (ret < 0) {
+		dev_err(&pdev->dev, "failed to acquire iface clock\n");
+		return ret;
+	}
+
+	ret = pm_runtime_resume_and_get(&pdev->dev);
+	if (ret)
+		return ret;
+
+	ret = qcom_cc_probe(pdev, desc);
+
+	pm_runtime_put_sync(&pdev->dev);
+
+	return ret;
+}
+
+static int lpass_audio_cc_sm8650_probe(struct platform_device *pdev)
+{
+	return lpass_cc_sm8650_probe(pdev, &lpass_audio_cc_sm8650_desc);
+}
+
+static const struct dev_pm_ops lpass_audio_cc_sm8650_pm_ops = {
+	RUNTIME_PM_OPS(pm_clk_suspend, pm_clk_resume, NULL)
+};
+
+static struct platform_driver lpass_audio_cc_sm8650_driver = {
+	.probe = lpass_audio_cc_sm8650_probe,
+	.driver = {
+		.name = "lpass_audio_cc-sm8650",
+		.of_match_table = lpass_audio_cc_sm8650_match_table,
+		.pm = pm_ptr(&lpass_audio_cc_sm8650_pm_ops),
+	},
+};
+
+static const struct regmap_config lpass_aon_cc_sm8650_regmap_config = {
+	.name = "lpasscc_aon",
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = 0x2f000,
+	.fast_io = true,
+};
+
+static const struct qcom_cc_desc lpass_aon_cc_sm8650_desc = {
+	.config = &lpass_aon_cc_sm8650_regmap_config,
+	.clks = lpass_aon_cc_sm8650_clocks,
+	.num_clks = ARRAY_SIZE(lpass_aon_cc_sm8650_clocks),
+	.gdscs = lpass_aon_cc_sm8650_gdscs,
+	.num_gdscs = ARRAY_SIZE(lpass_aon_cc_sm8650_gdscs),
+};
+
+static int lpass_aon_cc_sm8650_probe(struct platform_device *pdev)
+{
+	return lpass_cc_sm8650_probe(pdev, &lpass_aon_cc_sm8650_desc);
+}
+
+static const struct of_device_id lpass_aon_cc_sm8650_match_table[] = {
+	{ .compatible = "qcom,sm8650-lpassaoncc" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, lpass_aon_cc_sm8650_match_table);
+
+static struct platform_driver lpass_aon_cc_sm8650_driver = {
+	.probe = lpass_aon_cc_sm8650_probe,
+	.driver = {
+		.name = "lpass_aon_cc-sm8650",
+		.of_match_table = lpass_aon_cc_sm8650_match_table,
+		.pm = pm_ptr(&lpass_audio_cc_sm8650_pm_ops),
+	},
+};
+
+static int __init lpass_audio_cc_sm8650_init(void)
+{
+	int ret;
+
+	ret = platform_driver_register(&lpass_aon_cc_sm8650_driver);
+	if (ret)
+		return ret;
+
+	ret = platform_driver_register(&lpass_audio_cc_sm8650_driver);
+	if (ret)
+		platform_driver_unregister(&lpass_aon_cc_sm8650_driver);
+
+	return ret;
+}
+subsys_initcall(lpass_audio_cc_sm8650_init);
+
+static void __exit lpass_audio_cc_sm8650_exit(void)
+{
+	platform_driver_unregister(&lpass_audio_cc_sm8650_driver);
+	platform_driver_unregister(&lpass_aon_cc_sm8650_driver);
+}
+module_exit(lpass_audio_cc_sm8650_exit);
+
+MODULE_DESCRIPTION("LPASS Audio CC SM8650 Driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/clk/qcom/lpasscorecc-sm8650.c b/drivers/clk/qcom/lpasscorecc-sm8650.c
new file mode 100644
index 000000000000..1da080cc5074
--- /dev/null
+++ b/drivers/clk/qcom/lpasscorecc-sm8650.c
@@ -0,0 +1,506 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2021, The Linux Foundation. All rights reserved.
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/err.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+#include <dt-bindings/clock/qcom,lpasscorecc-sm8650.h>
+
+#include "clk-alpha-pll.h"
+#include "clk-branch.h"
+#include "clk-rcg.h"
+#include "clk-regmap.h"
+#include "clk-regmap-divider.h"
+#include "common.h"
+#include "gdsc.h"
+
+enum {
+	P_BI_TCXO,
+	P_LPASS_CORE_CC_DIG_PLL_OUT_MAIN,
+	P_LPASS_CORE_CC_DIG_PLL_OUT_MAIN_DIV_CLK_SRC,
+	P_LPASS_CORE_CC_DIG_PLL_OUT_ODD,
+};
+
+static const struct pll_vco lucid_ole_vco[] = {
+	{ 249600000, 2300000000, 0 },
+};
+
+static const struct alpha_pll_config lpass_core_cc_dig_pll_config = {
+	/* 614.4 MHz */
+	.l = 0x20,
+	.alpha = 0x0,
+	.config_ctl_val = 0x20485699,
+	.config_ctl_hi_val = 0x00182261,
+	.config_ctl_hi1_val = 0x82aa299c,
+	.test_ctl_val = 0x00000000,
+	.test_ctl_hi_val = 0x00000003,
+	.test_ctl_hi1_val = 0x00009000,
+	.test_ctl_hi2_val = 0x00000034,
+	.user_ctl_val = 0x00014000,
+	.user_ctl_hi_val = 0x00000005,
+};
+
+static struct clk_alpha_pll lpass_core_cc_dig_pll = {
+	.offset = 0x0,
+	.config = &lpass_core_cc_dig_pll_config,
+	.vco_table = lucid_ole_vco,
+	.num_vco = ARRAY_SIZE(lucid_ole_vco),
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE],
+	.clkr = {
+		.hw.init = &(struct clk_init_data){
+			.name = "lpass_core_cc_dig_pll",
+			.parent_data = &(const struct clk_parent_data){
+				.index = 0,
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_lucid_evo_ops,
+		},
+	},
+};
+
+static const struct clk_div_table post_div_table_lpass_core_cc_dig_pll_out_odd[] = {
+	{ 0x5, 5 },
+	{ }
+};
+
+static struct clk_alpha_pll_postdiv lpass_core_cc_dig_pll_out_odd = {
+	.offset = 0x0,
+	.post_div_shift = 14,
+	.post_div_table = post_div_table_lpass_core_cc_dig_pll_out_odd,
+	.num_post_div = ARRAY_SIZE(post_div_table_lpass_core_cc_dig_pll_out_odd),
+	.width = 4,
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE],
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "lpass_core_cc_dig_pll_out_odd",
+		.parent_hws = (const struct clk_hw*[]){
+			&lpass_core_cc_dig_pll.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_alpha_pll_postdiv_lucid_ole_ops,
+	},
+};
+
+static struct clk_regmap_div lpass_core_cc_dig_pll_out_main_div_clk_src = {
+	.reg = 0x10008,
+	.shift = 0,
+	.width = 4,
+	.clkr.hw.init = &(struct clk_init_data) {
+		.name = "lpass_core_cc_dig_pll_out_main_div_clk_src",
+		.parent_hws = (const struct clk_hw*[]){
+			&lpass_core_cc_dig_pll.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_regmap_div_ro_ops,
+	},
+};
+
+static const struct parent_map lpass_core_cc_parent_map_0[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_LPASS_CORE_CC_DIG_PLL_OUT_ODD, 5 },
+};
+
+static const struct clk_parent_data lpass_core_cc_parent_data_0[] = {
+	{ .index = 0 },
+	{ .hw = &lpass_core_cc_dig_pll_out_odd.clkr.hw },
+};
+
+static const struct parent_map lpass_core_cc_parent_map_2[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_LPASS_CORE_CC_DIG_PLL_OUT_MAIN, 1 },
+	{ P_LPASS_CORE_CC_DIG_PLL_OUT_MAIN_DIV_CLK_SRC, 2 },
+};
+
+static const struct clk_parent_data lpass_core_cc_parent_data_ao_2[] = {
+	{ .index = 0 },
+	{ .hw = &lpass_core_cc_dig_pll.clkr.hw },
+	{ .hw = &lpass_core_cc_dig_pll_out_main_div_clk_src.clkr.hw },
+};
+
+static const struct freq_tbl ftbl_lpass_core_cc_core_clk_src[] = {
+	F(19200000, P_BI_TCXO, 1, 0, 0),
+	F(51200000, P_LPASS_CORE_CC_DIG_PLL_OUT_MAIN_DIV_CLK_SRC, 6, 0, 0),
+	F(102400000, P_LPASS_CORE_CC_DIG_PLL_OUT_MAIN_DIV_CLK_SRC, 3, 0, 0),
+	F(204800000, P_LPASS_CORE_CC_DIG_PLL_OUT_MAIN, 3, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 lpass_core_cc_core_clk_src = {
+	.cmd_rcgr = 0x25000,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = lpass_core_cc_parent_map_2,
+	.freq_tbl = ftbl_lpass_core_cc_core_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data){
+		.name = "lpass_core_cc_core_clk_src",
+		.parent_data = lpass_core_cc_parent_data_ao_2,
+		.num_parents = ARRAY_SIZE(lpass_core_cc_parent_data_ao_2),
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_lpass_core_cc_ext_if0_clk_src[] = {
+	F(1536000, P_BI_TCXO, 1, 2, 25),
+	F(2304000, P_BI_TCXO, 1, 3, 25),
+	F(3072000, P_BI_TCXO, 1, 4, 25),
+	F(9600000, P_BI_TCXO, 2, 0, 0),
+	F(19200000, P_BI_TCXO, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 lpass_core_cc_ext_if0_clk_src = {
+	.cmd_rcgr = 0x18000,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = lpass_core_cc_parent_map_0,
+	.freq_tbl = ftbl_lpass_core_cc_ext_if0_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data){
+		.name = "lpass_core_cc_ext_if0_clk_src",
+		.parent_data = lpass_core_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(lpass_core_cc_parent_data_0),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 lpass_core_cc_ext_if1_clk_src = {
+	.cmd_rcgr = 0x19000,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = lpass_core_cc_parent_map_0,
+	.freq_tbl = ftbl_lpass_core_cc_ext_if0_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data){
+		.name = "lpass_core_cc_ext_if1_clk_src",
+		.parent_data = lpass_core_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(lpass_core_cc_parent_data_0),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 lpass_core_cc_ext_if2_clk_src = {
+	.cmd_rcgr = 0x1a000,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = lpass_core_cc_parent_map_0,
+	.freq_tbl = ftbl_lpass_core_cc_ext_if0_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data){
+		.name = "lpass_core_cc_ext_if2_clk_src",
+		.parent_data = lpass_core_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(lpass_core_cc_parent_data_0),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 lpass_core_cc_ext_mclk0_clk_src = {
+	.cmd_rcgr = 0x28000,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = lpass_core_cc_parent_map_0,
+	.freq_tbl = ftbl_lpass_core_cc_ext_if0_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data){
+		.name = "lpass_core_cc_ext_mclk0_clk_src",
+		.parent_data = lpass_core_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(lpass_core_cc_parent_data_0),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_branch lpass_core_cc_core_clk = {
+	.halt_reg = 0x27000,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x27000,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x27000,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data){
+			.name = "lpass_core_cc_core_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&lpass_core_cc_core_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_aon_ops,
+		},
+	},
+};
+
+static struct clk_branch lpass_core_cc_ext_if0_ibit_clk = {
+	.halt_reg = 0x18018,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x18018,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data){
+			.name = "lpass_core_cc_ext_if0_ibit_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&lpass_core_cc_ext_if0_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch lpass_core_cc_ext_if1_ibit_clk = {
+	.halt_reg = 0x19018,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x19018,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data){
+			.name = "lpass_core_cc_ext_if1_ibit_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&lpass_core_cc_ext_if1_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch lpass_core_cc_ext_if2_ibit_clk = {
+	.halt_reg = 0x1a018,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x1a018,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data){
+			.name = "lpass_core_cc_ext_if2_ibit_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&lpass_core_cc_ext_if2_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch lpass_core_cc_lpm_core_clk = {
+	.halt_reg = 0x26000,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x26000,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data){
+			.name = "lpass_core_cc_lpm_core_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&lpass_core_cc_core_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch lpass_core_cc_lpm_mem0_core_clk = {
+	.halt_reg = 0x26004,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x26004,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data){
+			.name = "lpass_core_cc_lpm_mem0_core_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&lpass_core_cc_core_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch lpass_core_cc_ext_mclk0_clk = {
+	.halt_reg = 0x28014,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x28014,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data){
+			.name = "lpass_core_cc_ext_mclk0_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&lpass_core_cc_ext_mclk0_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch lpass_core_cc_sysnoc_mport_core_clk = {
+	.halt_reg = 0x2b000,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x2b000,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x2b000,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data){
+			.name = "lpass_core_cc_sysnoc_mport_core_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&lpass_core_cc_core_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct gdsc lpass_core_cc_lpass_core_hm_gdsc = {
+	.gdscr = 0x0,
+	.pd = {
+		.name = "lpass_core_cc_lpass_core_hm_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = RETAIN_FF_ENABLE,
+};
+
+static struct clk_regmap *lpass_core_cc_sm8650_clocks[] = {
+	[LPASS_CORE_CC_CORE_CLK] = &lpass_core_cc_core_clk.clkr,
+	[LPASS_CORE_CC_CORE_CLK_SRC] = &lpass_core_cc_core_clk_src.clkr,
+	[LPASS_CORE_CC_DIG_PLL] = &lpass_core_cc_dig_pll.clkr,
+	[LPASS_CORE_CC_DIG_PLL_OUT_MAIN_DIV_CLK_SRC] =
+		&lpass_core_cc_dig_pll_out_main_div_clk_src.clkr,
+	[LPASS_CORE_CC_DIG_PLL_OUT_ODD] = &lpass_core_cc_dig_pll_out_odd.clkr,
+	[LPASS_CORE_CC_EXT_IF0_CLK_SRC] = &lpass_core_cc_ext_if0_clk_src.clkr,
+	[LPASS_CORE_CC_EXT_IF0_IBIT_CLK] = &lpass_core_cc_ext_if0_ibit_clk.clkr,
+	[LPASS_CORE_CC_EXT_IF1_CLK_SRC] = &lpass_core_cc_ext_if1_clk_src.clkr,
+	[LPASS_CORE_CC_EXT_IF1_IBIT_CLK] = &lpass_core_cc_ext_if1_ibit_clk.clkr,
+	[LPASS_CORE_CC_EXT_IF2_CLK_SRC] = &lpass_core_cc_ext_if2_clk_src.clkr,
+	[LPASS_CORE_CC_EXT_IF2_IBIT_CLK] = &lpass_core_cc_ext_if2_ibit_clk.clkr,
+	[LPASS_CORE_CC_LPM_CORE_CLK] = &lpass_core_cc_lpm_core_clk.clkr,
+	[LPASS_CORE_CC_LPM_MEM0_CORE_CLK] = &lpass_core_cc_lpm_mem0_core_clk.clkr,
+	[LPASS_CORE_CC_SYSNOC_MPORT_CORE_CLK] = &lpass_core_cc_sysnoc_mport_core_clk.clkr,
+	[LPASS_CORE_CC_EXT_MCLK0_CLK] = &lpass_core_cc_ext_mclk0_clk.clkr,
+	[LPASS_CORE_CC_EXT_MCLK0_CLK_SRC] = &lpass_core_cc_ext_mclk0_clk_src.clkr,
+};
+
+static const struct regmap_config lpass_core_cc_sm8650_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = 0x56014,
+	.fast_io = true,
+};
+
+static struct clk_alpha_pll *lpass_core_cc_sm8650_plls[] = {
+	&lpass_core_cc_dig_pll,
+};
+
+static const struct qcom_cc_driver_data lpass_core_cc_sm8650_driver_data = {
+	.alpha_plls = lpass_core_cc_sm8650_plls,
+	.num_alpha_plls = ARRAY_SIZE(lpass_core_cc_sm8650_plls),
+};
+
+static const struct qcom_cc_desc lpass_core_cc_sm8650_desc = {
+	.config = &lpass_core_cc_sm8650_regmap_config,
+	.clks = lpass_core_cc_sm8650_clocks,
+	.num_clks = ARRAY_SIZE(lpass_core_cc_sm8650_clocks),
+	.driver_data = &lpass_core_cc_sm8650_driver_data,
+	.use_rpm = true,
+};
+
+static const struct of_device_id lpass_core_cc_sm8650_match_table[] = {
+	{ .compatible = "qcom,sm8650-lpasscorecc" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, lpass_core_cc_sm8650_match_table);
+
+static struct gdsc *lpass_core_hm_sm8650_gdscs[] = {
+	[LPASS_CORE_HM_GDSC] = &lpass_core_cc_lpass_core_hm_gdsc,
+};
+
+static const struct regmap_config lpass_core_hm_sm8650_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = 0x9000,
+	.fast_io = true,
+};
+
+static const u32 lpass_core_hm_sm8650_critical_cbcrs[] = {
+	0x9000, /* LPASS_TOP_CC_LPASS_CORE_SWAY_AHB_LS */
+};
+
+static const struct qcom_cc_driver_data lpass_core_hm_sm8650_driver_data = {
+	.clk_cbcrs = lpass_core_hm_sm8650_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(lpass_core_hm_sm8650_critical_cbcrs),
+};
+
+static const struct qcom_cc_desc lpass_core_hm_sm8650_desc = {
+	.config = &lpass_core_hm_sm8650_regmap_config,
+	.gdscs = lpass_core_hm_sm8650_gdscs,
+	.num_gdscs = ARRAY_SIZE(lpass_core_hm_sm8650_gdscs),
+	.driver_data = &lpass_core_hm_sm8650_driver_data,
+	.use_rpm = true,
+};
+
+static int lpass_core_cc_sm8650_probe(struct platform_device *pdev)
+{
+	return qcom_cc_probe(pdev, &lpass_core_cc_sm8650_desc);
+}
+
+static struct platform_driver lpass_core_cc_sm8650_driver = {
+	.probe = lpass_core_cc_sm8650_probe,
+	.driver = {
+		.name = "lpass_core_cc-sm8650",
+		.of_match_table = lpass_core_cc_sm8650_match_table,
+	},
+};
+
+static int lpass_hm_core_probe(struct platform_device *pdev)
+{
+	return qcom_cc_probe(pdev, &lpass_core_hm_sm8650_desc);
+}
+
+static const struct of_device_id lpass_hm_sm8650_match_table[] = {
+	{ .compatible = "qcom,sm8650-lpasshm" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, lpass_hm_sm8650_match_table);
+
+static struct platform_driver lpass_hm_sm8650_driver = {
+	.probe = lpass_hm_core_probe,
+	.driver = {
+		.name = "lpass_hm-sm8650",
+		.of_match_table = lpass_hm_sm8650_match_table,
+	},
+};
+
+static int __init lpass_core_cc_sm8650_init(void)
+{
+	int ret;
+
+	ret = platform_driver_register(&lpass_hm_sm8650_driver);
+	if (ret)
+		return ret;
+
+	ret = platform_driver_register(&lpass_core_cc_sm8650_driver);
+	if (ret)
+		platform_driver_unregister(&lpass_hm_sm8650_driver);
+
+	return ret;
+}
+subsys_initcall(lpass_core_cc_sm8650_init);
+
+static void __exit lpass_core_cc_sm8650_exit(void)
+{
+	platform_driver_unregister(&lpass_core_cc_sm8650_driver);
+	platform_driver_unregister(&lpass_hm_sm8650_driver);
+}
+module_exit(lpass_core_cc_sm8650_exit);
+
+MODULE_DESCRIPTION("QTI LPASS_CORE_CC SM8650 Driver");
+MODULE_LICENSE("GPL");

-- 
2.34.1

