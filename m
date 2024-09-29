Received: from fhigh-a2-smtp.messagingengine.com (fhigh-a2-smtp.messagingengine.com [103.168.172.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79B82142904;
	Sun, 29 Sep 2024 09:13:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727601184; cv=none; b=Z4hdgnjD0z0J39xyX2Ia84lHUqNDdD8H8aFrfotGzryccUXYZ5/p7hHZB4+p119hVawYoOANOjv+pNEzySx4rOEEjgAWz92wLryx3mWkIux2HY31r7UBGnIQufc/9Q3MkIB8alyhFogU5/Qwld2tXYIFfm2vyJl9glyx81eZNHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727601184; c=relaxed/simple;
	bh=/pQ1otE9Hh/r7ymgq2pVTuYe/fGt1LlOyEcX1ANRjJo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tgazjwHg2y9PyGcAoKoaBF3ebLEjaE88Cwi+16oQSkDcN89y6mspsd8meiGVfDA3ukxw3/cFr9yrErk2kubk9QWcJbqZXtj67ezYe6Tcn8GE3ir+yuNpBzMTadINHMptGBogc+IMCr5JUK+O0CkHadpLhA6dkHRHBt+Of0SPrek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com; spf=pass smtp.mailfrom=testtoast.com; dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b=WJmozB18; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=GheKDpgE; arc=none smtp.client-ip=103.168.172.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=testtoast.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b="WJmozB18";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="GheKDpgE"
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfhigh.phl.internal (Postfix) with ESMTP id D7C0B11401FA;
	Sun, 29 Sep 2024 05:13:01 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-10.internal (MEProxy); Sun, 29 Sep 2024 05:13:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1727601181; x=
	1727687581; bh=nV1BScUrdzGA3a/wlIvGzF584kt9HToFlKVAV1oi63c=; b=W
	JmozB18swMdIpxi2PUVUc0ilaAZriprERvz4WjZ3GGVshDOcHvUSQdX6ZWVqMhXw
	vzQFiGLBJznXbLbf13wqFcBjm/0Z89s6Qb+3Dqm6ISZuSuG0pM/Jihl81BFoWht1
	0UqQDGF/8FhaSrvEGlr1ltLJaGf7VUVSbZR1F7D/uMyqw9zSH03nWWWPzI3Lkas0
	fSZTbatn6TU3IhYP8EVb4dl32DE0TUGQr1r7BL3ZHuSc7dTc5tETFn2LvR9rhdU5
	82jsbjIgd8t7mBjLrXjLnFZaxVArVNRMP9SrY/wbXgSu28WNiM98V/EcoXZZKhPw
	gXpsJOk9Bn3bWxWm037WA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1727601181; x=
	1727687581; bh=nV1BScUrdzGA3a/wlIvGzF584kt9HToFlKVAV1oi63c=; b=G
	heKDpgEfrcG5Snqq/ZESxv1ENmbFcJf9bbLkR44J41m6wHV0b9QXFEfBcW9I4QrG
	TS3XN7Fn0qgjYQArv30xr+deifBkKuIgaih7UioUKMXSkgUAg14ktrYoJ5J8isL0
	lriTN7Ew0zFYN51ast3PxwRpk2ZV2oWrTvcN2PSEhyd+sPmQFUjuMbbAICYRLRDT
	3cYQXHI6upCfm8brDdB/EFizDYaRksWFnnOPJAxvn+zwEdOzMvyuhNrxv2ryt/vs
	iICf29M2BtGTN3Z3e0x0e/2JVAfMiFuGhXatSSUxhHt2g0bCJV4IAR6JHMie224+
	Yx62yUn+Qj+cpO0uh0grA==
X-ME-Sender: <xms:HRr5Zr1OG7cfiFtSDuwV3BdHUsEQn_19s_B0uAPK4yJb4EX-T01jCg>
    <xme:HRr5ZqFwkENuHV-d1tSoUsXRzB49NDjZQEh4DsT6elRFZCB1DVLWpwsi43ewdlGeQ
    j85BaalWCmD4BhBlg>
X-ME-Received: <xmr:HRr5Zr7yfPMUHPk0gz03kolsGA55SQmTlg9roy93TsbMDgW5IIX8WUM35pnc0vKF6TT6HZfvcej2J2_yhWx4tSAVq4_-Sss2gPv5Ak__vkYFF1kf>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvddufedgudegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttden
    ucfhrhhomheptfihrghnucghrghlkhhlihhnuceorhihrghnsehtvghsthhtohgrshhtrd
    gtohhmqeenucggtffrrghtthgvrhhnpeffheeiffegtdfgffejteevgeefkeelieelkeev
    ueetffetteduffevgeeiieehteenucevlhhushhtvghrufhiiigvpeegnecurfgrrhgrmh
    epmhgrihhlfhhrohhmpehrhigrnhesthgvshhtthhorghsthdrtghomhdpnhgspghrtghp
    thhtohepvddupdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehmrhhiphgrrhguse
    hkvghrnhgvlhdrohhrghdprhgtphhtthhopeifvghnshestghsihgvrdhorhhgpdhrtghp
    thhtohepmhgrrghrthgvnhdrlhgrnhhkhhhorhhstheslhhinhhugidrihhnthgvlhdrtg
    homhdprhgtphhtthhopehtiihimhhmvghrmhgrnhhnsehsuhhsvgdruggvpdhrtghpthht
    oheprghirhhlihgvugesghhmrghilhdrtghomhdprhgtphhtthhopegurghnihgvlhesfh
    hffihllhdrtghhpdhrtghpthhtohepjhgvrhhnvghjrdhskhhrrggsvggtsehgmhgrihhl
    rdgtohhmpdhrtghpthhtohepshgrmhhuvghlsehshhholhhlrghnugdrohhrghdprhgtph
    htthhopehrohgshheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:HRr5Zg17Vb5eTVxb1JQb-PmGpf9h0qJiHgqM8TMRzEGcQ2ToEDIr5A>
    <xmx:HRr5ZuHWMsnA9eGgRc7fZBql681bVQt76ljeGU4s0EjZbthVgQEIbg>
    <xmx:HRr5Zh9ABg4l-9-GIyDbDMxJv5qFF642ZOcFD9ckMmubGQFL3emYDg>
    <xmx:HRr5Zrm4dge2SHGJjjw_LhJDKXBkjSnMbQMS08-qH0IhO_M_CYfd5w>
    <xmx:HRr5ZiM0vWPZeDeu4Qp_lqujUJkvsw3g3hivGfk53cPtWI5q3B_0wpgf>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 29 Sep 2024 05:12:55 -0400 (EDT)
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
Subject: [PATCH v5 15/26] drm: sun4i: vi_scaler refactor vi_scaler enablement
Date: Sun, 29 Sep 2024 22:04:47 +1300
Message-ID: <20240929091107.838023-16-ryan@testtoast.com>
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

If the video scaler is required, then it is obligatory to set the
relevant register to enable it, so move this to the
sun8i_vi_scaler_setup() function.

This simplifies the alternate case (scaler not required) so replace the
vi_scaler_enable() function with a vi_scaler_disable() function.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Signed-off-by: Ryan Walklin <ryan@testtoast.com>
---
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c  |  3 +--
 drivers/gpu/drm/sun4i/sun8i_vi_scaler.c | 21 +++++++++++----------
 drivers/gpu/drm/sun4i/sun8i_vi_scaler.h |  2 +-
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
index 4647e9bcccaa7..e348fd0a3d81c 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
@@ -156,10 +156,9 @@ static int sun8i_vi_layer_update_coord(struct sun8i_mixer *mixer, int channel,
 		sun8i_vi_scaler_setup(mixer, channel, src_w, src_h, dst_w,
 				      dst_h, hscale, vscale, hphase, vphase,
 				      format);
-		sun8i_vi_scaler_enable(mixer, channel, true);
 	} else {
 		DRM_DEBUG_DRIVER("HW scaling is not needed\n");
-		sun8i_vi_scaler_enable(mixer, channel, false);
+		sun8i_vi_scaler_disable(mixer, channel);
 	}
 
 	regmap_write(mixer->engine.regs,
diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_scaler.c b/drivers/gpu/drm/sun4i/sun8i_vi_scaler.c
index aa346c3beb303..e7242301b312c 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_scaler.c
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_scaler.c
@@ -933,20 +933,13 @@ static void sun8i_vi_scaler_set_coeff_ui(struct regmap *map, u32 base,
 			  &table[offset], SUN8I_VI_SCALER_COEFF_COUNT);
 }
 
-void sun8i_vi_scaler_enable(struct sun8i_mixer *mixer, int layer, bool enable)
+void sun8i_vi_scaler_disable(struct sun8i_mixer *mixer, int layer)
 {
-	u32 val, base;
+	u32 base;
 
 	base = sun8i_vi_scaler_base(mixer, layer);
 
-	if (enable)
-		val = SUN8I_SCALER_VSU_CTRL_EN |
-		      SUN8I_SCALER_VSU_CTRL_COEFF_RDY;
-	else
-		val = 0;
-
-	regmap_write(mixer->engine.regs,
-		     SUN8I_SCALER_VSU_CTRL(base), val);
+	regmap_write(mixer->engine.regs, SUN8I_SCALER_VSU_CTRL(base), 0);
 }
 
 void sun8i_vi_scaler_setup(struct sun8i_mixer *mixer, int layer,
@@ -982,6 +975,9 @@ void sun8i_vi_scaler_setup(struct sun8i_mixer *mixer, int layer,
 		cvphase = vphase;
 	}
 
+	regmap_write(mixer->engine.regs, SUN8I_SCALER_VSU_CTRL(base),
+		     SUN8I_SCALER_VSU_CTRL_EN);
+
 	if (mixer->cfg->de_type >= sun8i_mixer_de3) {
 		u32 val;
 
@@ -1027,4 +1023,9 @@ void sun8i_vi_scaler_setup(struct sun8i_mixer *mixer, int layer,
 	else
 		sun8i_vi_scaler_set_coeff_ui(mixer->engine.regs, base,
 					     hscale, vscale, format);
+
+	if (mixer->cfg->de_type <= sun8i_mixer_de3)
+		regmap_write(mixer->engine.regs, SUN8I_SCALER_VSU_CTRL(base),
+			     SUN8I_SCALER_VSU_CTRL_EN |
+			     SUN8I_SCALER_VSU_CTRL_COEFF_RDY);
 }
diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_scaler.h b/drivers/gpu/drm/sun4i/sun8i_vi_scaler.h
index 68f6593b369ab..e801bc7a4189e 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_scaler.h
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_scaler.h
@@ -69,7 +69,7 @@
 #define SUN50I_SCALER_VSU_ANGLE_SHIFT(x)		(((x) << 16) & 0xF)
 #define SUN50I_SCALER_VSU_ANGLE_OFFSET(x)		((x) & 0xFF)
 
-void sun8i_vi_scaler_enable(struct sun8i_mixer *mixer, int layer, bool enable);
+void sun8i_vi_scaler_disable(struct sun8i_mixer *mixer, int layer);
 void sun8i_vi_scaler_setup(struct sun8i_mixer *mixer, int layer,
 			   u32 src_w, u32 src_h, u32 dst_w, u32 dst_h,
 			   u32 hscale, u32 vscale, u32 hphase, u32 vphase,
-- 
2.46.1

