Received: from fout-b4-smtp.messagingengine.com (fout-b4-smtp.messagingengine.com [202.12.124.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 550011993A3;
	Sun, 16 Feb 2025 18:37:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739731074; cv=none; b=nuPyzK2TMfVe+cv6v3ZpXmFnbHFFQiPM1lcRB/KsLR7kFI/z+J0p1LFydmie7pUFllpKp2jozw8Fa14fFgQ8nlDp1QfCorpDSCCi8fZiUJMKPJWkQfhlgzz7hP0dc4HxENanx3eWkeApcljU260mUEXJU7sBq1VAb4YalcJ8MB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739731074; c=relaxed/simple;
	bh=+USZhEErcfV+oKUZN5CFx0nzuhAy9TyuXFNKfZ1kxQo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=m/wu4wzFkOnivzpShGjS8fbsffYr7b1pWTRnCiWBvIX5EqjbnffrwJn66+vYHXl+KpQExpXPQrwbeLLi8zepaKRTJBmRQs1jaKAv6LIEgSbEfLZ1F80h9gKpmS3N8zFIVIzH5XVfcFUMQQg1qXTKopI9UrDSSPKw6yYW3dTCLGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com; spf=pass smtp.mailfrom=testtoast.com; dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b=FS6rbJyv; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=02wnCxUh; arc=none smtp.client-ip=202.12.124.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=testtoast.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b="FS6rbJyv";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="02wnCxUh"
Received: from phl-compute-06.internal (phl-compute-06.phl.internal [10.202.2.46])
	by mailfout.stl.internal (Postfix) with ESMTP id 7B45211400B1;
	Sun, 16 Feb 2025 13:37:51 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Sun, 16 Feb 2025 13:37:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1739731071; x=
	1739817471; bh=LJb12UNrcw1b4CXj7oJwE7645Xi4wHyCdBE0N2smQ2w=; b=F
	S6rbJyvmg3Mar38c8UzOgy2/RP9Oc25mB3bZx+jBBR+OjoayovdG7kfo3rlQcsu4
	Yk22xkXha7/bBJFrQmDv3pCrYZf8+bKPUUodb+I2JvLNsHiEL/8Y2CBVYOUMqWDK
	fQkLo9+GVSaxi6jPLwOrbw00ewXRx7Juv01WQVw0x7+o/aa7JkEFlcDs6ObQ1qB7
	nLFnBkfwpiwgEkhDqfGqaxPbRw0XHr+oxyYOVlXA/I80r5Sl32LeR7dnS9Bun+4S
	Z3c7V2uWNZZzhkiq1brDhxC1CXrHgVK3+DeVWN52UvV0jkdualWf9XJUCfCP/UX6
	kP3TblMOxqJX/fPFVjG/g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1739731071; x=1739817471; bh=L
	Jb12UNrcw1b4CXj7oJwE7645Xi4wHyCdBE0N2smQ2w=; b=02wnCxUhwzjbdfSvp
	7vNh0e6PJ9KE4RJTNUeSNggEsSPdljL9bh1ggXKQUaNupyXlJOTdf0FnSCxqy6HX
	xuy6AY9zaRHeVfdB22RiUunIaya1s0nO/RvnyvDK0QidyH8NnvIS59mVk6DG4F1s
	X8eDNgI586G7Ixuk4Ph4OqdaxHr95kmw5TLm+5hQGtB7yr8eLJ15s1lnIFH3M8cU
	YAtSgmX/b8Wx/Nz42inWYQVqOqPqLdSX7R2K5gX/kxZDf+/svqFKLyXaEi4LUQw5
	EceaHPb1Gd/7m0BhGTMgRx16FZzAip/dRUvQi9HeggXIuS4Y2ZZdbI0hH93L7kdg
	CgAQA==
X-ME-Sender: <xms:fzCyZzKOCvGwHBcKkheJFGL9E1SKH-loCMhFiSwgsPq7EGalhrSRyA>
    <xme:fzCyZ3KTTddNzmkUhhetcX7zRNI9e3JMKjrzwDDC75Fz4qnk9mvj0gMwSEw2TXboZ
    kUrkLChXauDIN1DgA>
X-ME-Received: <xmr:fzCyZ7uL-B6nhvsXMZohCyyFKwWXKtx8ktb5s4F1Qpw2uTu8C6F0s38RBIn20k10SPW4qsThQp0FpCXlzeAiIVucCCo0Th2AjEq4BoFkz1pa>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdehiedvtdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddt
    necuhfhrohhmpefthigrnhcuhggrlhhklhhinhcuoehrhigrnhesthgvshhtthhorghsth
    drtghomheqnecuggftrfgrthhtvghrnhepffehieffgedtgfffjeetveegfeekleeileek
    veeuteffteetudffveegieeiheetnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomheprhihrghnsehtvghsthhtohgrshhtrdgtohhmpdhnsggprhgt
    phhtthhopedvgedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepmhhrihhprghrug
    eskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepfigvnhhssegtshhivgdrohhrghdprhgt
    phhtthhopehmrggrrhhtvghnrdhlrghnkhhhohhrshhtsehlihhnuhigrdhinhhtvghlrd
    gtohhmpdhrtghpthhtohepthiiihhmmhgvrhhmrghnnhesshhushgvrdguvgdprhgtphht
    thhopegrihhrlhhivggusehgmhgrihhlrdgtohhmpdhrtghpthhtohepuggrnhhivghlse
    hffhiflhhlrdgthhdprhgtphhtthhopehjvghrnhgvjhdrshhkrhgrsggvtgesghhmrghi
    lhdrtghomhdprhgtphhtthhopehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgpdhrtg
    hpthhtoheprhhosghhsehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:fzCyZ8bspLzcTTI8EgAW2CPRn8vwC4rNL3DdlYob1rozfjRNGYo6RA>
    <xmx:fzCyZ6Z4vrW_3Viec7dP6K7TCKZonoy0GX1nwxpmaKeqNTP04crSjw>
    <xmx:fzCyZwAfbTDyrTUPy2C3GlBiZmhhMzTHD_IXqBZfvUfeIQAjy9QQSw>
    <xmx:fzCyZ4bE7a7ZWOCtvQKv_0JF5vpzlyh5zNTWy91O4fIU1y3fNvlOhQ>
    <xmx:fzCyZ2LnLjg8EUjI6KCvn016dDn8jfQuH9O2YlKyDOiyrVOtKquxmUjP>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 16 Feb 2025 13:37:44 -0500 (EST)
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
Subject: [PATCH v7 04/27] drm: sun4i: de2: Initialize layer fields earlier
Date: Mon, 17 Feb 2025 07:36:04 +1300
Message-ID: <20250216183710.8443-5-ryan@testtoast.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250216183710.8443-3-ryan@testtoast.com>
References: <20250216183710.8443-3-ryan@testtoast.com>
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
2.48.1

