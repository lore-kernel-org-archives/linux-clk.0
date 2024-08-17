Received: from fout6-smtp.messagingengine.com (fout6-smtp.messagingengine.com [103.168.172.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 516C4143886;
	Sat, 17 Aug 2024 23:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723935998; cv=none; b=ORB92NSIA3YGtgAO7TZg+4ms4CD/3MrX9auIBR58gg0iyyOAhRQ9NHQvnAPNaP/bJcSjlpcKxMtcTKpGz+xwYGZkafwW3fVLljRp0JTjxVsDsA/OHwcwn+91LwT+5Rr+RcsIg9LnYEcOYq9gV3GXNDtXlSpis1hqrp3q0dlA450=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723935998; c=relaxed/simple;
	bh=JaAilNQJPK8ku1+BVGNvGTFdhq9Bo6qLXWEjJiZcCW0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KPoecUCS2EZTfvpzRKsFXq42Jkr7K+CMMTaJphFfIH+e7bxTS8ubIGETyp5PTAIxrugll5758UVFPTEzuLvdpkpZgtsQwS4uR2bHaHwEAyxDXncmX4jaXaB4R3VKxwvdplcGNT7cl03jS1lks+Mgkg7SSdRJAeadOTP6WNHhaEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com; spf=pass smtp.mailfrom=testtoast.com; dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b=umU7+wew; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=fJx0l1OR; arc=none smtp.client-ip=103.168.172.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=testtoast.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b="umU7+wew";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="fJx0l1OR"
Received: from phl-compute-04.internal (phl-compute-04.nyi.internal [10.202.2.44])
	by mailfout.nyi.internal (Postfix) with ESMTP id A8D83138D420;
	Sat, 17 Aug 2024 19:06:36 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Sat, 17 Aug 2024 19:06:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1723935996; x=
	1724022396; bh=aeqY0UvAomf+iMZUUhTvLzVEqiQJ1UL5KUNXZUwtMPU=; b=u
	mU7+wewX4XGY4aUxqtUOf3kMYk42t+NzTdLAcJKaHItk3TbMEaTIYeP/kY4xDCGa
	JDV1+6gyDQ98JSAa99bl5cRYm+odQj2LFXXOKKl3TH7NEnejVd7qSUjtKrDAg1mN
	cG2rz66udt4ls1U2m3324+Wzaq/v7eCZSmn6iVHLnDb0t3imR3otrWD7blZ+mRWK
	kIi4lemhdiOEoEPUeZ323oj1sidIhVnoABnsD/E0njHbSWFP57NtReUh50QMkhrs
	ZFA3AKQA7VakwZ0zeBsndcT1imUGQwTHuacfssjSp56vOrHFdRXKAr+Z9YtaPRbX
	23HC5i3P5Zu0JmlJv6UHQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1723935996; x=
	1724022396; bh=aeqY0UvAomf+iMZUUhTvLzVEqiQJ1UL5KUNXZUwtMPU=; b=f
	Jx0l1ORNagWiDzbHdGkjfxFPSUkTcp+SGtsW55BQHEB6nAgGTq5H/MfPsvuGweR6
	0grQBCfPtYh1qtVpoHi8ehqXZ98C5t35SB2+NzePydSyMtUT/o+rlZBcxJz3qFK/
	l3Q6u/NYCT/r0hSQLhUzMRuHD0m/sRS3NYhRWM0Dmpi5kQmdJBLuDwI+tK1t5Ns8
	9cL/xHdeyd5FR3rLluBt2fX3fqCkVImlWEzWtMQb/CZ4/BgdMSVB/N4fUABk79hn
	ZwFwhcZ1QV29PDQOAbZc9ui0luiy3zK7OWhgCiiIsuTi9NisYbbpkKNfyvszGJ+Q
	i8SKfVP1pBwaxuFXjKNaQ==
X-ME-Sender: <xms:_CzBZpmX_Quj7g4ag7QwgBjjHNKsJ_CIKC8mIeYgjlk7V-sQLbu2RA>
    <xme:_CzBZk0eL6ipNBnoR7gx6tYtj3ywV06gTB3-HI2vcp2evG7cXO5kCjjQEbs9_q79s
    -hbEXcOxnEXBn6mUQ>
X-ME-Received: <xmr:_CzBZvpspZ0xd0ntds_JNftSz1EoMy9NuBxV5eWe2rCrdvetA-OdX-PcdjeiLNd3CbYWRuwOQzgMYSQZHBmrCUGAZuUOaVA4HfYSwcvTx_680vmC>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudduuddgudejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttden
    ucfhrhhomheptfihrghnucghrghlkhhlihhnuceorhihrghnsehtvghsthhtohgrshhtrd
    gtohhmqeenucggtffrrghtthgvrhhnpeffheeiffegtdfgffejteevgeefkeelieelkeev
    ueetffetteduffevgeeiieehteenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmh
    epmhgrihhlfhhrohhmpehrhigrnhesthgvshhtthhorghsthdrtghomhdpnhgspghrtghp
    thhtohepvddvpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehmrhhiphgrrhguse
    hkvghrnhgvlhdrohhrghdprhgtphhtthhopeifvghnshestghsihgvrdhorhhgpdhrtghp
    thhtohepmhgrrghrthgvnhdrlhgrnhhkhhhorhhstheslhhinhhugidrihhnthgvlhdrtg
    homhdprhgtphhtthhopehtiihimhhmvghrmhgrnhhnsehsuhhsvgdruggvpdhrtghpthht
    oheprghirhhlihgvugesghhmrghilhdrtghomhdprhgtphhtthhopegurghnihgvlhesfh
    hffihllhdrtghhpdhrtghpthhtohepjhgvrhhnvghjrdhskhhrrggsvggtsehgmhgrihhl
    rdgtohhmpdhrtghpthhtohepshgrmhhuvghlsehshhholhhlrghnugdrohhrghdprhgtph
    htthhopehrohgshheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:_CzBZplus0bjFuyP1dYZoBLHI_vfFTjr55T2EcvJUbFQbAtTbndudg>
    <xmx:_CzBZn1REy-a3rTeJ39xh8aCxd4DTpUd4XNOs2rsaAZIk5BfwJz7aQ>
    <xmx:_CzBZouckmzkTD9s_siFDggUmY23O7m5fVx6sl589LyQgWN40DFPXw>
    <xmx:_CzBZrUa0z94SFkjOMMmcwZx-lpuQsufJlem-Vd_XuagFedJBBwpnw>
    <xmx:_CzBZllyO3mtHuJnNzRgO73CprozXLEZ6pnNBeGIsua0xrbCTPmndNOj>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 17 Aug 2024 19:06:29 -0400 (EDT)
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
Subject: [PATCH v3 08/26] drm: sun4i: de3: add YUV support to the DE3 mixer
Date: Sun, 18 Aug 2024 10:45:55 +1200
Message-ID: <20240817230503.158889-9-ryan@testtoast.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240817230503.158889-1-ryan@testtoast.com>
References: <20240817230503.158889-1-ryan@testtoast.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jernej Skrabec <jernej.skrabec@gmail.com>

The mixer in the DE3 display engine supports YUV 8 and 10 bit
formats in addition to 8-bit RGB. Add the required register
configuration and format enumeration callback functions to the mixer,
and store the in-use output format (defaulting to RGB) and color
encoding in engine variables.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Signed-off-by: Ryan Walklin <ryan@testtoast.com>
---
 drivers/gpu/drm/sun4i/sun8i_mixer.c  | 55 ++++++++++++++++++++++++++--
 drivers/gpu/drm/sun4i/sunxi_engine.h |  5 +++
 2 files changed, 56 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c b/drivers/gpu/drm/sun4i/sun8i_mixer.c
index 252827715de1d..af7c8f786eb83 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
@@ -23,7 +23,10 @@
 #include <drm/drm_gem_dma_helper.h>
 #include <drm/drm_probe_helper.h>
 
+#include <uapi/linux/media-bus-format.h>
+
 #include "sun4i_drv.h"
+#include "sun50i_fmt.h"
 #include "sun8i_mixer.h"
 #include "sun8i_ui_layer.h"
 #include "sun8i_vi_layer.h"
@@ -390,12 +393,52 @@ static void sun8i_mixer_mode_set(struct sunxi_engine *engine,
 
 	DRM_DEBUG_DRIVER("Switching display mixer interlaced mode %s\n",
 			 interlaced ? "on" : "off");
+
+	if (engine->format == MEDIA_BUS_FMT_RGB888_1X24)
+		val = SUN8I_MIXER_BLEND_COLOR_BLACK;
+	else
+		val = 0xff108080;
+
+	regmap_write(mixer->engine.regs,
+		     SUN8I_MIXER_BLEND_BKCOLOR(bld_base), val);
+	regmap_write(mixer->engine.regs,
+		     SUN8I_MIXER_BLEND_ATTR_FCOLOR(bld_base, 0), val);
+
+	if (mixer->cfg->has_formatter)
+		sun50i_fmt_setup(mixer, mode->hdisplay,
+				 mode->vdisplay, mixer->engine.format);
+}
+
+static u32 *sun8i_mixer_get_supported_fmts(struct sunxi_engine *engine, u32 *num)
+{
+	struct sun8i_mixer *mixer = engine_to_sun8i_mixer(engine);
+	u32 *formats, count;
+
+	count = 0;
+
+	formats = kcalloc(5, sizeof(*formats), GFP_KERNEL);
+	if (!formats)
+		return NULL;
+
+	if (mixer->cfg->has_formatter) {
+		formats[count++] = MEDIA_BUS_FMT_UYYVYY10_0_5X30;
+		formats[count++] = MEDIA_BUS_FMT_YUV8_1X24;
+		formats[count++] = MEDIA_BUS_FMT_UYVY8_1X16;
+		formats[count++] = MEDIA_BUS_FMT_UYYVYY8_0_5X24;
+	}
+
+	formats[count++] = MEDIA_BUS_FMT_RGB888_1X24;
+
+	*num = count;
+
+	return formats;
 }
 
 static const struct sunxi_engine_ops sun8i_engine_ops = {
-	.commit		= sun8i_mixer_commit,
-	.layers_init	= sun8i_layers_init,
-	.mode_set	= sun8i_mixer_mode_set,
+	.commit			= sun8i_mixer_commit,
+	.layers_init		= sun8i_layers_init,
+	.mode_set		= sun8i_mixer_mode_set,
+	.get_supported_fmts	= sun8i_mixer_get_supported_fmts,
 };
 
 static const struct regmap_config sun8i_mixer_regmap_config = {
@@ -456,7 +499,11 @@ static int sun8i_mixer_bind(struct device *dev, struct device *master,
 	dev_set_drvdata(dev, mixer);
 	mixer->engine.ops = &sun8i_engine_ops;
 	mixer->engine.node = dev->of_node;
-
+	/* default output format, supported by all mixers */
+	mixer->engine.format = MEDIA_BUS_FMT_RGB888_1X24;
+	/* default color encoding, ignored with RGB I/O */
+	mixer->engine.encoding = DRM_COLOR_YCBCR_BT601;
+	
 	if (of_property_present(dev->of_node, "iommus")) {
 		/*
 		 * This assume we have the same DMA constraints for
diff --git a/drivers/gpu/drm/sun4i/sunxi_engine.h b/drivers/gpu/drm/sun4i/sunxi_engine.h
index c48cbc1aceb80..ffafc29b3a0c3 100644
--- a/drivers/gpu/drm/sun4i/sunxi_engine.h
+++ b/drivers/gpu/drm/sun4i/sunxi_engine.h
@@ -6,6 +6,8 @@
 #ifndef _SUNXI_ENGINE_H_
 #define _SUNXI_ENGINE_H_
 
+#include <drm/drm_color_mgmt.h>
+
 struct drm_plane;
 struct drm_crtc;
 struct drm_device;
@@ -151,6 +153,9 @@ struct sunxi_engine {
 
 	int id;
 
+	u32				format;
+	enum drm_color_encoding		encoding;
+
 	/* Engine list management */
 	struct list_head		list;
 };
-- 
2.46.0

