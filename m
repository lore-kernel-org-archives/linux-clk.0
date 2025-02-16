Received: from fhigh-b6-smtp.messagingengine.com (fhigh-b6-smtp.messagingengine.com [202.12.124.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D9C814F9C4;
	Sun, 16 Feb 2025 08:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739696172; cv=none; b=MPesl1dl4Y7ZmqUluy38OdeQJ/bbm1HFnSg0nQWggzgzQ6wOrgAlhAelfne6p19VSnqzh7QL+47UJq4T0+qNo7k5r10gS72gBeLipKjtmG9jHK8HWX9yBx9zA39NidXosV35u6qHiwsUprQmeN4UcoEc5zCIMIRSvW+0qXcexUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739696172; c=relaxed/simple;
	bh=+USZhEErcfV+oKUZN5CFx0nzuhAy9TyuXFNKfZ1kxQo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lhnR3pmDDyePDWi3Z6MDoMr4mTnf6hvhqiYYDo5haNJA8EmVQlPRL7uf8upqYhBeJFgP+3plCyhD3GCjDcL7qgfo0sVHFwh61hn86Xa5wTX5YjciRloHoBayy9lLHpfji2p70I8dDFNjs4hg75Czyc4kN7X2UW4AegVsqOuUlLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com; spf=pass smtp.mailfrom=testtoast.com; dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b=VS4/Eb5e; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=OubSzS74; arc=none smtp.client-ip=202.12.124.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=testtoast.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b="VS4/Eb5e";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="OubSzS74"
Received: from phl-compute-07.internal (phl-compute-07.phl.internal [10.202.2.47])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 17E5D2540108;
	Sun, 16 Feb 2025 03:56:09 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-07.internal (MEProxy); Sun, 16 Feb 2025 03:56:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1739696168; x=
	1739782568; bh=LJb12UNrcw1b4CXj7oJwE7645Xi4wHyCdBE0N2smQ2w=; b=V
	S4/Eb5eg86A/ExKld8MfM+M8fJjlvOfPwy8MVG5mAWSCImW0ayNXWCM9x+SWuqhi
	ncFzzsrtQ7tWWYk3sylQGpbDRyeugIvUid/8F7RjjsS0VgjHlmUuxkknCQs3w1ta
	ADVGdKvkU9fohP7xMh2mdj2pqbjacth8KB3nDzlzit1tTTHX4jNUwM5UdA/ReNv0
	jxWtrhUChOIE9gUImC0cWmIP7pT0UTxOs1DPR7a/nTfMAQDlw+2lgHQ06Cj0bFCf
	uBGl435AIgiqOJFWJdOjQ4rtWdnDhZGkMbaCLkNkd/o4mgD+8MWHzfPJp6967qzO
	T90s1FHWmgLVKnq8kJ3Hw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1739696168; x=1739782568; bh=L
	Jb12UNrcw1b4CXj7oJwE7645Xi4wHyCdBE0N2smQ2w=; b=OubSzS74pOYLzIHtj
	1QV8R/HySGGM8QBnUc883vge3XL4reOurpG84GIPSCE4fXXTGqGwa4kqhLWIUXyL
	ic6Ax8hgcF/Mv0SUoeOOeDXptqvqUyvN4lWFdHJaIpRScv738SM/afeJnXN1Gr74
	+ZqAhaGwvKq90onTJXg6TFoJQkHQhjyGfuLqB0ItGBvXg4Ys4Q2FpoUn34V6LNZl
	m5Y6b7uNbXDvtuWqBiEM2KJkXKO7q9JP5RD1OVFOHAte3q7hHL6MtFFv8Smyh6cc
	TSXvCENQ8ZXGfapJcQafTTVm7NjXWUui0xtF7uUsxEtzEe3GmjQA6LfoO7Jo847u
	jtxFA==
X-ME-Sender: <xms:KKixZzpjfkfWyCgMc-2bR0l4vsPMgUvC9oykmmLBoPKzdXaowz9l-Q>
    <xme:KKixZ9p3ZAswYQe2az6gjdCcFHwW-8N8ZJofPy_TyN2FTkJf0nlAKZMLS7JgaUMXd
    7U-WbdlVXSFSR7X8Q>
X-ME-Received: <xmr:KKixZwM8zZ238I10KHOnAjJRrIfUjHy6EDa1F1ZEOfdhHT9asR6n2NtRiEhmkkwiVyO7SOp22Ol1o34OlWur5IHOrR929_y8oFIjL-UcnmVe>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdehhedtfecutefuodetggdotefrod
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
X-ME-Proxy: <xmx:KKixZ26r9MVv99z0iPbq_Aj12dQYugAQjnCdilG9oT-SiDLrYGR_Tg>
    <xmx:KKixZy6W3cQO6-eeYWzntoMKBt3mPY6kud8nZGxMG7jY38zGaKH-_Q>
    <xmx:KKixZ-jhlL5aFu9epQ0MaRFWrjpqbnhQPqooVfmYvC91EGcnSFtoYg>
    <xmx:KKixZ04x2MyakkPweMNsP4XGpxROum2oKSuw7pJBWuKioPbV-ihe2w>
    <xmx:KKixZ6pbycH51zBur1K8hL4UReHD91iQvqMAZjfakbj4QCA1-2mmtnI0>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 16 Feb 2025 03:56:02 -0500 (EST)
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
Subject: [PATCH v6 04/27] drm: sun4i: de2: Initialize layer fields earlier
Date: Sun, 16 Feb 2025 21:50:35 +1300
Message-ID: <20250216085432.6373-6-ryan@testtoast.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250216085432.6373-2-ryan@testtoast.com>
References: <20250216085432.6373-2-ryan@testtoast.com>
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

