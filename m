Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA9FB4EBAD3
	for <linux-clk@vger.kernel.org>; Wed, 14 Oct 2026 23:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792021898; cv=none; b=eV38yIlLhhF5Gnv8iQoVaQLHEB2xXNnuARNvldjOCeSMTkjwUZ3/oAHm/lHqWJmxLY0dfrM1xEqAUeh7+77jvQaJwFnkRWlBC2AFMVTlESYVCQexMGa3utmcf08ylonXi5+QGuC6Cx0njzbpdx19AgKymBDq6/qy6SWDH/4UjC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792021898; c=relaxed/simple;
	bh=nFFYERoco/hEDei2XWIZ/Mq26XIYNYrFthcRkgPDryI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ETp4SB/FxkD4CFlQe1AlA/sI4SkfSskC07FRDkW3bmr1IegXvsyg/7WiHF0jV1GlN6a5FZ7I5LtEr+Q3tEFycPqViazCuWZLwP5Sf6rur/UlsO1KCTZeqP+Y3wxHShf+zU4TB4iB9BjZEwL4bf5pJnF2PXcT0Ek+BGr35MGqMMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q2fEWkqC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R83i3LFZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q2fEWkqC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R83i3LFZ"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EMFWnV905402
	for <linux-clk@vger.kernel.org>; Wed, 14 Oct 2026 23:51:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vHNXCTplanDLYcIsWoT+gNJA9c0EMiWv99iH9HXiGRA=; b=Q2fEWkqCuJwcFLu/
	7KDfaF9X9LUqm7OhjcYEJJnM/BpWVwC61h/5AC9lbr2kBkr1jx008eN3vQJAyV1u
	c9jbIAsfNooPgj7H4MZufIrxU95SGRd8GPipKzth0OsYy8UuENhfdQAJbfE64xyl
	2GdUlgO8kIHFPrGYxapbSZBi6GgvDVGZrgkNoGBfJ0+DhCpconU5SsFf2bM30BuR
	4e2ePV2yo91xfvs5Y6QZZqksjjl1kzcDa3dzYtO1/FhBZ20YK/q4lI1h+6P8FS3P
	YKa9JyOgwqk/z02ZzlJFSLaH321Fv+wOjWn+hLjvSnHfKek6FlVU84dnASZQBtaN
	TaBXHA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ha42p412j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 14 Oct 2026 23:51:34 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-939c30aa9a0so107587885a.0
        for <linux-clk@vger.kernel.org>; Wed, 14 Oct 2026 16:51:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792021894; x=1792626694; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vHNXCTplanDLYcIsWoT+gNJA9c0EMiWv99iH9HXiGRA=;
        b=R83i3LFZVNXhDv5552yloe2X/aXJj4GLSSU2XZMQX2D4dLDWgyrEorMIgdbSEXJ/xx
         aGn3CK3WuV7eGd2BFJOEfWm0uz/nt1YDTPLWsojom1YWh01RKWN0v8B8CNpg5ZtSDKgi
         bD61Q/Oe36hqO02WtPsCvSPmKMt6Q+m1QVSa+ZWQ4fxTyskzZFjmTbNc/gwOCKTVvQ1B
         KaHu3SYLs2iovrVzYkeT2Wg2gZRuHrwjd3+4Q5HjcLRui6KigFnMZ8ZlFWafn/gS7xJU
         j58qGI5L6RZycKXnxmwrEa7Qagj/pBdHccJFR22itOAxtPPtuT0dMZ9WZIW8MJp8G4rX
         TpaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792021894; x=1792626694;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vHNXCTplanDLYcIsWoT+gNJA9c0EMiWv99iH9HXiGRA=;
        b=0frdQCj70rGRc7a3sUqSkscrpMAk5KWoX9EvCGho9xJxuh4cm8U5l/lerR8I922fpL
         V1nhzWi+EGO2Nje5PMYgdeRlodzNEkVynjG+98KO6++c+0Zw0VBQwirAEwNxm4ol9gkb
         Mj4+Y1XT5xD50zBZsgqWykEZEvj7I9Kb9+wxsmnGJ2bXkxjjndh9qAUP9ybw3vgn3sJb
         wuJx+hKnKYuOhrmqVTI9DHIhn4Hs/9PAtogL+Wqj8/7UrXCdPKGKiiC6mjPO20lzyXMr
         fh6SsnHrMc5FDvOWSUWa3Rr4X2eIaSaM2inB3nHMbUsoAn9HJ5MwZcryHv8F/oSKpnSM
         AnuQ==
