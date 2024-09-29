Received: from fout-a3-smtp.messagingengine.com (fout-a3-smtp.messagingengine.com [103.168.172.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75D7F13E02B;
	Sun, 29 Sep 2024 09:11:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727601121; cv=none; b=LAQckkhxkzZQ6Spa9XIZ9wN4msgO36foSgNIJi4QRU6RQodwudLvHI5ZePJL2JjQkrehHmrXdeqDvyJW5CjM2xGBAErfEToqmzvzmr0Jm983HuZxWzZgHkniarujj8zdCyd7IW+vUiLcP+dbvogPS9ZBNPt4BLwrAPStYKCJ9EY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727601121; c=relaxed/simple;
	bh=zkP+EgCSMEQ8+P6uzaXN8DjtB+YQu8AcSlcSh3kzXA8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y8jL2HL6sVwCe5kSdWb2EMpqmbhnAC+cSCb/7GlfTFAgxPsw1HUMlriUQXgXKkG/5Mg11ttQlDDGVt/tZgaJ5fVuSI/42oHnx2TTceZkqu0JgWJ6ka9iU2vu8WTI4yYtiLHL804/UrkVFEMr4YeJFhe890kbVZVESPObi8K7Tsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com; spf=pass smtp.mailfrom=testtoast.com; dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b=Zuq41dey; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=lqTyiFH9; arc=none smtp.client-ip=103.168.172.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=testtoast.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b="Zuq41dey";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="lqTyiFH9"
Received: from phl-compute-04.internal (phl-compute-04.phl.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id D684113802B6;
	Sun, 29 Sep 2024 05:11:58 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Sun, 29 Sep 2024 05:11:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1727601118; x=
	1727687518; bh=Nrlqm79bY8OBTpF7Y4mgezfpb6RIo8X4hT/KX88CsXc=; b=Z
	uq41deyoFTqQLCOg+8USv2r7vOIauRhDGccf5qvJakE6GRCbjmRT/HKEvD3XhZYx
	uAXw9xLjuXZA7Y/XMyfChrUdDVWrbhhtbcwJScmu7bMs7DNwolJvZUzbIY0GN869
	dJq3M+meMI/26eGJ2FJ23xCfKBBCZn/UKRyqiDldQwGQo7uxvm4vmASGjQ9b8qFr
	5R64ZvNJf/PQpSXTioPL1GFu7Fjf5urPZRP8gNP0Bcewpip+QBxOKhpvWXsPhmxJ
	ovDpFo0itwZkqOa2BwgJhPWegTGnF+42uKQ9Kwx/5/R7g2dzr2rwDeGwVMDRGIlF
	+iV/6+Bj/RPGX9Hz/EpLA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1727601118; x=
	1727687518; bh=Nrlqm79bY8OBTpF7Y4mgezfpb6RIo8X4hT/KX88CsXc=; b=l
	qTyiFH9DoqoWey3W3LubLmdztDZeOIXBZ9pxeuqJqDG9ijqRTGhceADpIETS87PK
	sOI8F75fZVafpaogY1HDBpZlzdGjjrhyeY9ahP4olB4+QS4TDr4FPkCN3umZbZQQ
	UIC9akjNXwDtkczW80GmSiGV0ghgMkHYwoyQw3Gi8Zaxd9Hj2HuUpU3SHsYSJ+R0
	p0oMkg+kfDmQPSah7RyWBlSfMoacO7+E4L7I2XguCR3ruUrSc1IyslmRsrMoINFO
	0BnYYZOK4Mz8/hzww55443xtIcP6a+Bqp+E1esxw7FE71a+pWtaWrA6NRaEfhY+J
	VRaJKd11qE+OcBBr2ljcA==
X-ME-Sender: <xms:3hn5ZoL1Sv-mCxZJIAcx0Swj2rsuk-0DT2VNv6CGLa1Q94AaFoJ9TQ>
    <xme:3hn5ZoJwS2Ow9z10xxICpQmPn6DO1szQYFB1ZlF3oO6u8L7pDMopkOeZK8lntdaQs
    qTX4XoHRhKGasybrw>
X-ME-Received: <xmr:3hn5ZosLbHkGliPLIQ3ZHfssWz41YjOOit32KRW_ismhbQLfp9a5UV0LehFky4KWg043AiFJSc8Fam__Glvnu1OZROspNBkWH0ciwp2VT53ar4M9>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvddufedgudegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttden
    ucfhrhhomheptfihrghnucghrghlkhhlihhnuceorhihrghnsehtvghsthhtohgrshhtrd
    gtohhmqeenucggtffrrghtthgvrhhnpeffheeiffegtdfgffejteevgeefkeelieelkeev
    ueetffetteduffevgeeiieehteenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
    epmhgrihhlfhhrohhmpehrhigrnhesthgvshhtthhorghsthdrtghomhdpnhgspghrtghp
    thhtohepvddupdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehmrhhiphgrrhguse
    hkvghrnhgvlhdrohhrghdprhgtphhtthhopeifvghnshestghsihgvrdhorhhgpdhrtghp
    thhtohepmhgrrghrthgvnhdrlhgrnhhkhhhorhhstheslhhinhhugidrihhnthgvlhdrtg
    homhdprhgtphhtthhopehtiihimhhmvghrmhgrnhhnsehsuhhsvgdruggvpdhrtghpthht
    oheprghirhhlihgvugesghhmrghilhdrtghomhdprhgtphhtthhopegurghnihgvlhesfh
    hffihllhdrtghhpdhrtghpthhtohepjhgvrhhnvghjrdhskhhrrggsvggtsehgmhgrihhl
    rdgtohhmpdhrtghpthhtohepshgrmhhuvghlsehshhholhhlrghnugdrohhrghdprhgtph
    htthhopehrohgshheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:3hn5ZlY4Zzhno6slFNs3atPZA3DXREjXo1xraaHTftFuhJVl7_I5Ag>
    <xmx:3hn5ZvYEHIA_iQhk-ZnGoSlq42sn5PZBdB4pTgeDEjwHGM473_ykcA>
    <xmx:3hn5ZhC9ESApJ2WgnEUyfpcfIwcPuKaVmWEdaVFJ2X2_ZxgKnSrHsw>
    <xmx:3hn5ZlZxxzQ4yHXed2xIzw4SeeJX6KcD2QHugLAN1V9OHQTHUjD9ww>
    <xmx:3hn5Zlxv8v5IACzDEjskaenxdoxhASY80johuaHtTTQGy30Pdka2u-Me>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 29 Sep 2024 05:11:52 -0400 (EDT)
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
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Ryan Walklin <ryan@testtoast.com>
Subject: [PATCH v5 05/26] drm: sun4i: de3: Add YUV formatter module
Date: Sun, 29 Sep 2024 22:04:37 +1300
Message-ID: <20240929091107.838023-6-ryan@testtoast.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20240929091107.838023-1-ryan@testtoast.com>
References: <20240929091107.838023-1-ryan@testtoast.com>
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
2.46.1

