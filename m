Received: from fout6-smtp.messagingengine.com (fout6-smtp.messagingengine.com [103.168.172.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D79641741F3;
	Wed,  3 Jul 2024 10:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720004148; cv=none; b=aPhAkVlrNeUlxBUnL8MgQq7Cgcbiu782fqcnzEsIsHGxOwTUtwXxaSB8RfM+9oTF3H2VzgySHcBbNeOPhZfVkvg6R0zhr0xytMN8lrUj29Wd9COyi3xMmndKoInNjaQFE/gSwdwm83AdG37tVM+3CTMXChfe4zccZzMFxv4nCmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720004148; c=relaxed/simple;
	bh=jmjGtK29cRc4yaV7+nkqN0EfeRSKfNMHZIKyWrX6klM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bRBCtyJ4bkzvpkinIAXwGFT9fqsaz0vspxtryr2fWHeLZaFrkuzYVo5loAD+0o4501iSoVoTFiIj+KUf1nJ093WDZ+TlMSaZIhvdCV+sTkGxGXijXXkziAaEwkP4lAeRVr4NlN15vtWIbW2IPvxt+qx2o6l/0dhlxXUZPV4/rns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com; spf=pass smtp.mailfrom=testtoast.com; dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b=xwokBsnI; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=cPcGitv+; arc=none smtp.client-ip=103.168.172.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=testtoast.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b="xwokBsnI";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="cPcGitv+"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfout.nyi.internal (Postfix) with ESMTP id 334551380622;
	Wed,  3 Jul 2024 06:55:46 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Wed, 03 Jul 2024 06:55:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1720004146; x=
	1720090546; bh=tfCHMfxWFNiChBgwEq49Ue2QzQSIOUIUNic78/4HQvQ=; b=x
	wokBsnIxAK8D8CSFcE32WjnNLkRSN+vXHiDdzZ0UrH4p6dTLvxHssV0eaoQksUh6
	+3VZPBrAIfyK0uw2wCQS1IAXsdko4suKd6wiLRNfw1BXiUxnapBKzoKKRnDd4AqS
	43zdYiTSGgjc2yMiXbAsZ64gZKQAf5dtQ9636sVi0WT+o04eZEhw5RZ8OLYmIT3B
	1sI4oBQJz4VyYWVeGvqVNcH29025hPWEoRRaXYiOK12xWK2BND5Q5qTMxn+7xmgE
	JY19vYLPsdTKoPTMFaKyl7d9sI2YAqULEesPPEiSJUabLnUSaHfFJ1edwmNuNRov
	kPbdUkLFkD0SPy0eYlWdw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1720004146; x=
	1720090546; bh=tfCHMfxWFNiChBgwEq49Ue2QzQSIOUIUNic78/4HQvQ=; b=c
	PcGitv+KHLKhM1/p+R3Ajkn2fS5K5RbTLCpafInFFlt7Yul9f2NL/wYbyeZKYK6U
	+DB0irYb4D1c2pYV9HRUCaE/sjuZSi5zXsrw4WPvi+7LWLZ7ycdO79hEjr1acwQW
	edpClElXtTpmHvrGtwoVAfHyfxOpTP4dXCv5zhO2AAZyW33TJ5xMjcnFNB6RZ4gQ
	23Chol+b1R35nx4TnV+tfnPyhOEGCVE6mpygqnfJB4GF6ERYNCHfF0uzWmWrUA4e
	uvlm3OvOQSzMBGNrSuRMOEz2DiZTjJAAg5zqkXeyFE8Ay1dKZlLDaFQGeRaubmSG
	PJEM/HunjVooBPS2/KtuA==
X-ME-Sender: <xms:Mi6FZm2Jl7MFw3iBYTuQRttnyq1fWt2YKcbTFneRfiZgKQomRVteEQ>
    <xme:Mi6FZpGNbxtBmQxRYC5Nt3Bv-xBV4AkI4FZP_W9AxNqZrZ8ZM9BnADBiBS_ETbX3k
    39bmvGYqGWyZ0Kfaw>
X-ME-Received: <xmr:Mi6FZu7kux5GkAHOaW5GpNsVwG8PVb4MonVtY4eGa69pF4dgJaT9hxJXgAktPccGUpUsmecAiGZgf2t94e5Ulm8o20_Dhwd17By9Rxm_pipx1HPo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudejgdefgecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefthigrnhcu
    hggrlhhklhhinhcuoehrhigrnhesthgvshhtthhorghsthdrtghomheqnecuggftrfgrth
    htvghrnhepffehieffgedtgfffjeetveegfeekleeileekveeuteffteetudffveegieei
    heetnecuvehluhhsthgvrhfuihiivgepfeenucfrrghrrghmpehmrghilhhfrhhomheprh
    ihrghnsehtvghsthhtohgrshhtrdgtohhm
X-ME-Proxy: <xmx:Mi6FZn25-Znk2pxM-8vcRmEA-MqYKNHC5UnC3XUIXv1iQaW9EuR0Sg>
    <xmx:Mi6FZpEMeo1NmZsgrUbig2Pv-n_DIDZjloYtppZAkUdiA4BvTs2pHQ>
    <xmx:Mi6FZg881LgRUEWzNdwuJO5cyCxIOignnH745cO49k1yzT38_nhcdQ>
    <xmx:Mi6FZumdxDIfZ-h2OLi6-QGM9Lc68EJvqAyrXJU9Zpyd9jsjBVp5Tw>
    <xmx:Mi6FZi3e9h2y2PlSZtDdHrJPziSpwPnOkSPGL-6OBH-6h1eY660SfeBm>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 3 Jul 2024 06:55:40 -0400 (EDT)
From: Ryan Walklin <ryan@testtoast.com>
To: Maxime Ripard <mripard@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Andre Przywara <andre.przywara@arm.com>,
	Chris Morgan <macroalpha82@gmail.com>,
	John Watts <contact@jookia.org>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Ryan Walklin <ryan@testtoast.com>
Subject: [PATCH v2 05/23] drm: sun4i: de3: Add YUV formatter module
Date: Wed,  3 Jul 2024 22:50:55 +1200
Message-ID: <20240703105454.41254-6-ryan@testtoast.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240703105454.41254-1-ryan@testtoast.com>
References: <20240703105454.41254-1-ryan@testtoast.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jernej Skrabec <jernej.skrabec@gmail.com>

The display engine formatter (FMT) module is present in the DE3 engine
and provides YUV444 to YUV422/YUV420 conversion, format re-mapping and
color depth conversion.

Add support for this module.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Signed-off-by: Ryan Walklin <ryan@testtoast.com>
---
 drivers/gpu/drm/sun4i/Makefile     |  3 +-
 drivers/gpu/drm/sun4i/sun50i_fmt.c | 82 ++++++++++++++++++++++++++++++
 drivers/gpu/drm/sun4i/sun50i_fmt.h | 32 ++++++++++++
 3 files changed, 116 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/sun4i/sun50i_fmt.c
 create mode 100644 drivers/gpu/drm/sun4i/sun50i_fmt.h

diff --git a/drivers/gpu/drm/sun4i/Makefile b/drivers/gpu/drm/sun4i/Makefile
index bad7497a0d11e..3f516329f51ee 100644
--- a/drivers/gpu/drm/sun4i/Makefile
+++ b/drivers/gpu/drm/sun4i/Makefile
@@ -16,7 +16,8 @@ sun8i-drm-hdmi-y		+= sun8i_hdmi_phy_clk.o
 
 sun8i-mixer-y			+= sun8i_mixer.o sun8i_ui_layer.o \
 				   sun8i_vi_layer.o sun8i_ui_scaler.o \
-				   sun8i_vi_scaler.o sun8i_csc.o
+				   sun8i_vi_scaler.o sun8i_csc.o \
+				   sun50i_fmt.o
 
 sun4i-tcon-y			+= sun4i_crtc.o
 sun4i-tcon-y			+= sun4i_tcon_dclk.o
diff --git a/drivers/gpu/drm/sun4i/sun50i_fmt.c b/drivers/gpu/drm/sun4i/sun50i_fmt.c
new file mode 100644
index 0000000000000..050a8716ae862
--- /dev/null
+++ b/drivers/gpu/drm/sun4i/sun50i_fmt.c
@@ -0,0 +1,82 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (C) Jernej Skrabec <jernej.skrabec@gmail.com>
+ */
+
+#include <uapi/linux/media-bus-format.h>
+
+#include "sun50i_fmt.h"
+
+static bool sun50i_fmt_is_10bit(u32 format)
+{
+	switch (format) {
+	case MEDIA_BUS_FMT_RGB101010_1X30:
+	case MEDIA_BUS_FMT_YUV10_1X30:
+	case MEDIA_BUS_FMT_UYYVYY10_0_5X30:
+	case MEDIA_BUS_FMT_UYVY10_1X20:
+		return true;
+	default:
+		return false;
+	}
+}
+
+static u32 sun50i_fmt_get_colorspace(u32 format)
+{
+	switch (format) {
+	case MEDIA_BUS_FMT_UYYVYY8_0_5X24:
+	case MEDIA_BUS_FMT_UYYVYY10_0_5X30:
+		return SUN50I_FMT_CS_YUV420;
+	case MEDIA_BUS_FMT_UYVY8_1X16:
+	case MEDIA_BUS_FMT_UYVY10_1X20:
+		return SUN50I_FMT_CS_YUV422;
+	default:
+		return SUN50I_FMT_CS_YUV444RGB;
+	}
+}
+
+static void sun50i_fmt_de3_limits(u32 *limits, u32 colorspace, bool bit10)
+{
+	if (colorspace != SUN50I_FMT_CS_YUV444RGB) {
+		limits[0] = SUN50I_FMT_LIMIT(64, 940);
+		limits[1] = SUN50I_FMT_LIMIT(64, 960);
+		limits[2] = SUN50I_FMT_LIMIT(64, 960);
+	} else if (bit10) {
+		limits[0] = SUN50I_FMT_LIMIT(0, 1023);
+		limits[1] = SUN50I_FMT_LIMIT(0, 1023);
+		limits[2] = SUN50I_FMT_LIMIT(0, 1023);
+	} else {
+		limits[0] = SUN50I_FMT_LIMIT(0, 1021);
+		limits[1] = SUN50I_FMT_LIMIT(0, 1021);
+		limits[2] = SUN50I_FMT_LIMIT(0, 1021);
+	}
+}
+
+void sun50i_fmt_setup(struct sun8i_mixer *mixer, u16 width,
+		      u16 height, u32 format)
+{
+	u32 colorspace, limit[3], base;
+	struct regmap *regs;
+	bool bit10;
+
+	colorspace = sun50i_fmt_get_colorspace(format);
+	bit10 = sun50i_fmt_is_10bit(format);
+	base = SUN50I_FMT_DE3;
+	regs = sun8i_blender_regmap(mixer);
+
+	sun50i_fmt_de3_limits(limit, colorspace, bit10);
+
+	regmap_write(regs, SUN50I_FMT_CTRL(base), 0);
+
+	regmap_write(regs, SUN50I_FMT_SIZE(base),
+		     SUN8I_MIXER_SIZE(width, height));
+	regmap_write(regs, SUN50I_FMT_SWAP(base), 0);
+	regmap_write(regs, SUN50I_FMT_DEPTH(base), bit10);
+	regmap_write(regs, SUN50I_FMT_FORMAT(base), colorspace);
+	regmap_write(regs, SUN50I_FMT_COEF(base), 0);
+
+	regmap_write(regs, SUN50I_FMT_LMT_Y(base), limit[0]);
+	regmap_write(regs, SUN50I_FMT_LMT_C0(base), limit[1]);
+	regmap_write(regs, SUN50I_FMT_LMT_C1(base), limit[2]);
+
+	regmap_write(regs, SUN50I_FMT_CTRL(base), 1);
+}
diff --git a/drivers/gpu/drm/sun4i/sun50i_fmt.h b/drivers/gpu/drm/sun4i/sun50i_fmt.h
new file mode 100644
index 0000000000000..4127f7206aade
--- /dev/null
+++ b/drivers/gpu/drm/sun4i/sun50i_fmt.h
@@ -0,0 +1,32 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Copyright (C) Jernej Skrabec <jernej.skrabec@gmail.com>
+ */
+
+#ifndef _SUN50I_FMT_H_
+#define _SUN50I_FMT_H_
+
+#include "sun8i_mixer.h"
+
+#define SUN50I_FMT_DE3 0xa8000
+
+#define SUN50I_FMT_CTRL(base)   ((base) + 0x00)
+#define SUN50I_FMT_SIZE(base)   ((base) + 0x04)
+#define SUN50I_FMT_SWAP(base)   ((base) + 0x08)
+#define SUN50I_FMT_DEPTH(base)  ((base) + 0x0c)
+#define SUN50I_FMT_FORMAT(base) ((base) + 0x10)
+#define SUN50I_FMT_COEF(base)   ((base) + 0x14)
+#define SUN50I_FMT_LMT_Y(base)  ((base) + 0x20)
+#define SUN50I_FMT_LMT_C0(base) ((base) + 0x24)
+#define SUN50I_FMT_LMT_C1(base) ((base) + 0x28)
+
+#define SUN50I_FMT_LIMIT(low, high) (((high) << 16) | (low))
+
+#define SUN50I_FMT_CS_YUV444RGB 0
+#define SUN50I_FMT_CS_YUV422    1
+#define SUN50I_FMT_CS_YUV420    2
+
+void sun50i_fmt_setup(struct sun8i_mixer *mixer, u16 width,
+		      u16 height, u32 format);
+
+#endif
-- 
2.45.2

