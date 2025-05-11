Received: from fhigh-a4-smtp.messagingengine.com (fhigh-a4-smtp.messagingengine.com [103.168.172.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF55719CC1C;
	Sun, 11 May 2025 10:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746960155; cv=none; b=u9sAVurH6iuiT1FTO1pdx4oHk1wZZ5s0kIlGiaEERmZFe2QkBSGR3gACAAxsM4YlUcLkx8rxwjYAkxt026xgprXbTA0xR2KCpMwi62qdousTVhWYod0jBB8IaVoJFGY7244cO1F8iLBl4y2UixZeqL68OYDx+YhIuMyuh2rIYdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746960155; c=relaxed/simple;
	bh=5DRm7vCvI9hiySZPK9ls7Rb8GvfGQNLGmRZfQcCoImE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H9MSnH+c7a9AnbsoVZyuydojpSAtuWBKX3IEUJ5eh93dNiSeHX7zTVo2ZJfayDgn1WO5XU/HDjU+HLsxovoLIejTMAWAW000MkxWIbaO2sjgDJQpzxuIWL/SZK2BD0Ka+ltSo6XuYV6Vc8IRoi7m15i6fomeCv8iCKXRLWxO5Zk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com; spf=pass smtp.mailfrom=testtoast.com; dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b=h3FDHQsF; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=JOHMMAXJ; arc=none smtp.client-ip=103.168.172.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=testtoast.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b="h3FDHQsF";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="JOHMMAXJ"
Received: from phl-compute-01.internal (phl-compute-01.phl.internal [10.202.2.41])
	by mailfhigh.phl.internal (Postfix) with ESMTP id DDFEE1140130;
	Sun, 11 May 2025 06:42:32 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Sun, 11 May 2025 06:42:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1746960152; x=
	1747046552; bh=Q4WwSzwo/m3zTZNH1N2GBvom6q9yaF5Ke1a0olHytF8=; b=h
	3FDHQsFJBT4ySotg+1TukROSIlG0m7x3x3ctTw8WidwVeQTGQCoEKCyv/7G9Z5og
	uIrQkjJGuZB4yQ11ayDgowyuOsAc7XsHneLWoEZAf4utYCMt+qGxXq0ESTuVuTBn
	Rq7U+PpRD/HT2DnvgLthkz5xHOz6SHA1AfaEAGWmZSx7e5m4n/D3OK6cUDDOBigj
	SuApqq+NePM/oaVDB6leQf27CBcXev6ScI4lqUfaeicTgcAE9RRL/28FoVX9h+vZ
	jk4DVS8Nd3fwRj2p28utJYKyjIiqZ4n5YlrwZ2Awr8QsT6bdnXbO8vImWN1oORvI
	MKYztedpfDPIcyczxAEVQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1746960152; x=1747046552; bh=Q
	4WwSzwo/m3zTZNH1N2GBvom6q9yaF5Ke1a0olHytF8=; b=JOHMMAXJ4vYmfj4Rd
	C9hleaGf6rHEEbzx3X5ge1T6MzkTfRJBY+eo3FhEQPNRwA7BGbjDzCWuN97oDxxW
	UAi/xOH4tLemtOn0n28+lw01aP9LmQg1LxHz3jFR28qT+fSm/SQT7H/da345hvuJ
	iSjSckIkuYdGU74cuKIV2VeWkpAfcLN6+Nue5Dp9V19fdH1EL82DAf8MC3N7Q+cs
	ulA9m1uEbsZBuid7Sk7xB5fC6mRubMRxog9sAUf/Zv7NXlyjB905/KYEUBuwZ1CP
	whZxu8O0Kfio271jbOf0bzvAC/f99h0G+A6dG/iU5nkfJvUyKT7iI3zxIPOg7hf7
	/Vkvg==
X-ME-Sender: <xms:F38gaOqptGUakmQssSJNN9CMKKdyo4GJ5qfqcSepWCeLjQFxsNWFvw>
    <xme:F38gaMqwQnbagdAf4m2ELRysSJIHyJ0cpYjNqNsz_LcPO_RIWafdvY5IfDjjRYcen
    kTqx-UZTwM9fwe-7g>
X-ME-Received: <xmr:F38gaDMa02JtjTVUzDrFqc9jtYdPbecfvnKjia7FkOZcn-akaKr8QfHg-ujtbkHKInsFkPphnwIlFj9CZDRUk-Ik2PmcT9luwqJPgjxSvtZ3>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvleekudeiucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredt
    tdenucfhrhhomheptfihrghnucghrghlkhhlihhnuceorhihrghnsehtvghsthhtohgrsh
    htrdgtohhmqeenucggtffrrghtthgvrhhnpeffheeiffegtdfgffejteevgeefkeelieel
    keevueetffetteduffevgeeiieehteenucevlhhushhtvghrufhiiigvpedtnecurfgrrh
    grmhepmhgrihhlfhhrohhmpehrhigrnhesthgvshhtthhorghsthdrtghomhdpnhgspghr
    tghpthhtohepvdegpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehmrhhiphgrrh
    gusehkvghrnhgvlhdrohhrghdprhgtphhtthhopeifvghnshestghsihgvrdhorhhgpdhr
    tghpthhtohepmhgrrghrthgvnhdrlhgrnhhkhhhorhhstheslhhinhhugidrihhnthgvlh
    drtghomhdprhgtphhtthhopehtiihimhhmvghrmhgrnhhnsehsuhhsvgdruggvpdhrtghp
    thhtoheprghirhhlihgvugesghhmrghilhdrtghomhdprhgtphhtthhopegurghnihgvlh
    esfhhffihllhdrtghhpdhrtghpthhtohepjhgvrhhnvghjrdhskhhrrggsvggtsehgmhgr
    ihhlrdgtohhmpdhrtghpthhtohepshgrmhhuvghlsehshhholhhlrghnugdrohhrghdprh
    gtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:F38gaN5lU2N8vMcIQ2BxBICGiSW7DtuXGwoGZUZQe81ysRJWqgc6dw>
    <xmx:F38gaN6X8-Cqwk6SxVW9L0qM-Ve4L44dYuhzUOOeVf-xfqvgcU0LdQ>
    <xmx:F38gaNi5t6fJowjueeFQpFt54U9lBuh9VM3FMhLeLbqjqViMaqQAeg>
    <xmx:F38gaH7C74_A0AoNgsYDPz8clVin0IeicBQah9ojgYRVLC5v4j55Ew>
    <xmx:GH8gaNoRihFtys6u2NiKeHeo-Q34NISECRvI0fwUjWlXG0zTduwhX8H3>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 11 May 2025 06:42:25 -0400 (EDT)
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
Subject: [PATCH v10 09/11] drm: sun4i: de33: vi_scaler: add Display Engine 3.3 (DE33) support
Date: Sun, 11 May 2025 22:31:18 +1200
Message-ID: <20250511104042.24249-10-ryan@testtoast.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250511104042.24249-1-ryan@testtoast.com>
References: <20250511104042.24249-1-ryan@testtoast.com>
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
 drivers/gpu/drm/sun4i/sun8i_ui_layer.c  | 20 ++++++++++++++++----
 drivers/gpu/drm/sun4i/sun8i_vi_scaler.c |  4 +++-
 2 files changed, 19 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
index 7a21d32ff1e4..3eefdb710dee 100644
--- a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
@@ -94,12 +94,24 @@ static int sun8i_ui_layer_update_coord(struct sun8i_mixer *mixer, int channel,
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
+			sun8i_vi_scaler_enable(mixer, channel, true);
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
+			sun8i_vi_scaler_enable(mixer, channel, false);
+		else
+			sun8i_ui_scaler_enable(mixer, channel, false);
 	}
 
 	/* Set base coordinates */
diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_scaler.c b/drivers/gpu/drm/sun4i/sun8i_vi_scaler.c
index ad87ab395803..6839fd5ab602 100644
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
-- 
2.49.0

