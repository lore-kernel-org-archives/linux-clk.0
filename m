Received: from fout-b8-smtp.messagingengine.com (fout-b8-smtp.messagingengine.com [202.12.124.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BF40278160;
	Wed, 28 May 2025 09:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748424335; cv=none; b=uq3F0kPH1kCAZuTAtmwSpaCjtj8KgqQ1w5QvC35kL5SqRJkujj9XDbztFdiGRZGxBV07eqBd77mng/3b5dEP4u9XhtGDrDzl8oIv2PQm7KAHwzb+D5zf4arDCEL1gU/z+0oo6JXFVYi45AW6s+EaDmoOsndag6O+4+ImW8o8Vqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748424335; c=relaxed/simple;
	bh=xTBWctMJhenrDbiPn3J6So8d2LJqEW/SGehvBZpRR14=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PHN8eKsPQ9kj7zBKhLeN4RQ+MOGmt/W9GtBVtALMPwMOHT38GopZZFt0CE+/t5PQcZZaFdXBet2z/W6d7bWGv2lAMDSkyuzBYESvFQRwsnaTxtG68wJMEe3M/dDA8O0ZcA0NKSP/K3t5TKOtUKmH1u9ZDeKYrwZCTB3hQ7jR+bs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com; spf=pass smtp.mailfrom=testtoast.com; dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b=bRRFRfXZ; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=VF82C+oO; arc=none smtp.client-ip=202.12.124.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=testtoast.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b="bRRFRfXZ";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="VF82C+oO"
Received: from phl-compute-01.internal (phl-compute-01.phl.internal [10.202.2.41])
	by mailfout.stl.internal (Postfix) with ESMTP id 1D11A1140180;
	Wed, 28 May 2025 05:25:32 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Wed, 28 May 2025 05:25:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1748424331; x=
	1748510731; bh=QfMaJ0YDIimRZDopunzEZyVGzXDmn/F5X+P3lLqrGAw=; b=b
	RRFRfXZWNcloCNwpucvyfvGkg/cjjEhlseHcAYht5J6H7PU/AyE/FfLpElDhZbiz
	6yEg0UCl1k52ivKXOfW35ZuMEBpRdCIPfCBBqO9LpsjXTJL3IU54VnuJnrHtKABH
	0Xl6A6VwNrwv6oqsXejNuu1HN4bvJfEx/KK5ZVSO0BFrP4P3BEhfF9CZmfSWr0V+
	mWo8iEn/dBPv9FZJEjfvEeXqgLhADcTf9NqCEkbsnK52BIQjZmIapBO6y0hWDstC
	pmnejQBUt6ZjvjjcdAHhC+AKa3J+a+7OCWu9/BZq6whFzVnu7ifRFFcIBPu2jdd0
	Mthc4bnnbE2sCCgVH/MkA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1748424331; x=1748510731; bh=Q
	fMaJ0YDIimRZDopunzEZyVGzXDmn/F5X+P3lLqrGAw=; b=VF82C+oOhnQZ4ZmaK
	gBQVWjS15hLQw3fFtKst23XEPoHFZwbgd4/3QJ1x6FrxiYhk4QeWOMSn2Igp0TWt
	KN00/lUbKr+OjgZIbZfNi+hadXNAelMvaN6t3ljZ+3saU3WyCiZBKgBWAkxkN9WD
	v2qfpS7kY89b1dqw/9twLzOuIKh/5wG+0xG/fTO9FSIh0dKHA6pBe6Ciq7ad+xV5
	/aOwUvho1ssxNBjrOvH73csw7L4L3ZVWPCQsIs/ZZqaVbbzztf49ma7GoDEMPHBY
	+/BpOSOZ9UXL7cgoL6cX9oyyt8195TySHCKi648bZqNwln4NEZ25BzadMR7kAIYq
	mNQTQ==
X-ME-Sender: <xms:i9Y2aCMYLxXcPjBvMAmtoldpvstKyH4HIFS61e20xaiOKNZgKeHWqw>
    <xme:i9Y2aA_V9jZuJbk7YTmgvDw-1hLfRdvrlr_olMyoglBhXEwvSlo8pAxvNiqXimo6O
    xLIxBvTOVv4KloV3w>
X-ME-Received: <xmr:i9Y2aJSJuI02tQFQ6jSDrkYD-VOegnUlwNAUwgFeDYZe0qAm3vg1y9xQNbhYLFuKFZU7SxMhqP399KaZAGs7dCCtyOns_6GJUqWt3DPLaWh0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgddvvdekleculddtuddrgeefvddrtd
    dtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggft
    fghnshhusghstghrihgsvgdpuffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftd
    dtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffo
    jghfggfgsedtkeertdertddtnecuhfhrohhmpefthigrnhcuhggrlhhklhhinhcuoehrhi
    grnhesthgvshhtthhorghsthdrtghomheqnecuggftrfgrthhtvghrnhepffehieffgedt
    gfffjeetveegfeekleeileekveeuteffteetudffveegieeiheetnecuvehluhhsthgvrh
    fuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprhihrghnsehtvghsthhtohgr
    shhtrdgtohhmpdhnsggprhgtphhtthhopedvgedpmhhouggvpehsmhhtphhouhhtpdhrtg
    hpthhtohepmhhrihhprghrugeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepfigvnhhs
    segtshhivgdrohhrghdprhgtphhtthhopehmrggrrhhtvghnrdhlrghnkhhhohhrshhtse
    hlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohepthiiihhmmhgvrhhmrghnnhes
    shhushgvrdguvgdprhgtphhtthhopegrihhrlhhivggusehgmhgrihhlrdgtohhmpdhrtg
    hpthhtohepuggrnhhivghlsehffhiflhhlrdgthhdprhgtphhtthhopehjvghrnhgvjhdr
    shhkrhgrsggvtgesghhmrghilhdrtghomhdprhgtphhtthhopehsrghmuhgvlhesshhhoh
    hllhgrnhgurdhorhhgpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:i9Y2aCv4gJQU1l5QWpdG_WFTkPtDeb2AmfLqRIpw5xAWXKPfC8b3UQ>
    <xmx:i9Y2aKcQyGeQmvKFK1hzAo0Zz142UdDYYAcBa2vKjjI4OrU6fL0Fow>
    <xmx:i9Y2aG29_5t3P2XruLzMvkRKwK8FTs5v8sZWuYjAE-4Zx61OXLbjfQ>
    <xmx:i9Y2aO8mLckxHxy5WbtWeds6rDAyXy0BC1GpY3e_h__MihI_xXT88g>
    <xmx:i9Y2aFkQ-s1XpuR9As5wJmP_t78I7IdQOsi9MFpBMP8GA7NG1xy1Dgu1>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 28 May 2025 05:25:25 -0400 (EDT)
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
Subject: [PATCH v12 4/8] drm: sun4i: de2/de3: use generic register reference function for layer configuration
Date: Wed, 28 May 2025 21:22:09 +1200
Message-ID: <20250528092431.28825-5-ryan@testtoast.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250528092431.28825-1-ryan@testtoast.com>
References: <20250528092431.28825-1-ryan@testtoast.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jernej Skrabec <jernej.skrabec@gmail.com>

Use the new blender register lookup function where required in the layer
commit and update code.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Signed-off-by: Ryan Walklin <ryan@testtoast.com>
Acked-by: Maxime Ripard <mripard@kernel.org>
Reviewed-by: Chen-Yu Tsai <wens@csie.org>

---
Changelog v2..v3:
- Refactor for 6.11 layer init/modesetting changes
---
 drivers/gpu/drm/sun4i/sun8i_mixer.c    | 5 +++--
 drivers/gpu/drm/sun4i/sun8i_ui_layer.c | 7 +++++--
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c | 6 ++++--
 3 files changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c b/drivers/gpu/drm/sun4i/sun8i_mixer.c
index fd2650153492..86e5211a843b 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
@@ -274,6 +274,7 @@ static void sun8i_mixer_commit(struct sunxi_engine *engine,
 {
 	struct sun8i_mixer *mixer = engine_to_sun8i_mixer(engine);
 	u32 bld_base = sun8i_blender_base(mixer);
+	struct regmap *bld_regs = sun8i_blender_regmap(mixer);
 	struct drm_plane_state *plane_state;
 	struct drm_plane *plane;
 	u32 route = 0, pipe_en = 0;
@@ -313,8 +314,8 @@ static void sun8i_mixer_commit(struct sunxi_engine *engine,
 		pipe_en |= SUN8I_MIXER_BLEND_PIPE_CTL_EN(zpos);
 	}
 
-	regmap_write(mixer->engine.regs, SUN8I_MIXER_BLEND_ROUTE(bld_base), route);
-	regmap_write(mixer->engine.regs, SUN8I_MIXER_BLEND_PIPE_CTL(bld_base),
+	regmap_write(bld_regs, SUN8I_MIXER_BLEND_ROUTE(bld_base), route);
+	regmap_write(bld_regs, SUN8I_MIXER_BLEND_PIPE_CTL(bld_base),
 		     pipe_en | SUN8I_MIXER_BLEND_PIPE_CTL_FC_EN(0));
 
 	regmap_write(engine->regs, SUN8I_MIXER_GLOBAL_DBUFF,
diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
index b90e5edef4e8..7a21d32ff1e4 100644
--- a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
@@ -23,6 +23,7 @@
 #include "sun8i_mixer.h"
 #include "sun8i_ui_layer.h"
 #include "sun8i_ui_scaler.h"
+#include "sun8i_vi_scaler.h"
 
 static void sun8i_ui_layer_update_alpha(struct sun8i_mixer *mixer, int channel,
 					int overlay, struct drm_plane *plane)
@@ -51,6 +52,7 @@ static int sun8i_ui_layer_update_coord(struct sun8i_mixer *mixer, int channel,
 {
 	struct drm_plane_state *state = plane->state;
 	u32 src_w, src_h, dst_w, dst_h;
+	struct regmap *bld_regs;
 	u32 bld_base, ch_base;
 	u32 outsize, insize;
 	u32 hphase, vphase;
@@ -59,6 +61,7 @@ static int sun8i_ui_layer_update_coord(struct sun8i_mixer *mixer, int channel,
 			 channel, overlay);
 
 	bld_base = sun8i_blender_base(mixer);
+	bld_regs = sun8i_blender_regmap(mixer);
 	ch_base = sun8i_channel_base(mixer, channel);
 
 	src_w = drm_rect_width(&state->src) >> 16;
@@ -103,10 +106,10 @@ static int sun8i_ui_layer_update_coord(struct sun8i_mixer *mixer, int channel,
 	DRM_DEBUG_DRIVER("Layer destination coordinates X: %d Y: %d\n",
 			 state->dst.x1, state->dst.y1);
 	DRM_DEBUG_DRIVER("Layer destination size W: %d H: %d\n", dst_w, dst_h);
-	regmap_write(mixer->engine.regs,
+	regmap_write(bld_regs,
 		     SUN8I_MIXER_BLEND_ATTR_COORD(bld_base, zpos),
 		     SUN8I_MIXER_COORD(state->dst.x1, state->dst.y1));
-	regmap_write(mixer->engine.regs,
+	regmap_write(bld_regs,
 		     SUN8I_MIXER_BLEND_ATTR_INSIZE(bld_base, zpos),
 		     outsize);
 
diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
index 112f0a37cf4a..a09ee4097537 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
@@ -55,6 +55,7 @@ static int sun8i_vi_layer_update_coord(struct sun8i_mixer *mixer, int channel,
 	struct drm_plane_state *state = plane->state;
 	const struct drm_format_info *format = state->fb->format;
 	u32 src_w, src_h, dst_w, dst_h;
+	struct regmap *bld_regs;
 	u32 bld_base, ch_base;
 	u32 outsize, insize;
 	u32 hphase, vphase;
@@ -66,6 +67,7 @@ static int sun8i_vi_layer_update_coord(struct sun8i_mixer *mixer, int channel,
 			 channel, overlay);
 
 	bld_base = sun8i_blender_base(mixer);
+	bld_regs = sun8i_blender_regmap(mixer);
 	ch_base = sun8i_channel_base(mixer, channel);
 
 	src_w = drm_rect_width(&state->src) >> 16;
@@ -183,10 +185,10 @@ static int sun8i_vi_layer_update_coord(struct sun8i_mixer *mixer, int channel,
 	DRM_DEBUG_DRIVER("Layer destination coordinates X: %d Y: %d\n",
 			 state->dst.x1, state->dst.y1);
 	DRM_DEBUG_DRIVER("Layer destination size W: %d H: %d\n", dst_w, dst_h);
-	regmap_write(mixer->engine.regs,
+	regmap_write(bld_regs,
 		     SUN8I_MIXER_BLEND_ATTR_COORD(bld_base, zpos),
 		     SUN8I_MIXER_COORD(state->dst.x1, state->dst.y1));
-	regmap_write(mixer->engine.regs,
+	regmap_write(bld_regs,
 		     SUN8I_MIXER_BLEND_ATTR_INSIZE(bld_base, zpos),
 		     outsize);
 
-- 
2.49.0

