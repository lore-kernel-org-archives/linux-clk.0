Received: from fout-b4-smtp.messagingengine.com (fout-b4-smtp.messagingengine.com [202.12.124.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A774019F117;
	Sun, 16 Feb 2025 18:38:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739731122; cv=none; b=S+8QCP3FyZ50f242jr1lXP8i+NS+3UkY8mk77hlYxI0QOXSN41lqC4F2xxNorCjU3TNq90Vp2+6zodpOGp7QvwfhjpsoP6t/6ZzmVcg/P9l9stl5K1tyeR1Xd9DZbGYuf2q/ExJ1R0teEgie+NLy1db0GkksMMdo3j9BEtdfweY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739731122; c=relaxed/simple;
	bh=vWIZTT+xKOnjjS1vDB/XncuJdONY4uX2gcXM+nAyZj8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LIMhQAfKhlzzdl45ZSCoIE2iq6HkfmQwqGyI0quVYw63xxc3ggMCnk6bNZXwzD4wWTnpsvcZGk9rWfAZmLZmAK+EfRYOMXFuHDYYUHj1lyZ3OwakjlvMV6YWSSSFlEabPXHXSxstiGEBxlS4plJozrHH95ug0jPKTT68mV+T+cI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com; spf=pass smtp.mailfrom=testtoast.com; dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b=ctIbIvJ/; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=HSkPc8Db; arc=none smtp.client-ip=202.12.124.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=testtoast.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b="ctIbIvJ/";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="HSkPc8Db"
Received: from phl-compute-08.internal (phl-compute-08.phl.internal [10.202.2.48])
	by mailfout.stl.internal (Postfix) with ESMTP id 119D011400B1;
	Sun, 16 Feb 2025 13:38:39 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-08.internal (MEProxy); Sun, 16 Feb 2025 13:38:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1739731118; x=
	1739817518; bh=aoEvA/CFJ1os4TjOsG26WNhs1piY3FD4LMZ7JtNG/qw=; b=c
	tIbIvJ/zPqHhahcxlgZ+1Xm0eku1/8wSA9wTJp5bVNewTvwArG6jAtUUKXs7ZVlE
	eRk2ExZSKub5tuFL4jD1bn/oS+vLTFc8Mh6VevhxeZ7MX/w/7GePLsC7OkSA8Gec
	oQ/O3yxK+5KfP4wBoMZ2JzdJi3tgHmDNWmZ0n+QenSjtHsPFXglBAABBJ6kwa9p2
	+5cOxtU16VZpcTabvSjKOQ/fCdGR2A57ShMdNPrK2tP7u4FD9JJ/hJbDXHYdyWYe
	A9yDCfphFZdzpAIMH4U601Wy8dcB3ST5C2ZhwHPjEwnG4i9qs9cnr66Esk+grV9u
	UJw7Priv8ZINY3SH7vRuQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1739731118; x=1739817518; bh=a
	oEvA/CFJ1os4TjOsG26WNhs1piY3FD4LMZ7JtNG/qw=; b=HSkPc8Db1pUxJa1CT
	leh8/xiww72z7WoxLDXGVoCgK/EjaBfukerO/OejCIlrm/v3nwjAqZ2eBeKQ90UG
	veCJayYZKbIQLH/OayQRBBOP+iR+w7ZDItj8x+9oRL6F0nJPCUKnK9LOhExeqBGx
	5BfeCX2L77/K8Pf/Xn44z34VIzbILmxQzDHj11f8EpvwbqsVR06BfDa3JqlehrZy
	xu1Rxf8EMzE3zeAgi/zwyjbmCvbrLBXUKVP2pbhHm+hYpUG5y+U0rc8erRWRHzfK
	gvLREVRbuBRGU8FKLu8uonYRZHldMn55UXXLTK6+XcUB70xSRnjCgukGEshcy1JC
	AyLQA==
X-ME-Sender: <xms:rjCyZ_aOwSINr6hdY8INhNMRKyXUEKzIWcAke9ZdMtf3E9diIpDwlw>
    <xme:rjCyZ-b-mBnjQQ9jkjeqsa2saWThsKbuzrN4y6i7l_EK71lqk4L-mb8u024pK_geG
    8yiLbF14-r0kqqTow>
X-ME-Received: <xmr:rjCyZx-Ej8KNCVE7Jx9ifjz6ZcGwJrtMGC7LBVPBgy5QUv3Bp6wWavIvU-kYRtQfyBS0_a-voTjx4GgRjX-PWsxB_qG7rJW3NKLUsIuRxgr9>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdehiedvtdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddt
    necuhfhrohhmpefthigrnhcuhggrlhhklhhinhcuoehrhigrnhesthgvshhtthhorghsth
    drtghomheqnecuggftrfgrthhtvghrnhepffehieffgedtgfffjeetveegfeekleeileek
    veeuteffteetudffveegieeiheetnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomheprhihrghnsehtvghsthhtohgrshhtrdgtohhmpdhnsggprhgt
    phhtthhopedvgedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepmhhrihhprghrug
    eskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepfigvnhhssegtshhivgdrohhrghdprhgt
    phhtthhopehmrggrrhhtvghnrdhlrghnkhhhohhrshhtsehlihhnuhigrdhinhhtvghlrd
    gtohhmpdhrtghpthhtohepthiiihhmmhgvrhhmrghnnhesshhushgvrdguvgdprhgtphht
    thhopegrihhrlhhivggusehgmhgrihhlrdgtohhmpdhrtghpthhtohepuggrnhhivghlse
    hffhiflhhlrdgthhdprhgtphhtthhopehjvghrnhgvjhdrshhkrhgrsggvtgesghhmrghi
    lhdrtghomhdprhgtphhtthhopehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgpdhrtg
    hpthhtoheprhhosghhsehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:rjCyZ1qHRrtXXgAdx6AAsI7wb1Od5XR8bP6l4jkwmbVex6Td6VdfNw>
    <xmx:rjCyZ6pB3inw7Mojypbijub7hPoTrL7ub3AdWFlEDhlbr4VtPoBk4g>
    <xmx:rjCyZ7RNP_gOxiMRiOkLanZfS910-NtwvRYKQlPxLLrUgJAj4n7OnA>
    <xmx:rjCyZypfUb8XgeP8pLOwK4nIGXBMO3MMbtqJsQbQyvDASBRjAEeeVQ>
    <xmx:rjCyZ8bhPU-1OU7sMseWkB5Sm-rUuk-_3fIe1veTIcKHrsRpzaZHtpxa>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 16 Feb 2025 13:38:32 -0500 (EST)
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
	Hironori KIKUCHI <kikuchan98@gmail.com>,
	Philippe Simons <simons.philippe@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Ryan Walklin <ryan@testtoast.com>
Subject: [PATCH v7 08/27] drm: sun4i: de3: add YUV support to the DE3 mixer
Date: Mon, 17 Feb 2025 07:36:08 +1300
Message-ID: <20250216183710.8443-9-ryan@testtoast.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250216183710.8443-3-ryan@testtoast.com>
References: <20250216183710.8443-3-ryan@testtoast.com>
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
encoding in the mixer configuration.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Signed-off-by: Ryan Walklin <ryan@testtoast.com>

---
Changelog v4..v5:
- Remove trailing whitespace

Changelog v5..v6:
- Move color format and encoding flags to mixer and add struct.
---
 drivers/gpu/drm/sun4i/sun8i_mixer.c | 54 +++++++++++++++++++++++++++--
 drivers/gpu/drm/sun4i/sun8i_mixer.h | 11 ++++++
 2 files changed, 62 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c b/drivers/gpu/drm/sun4i/sun8i_mixer.c
index a170f68708b1f..bc934186bfd6f 100644
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
+	if (mixer->color_model.format == MEDIA_BUS_FMT_RGB888_1X24)
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
+				 mode->vdisplay, mixer->color_model.format);
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
@@ -484,6 +527,11 @@ static int sun8i_mixer_bind(struct device *dev, struct device *master,
 	if (!mixer->cfg)
 		return -EINVAL;
 
+	/* default output format, supported by all mixers */
+	mixer->color_model.format = MEDIA_BUS_FMT_RGB888_1X24;
+	/* default color encoding, ignored with RGB I/O */
+	mixer->color_model.encoding = DRM_COLOR_YCBCR_BT601;
+
 	regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(regs))
 		return PTR_ERR(regs);
diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.h b/drivers/gpu/drm/sun4i/sun8i_mixer.h
index 8417b8fef2e1f..5f465a974fbdf 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.h
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.h
@@ -9,6 +9,7 @@
 #include <linux/clk.h>
 #include <linux/regmap.h>
 #include <linux/reset.h>
+#include <drm/drm_color_mgmt.h>
 #include <drm/drm_plane.h>
 
 #include "sunxi_engine.h"
@@ -177,6 +178,11 @@ struct sun8i_mixer_cfg {
 	unsigned int	scanline_yuv;
 };
 
+struct sun8i_color_model {
+	u32			format;
+	enum drm_color_encoding	encoding;
+};
+
 struct sun8i_mixer {
 	struct sunxi_engine		engine;
 
@@ -186,6 +192,11 @@ struct sun8i_mixer {
 
 	struct clk			*bus_clk;
 	struct clk			*mod_clk;
+
+	struct regmap			*top_regs;
+	struct regmap			*disp_regs;
+
+	struct sun8i_color_model	color_model;
 };
 
 enum {
-- 
2.48.1