X-Forwarded-Encrypted: i=1; AKwUvByXyIaqP4oKL1wXPyhl9rLmXlpVvsgNN0KE6eU7hJRVE55aog9W8H7WFG94UNndcqFnX0el623T4sY=@vger.kernel.org
X-Gm-Message-State: AFq9FYKIopoccz3nyyn7hjoQmkCihMihpzgquSCwXw8L8s349/TxuDVM
	Fohx7tAN6yavTWT1HakX/FAnvWA0fBubCqxIyTk8pEdKicBIlY7DtDZQN0OaLqjkdLcBYL24PND
	Iw6Ue3RXEF/CHqn4gkV+Z29eyFhZrY8DwpVHuo2Pg4tA4glyCNFd/kcUegmTODYs=
X-Gm-Gg: AYBFou0Z6pmAoyw98fLrhd172K5qH/HLo5pMTJ54WSWRO+WNaRtxlMcJ8lDBDmdF4b4
	/QOPcAdI/cz8zmXeNtRKV64npdo3NvEZqS6bwOI2QFVOq3kTT2l00hEmhURY8SP//sl8orrc6LZ
	Edpzot/GE3THl6HhQfGeTc78iViGH+EdVoGgq1xWNHjHO0ybzECEtBX5a3eU34AVK6A+EiY9Hjl
	8+Ili87lYAyu0E9HnGyS8SerPXsFFCwRSLGA9xosto/MFET55gIuWzN0pScPi9L3CDpSuwuLCMp
	EAak+qNRg1eOLFfcXYDICYg72QaIzvz0/ptVtP+osAs66PvmGp+ZWkyqMufAZNL4gPDvb4JjG9W
	2f65cVMA28xzHyUmV9neBuyHOQXJOD8FFQwBTJzvAwrXyR5kPUvEofJawu1Opn4wUUSPHtR1bTL
	A4PMCNx8zqs+cb
X-Received: by 2002:a05:620a:4515:b0:93c:aa75:71e with SMTP id af79cd13be357-93ebd27cc81mr2822433985a.55.1792021893803;
        Wed, 14 Oct 2026 16:51:33 -0700 (PDT)
X-Received: by 2002:a05:620a:4515:b0:93c:aa75:71e with SMTP id af79cd13be357-93ebd27cc81mr2822430985a.55.1792021893201;
        Wed, 14 Oct 2026 16:51:33 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3aafded5414sm2285281fa.16.2026.10.14.16.51.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 16:51:30 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 02:51:14 +0300
