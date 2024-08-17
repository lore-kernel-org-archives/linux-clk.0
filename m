Received: from fout6-smtp.messagingengine.com (fout6-smtp.messagingengine.com [103.168.172.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5190D155A5D;
	Sat, 17 Aug 2024 23:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723936043; cv=none; b=JN+xt8gLFVm7+7dpL3Kkxflm8CIyDZb4jj5xAiVlzCAtl+VifNBBAUNn7IEBA93220cXmVZH806jJFv+aDDtiff4fIAG1FkoHjTmm0w9KOXZCSKmGaU+O3EFPTeX37oRrYOJrNqpvODc0hq+2ZgXMQJZwMbEhHSKyxcQqVYo9XM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723936043; c=relaxed/simple;
	bh=3MU3o/jFiSuOyXd7Y9pTh1rwNna6+HwGPPQxmAZFtcU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W3PL1wxEOwKno8l0vHDigQf7AZDnJU2HZHMXwLyUPUEcyypsxSfZxtcas1XdxeBcX6CuoCa6icRb8AK63PYloTrdlOfqvkIeiuqR1HJQNJJsPyzR496sB24GwLUOS1QLM/18V778LheZil+625k1dU8AdNE26Y5nnEFBR+NbEKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com; spf=pass smtp.mailfrom=testtoast.com; dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b=iqFdG4GW; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=IHBTpQgj; arc=none smtp.client-ip=103.168.172.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=testtoast.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b="iqFdG4GW";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="IHBTpQgj"
Received: from phl-compute-02.internal (phl-compute-02.nyi.internal [10.202.2.42])
	by mailfout.nyi.internal (Postfix) with ESMTP id 98F58138DD1C;
	Sat, 17 Aug 2024 19:07:20 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Sat, 17 Aug 2024 19:07:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1723936040; x=
	1724022440; bh=IyGsSCTkc5FnsNmuMVkWXzDaM1RdjP9WM6gEgIthaCM=; b=i
	qFdG4GWX7XbzT95OTSszu/B6HSWlNG5l6ewWDF4Q7Z8bmjAd6mz8DYDfwHgyT1UI
	tZJ9usOCRE7er9IpIQkAueKcNvygZkKGco88DUZswFQRlN2nlBiSBVg6sTPjSsqy
	DLgXcmOqmZWZYaVpJA337npBHgkQkx1GVF5q+kz0W+kLnwPxcbNMkYP04alg66Ph
	8XU9BE7Wd2NxevfuW4cugz9YDC3Ph8rt6yA+1FNYYTPIWaIJBRBjgSePUEolObaj
	kOgqSmSloX6Eu2R5iE2mFH+ebXAMVfERz5XB8RhTxMi/k6WT69MtooBChuPT4cTx
	/vA146NKk7pAU/t9RwqQQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1723936040; x=
	1724022440; bh=IyGsSCTkc5FnsNmuMVkWXzDaM1RdjP9WM6gEgIthaCM=; b=I
	HBTpQgjlJgeBtgfv/ze25B/8pibQwf1JSfrYuDDKl8Vz/HhfYe87Jy82Xt6VAmvw
	Te93F3uaTcWBX7QM3RP5NvrSrw8HzTYoAbn4G+dG8kToQ6gDruEb59Dd0mjldSFh
	UUp+AHjngOt7h1/AtvGBopLlPNxdT0hO57hTbQvBl2g15xNe+eDfrvj0tknVeG/K
	Jaqi9+eyArLpk8EN5Uiuie9RwuhvwzCCaLmZMUCNLWOu7BrHdY6iIidkH9AdfQx3
	H5+jp/0vdh9AKHV5QJvMUqVq+G6GV9LNPzhAuR3iudEAouHMuoKLELYEhCxVUnhq
	8CsarpU6FB1v/Fzk3AVfQ==
X-ME-Sender: <xms:KC3BZvaY2fgQQmCAM9q2MakFexd7t1S7J3CYgVxuM10ZxkQ3-NbkEQ>
    <xme:KC3BZuZA0RKeP1GVhqh0A6b_Oe27HiGvXItSPljQykYJbTfltLQ1fMF0ZcA5bcQ0W
    vcEEbay2zfcdDa42Q>
X-ME-Received: <xmr:KC3BZh-ez0IDCwhWoZH14zGT2-OWvCVUVqKLgIF_jd3ZgfW0FjNBQ8n4Y4W_fNVNS4Ipjh7NEHDIsTyxHjyV4zM6-kVRXk2ubxMt4iMzD_PGQTWx>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudduuddgudekucetufdoteggodetrfdotf
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
X-ME-Proxy: <xmx:KC3BZlqZ7eUF_KLpgCrDJflcypKI9tbDhMQB63d-tak0pp92w2ozYQ>
    <xmx:KC3BZqrrLAXXAQRn6Ng1TqDQtC9qhr7-H-8oD4NUeVfy3j4CpwueLg>
    <xmx:KC3BZrSveb2YdukRVz-OKRM9TUMj_fJ05tJAP1i8Yg8rUs6qjFf59w>
    <xmx:KC3BZioZOYUDE2dk180fCInu9-WMWa6JVUjiXAw753bFA4R6D4X2lw>
    <xmx:KC3BZjZmTKk34IWry9OEfsLJ-EJC10Sz8-EcLEq6cG_Hhf89U0WM-12D>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 17 Aug 2024 19:07:13 -0400 (EDT)
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
Subject: [PATCH v3 14/26] drm: sun4i: de2/de3: refactor mixer initialisation
Date: Sun, 18 Aug 2024 10:46:01 +1200
Message-ID: <20240817230503.158889-15-ryan@testtoast.com>
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

Now that the DE variant can be selected by enum, take the oppportunity
to factor out some common initialisation code to a separate function.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Signed-off-by: Ryan Walklin <ryan@testtoast.com>
Reviewed-by: Andre Przywara <andre.przywara@arm.com>

--
Changelog v1..v2:
- Combine base register allocation and initialisation in sun8i_mixer_init
- Whitespace fix
---
 drivers/gpu/drm/sun4i/sun8i_mixer.c | 66 +++++++++++++++--------------
 1 file changed, 35 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c b/drivers/gpu/drm/sun4i/sun8i_mixer.c
index 34f03ad18a26e..8871ca2858c80 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
@@ -468,6 +468,38 @@ static int sun8i_mixer_of_get_id(struct device_node *node)
 	return of_ep.id;
 }
 
+static void sun8i_mixer_init(struct sun8i_mixer *mixer)
+{
+	unsigned int base = sun8i_blender_base(mixer);
+	int plane_cnt, i;
+
+	/* Enable the mixer */
+	regmap_write(mixer->engine.regs, SUN8I_MIXER_GLOBAL_CTL,
+		     SUN8I_MIXER_GLOBAL_CTL_RT_EN);
+
+	/* Set background color to black */
+	regmap_write(mixer->engine.regs, SUN8I_MIXER_BLEND_BKCOLOR(base),
+		     SUN8I_MIXER_BLEND_COLOR_BLACK);
+
+	/*
+	 * Set fill color of bottom plane to black. Generally not needed
+	 * except when VI plane is at bottom (zpos = 0) and enabled.
+	 */
+	regmap_write(mixer->engine.regs, SUN8I_MIXER_BLEND_PIPE_CTL(base),
+		     SUN8I_MIXER_BLEND_PIPE_CTL_FC_EN(0));
+	regmap_write(mixer->engine.regs, SUN8I_MIXER_BLEND_ATTR_FCOLOR(base, 0),
+		     SUN8I_MIXER_BLEND_COLOR_BLACK);
+
+	plane_cnt = mixer->cfg->vi_num + mixer->cfg->ui_num;
+	for (i = 0; i < plane_cnt; i++)
+		regmap_write(mixer->engine.regs,
+			     SUN8I_MIXER_BLEND_MODE(base, i),
+			     SUN8I_MIXER_BLEND_MODE_DEF);
+
+	regmap_update_bits(mixer->engine.regs, SUN8I_MIXER_BLEND_PIPE_CTL(base),
+			   SUN8I_MIXER_BLEND_PIPE_CTL_EN_MSK, 0);
+}
+
 static int sun8i_mixer_bind(struct device *dev, struct device *master,
 			      void *data)
 {
@@ -476,8 +508,6 @@ static int sun8i_mixer_bind(struct device *dev, struct device *master,
 	struct sun4i_drv *drv = drm->dev_private;
 	struct sun8i_mixer *mixer;
 	void __iomem *regs;
-	unsigned int base;
-	int plane_cnt;
 	int i, ret;
 
 	/*
@@ -581,8 +611,6 @@ static int sun8i_mixer_bind(struct device *dev, struct device *master,
 
 	list_add_tail(&mixer->engine.list, &drv->engine_list);
 
-	base = sun8i_blender_base(mixer);
-
 	/* Reset registers and disable unused sub-engines */
 	if (mixer->cfg->de_type == sun8i_mixer_de3) {
 		for (i = 0; i < DE3_MIXER_UNIT_SIZE; i += 4)
@@ -598,7 +626,7 @@ static int sun8i_mixer_bind(struct device *dev, struct device *master,
 		regmap_write(mixer->engine.regs, SUN50I_MIXER_FMT_EN, 0);
 		regmap_write(mixer->engine.regs, SUN50I_MIXER_CDC0_EN, 0);
 		regmap_write(mixer->engine.regs, SUN50I_MIXER_CDC1_EN, 0);
-	} else {
+	} else if (mixer->cfg->de_type == sun8i_mixer_de2) {
 		for (i = 0; i < DE2_MIXER_UNIT_SIZE; i += 4)
 			regmap_write(mixer->engine.regs, i, 0);
 
@@ -611,32 +639,8 @@ static int sun8i_mixer_bind(struct device *dev, struct device *master,
 		regmap_write(mixer->engine.regs, SUN8I_MIXER_DCSC_EN, 0);
 	}
 
-	/* Enable the mixer */
-	regmap_write(mixer->engine.regs, SUN8I_MIXER_GLOBAL_CTL,
-		     SUN8I_MIXER_GLOBAL_CTL_RT_EN);
-
-	/* Set background color to black */
-	regmap_write(mixer->engine.regs, SUN8I_MIXER_BLEND_BKCOLOR(base),
-		     SUN8I_MIXER_BLEND_COLOR_BLACK);
-
-	/*
-	 * Set fill color of bottom plane to black. Generally not needed
-	 * except when VI plane is at bottom (zpos = 0) and enabled.
-	 */
-	regmap_write(mixer->engine.regs, SUN8I_MIXER_BLEND_PIPE_CTL(base),
-		     SUN8I_MIXER_BLEND_PIPE_CTL_FC_EN(0));
-	regmap_write(mixer->engine.regs, SUN8I_MIXER_BLEND_ATTR_FCOLOR(base, 0),
-		     SUN8I_MIXER_BLEND_COLOR_BLACK);
-
-	plane_cnt = mixer->cfg->vi_num + mixer->cfg->ui_num;
-	for (i = 0; i < plane_cnt; i++)
-		regmap_write(mixer->engine.regs,
-			     SUN8I_MIXER_BLEND_MODE(base, i),
-			     SUN8I_MIXER_BLEND_MODE_DEF);
-
-	regmap_update_bits(mixer->engine.regs, SUN8I_MIXER_BLEND_PIPE_CTL(base),
-			   SUN8I_MIXER_BLEND_PIPE_CTL_EN_MSK, 0);
-
+	sun8i_mixer_init(mixer);
+	
 	return 0;
 
 err_disable_bus_clk:
-- 
2.46.0

