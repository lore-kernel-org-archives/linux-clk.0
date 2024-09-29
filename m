Received: from fout-a3-smtp.messagingengine.com (fout-a3-smtp.messagingengine.com [103.168.172.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B75D8BE4E;
	Sun, 29 Sep 2024 09:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727601241; cv=none; b=h0agStQb+MozckFfwZFm0PgKbX2fgHam2m2WXX6s8x85c+3tkfZ65FT8LZM9wY5vU3avaOukkFYwj62Ra0aeAR7Lj19TjaI9OjEh/lMLLIxh1sCfXFJ87sNKbIoXEKRCQWu4orNgzYvpBhlqc9h9pT/4aMWydMK7rIarVh1epsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727601241; c=relaxed/simple;
	bh=Oe74rKuOwVGBvRNuGdXjhw6UlgpjziTN54VL3rjMgJo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KtSerruhQiV8bnVEk/Fv449NROj0Gfi11VwbXoo/QqgBdauhPtoEU/8dZ/P6f9qwsEE1nviFL8+PCjHMTOovsHEv5N8BmxkWEwixzfhE5SPghkMGIhLRETuS3U4IZGohg6Q8Zt2fzdQfAcBn8jG0FUXNWeFkD9fI86gxt7zQlDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com; spf=pass smtp.mailfrom=testtoast.com; dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b=vFVZGpH0; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=GfO6sAR0; arc=none smtp.client-ip=103.168.172.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=testtoast.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b="vFVZGpH0";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="GfO6sAR0"
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfout.phl.internal (Postfix) with ESMTP id 2097E13802B7;
	Sun, 29 Sep 2024 05:13:59 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Sun, 29 Sep 2024 05:13:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1727601239; x=
	1727687639; bh=GzStvdVzyVR2B+0fZHuwlVX7olZEgtoygp1s91SLTdg=; b=v
	FVZGpH092wo4X0sM+DMTtsa2Yc+jyKdzWkHtijgoyWNySPpTj1NgEov/FtH7SkB3
	GgWQsBzrRSdbdG3l+4Gq01FtJtyYioBPD+nenXuVXYKDh7XE/QEG60MJqrrw0gbf
	aBNYIByI47BwaY9TlhaC0uFPGg7X6ewh1EHTm8eR7BAfoj5iZOL9vjftfbNnP6di
	857mtuLkp5mRAPOwcYi6a/WTD97mlAc4n6C4DW0JtsBhIXqJ6JRzq3OPZBL3tcdc
	HphkchCbG6DiRr9fBH2/9T2haPggE2s1oaXQDyORtPZsHnUwSv7595So68SB1KXb
	jraIjOLkOgPTnLv7jfXqA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1727601239; x=
	1727687639; bh=GzStvdVzyVR2B+0fZHuwlVX7olZEgtoygp1s91SLTdg=; b=G
	fO6sAR0rldSJ9NH/ZEZjpQSeyOicfBftF7YYTbYkDEWBeX/P7Fb48D+f2Hs4sL8T
	BwGK0HeW5plMJcdciKDnNFojTi78HGOuwMMd9B1prS1RAbHzz1AigeQtCh33Hg4W
	NrBvjwA7uumwjB4BFKTWdXQn+Mymt4GghXxbhMffYEzhlY9asS9LJwOMkS+PicdQ
	zkqDREhs723Oepk3KeoysJ1lkj43rDKZtqBX5Lez4Mx0GFd23VdprYBTMqjDgmpW
	Vnbo2dTlPSlmdtoFmcQsacZEe3h5Rg4rl/UGPN2Nbc0AMwx0p9jAXh3xwGc865Jq
	nEg5rNNPWRmG78o+Ep5yA==
X-ME-Sender: <xms:Vhr5ZnA5asR7JDtq2lNzn_vkhl4x89fchvUBaNUL_wtcvrohhX3w-A>
    <xme:Vhr5ZtgwC2ylsoWPgfdhiVJaYVnfgUZLuZws3ZaZXsUMLjPpZTmlnRQS79FR1KS6c
    KhsVbb28UBQcIjv8Q>
X-ME-Received: <xmr:Vhr5Zik0Jl0RMNtsFizI5Kg_Qh7FyFmyHx127SgvnBEq775697m6aEow6nxUBgO9TxoMFEUaawcgF1zsV9lMW13YlH74Csx_BRIbvM6M6GZUp3zz>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvddufedgudegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttden
    ucfhrhhomheptfihrghnucghrghlkhhlihhnuceorhihrghnsehtvghsthhtohgrshhtrd
    gtohhmqeenucggtffrrghtthgvrhhnpeffheeiffegtdfgffejteevgeefkeelieelkeev
    ueetffetteduffevgeeiieehteenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmh
    epmhgrihhlfhhrohhmpehrhigrnhesthgvshhtthhorghsthdrtghomhdpnhgspghrtghp
    thhtohepvddupdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehmrhhiphgrrhguse
    hkvghrnhgvlhdrohhrghdprhgtphhtthhopeifvghnshestghsihgvrdhorhhgpdhrtghp
    thhtohepmhgrrghrthgvnhdrlhgrnhhkhhhorhhstheslhhinhhugidrihhnthgvlhdrtg
    homhdprhgtphhtthhopehtiihimhhmvghrmhgrnhhnsehsuhhsvgdruggvpdhrtghpthht
    oheprghirhhlihgvugesghhmrghilhdrtghomhdprhgtphhtthhopegurghnihgvlhesfh
    hffihllhdrtghhpdhrtghpthhtohepjhgvrhhnvghjrdhskhhrrggsvggtsehgmhgrihhl
    rdgtohhmpdhrtghpthhtohepshgrmhhuvghlsehshhholhhlrghnugdrohhrghdprhgtph
    htthhopehrohgshheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:Vhr5Zpx30ORuKRD8IDAWB-POkL9JimjhFoUSqxmEEhNwiUgWhhyqcQ>
    <xmx:Vxr5ZsTZTIA4tHcaanqEQwwutLzHuEA30eqqSiCv35GbRwNzNI6uhQ>
    <xmx:Vxr5ZsZs9eXNoKPRETluMqFLiO8sZCoe-6gc5cwxFMnWQUZBE6eJVg>
    <xmx:Vxr5ZtTFXtbrVHTRPlIt1unebdrQwPVagbHH1KytH3lblYjOn-MxFg>
    <xmx:Vxr5ZkJRgLvT2vh15mo7-RiSAlMFKqFfE7HgNcW6C719n45uUsSUo_sI>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 29 Sep 2024 05:13:53 -0400 (EDT)
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
Subject: [PATCH v5 24/26] drm: sun4i: de33: vi_scaler: add Display Engine 3.3 (DE33) support
Date: Sun, 29 Sep 2024 22:04:56 +1300
Message-ID: <20240929091107.838023-25-ryan@testtoast.com>
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

The vi_scaler appears to be used in preference to the ui_scaler module
for hardware video scaling in the DE33.

Enable support for this scaler.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Signed-off-by: Ryan Walklin <ryan@testtoast.com>
---
 drivers/gpu/drm/sun4i/sun8i_ui_layer.c  | 19 +++++++++++++++----
 drivers/gpu/drm/sun4i/sun8i_vi_scaler.c |  7 ++++++-
 2 files changed, 21 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
index 7f1231cf0f012..180be9d67d9c3 100644
--- a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
@@ -95,12 +95,23 @@ static int sun8i_ui_layer_update_coord(struct sun8i_mixer *mixer, int channel,
 		hscale = state->src_w / state->crtc_w;
 		vscale = state->src_h / state->crtc_h;
 
-		sun8i_ui_scaler_setup(mixer, channel, src_w, src_h, dst_w,
-				      dst_h, hscale, vscale, hphase, vphase);
-		sun8i_ui_scaler_enable(mixer, channel, true);
+		if (mixer->cfg->de_type == sun8i_mixer_de33) {
+			sun8i_vi_scaler_setup(mixer, channel, src_w, src_h,
+					      dst_w, dst_h, hscale, vscale,
+					      hphase, vphase,
+					      state->fb->format);
+		} else {
+			sun8i_ui_scaler_setup(mixer, channel, src_w, src_h,
+					      dst_w, dst_h, hscale, vscale,
+					      hphase, vphase);
+			sun8i_ui_scaler_enable(mixer, channel, true);
+		}
 	} else {
 		DRM_DEBUG_DRIVER("HW scaling is not needed\n");
-		sun8i_ui_scaler_enable(mixer, channel, false);
+		if (mixer->cfg->de_type == sun8i_mixer_de33)
+			sun8i_vi_scaler_disable(mixer, channel);
+		else
+			sun8i_ui_scaler_enable(mixer, channel, false);
 	}
 
 	/* Set base coordinates */
diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_scaler.c b/drivers/gpu/drm/sun4i/sun8i_vi_scaler.c
index e7242301b312c..9c7f6e7d71d50 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_scaler.c
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_scaler.c
@@ -835,7 +835,9 @@ static const u32 bicubic4coefftab32[480] = {
 
 static u32 sun8i_vi_scaler_base(struct sun8i_mixer *mixer, int channel)
 {
-	if (mixer->cfg->de_type == sun8i_mixer_de3)
+	if (mixer->cfg->de_type == sun8i_mixer_de33)
+		return sun8i_channel_base(mixer, channel) + 0x3000;
+	else if (mixer->cfg->de_type == sun8i_mixer_de3)
 		return DE3_VI_SCALER_UNIT_BASE +
 		       DE3_VI_SCALER_UNIT_SIZE * channel;
 	else
@@ -845,6 +847,9 @@ static u32 sun8i_vi_scaler_base(struct sun8i_mixer *mixer, int channel)
 
 static bool sun8i_vi_scaler_is_vi_plane(struct sun8i_mixer *mixer, int channel)
 {
+	if (mixer->cfg->de_type == sun8i_mixer_de33)
+		return mixer->cfg->map[channel] < mixer->cfg->vi_num;
+
 	return true;
 }
 
-- 
2.46.1

