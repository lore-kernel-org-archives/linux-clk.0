Received: from fhigh-a2-smtp.messagingengine.com (fhigh-a2-smtp.messagingengine.com [103.168.172.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B8BF13C827;
	Sun, 29 Sep 2024 09:12:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727601135; cv=none; b=ZKP7wASfN/ZPJmE1Mste9hz0EyPHIZRMjI1G2MAtG1f/HmhVgbB9EQlUfjDKHDUyCmNWvu+QJrhR+ucqEBFTKspf2C4w3CUuQ0n/A+QDFJgVwtr9sFpA664jG7DKDvLckGmpl9ffnid+XDPlx3JK5DHr6Mt5sobNOQWB6p5xKao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727601135; c=relaxed/simple;
	bh=r2+rCrqwbcxwxDxgUi5Q27ELKyFEBo40VUVwIuJU0f0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Oo+64wL9fVtFlXMSECYiXHlQZylN1mehBYs6/+lBsmLsgna8fitrnkhf8EWs+hziODxXbn3qnlGApOaQ1oj2uw6B1hEkalIWZvutXYFHYIsMR0jjCO74vqHIawEBY+3PbDJG0Dxnts6Z8rqo8AuH+73B/Qyn9tUwW/JnqENrPRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com; spf=pass smtp.mailfrom=testtoast.com; dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b=mNXBFg6X; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=KR20lgM6; arc=none smtp.client-ip=103.168.172.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=testtoast.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b="mNXBFg6X";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="KR20lgM6"
Received: from phl-compute-01.internal (phl-compute-01.phl.internal [10.202.2.41])
	by mailfhigh.phl.internal (Postfix) with ESMTP id B8D3611401F9;
	Sun, 29 Sep 2024 05:12:11 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Sun, 29 Sep 2024 05:12:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1727601131; x=
	1727687531; bh=AwHhBn3bbgR1hnB5MQJEZRwH1DqrqeD78dAXPRj4TlI=; b=m
	NXBFg6XKKBiPeQm1GKrMvDEhbyIhmjnBQMtvksSTIRnybHrQx054O7kxAcxwTs6j
	ogBfRT1I+H2XUGInPUD+TTbZzqmg1AnSbL0EZf2ss0BSu4Z3LgCKrpIalavtj7zg
	5Pfqyy686HnG0Rs0nBxUoutKvtzXiynC3BrCLOYOnDsQrBti53dZo+bM5deB7Z6f
	PVZE8knBedboizftf6h16RMXWPQ0nU0jLMrFWszLVKm+BDhWwBNE0asmjIDVoG+h
	0le2PLyE4kcBfq/Esl8qEr1JvesYTRR/BFSpU4h2CO40D3JzqQINRnA+bmbWOs11
	C9w3ynqckkkEeZrAaPitA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1727601131; x=
	1727687531; bh=AwHhBn3bbgR1hnB5MQJEZRwH1DqrqeD78dAXPRj4TlI=; b=K
	R20lgM6ToPCT8+0ASW+NJobM6wm8eEihAAQT5WvSlXRlpuYqMeQIBlqJd/PXKdyt
	gobm+/MwrqJYpBLW5v5TMSDcd/umWXyLA0OaCT2cAVeOmR/7FW3deIcCUxb58sY1
	pI5rD17asmtnZuIdHQ8l6NvtqWsoPaSQ3ug/TpJyVrIkmeIU8voR6w0kyOifyzFL
	3P7cJ4VZrLz4Icf6NLiXekAtkjI1aXwH5esx6+61dhRPVuXq47S+yudP1JGUXHX/
	iMNx2eJRK78Nx/8QMU493VuJN9+LbBFhEYpF3W0WzYsI2c7mvbcdDL2XqPFEZ0XX
	OvX0M4zHtlPfChH8iTnuQ==
X-ME-Sender: <xms:6xn5ZjQgPiLke8VS6l2ttw84PwuypbETLKR_WBCy1M1l7SGnV8l52A>
    <xme:6xn5ZkyKSHUYQcZXSzF1Za4h1P3jgew90Y4JF7ltglBrKV87nbUMFiWgyxIV0GHO9
    e9DA6TaGF-fZmGe0Q>
X-ME-Received: <xmr:6xn5Zo2Ck3luSHWLKEGUvW7xymn8ddk6pVyqiaIDl5V1yGAoMYjrcIDO-_QgktsAG_qzlp8Ci7jYG-Ktl-WXZhdp5UaV49c2fZcsb_K_fnzIXkZ1>
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
X-ME-Proxy: <xmx:6xn5ZjCw-C_ZdrIFG5TyumQbQZmSMyJcu32CFdniizipa4lfn_B13Q>
    <xmx:6xn5ZsjosSNsylpKNTlnKvbnV_ni6HGIzNnXRw3YAhl3CWVTKrwRzA>
    <xmx:6xn5ZnppKpM3gX1vk1s49ZZpyfjLzZzT_8lK2_KpFg14mfaPmMsX_w>
    <xmx:6xn5ZngW6D5-CzP8zY0OPb6w0xS5MZnvRJFcpoGVH3sFtmTMSWE1RQ>
    <xmx:6xn5ZpYiiZtJeNZEpUc8f65linlhMjM0EAWd4pK4ziq5fA1Fm-qMabZt>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 29 Sep 2024 05:12:05 -0400 (EDT)
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
Subject: [PATCH v5 07/26] drm: sun4i: de3: add formatter flag to mixer config
Date: Sun, 29 Sep 2024 22:04:39 +1300
Message-ID: <20240929091107.838023-8-ryan@testtoast.com>
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

