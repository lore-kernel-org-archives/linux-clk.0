Received: from fhigh-b7-smtp.messagingengine.com (fhigh-b7-smtp.messagingengine.com [202.12.124.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63B961EB193;
	Wed, 28 May 2025 09:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748424320; cv=none; b=QQKZWM3URoxtLAntHlm82CB/0DPE6mkOXfh3U72V06GJNt+3TWU9ZzUztIhq+Zm1JBkx8fu15+Fwod2wCweErJOWHMzwMkoA2FNOiwuqI0r6KIKgOkUA49w3kbNGKTNtlxfVAxZau7fdBdei0a5Fl536uqJpnb8n090jcYLc97I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748424320; c=relaxed/simple;
	bh=pDmGlWUT3BuKq4fhLpTvx+Ib/U/SY+j/MdXgA/RX3+M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UxvSZHWjXgdgbi2MJ5MLjthw/OMKbNgNaPR9fBbDswdDg0JD3oNYjlnB1m2Xjpi8P3vTixgLlsETqEE97xaJhDnJv/ESr3ww/QSvF/vzc706DylZdrpgL0dcs+5k68pMxGlMaTw9o4f+lAL1/njKFDyjSgWrIqL2gmMYJMpoz18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com; spf=pass smtp.mailfrom=testtoast.com; dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b=WTMONFNd; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=bc1tazAy; arc=none smtp.client-ip=202.12.124.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=testtoast.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b="WTMONFNd";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="bc1tazAy"
Received: from phl-compute-12.internal (phl-compute-12.phl.internal [10.202.2.52])
	by mailfhigh.stl.internal (Postfix) with ESMTP id F298825400C6;
	Wed, 28 May 2025 05:25:16 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-12.internal (MEProxy); Wed, 28 May 2025 05:25:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1748424316; x=
	1748510716; bh=AGRbgwnu43wR94o4/1WLfC/tXsGewtbb/Wv0gr76o5w=; b=W
	TMONFNduMJdlIwORoEjnXD8D9DGpwhtnZU+SKPK21HrIH6s9MP2jYSoiO51h80ug
	ysXmrbQLrLtLOYcVW18enTC1/IdWiFum/SjK03Hekeo8Om1LBnZwko+8cyXV/5iG
	D/ERCXaFuNtHqCNDh4h9SvaDdtWkV3Woll278Jowzw8xKmqfyGVsmf0dlF5vmHrT
	mpMpyLEMWRCbt0TaebLbsAIwj3CLQ60s4EgfsIY9H7DSbRK2+Nr2qvp7J2l74CWI
	XOmi5o77NRyDr0WTzjnzF83znxJsXcWTxTWXuOE/Zfj8nzZWIOo6wzYYvrZItAO1
	MjSAGDroYF9a8oHUUBlOg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1748424316; x=1748510716; bh=A
	GRbgwnu43wR94o4/1WLfC/tXsGewtbb/Wv0gr76o5w=; b=bc1tazAyGHTKMkVRN
	WmFqpjAi2KgjTRDlAO5BzMFTuwLs01vG5wrQ0+fc8bflaGczn+aCEJdhpRs38MZt
	+dCdv30Q7Ar7lSAU7JFWS+9I6qs0wS9ipzr80R4XuOXPOLTQe5Y0j4L7NABGhLYz
	qm3wXdwcLYYvVPfGaKXYd+BwrB3ZAUMbGgJXRDBRVZskr4Y+XMIpP2a4PtxJpcwa
	dhn+Ex4GlSTnjhirj/ByNyO99+8nuFpqeerVElX4edAl8fZdfCzukFM4zlSEStU2
	/NTaYWaEcnJsLMjDYzJvdlNQ3lwzZGkk9NziXJVGiUk608zb6nkEuX4jYMYNV1b6
	tIXZw==
X-ME-Sender: <xms:fNY2aFwD38Leg99a7qin-CpnK_N8u0WEO0wLO6ycg9-0iK3y00S7ng>
    <xme:fNY2aFQyv373gx6NWLg8QLSrU3d6B8yTfvVmJ4OcgTjjpcNMawj-KrO7_KyLrzl3I
    7fEOefBRBXMbtdo9A>
X-ME-Received: <xmr:fNY2aPU9cPOHJgHJmwDGoyT61kUFi1GU1GI6NZD6FLk-Vs_egipCQpuximrBtgItV3HpZ0-csfsW6mJg6LgpW6cvHuc-Ug6BekQv3ozZ0Oo2>
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
X-ME-Proxy: <xmx:fNY2aHjrM1c1-IUv1TC7pgW45UqQCItPt6vVm865y-8wJnUmZv09qQ>
    <xmx:fNY2aHDWjCVom6dKAbMGN1boM3Tm49pttejYnOqY8skWIKugdq6gnw>
    <xmx:fNY2aAKKxtWbVzMxZGIq4bOWy0c0RtGAiQn34mrVurZ2DODmbs8YHg>
    <xmx:fNY2aGAg_M1kJGxn_MyjnAv27AOGLopIYuVzqmFEzobaE--1dKcJVQ>
    <xmx:fNY2aEohDPDVe6bF7YnqcFYx4sxqsKUO9Ers3dMV8rsgxW2OgpOlvkqD>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 28 May 2025 05:25:10 -0400 (EDT)
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
Subject: [PATCH v12 2/8] drm: sun4i: de2/de3: refactor mixer initialisation
Date: Wed, 28 May 2025 21:22:07 +1200
Message-ID: <20250528092431.28825-3-ryan@testtoast.com>
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

Now that the DE variant can be selected by enum, take the oppportunity
to factor out some common initialisation code to a separate function.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Signed-off-by: Ryan Walklin <ryan@testtoast.com>
Reviewed-by: Andre Przywara <andre.przywara@arm.com>
Acked-by: Maxime Ripard <mripard@kernel.org>
Reviewed-by: Chen-Yu Tsai <wens@csie.org>

---
Changelog v1..v2:
- Combine base register allocation and initialisation in sun8i_mixer_init
- Whitespace fix

Changelog v4..v5:
- Remove trailing whitespace

Changelog v7..v8:
- Remove CSC configuration changes (logically better placed with future YUV support) making this the first patch in the series.
---
 drivers/gpu/drm/sun4i/sun8i_mixer.c | 64 +++++++++++++++--------------
 1 file changed, 34 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c b/drivers/gpu/drm/sun4i/sun8i_mixer.c
index f5368761aad9..fd2650153492 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
@@ -425,6 +425,38 @@ static int sun8i_mixer_of_get_id(struct device_node *node)
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
@@ -433,8 +465,6 @@ static int sun8i_mixer_bind(struct device *dev, struct device *master,
 	struct sun4i_drv *drv = drm->dev_private;
 	struct sun8i_mixer *mixer;
 	void __iomem *regs;
-	unsigned int base;
-	int plane_cnt;
 	int i, ret;
 
 	/*
@@ -534,8 +564,6 @@ static int sun8i_mixer_bind(struct device *dev, struct device *master,
 
 	list_add_tail(&mixer->engine.list, &drv->engine_list);
 
-	base = sun8i_blender_base(mixer);
-
 	/* Reset registers and disable unused sub-engines */
 	if (mixer->cfg->de_type == SUN8I_MIXER_DE3) {
 		for (i = 0; i < DE3_MIXER_UNIT_SIZE; i += 4)
@@ -551,7 +579,7 @@ static int sun8i_mixer_bind(struct device *dev, struct device *master,
 		regmap_write(mixer->engine.regs, SUN50I_MIXER_FMT_EN, 0);
 		regmap_write(mixer->engine.regs, SUN50I_MIXER_CDC0_EN, 0);
 		regmap_write(mixer->engine.regs, SUN50I_MIXER_CDC1_EN, 0);
-	} else {
+	} else if (mixer->cfg->de_type == SUN8I_MIXER_DE2) {
 		for (i = 0; i < DE2_MIXER_UNIT_SIZE; i += 4)
 			regmap_write(mixer->engine.regs, i, 0);
 
@@ -564,31 +592,7 @@ static int sun8i_mixer_bind(struct device *dev, struct device *master,
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
+	sun8i_mixer_init(mixer);
 
 	return 0;
 
-- 
2.49.0

