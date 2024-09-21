Received: from fout6-smtp.messagingengine.com (fout6-smtp.messagingengine.com [103.168.172.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A82E7157A5C;
	Sat, 21 Sep 2024 09:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726912390; cv=none; b=QbjyndYHoF6UuAzTomXqELYdBrVmJyqQuplZ4OXYR6kXYxfwCBHWfALFIqZxYkrE/q307+1ToEYICNg2/25RrxsyEHqD+bnxYRaSYqjqkTYNbegNdu+0rFAczpmj4rM0Sejt8klnres6LcXpw8fZuY5WjrNL4yDkAEutUdeD0gE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726912390; c=relaxed/simple;
	bh=r2+rCrqwbcxwxDxgUi5Q27ELKyFEBo40VUVwIuJU0f0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sGWODYg7l9RgU5gLfC+LCpO+mG+/6DyKj7e3sHETCUvs+Lmb92WdOjjKNdKf4YdWIoXV6p+Dnb3RATaCOahrNi4+nK9PIi2t17EUV81dlYZSCYHG7LgYZoJcavHjnG02Tdws9XKf5xAHKW5gChXZeG0nU6g7M/9mfne/9rmvOH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com; spf=pass smtp.mailfrom=testtoast.com; dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b=mBkUNc8y; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=MofWFPhA; arc=none smtp.client-ip=103.168.172.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=testtoast.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b="mBkUNc8y";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="MofWFPhA"
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfout.phl.internal (Postfix) with ESMTP id E4B681380302;
	Sat, 21 Sep 2024 05:53:07 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-10.internal (MEProxy); Sat, 21 Sep 2024 05:53:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1726912387; x=
	1726998787; bh=AwHhBn3bbgR1hnB5MQJEZRwH1DqrqeD78dAXPRj4TlI=; b=m
	BkUNc8yHXZdDzlfUYjEQe8tqulCM8a98lY4GpxakOelM9U6cTZz6MwJOtPE5oNX4
	AEOUGrCvqZhq7Zy6ncvVeUP0BnWZYI5U16yZsny74q6QosAEHQVNIaF8kmGAoq17
	VLyuLF+bGdkBv3hVBpued9jKq/WKdVLJXweLJ70V8cFmkBBN7eTBLa4dPGPdh5Hb
	ip9F4qir6fqd9FVBEZlxyKA5tbxIWVJ/JasMDD3/6/WHezWv8mVnP5AGrsoX5zzb
	+3hVi/XwxSVIiJ/LZwPlDKvKSsc5SQoXaijvJDbJW6guD+EA0f39/l2iuFU/jNsq
	STRFmNI3NjcefXgjXqqpg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1726912387; x=
	1726998787; bh=AwHhBn3bbgR1hnB5MQJEZRwH1DqrqeD78dAXPRj4TlI=; b=M
	ofWFPhApabbPlYP+lm3Bd8Z5NHPCEqYYWXhhurb3wEiRgtoTp5aF2Ls0wJIyX3eJ
	fwp6ZyNlIRQQuRaMo5ysxFsq1Uq7raPbzVpr4yMUe0fOYTehFxZOvPoXjREhGknL
	Opuk2XO2sAR7AeH/0v1RnwTfoefQZ2Cnm4o+1Kuc5jrE2wGsaaHftjqfi95RexDE
	29LjVzGKorNFXEGjjKaJ8cvf9LKqRwSXiy0prW4FdRLku98IAGE6uD6OwNZ9jQio
	efyaELaTz8yV1q7SGuopX7OlxJGwy4bCzQsXCVuDWzBWbuSViy5ZIUGs7tw2HzYI
	z1PPoI59rbYLpPUADdXLg==
X-ME-Sender: <xms:g5fuZqTOPRqPA--E-5srNLbEHGgra67OSXh-BsBxYrvLMf1sLBijGA>
    <xme:g5fuZvxvHrMUprl_kHGoWI2PBhBxEG9Ha60laqgihdXAwiIISA4EffzOGS7tzLG9K
    HqrliLb0_swz1SLMA>
X-ME-Received: <xmr:g5fuZn1uQlgCCKsilCkZiWPVEvO0ktBQqy7p7B3OnkIKTfxF0oagjW8Rg6ndT9ZSsVnPKE8P1Xsfm6zz5mcoz5TQZcdYeeLI2gTCrzjYlXx32CiU>
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
X-ME-Proxy: <xmx:g5fuZmDFrMk8IBLpNmN1YiKepgbT5JfhcEHgRhTRik-B1IQWZxEH6w>
    <xmx:g5fuZjgOqIhchY-MZ_ghKs_meh4MztiscmkwQk-TqY_wklBOGCxMSQ>
    <xmx:g5fuZir62li__-fkqbSHA5WkSxDTYMw7pPOpKU3UEjj2zamp3et8GQ>
    <xmx:g5fuZmjRUw_wDURz8SD4RQXyzZLBgQ0iYJJt3Wf5a2kWizbesKriqg>
    <xmx:g5fuZuQKE0-ze3kWSrVLDJCMUO_Q_veNuEPYppap1E63C_EHiDP57y6m>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 21 Sep 2024 05:53:01 -0400 (EDT)
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
Subject: [PATCH v4 07/26] drm: sun4i: de3: add formatter flag to mixer config
Date: Sat, 21 Sep 2024 21:45:56 +1200
Message-ID: <20240921095153.213568-8-ryan@testtoast.com>
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

Only the DE3 (and newer) display engines have a formatter module. This
could be inferred from the is_de3 flag alone, however this will not
scale with addition of future DE versions in subsequent patches.

Add a separate flag to signal this in the mixer configuration.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Signed-off-by: Ryan Walklin <ryan@testtoast.com>
---
 drivers/gpu/drm/sun4i/sun8i_mixer.c | 1 +
 drivers/gpu/drm/sun4i/sun8i_mixer.h | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c b/drivers/gpu/drm/sun4i/sun8i_mixer.c
index bd0fe2c6624e6..252827715de1d 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
@@ -717,6 +717,7 @@ static const struct sun8i_mixer_cfg sun50i_a64_mixer1_cfg = {
 static const struct sun8i_mixer_cfg sun50i_h6_mixer0_cfg = {
 	.ccsc		= CCSC_MIXER0_LAYOUT,
 	.is_de3		= true,
+	.has_formatter	= 1,
 	.mod_rate	= 600000000,
 	.scaler_mask	= 0xf,
 	.scanline_yuv	= 4096,
diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.h b/drivers/gpu/drm/sun4i/sun8i_mixer.h
index d7898c9c9cc0c..8417b8fef2e1f 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.h
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.h
@@ -163,6 +163,7 @@ enum {
  * @mod_rate: module clock rate that needs to be set in order to have
  *	a functional block.
  * @is_de3: true, if this is next gen display engine 3.0, false otherwise.
+ * @has_formatter: true, if mixer has formatter core, for 10-bit and YUV handling
  * @scaline_yuv: size of a scanline for VI scaler for YUV formats.
  */
 struct sun8i_mixer_cfg {
@@ -172,6 +173,7 @@ struct sun8i_mixer_cfg {
 	int		ccsc;
 	unsigned long	mod_rate;
 	unsigned int	is_de3 : 1;
+	unsigned int    has_formatter : 1;
 	unsigned int	scanline_yuv;
 };
 
-- 
2.46.1