Subject: [PATCH v3 2/5] drm/panel: add Novatek NT36850 panel driver
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-sdm845-hdk-v3-2-1c179cd0d16f@oss.qualcomm.com>
References: <20261015-sdm845-hdk-v3-0-1c179cd0d16f@oss.qualcomm.com>
In-Reply-To: <20261015-sdm845-hdk-v3-0-1c179cd0d16f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Abel Vesa <abelvesa@kernel.org>, Ulf Hansson <ulfh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=12709;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=nFFYERoco/hEDei2XWIZ/Mq26XIYNYrFthcRkgPDryI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq0BV5Ltm+/0xgsV6qXgAxB8VFn5g0l4VnI2ugb
 Wo4tqyX7+KJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCatAVeQAKCRCLPIo+Aiko
 1U1yB/9lASpKHHY1aba+OmW7khuFoxAQzOoxNSHajf7ko2ygg+Q1hqGJccqQKoolCM06d1r+E2D
 UIJCHAlliuwD4Hz4iRA1N2hdTLXl7zWFEItU2Kt3mqD/+sE+yATfWKfuQLVu69Iy1WAp37vo4ue
 fjtDGobRLfA7/gM5iZHNA+iLPmYhl4+hYXz15AToyhRi9sH8d/zIcPImMK2ynqbrvet/C8Wrjxn
 zd48JZz0hpv8ycfTVflNjjk3czAyiSkVMERMjNqAbgzavm74VgtDnWCQTh4pN/97n8KnRNO6iT8
 V4QvKY9fJ2MH1/D05TPyih6jD+SHrPZ215Nx/7XdSnlJHVKn
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA5NSBTYWx0ZWRfX+C8U8HvsbzYD
 jsdZUbX7k8JmBERVsN8sAzvcgHAIwvlRgmDht+4UodDg8gcU/fBNaQR0PhRl2Li9Kaxszr5SSXW
 ktkmJUAcnabTS2Px/d6XXdNqn9fE8lI=
X-Proofpoint-ORIG-GUID: pJConVbhZARxR3BvI6JK7cKxHihRl3w7
X-Authority-Analysis: v=2.4 cv=aeb0Dhot c=1 sm=1 tr=0 ts=6ad01586 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=pGLkceISAAAA:8 a=Avzf8x2XDEdYhfZFVJMA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA5NSBTYWx0ZWRfX6VImJw6easCd
 61hZKIPObPlg5/kV2hY7zuQ3ynywp5vFv06AviSIxrUx2AG0DbJdEINQuNK5wUdsX10YWplt7np
 UrD9IY+3+EiRLqDkaeO3ob54UZ4r1MwoZYlPqnMKFP9ZzqBXwn4kHv0weYlNF1voevIqmgbesIg
 TJ1c+0MT7nbl2BSsPLs0BpZO+1JhubLUz0mp4IBWzebi1JXxrB57pu7+BuvGuxK3Lg4wBKACMzS
 YlrJpechyVf4wTXjj7CofOAMdaMqGQAzi9jgQP/7mvc5duqW/G40zSLnPUQozX5Mg+fApltK080
 65Epe6TJYogBqbNsuuadKWjn2PQlE0S/cmdfkMVcuGS7wsDQDO+NiXHjvne8ovFnTL06YzYSFvT
 6GAh7MBHEAmuu9mDLPZp5VNXnJ/dD+1acvy3LZXBh7wHdaL20eBCucM3VSqHrnqVfV85iU2qnWX
 4Fz9nC3WaJYJli7O2og==
X-Proofpoint-GUID: pJConVbhZARxR3BvI6JK7cKxHihRl3w7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610140095

Add support for the Truly WQHD dual-DSI command mode panel built around
the Novatek NT36850, found on the display card for the Qualcomm SDM845
and SM8150 HDK. The driver is based on panel-novatek-nt36523, the power
and command sequences follow the vendor device tree.

Assisted-by: LLM
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/panel/Kconfig                 |  10 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 drivers/gpu/drm/panel/panel-novatek-nt36850.c | 344 ++++++++++++++++++++++++++
 3 files changed, 355 insertions(+)

diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
index 53a1fc2913fe..869a5501e709 100644
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -723,6 +723,16 @@ config DRM_PANEL_NOVATEK_NT36672E
 	  LCD panel module. The panel has a resolution of 1080x2408 and uses 24 bit
 	  RGB per pixel.
 
