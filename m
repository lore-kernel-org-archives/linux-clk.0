Received: from fhigh3-smtp.messagingengine.com (fhigh3-smtp.messagingengine.com [103.168.172.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AB98156F5D;
	Sat, 21 Sep 2024 09:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726912371; cv=none; b=jMqLydA2AdQfdQjNIH+61QB87rIibkg92lvbJ11ILKUZVCqsxO7Zt0onIqWrBC4CktNYNSX/klG8BvPSGM0tgmmfXBJ16eHEE+hxYaMpNXAKDVzropBJfdSNp3QX8d+CXp0AENk7Kw6sZFjXmhO+JbVTalu6OY2VTzfiLk92kpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726912371; c=relaxed/simple;
	bh=5N7dKt3+JRM4U7IvBaBa1K71v9qWqjKB54iGk7SerSo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Kh+P96adXVLyDI8Bv9PbNUYJgJDqX63oQsRo6TQz0WE+G9Bq5V08RVFD2VhhoQlrEYFgv5yQnCvQ9vOK4CP1D/W1FZBuSmJhgpT7wHnrmN9KefsicZBPjZHO8Y/xE6/xOlTjhVDCJ4QpHwKQvHYklHgraDy+dVDCbWA3ZHzxb/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com; spf=pass smtp.mailfrom=testtoast.com; dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b=uwswMxnJ; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Ogc+tI7k; arc=none smtp.client-ip=103.168.172.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=testtoast.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b="uwswMxnJ";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Ogc+tI7k"
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id ED0781140253;
	Sat, 21 Sep 2024 05:52:48 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Sat, 21 Sep 2024 05:52:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1726912368; x=
	1726998768; bh=nay3ZyN0cN/80lVEv9bgr4vS0wpneM/GiqVSWG6S8J8=; b=u
	wswMxnJRVGPk1w0GshhQ3R16g7oTbJ/m6qkHiHeQcBdMAC3yfKzGw6oo194ROMsK
	qeY5TABEliiPacbLsqt/sBOVpyDR7GOFdzxVsffUFvUBESd4NPQj/4sGyeyCDa9p
	kMUYkJnzC/oNOu9Q3gTgeD67bGyDfDbNbGFvkPYfGDPrmmM9ITcQ2x6/mjwFkmu9
	ud8lyRK2iL+M0J6+25qWV58K+ut3Ct0GqI4SoW5btABX4rKrmbSIY1KgsOZLX2OT
	03pBz+rzHuv6Z7YAc/ZGXIGee2NUa31dcenZpOTdpqxWuC7gWwAL7CCK5SEJuGi7
	q+TxAkCfiNSj0MnIqUaAA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1726912368; x=
	1726998768; bh=nay3ZyN0cN/80lVEv9bgr4vS0wpneM/GiqVSWG6S8J8=; b=O
	gc+tI7kx3oco+4QyFzLhXet0hno+iwlIg/TQeOi42k9bcFl/Bpz54Y8Og8As/DEC
	TBHqry5oOPjlqCvJdtvBGgPibntLtHO0Pzc0yU1ELH3nhsZwe/2x4aTHfFTSaIfv
	AOGZe7eBbpKN4J8VQJSj9HSJq7iFRH6fUupYxM27z0ANWrR9kM7NCHxQxEAkb+tq
	nTtft4hyrklyrJSMBKf5q85Dz7VhYvFjyO/IoJdnyAG9j4dKLPPZZ+ctyfeKDr1r
	sm0Bs9keXr4EVy3MQAN++OCByZaY8+6ZbulE+qaDdoI1pFsjoQ33BXk2BpZc6XIE
	jqwBnhqUs56blB2HaPoKw==
X-ME-Sender: <xms:cJfuZqLG8PHGnTGjn16fuYhpnlxIWuAXYWbwIQgz6YmlS7GdbYP3fw>
    <xme:cJfuZiI7SDe0XShkZunfLC7vModL5wOVFfiZIk5sEdjidvNZqso13zpoClQMBIfa2
    QqU-CDhONO3HyqR3w>
X-ME-Received: <xmr:cJfuZqsRmmVJmrthHlr5RZIcH1-r0w37qFe6kwWaAtEWCOX4JOQVcBHvvwvZdQnbwT6rcHA7U6Mx3nFcKLMQ_8789PB5rIDv_qS_JqUsV_uSDeCc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudelhedgvdduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttden
    ucfhrhhomheptfihrghnucghrghlkhhlihhnuceorhihrghnsehtvghsthhtohgrshhtrd
    gtohhmqeenucggtffrrghtthgvrhhnpeffheeiffegtdfgffejteevgeefkeelieelkeev
    ueetffetteduffevgeeiieehteenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
    epmhgrihhlfhhrohhmpehrhigrnhesthgvshhtthhorghsthdrtghomhdpnhgspghrtghp
    thhtohepvddvpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehmrhhiphgrrhguse
    hkvghrnhgvlhdrohhrghdprhgtphhtthhopeifvghnshestghsihgvrdhorhhgpdhrtghp
    thhtohepmhgrrghrthgvnhdrlhgrnhhkhhhorhhstheslhhinhhugidrihhnthgvlhdrtg
    homhdprhgtphhtthhopehtiihimhhmvghrmhgrnhhnsehsuhhsvgdruggvpdhrtghpthht
    oheprghirhhlihgvugesghhmrghilhdrtghomhdprhgtphhtthhopegurghnihgvlhesfh
    hffihllhdrtghhpdhrtghpthhtohepjhgvrhhnvghjrdhskhhrrggsvggtsehgmhgrihhl
    rdgtohhmpdhrtghpthhtohepshgrmhhuvghlsehshhholhhlrghnugdrohhrghdprhgtph
    htthhopehrohgshheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:cJfuZvaTAIdugz_mg8_4ANCNWbPPOvLytHG_GEJAtsujf0U5TIRfug>
    <xmx:cJfuZhbIOffah3ba8w6_z8d_uvS0wdgDIQfsQbLZIahOn4U4xItjIQ>
    <xmx:cJfuZrCRjDYnX9vSgIjSilzzwk38zkqKA3woG4YPZujMMWfIRDFtNw>
    <xmx:cJfuZna5m-XKGg05MtUpgkC4WD1RbzO5uK_mOlwa46hFdYdgID1ujA>
    <xmx:cJfuZuLZx_1LXWGi2bocp8O-18fR441BLaTBKieconAvzDtW7jwSSeO8>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 21 Sep 2024 05:52:42 -0400 (EDT)
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
Subject: [PATCH v4 04/26] drm: sun4i: de2: Initialize layer fields earlier
Date: Sat, 21 Sep 2024 21:45:53 +1200
Message-ID: <20240921095153.213568-5-ryan@testtoast.com>
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

drm_universal_plane_init() can already call some callbacks, like
format_mod_supported, during initialization. Because of that, fields
should be initialized beforehand.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Co-developed-by: Ryan Walklin <ryan@testtoast.com>
Signed-off-by: Ryan Walklin <ryan@testtoast.com>
Reviewed-by: Chen-Yu Tsai <wens@csie.org>
---
 drivers/gpu/drm/sun4i/sun8i_ui_layer.c | 9 +++++----
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c | 9 +++++----
 2 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
index aa987bca1dbb9..cb9b694fef101 100644
--- a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
@@ -295,6 +295,11 @@ struct sun8i_layer *sun8i_ui_layer_init_one(struct drm_device *drm,
 	if (!layer)
 		return ERR_PTR(-ENOMEM);
 
+	layer->mixer = mixer;
+	layer->type = SUN8I_LAYER_TYPE_UI;
+	layer->channel = channel;
+	layer->overlay = 0;
+
 	if (index == 0)
 		type = DRM_PLANE_TYPE_PRIMARY;
 
@@ -325,10 +330,6 @@ struct sun8i_layer *sun8i_ui_layer_init_one(struct drm_device *drm,
 	}
 
 	drm_plane_helper_add(&layer->plane, &sun8i_ui_layer_helper_funcs);
-	layer->mixer = mixer;
-	layer->type = SUN8I_LAYER_TYPE_UI;
-	layer->channel = channel;
-	layer->overlay = 0;
 
 	return layer;
 }
diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
index f3a5329351caa..3c657b069d1f4 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
@@ -478,6 +478,11 @@ struct sun8i_layer *sun8i_vi_layer_init_one(struct drm_device *drm,
 	if (!layer)
 		return ERR_PTR(-ENOMEM);
 
+	layer->mixer = mixer;
+	layer->type = SUN8I_LAYER_TYPE_VI;
+	layer->channel = index;
+	layer->overlay = 0;
+
 	if (mixer->cfg->is_de3) {
 		formats = sun8i_vi_layer_de3_formats;
 		format_count = ARRAY_SIZE(sun8i_vi_layer_de3_formats);
@@ -536,10 +541,6 @@ struct sun8i_layer *sun8i_vi_layer_init_one(struct drm_device *drm,
 	}
 
 	drm_plane_helper_add(&layer->plane, &sun8i_vi_layer_helper_funcs);
-	layer->mixer = mixer;
-	layer->type = SUN8I_LAYER_TYPE_VI;
-	layer->channel = index;
-	layer->overlay = 0;
 
 	return layer;
 }
-- 
2.46.1

