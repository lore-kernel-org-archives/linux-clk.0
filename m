Received: from fhigh3-smtp.messagingengine.com (fhigh3-smtp.messagingengine.com [103.168.172.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55E97156F5D;
	Sat, 21 Sep 2024 09:53:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726912402; cv=none; b=h6vvy3bxlanX1Qb6xNw5ZpZ6SWvSbzTvoc3xYfMoDgWw8wyMohP564p3Op8C/2UfcTy+fWKQ4NsPMIkXtYOUd9WRmRZF7FSkF80Rol3SZ6bYXPB/LD2qWXIORa1ZeKEp9Zf1Ork6oTnlVRimedCWBp3t8zV5KKx8NiX3IIJhct8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726912402; c=relaxed/simple;
	bh=op6Am6mnV9uhbauhy+Kqw0DurjlaAhAuqwuuQIBlcPQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sqoa28bAtJm+RJHyMr5NHGtDrEjy5Gu4QZ8+DLws9u2T5xLA4VVMpIfXWVQzIHhbfvb2BLwUnxV27imBEE0wc6Tq1VAM6FO4w7N99FaeciKV0gOnlvwJJcw2DBgZBFWflRSsaw4H/vvZnOWa+HikrO1BGuVpoXhyAhRWtNO5MjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com; spf=pass smtp.mailfrom=testtoast.com; dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b=DbwGrAXo; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=F4drYuJy; arc=none smtp.client-ip=103.168.172.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=testtoast.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b="DbwGrAXo";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="F4drYuJy"
Received: from phl-compute-04.internal (phl-compute-04.phl.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 9B3961140259;
	Sat, 21 Sep 2024 05:53:20 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Sat, 21 Sep 2024 05:53:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1726912400; x=
	1726998800; bh=UUs9KKw9gM7Rm8ttFhQy8Tmz+91u9KDG5MSJ+Ys1Ptg=; b=D
	bwGrAXoYyxAhD3a6RpfKcDyUx8hf+RQHAr58YGEQzMzlp4H0aOHt0zPb/TbpONDS
	zW3/LFaPmhda2Wiir4S7aadR0nQACg6ZbzWJOkpbiveSSpFBq4C9hcHC/gpGXu1k
	l/7HcKTAY8DecMRUfaxPLVDHZy/2DR1LkoteXkyrbWhTBHKU3jNAwhMscJpc47s3
	CswUw3TSXifFtEbFIG6jl5+5vdtkBOzfUf3XPyu0dEhSZmrQ5buPaRnngHwbhxRu
	LKupW8AYoiimwkAuKr038Pkk6R3wedlcDl5t8D4PuUIcy+xpcESjH7FbeWZdJXdy
	aXvbmxlot4emZLImSYO4A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1726912400; x=
	1726998800; bh=UUs9KKw9gM7Rm8ttFhQy8Tmz+91u9KDG5MSJ+Ys1Ptg=; b=F
	4drYuJy/AFhAbi3XGICrkv/J1VzGYsl8EqBHsrs7GC78LCfxTMY3PAHltJTaeXYj
	a3CI/V4RfINJibAhgIk827a5NLrHGzmJAis6GMfx9o//8TQ5NgfdgWmaJn64Rwo2
	AGXsKPt0jEJ9yvMFsK2trRmnm/mx4DyqtTxp8Ga2qqSvSfZ+5NxQXbDaHKbd8KCI
	6PhNLup6Y6g1VpYrfnnkF6o2GYmgzWAYFb9apcL4DAI0qoOXmHT+F+iZtUhd+uUE
	U7tplSuPX2q2OGJGGV2vRgpV/tZnKjugZzis0srGCN7POsyLF647qDwwoZcpPEfz
	t7oZv/fVterX9ZefRs9rQ==
X-ME-Sender: <xms:kJfuZigkXMSZYB4fyKN4_DNrrZiVgE5Kdcu4RA3B7r02BNzJatlqeQ>
    <xme:kJfuZjBxjbAYCXG8PIUMtVnl4dRuDo07I5xoXhVdIAmPqj3PN2zE-LUZ8jh_TCT5Z
    mXtWA6f58tf8Pit0w>
X-ME-Received: <xmr:kJfuZqGpii9K4Q_ZybPs8Vx458a4MlR7vQBUE15vHCurwb7lC8JXC8HGS6atSZzP0sgW3scZSCsPJRBQp1JV7yiLgg8wm3YhKlesZtEZOMujasM8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudelhedgvdduucetufdoteggodetrfdotf
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
X-ME-Proxy: <xmx:kJfuZrRLwBXSD1cdeBy5BkXAuJPRzp37dw1I_mDknNFih2gQF5xoow>
    <xmx:kJfuZvy3FyVAgH0ikyIuVLuV_VXZ-k3LWGvgSxS6oZoY2Q3XzPnshA>
    <xmx:kJfuZp5anL-ylAhytbHtrPmkeVCTbTHaaphVR5ws6NY-qHevtCte7Q>
    <xmx:kJfuZswaQg96gMCNsBjRUSc4QLDd8HcAMXKxfVx7juil7LPISocZuA>
    <xmx:kJfuZmhyProM1OjLr4eBJ-6KWQHL-Iib9Bak7qU4iTcCPhyqMZj_3yWN>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 21 Sep 2024 05:53:14 -0400 (EDT)
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
Subject: [PATCH v4 09/26] drm: sun4i: de3: pass engine reference to ccsc setup function
Date: Sat, 21 Sep 2024 21:45:58 +1200
Message-ID: <20240921095153.213568-10-ryan@testtoast.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20240921095153.213568-1-ryan@testtoast.com>
References: <20240921095153.213568-1-ryan@testtoast.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jernej Skrabec <jernej.skrabec@gmail.com>

Configuration of the DE3 colorspace and dynamic range correction module
requires knowledge of the current video format and encoding.

Pass the display engine by reference to the csc setup function, rather
than the register map alone, to allow access to this information.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Signed-off-by: Ryan Walklin <ryan@testtoast.com>
---
 drivers/gpu/drm/sun4i/sun8i_csc.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_csc.c b/drivers/gpu/drm/sun4i/sun8i_csc.c
index 68d955c63b05b..8a336ccb27d33 100644
--- a/drivers/gpu/drm/sun4i/sun8i_csc.c
+++ b/drivers/gpu/drm/sun4i/sun8i_csc.c
@@ -148,17 +148,19 @@ static void sun8i_csc_setup(struct regmap *map, u32 base,
 	regmap_write(map, SUN8I_CSC_CTRL(base), val);
 }
 
-static void sun8i_de3_ccsc_setup(struct regmap *map, int layer,
+static void sun8i_de3_ccsc_setup(struct sunxi_engine *engine, int layer,
 				 enum format_type fmt_type,
 				 enum drm_color_encoding encoding,
 				 enum drm_color_range range)
 {
 	u32 addr, val, mask;
+	struct regmap *map;
 	const u32 *table;
 	int i;
 
 	mask = SUN50I_MIXER_BLEND_CSC_CTL_EN(layer);
 	table = yuv2rgb_de3[range][encoding];
+	map = engine->regs;
 
 	switch (fmt_type) {
 	case FORMAT_TYPE_RGB:
@@ -204,7 +206,7 @@ void sun8i_csc_set_ccsc(struct sun8i_mixer *mixer, int layer,
 	u32 base;
 
 	if (mixer->cfg->is_de3) {
-		sun8i_de3_ccsc_setup(mixer->engine.regs, layer,
+		sun8i_de3_ccsc_setup(&mixer->engine, layer,
 				     fmt_type, encoding, range);
 		return;
 	}
-- 
2.46.1