+config DRM_PANEL_NOVATEK_NT36850
+	tristate "Novatek NT36850 panel driver"
+	depends on OF
+	depends on DRM_MIPI_DSI
+	depends on BACKLIGHT_CLASS_DEVICE
+	help
+	  Say Y here if you want to enable support for the panels built
+	  around the Novatek NT36850 display controller, such as some
+	  Truly panels used in Qualcomm development kits.
+
 config DRM_PANEL_NOVATEK_NT37700F
 	tristate "Novatek NT37700F DSI panel"
 	depends on OF
diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
index f2c9c80a218f..8dd8eb7080cb 100644
--- a/drivers/gpu/drm/panel/Makefile
+++ b/drivers/gpu/drm/panel/Makefile
@@ -69,6 +69,7 @@ obj-$(CONFIG_DRM_PANEL_NOVATEK_NT36532) += panel-novatek-nt36532.o
 obj-$(CONFIG_DRM_PANEL_NOVATEK_NT36536) += panel-novatek-nt36536.o
 obj-$(CONFIG_DRM_PANEL_NOVATEK_NT36672A) += panel-novatek-nt36672a.o
 obj-$(CONFIG_DRM_PANEL_NOVATEK_NT36672E) += panel-novatek-nt36672e.o
+obj-$(CONFIG_DRM_PANEL_NOVATEK_NT36850) += panel-novatek-nt36850.o
 obj-$(CONFIG_DRM_PANEL_NOVATEK_NT37700F) += panel-novatek-nt37700f.o
 obj-$(CONFIG_DRM_PANEL_NOVATEK_NT37801) += panel-novatek-nt37801.o
 obj-$(CONFIG_DRM_PANEL_NOVATEK_NT39016) += panel-novatek-nt39016.o
diff --git a/drivers/gpu/drm/panel/panel-novatek-nt36850.c b/drivers/gpu/drm/panel/panel-novatek-nt36850.c
new file mode 100644
index 000000000000..d3530e3d5754
--- /dev/null
+++ b/drivers/gpu/drm/panel/panel-novatek-nt36850.c
@@ -0,0 +1,344 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Novatek NT36850 DriverIC panels driver
+ *
+ * Copyright (c) 2022, 2023 Jianhua Lu <lujianhua000@gmail.com>
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries
+ */
+
+#include <linux/backlight.h>
+#include <linux/delay.h>
+#include <linux/gpio/consumer.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_graph.h>
+#include <linux/regulator/consumer.h>
+
+#include <video/mipi_display.h>
+
+#include <drm/drm_crtc.h>
+#include <drm/drm_mipi_dsi.h>
+#include <drm/drm_modes.h>
+#include <drm/drm_of.h>
+#include <drm/drm_panel.h>
+#include <drm/drm_probe_helper.h>
+
+struct panel_info {
+	struct drm_panel panel;
+	struct mipi_dsi_device *dsi[2];
+	const struct panel_desc *desc;
+	enum drm_panel_orientation orientation;
+
+	struct gpio_desc *reset_gpio;
+	struct backlight_device *backlight;
+	struct regulator *vddio;
+	struct regulator *avdd;
+	struct regulator *avee;
+};
+
+struct panel_desc {
+	unsigned int bpc;
+	unsigned int lanes;
+	unsigned long mode_flags;
+	enum mipi_dsi_pixel_format format;
+
+	const struct drm_display_mode *mode;
+	int (*init_sequence)(struct panel_info *pinfo);
+
+	bool is_dual_dsi;
+};
+
+static inline struct panel_info *to_panel_info(struct drm_panel *panel)
+{
+	return container_of(panel, struct panel_info, panel);
+}
+
+static int truly_wqhd_init_sequence(struct panel_info *pinfo)
+{
+	struct mipi_dsi_device *dsi0 = pinfo->dsi[0];
+	struct mipi_dsi_device *dsi1 = pinfo->dsi[1];
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = NULL };
+
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0xff, 0x10);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0xfb, 0x01);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1,
+					  MIPI_DCS_SET_ADDRESS_MODE, 0x00);
+	mipi_dsi_dual(mipi_dsi_dcs_set_tear_on_multi, &dsi_ctx, dsi0, dsi1,
+		      MIPI_DSI_DCS_TEAR_MODE_VBLANK);
+	mipi_dsi_dual(mipi_dsi_dcs_set_tear_scanline_multi, &dsi_ctx, dsi0, dsi1,
+		      1000);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1,
+					  MIPI_DCS_SET_DISPLAY_BRIGHTNESS,
+					  0xff);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1,
+					  MIPI_DCS_WRITE_CONTROL_DISPLAY,
+					  0x2c);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1,
+					  MIPI_DCS_WRITE_POWER_SAVE, 0x01);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1,
+					  MIPI_DCS_EXIT_INVERT_MODE);
+	mipi_dsi_usleep_range(&dsi_ctx, 10000, 11000);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0xbb, 0x10);
+	mipi_dsi_dual(mipi_dsi_dcs_exit_sleep_mode_multi, &dsi_ctx, dsi0, dsi1);
+	mipi_dsi_msleep(&dsi_ctx, 120);
+	mipi_dsi_dual(mipi_dsi_dcs_set_display_on_multi, &dsi_ctx, dsi0, dsi1);
+	mipi_dsi_msleep(&dsi_ctx, 120);
+
+	return dsi_ctx.accum_err;
+}
+
+static const struct drm_display_mode truly_wqhd_mode = {
+	.clock = (720 + 120 + 20 + 140) * 2 * (2560 + 8 + 4 + 20) * 60 / 1000,
+	.hdisplay = 720 * 2,
+	.hsync_start = (720 + 120) * 2,
+	.hsync_end = (720 + 120 + 20) * 2,
+	.htotal = (720 + 120 + 20 + 140) * 2,
+	.vdisplay = 2560,
+	.vsync_start = 2560 + 8,
+	.vsync_end = 2560 + 8 + 4,
+	.vtotal = 2560 + 8 + 4 + 20,
+};
+
+static const struct panel_desc truly_wqhd_desc = {
+	.mode = &truly_wqhd_mode,
+	.bpc = 8,
+	.lanes = 4,
+	.format = MIPI_DSI_FMT_RGB888,
+	.mode_flags = MIPI_DSI_CLOCK_NON_CONTINUOUS | MIPI_DSI_MODE_LPM,
+	.init_sequence = truly_wqhd_init_sequence,
+	.is_dual_dsi = true,
+};
+
+static void nt36850_reset(struct panel_info *pinfo)
+{
+	gpiod_set_value_cansleep(pinfo->reset_gpio, 0);
+	usleep_range(10000, 11000);
+	gpiod_set_value_cansleep(pinfo->reset_gpio, 1);
+	usleep_range(10000, 11000);
+	gpiod_set_value_cansleep(pinfo->reset_gpio, 0);
+	msleep(50);
+}
+
+static int nt36850_prepare(struct drm_panel *panel)
+{
+	struct panel_info *pinfo = to_panel_info(panel);
+	int ret;
+
+	ret = regulator_enable(pinfo->vddio);
+	if (ret) {
+		dev_err(panel->dev, "failed to enable vddio regulator: %d\n", ret);
+		return ret;
+	}
+
+	msleep(20);
+
+	ret = regulator_enable(pinfo->avdd);
+	if (ret) {
+		dev_err(panel->dev, "failed to enable avdd regulator: %d\n", ret);
+		goto err_vddio;
+	}
+
+	ret = regulator_enable(pinfo->avee);
+	if (ret) {
+		dev_err(panel->dev, "failed to enable avee regulator: %d\n", ret);
+		goto err_avdd;
+	}
+
+	msleep(20);
+
+	nt36850_reset(pinfo);
+
+	ret = pinfo->desc->init_sequence(pinfo);
+	if (ret < 0) {
+		dev_err(panel->dev, "failed to initialize panel: %d\n", ret);
+		goto err_avee;
+	}
+
+	return 0;
+
+err_avee:
+	gpiod_set_value_cansleep(pinfo->reset_gpio, 1);
+	regulator_disable(pinfo->avee);
+err_avdd:
+	regulator_disable(pinfo->avdd);
+err_vddio:
+	regulator_disable(pinfo->vddio);
+
+	return ret;
+}
+
+static int nt36850_num_dsi_hosts(struct panel_info *pinfo)
+{
+	return pinfo->desc->is_dual_dsi ? 2 : 1;
+}
+
+static int nt36850_disable(struct drm_panel *panel)
+{
+	struct panel_info *pinfo = to_panel_info(panel);
+	struct mipi_dsi_device *dsi0 = pinfo->dsi[0];
+	struct mipi_dsi_device *dsi1 = pinfo->dsi[1];
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = NULL };
+
+	dsi0->mode_flags &= ~MIPI_DSI_MODE_LPM;
+	dsi1->mode_flags &= ~MIPI_DSI_MODE_LPM;
+
+	mipi_dsi_dual(mipi_dsi_dcs_set_display_off_multi, &dsi_ctx, dsi0, dsi1);
+	mipi_dsi_msleep(&dsi_ctx, 120);
+	mipi_dsi_dual(mipi_dsi_dcs_enter_sleep_mode_multi, &dsi_ctx, dsi0, dsi1);
+	mipi_dsi_msleep(&dsi_ctx, 120);
+
+	dsi0->mode_flags |= MIPI_DSI_MODE_LPM;
+	dsi1->mode_flags |= MIPI_DSI_MODE_LPM;
+
+	return dsi_ctx.accum_err;
+}
+
+static int nt36850_unprepare(struct drm_panel *panel)
+{
+	struct panel_info *pinfo = to_panel_info(panel);
+
+	gpiod_set_value_cansleep(pinfo->reset_gpio, 1);
+	regulator_disable(pinfo->avee);
+	regulator_disable(pinfo->avdd);
+	regulator_disable(pinfo->vddio);
+
+	return 0;
+}
+
+static int nt36850_get_modes(struct drm_panel *panel,
+			       struct drm_connector *connector)
+{
+	struct panel_info *pinfo = to_panel_info(panel);
+
+	connector->display_info.bpc = pinfo->desc->bpc;
+
+	return drm_connector_helper_get_modes_fixed(connector, pinfo->desc->mode);
+}
+
+static enum drm_panel_orientation nt36850_get_orientation(struct drm_panel *panel)
+{
+	struct panel_info *pinfo = to_panel_info(panel);
+
+	return pinfo->orientation;
+}
+
+static const struct drm_panel_funcs nt36850_panel_funcs = {
+	.disable = nt36850_disable,
+	.prepare = nt36850_prepare,
+	.unprepare = nt36850_unprepare,
+	.get_modes = nt36850_get_modes,
+	.get_orientation = nt36850_get_orientation,
+};
+
+static int nt36850_probe(struct mipi_dsi_device *dsi)
+{
+	struct device *dev = &dsi->dev;
+	struct device_node *dsi1;
+	struct mipi_dsi_host *dsi1_host;
+	struct panel_info *pinfo;
+	const struct mipi_dsi_device_info *info;
+	int i, ret;
+
+	pinfo = devm_drm_panel_alloc(dev, struct panel_info, panel,
+				     &nt36850_panel_funcs,
+				     DRM_MODE_CONNECTOR_DSI);
+	if (IS_ERR(pinfo))
+		return PTR_ERR(pinfo);
+
+	pinfo->vddio = devm_regulator_get(dev, "vddio");
+	if (IS_ERR(pinfo->vddio))
+		return dev_err_probe(dev, PTR_ERR(pinfo->vddio), "failed to get vddio regulator\n");
+
+	pinfo->avdd = devm_regulator_get(dev, "avdd");
+	if (IS_ERR(pinfo->avdd))
+		return dev_err_probe(dev, PTR_ERR(pinfo->avdd), "failed to get avdd regulator\n");
+
+	pinfo->avee = devm_regulator_get(dev, "avee");
+	if (IS_ERR(pinfo->avee))
+		return dev_err_probe(dev, PTR_ERR(pinfo->avee), "failed to get avee regulator\n");
+
+	pinfo->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
+	if (IS_ERR(pinfo->reset_gpio))
+		return dev_err_probe(dev, PTR_ERR(pinfo->reset_gpio), "failed to get reset gpio\n");
+
+	pinfo->desc = of_device_get_match_data(dev);
+	if (!pinfo->desc)
+		return -ENODEV;
+
+	/* If the panel is dual dsi, register DSI1 */
+	if (pinfo->desc->is_dual_dsi) {
+		struct mipi_dsi_device_info dsi_info = {
+			.type = "dsi-secondary",
+		};
+
+		dsi1 = of_graph_get_remote_node(dsi->dev.of_node, 1, -1);
+		if (!dsi1) {
+			dev_err(dev, "cannot get secondary DSI node.\n");
+			return -ENODEV;
+		}
+
+		dsi1_host = of_find_mipi_dsi_host_by_node(dsi1);
+		of_node_put(dsi1);
+		if (!dsi1_host)
+			return dev_err_probe(dev, -EPROBE_DEFER, "cannot get secondary DSI host\n");
+
+		pinfo->dsi[1] = devm_mipi_dsi_device_register_full(dev, dsi1_host, &dsi_info);
+		if (IS_ERR(pinfo->dsi[1])) {
+			dev_err(dev, "cannot get secondary DSI device\n");
+			return PTR_ERR(pinfo->dsi[1]);
+		}
+	}
+
+	pinfo->dsi[0] = dsi;
+	mipi_dsi_set_drvdata(dsi, pinfo);
+
+	ret = drm_of_get_panel_orientation(dev->of_node, &pinfo->orientation);
+	if (ret < 0) {
+		dev_err(dev, "%pOF: failed to get orientation %d\n", dev->of_node, ret);
+		return ret;
+	}
+
+	pinfo->panel.prepare_prev_first = true;
+
+	ret = drm_panel_of_backlight(&pinfo->panel);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to get backlight\n");
+
+	ret = devm_drm_panel_add(&dsi->dev, &pinfo->panel);
+	if (ret)
+		return dev_err_probe(dev, ret, "can't add the panel\n");
+
+	for (i = 0; i < nt36850_num_dsi_hosts(pinfo); i++) {
+		pinfo->dsi[i]->lanes = pinfo->desc->lanes;
+		pinfo->dsi[i]->format = pinfo->desc->format;
+		pinfo->dsi[i]->mode_flags = pinfo->desc->mode_flags;
+
+		ret = devm_mipi_dsi_attach(dev, pinfo->dsi[i]);
+		if (ret < 0)
+			return dev_err_probe(dev, ret, "cannot attach to DSI%d host.\n", i);
+	}
+
+	return 0;
+}
+
+static const struct of_device_id nt36850_of_match[] = {
+	{
+		.compatible = "truly,wqhd60-nt36850",
+		.data = &truly_wqhd_desc,
+	},
+	{},
+};
+MODULE_DEVICE_TABLE(of, nt36850_of_match);
+
+static struct mipi_dsi_driver nt36850_driver = {
+	.probe = nt36850_probe,
+	.driver = {
+		.name = "panel-novatek-nt36850",
+		.of_match_table = nt36850_of_match,
+	},
+};
+module_mipi_dsi_driver(nt36850_driver);
+
+MODULE_AUTHOR("Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>");
+MODULE_DESCRIPTION("DRM driver for Novatek NT36850 based MIPI DSI panels");
+MODULE_LICENSE("GPL");

-- 
2.47.3

