Received: from wfhigh3-smtp.messagingengine.com (wfhigh3-smtp.messagingengine.com [64.147.123.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AD3D186E2E;
	Fri,  7 Jun 2024 11:03:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717758223; cv=none; b=B9F+aCm9ED0pluLaAcEGeMIrrFxzqEkJK7IVa9JvozX3KtFG/aPLEPMZK0WoZ0yFsonTscKw6x/rrEz7Mw6TFBnmzsag5tvPuSj/6yV3Ek7PjrkAqO4mQSjqwiKjq3kuEfzrtiNh7d/vbmkZH8YMetX3mTCcx3GkPs/HCH5spkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717758223; c=relaxed/simple;
	bh=8YVfwSNlzB/6d5RaR+RT5eC2BqDILP0+FvJzvg4U7/k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AXVkksEQcDBVCufWrhVHKa5E/UfkBSDxr2/cwMjEd6CwnvOVYSfv7apl11v7iDTyJG4UR38yV9eljEUeG0ZpeE+Eqi9zd6XAOx2o9jp26M/8wAEkHCVmsHRsUzyJQE4dAFb/9bOhQ1Ru6FVuYS7hawGyxfBZRZq8zEymvkqp+/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com; spf=pass smtp.mailfrom=testtoast.com; dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b=MVhQlOdi; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Xn8NF316; arc=none smtp.client-ip=64.147.123.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=testtoast.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b="MVhQlOdi";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Xn8NF316"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfhigh.west.internal (Postfix) with ESMTP id 673AD1800147;
	Fri,  7 Jun 2024 07:03:40 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Fri, 07 Jun 2024 07:03:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1717758220; x=
	1717844620; bh=nWXLocCMt7EGKg67iVS/7BHF4d4/LJP7o3vbPwq3pQs=; b=M
	VhQlOdiOduCbARtTMY6/oLGGl07FCkTXu9PfS91iiOtugXaM6rDxtrqxb46hzTn5
	io+N40jYwd6qRVZq4TffxbW0ZMisgyE0JRNctuc9C+imoo7yPKHqjdsltrXyAE/g
	5YG+jMQ8yBsu5pL0jXARSPLZwQ+cOjln9f3N/shVUt+n4Tz00a4gubrq69Nc7nLB
	Imn25mAA4BcnYy+w69MNZpPmrruLgM6X5h7a9zWfujRl/KQxVEn8JvLD44+D9Blp
	tS7dATqABXrlYXc98i4da2B3i4RBuJVr+zq/V4YyA+h0hbZ5RZGvZkXmAVjaGtej
	ledd0uuPZ80yVbcmLq7ig==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1717758220; x=
	1717844620; bh=nWXLocCMt7EGKg67iVS/7BHF4d4/LJP7o3vbPwq3pQs=; b=X
	n8NF316A2olzLw6+CuSBvhkPP4lQlty+gahCsZW5GYs2L750CdDgXy3/+WelKSM8
	+7wqvbb9N0Ic23cDRaO+2ViTr5frOFQD+E7MYji7ozbQepyNzXTqgj4kwBCjJTig
	6YcuqdkMDTVSiS42fod7Ro42FhgDvq3WqGlNyb4Yriap1wAE2AQTktViKdLWRKaB
	DxydE/mSAvMpA9zqEM39YErvM+oGW3u34duHbFZRPzMYaMAopjXBZWYBRWMuZDMg
	kp21/Yj58Q7k1kwVINGGqpCk3lDBOGSJDKOa/g01G+AxWCan9SY+qSq7q2scltWu
	A+XqSgHgyddrKjgEuzqxQ==
X-ME-Sender: <xms:C-liZgs6ZYsYrXFGdZBuneZnjFWdWk0Z_7fhsd9qrpIpQgg1qSJWdQ>
    <xme:C-liZte0WaAPHfiEDCKvpgfp0paS9qNbv6z_LQrQLDxGMvlOA3mSzS6zXaDviNnBi
    WbIEFJYaDSDthoBYg>
X-ME-Received: <xmr:C-liZryBP_4et8L_nYsf3spNHbQ1N8QKvxjG8ec8tZw9noL5rpHEpwnOYL4c6VFtbdhhsGhTDg1auht1qMTpJlNjnFXmIvUuvSe-wPx5OO5JIbUV>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfedtuddgudduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomheptfihrghn
    ucghrghlkhhlihhnuceorhihrghnsehtvghsthhtohgrshhtrdgtohhmqeenucggtffrrg
    htthgvrhhnpeffheeiffegtdfgffejteevgeefkeelieelkeevueetffetteduffevgeei
    ieehteenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hrhigrnhesthgvshhtthhorghsthdrtghomh
X-ME-Proxy: <xmx:C-liZjORzDXES8661nVNSdxKQTwNtmvhLOhgcfmUhD-AR4IB_6WNOQ>
    <xmx:C-liZg9p1QOpbWSqUBEhNhFYFpGsGNtQHRufDrY0enawwi2JQkiXOw>
    <xmx:C-liZrXR-7rlIuGfp6e8lUF8qwS99CEsAKm-ppJXjDL9zhXu67vjOA>
    <xmx:C-liZpd5GpdlJDFHrYDLnl1a-b8FKrx1T0rGQb_Fm6ebbYLoZ6q27w>
    <xmx:DOliZss1rxzJ-M70V1a9UwGCEbKUfolz7mgCvy-Mrs9DHx54g_qWx84M>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 7 Jun 2024 07:03:34 -0400 (EDT)
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
Subject: [PATCH RFC 5/8] drm/sun4i: de2: Initialize layer fields earlier
Date: Fri,  7 Jun 2024 23:00:01 +1200
Message-ID: <20240607110227.49848-6-ryan@testtoast.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240607110227.49848-1-ryan@testtoast.com>
References: <20240607110227.49848-1-ryan@testtoast.com>
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
---
 drivers/gpu/drm/sun4i/sun8i_ui_layer.c | 7 ++++---
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c | 7 ++++---
 2 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
index 884abe3cf773a..91781b5bbbbce 100644
--- a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
@@ -365,6 +365,10 @@ struct sun8i_ui_layer *sun8i_ui_layer_init_one(struct drm_device *drm,
 	if (!layer)
 		return ERR_PTR(-ENOMEM);
 
+	layer->mixer = mixer;
+	layer->channel = channel;
+	layer->overlay = 0;
+
 	if (index == 0)
 		type = DRM_PLANE_TYPE_PRIMARY;
 
@@ -395,9 +399,6 @@ struct sun8i_ui_layer *sun8i_ui_layer_init_one(struct drm_device *drm,
 	}
 
 	drm_plane_helper_add(&layer->plane, &sun8i_ui_layer_helper_funcs);
-	layer->mixer = mixer;
-	layer->channel = channel;
-	layer->overlay = 0;
 
 	return layer;
 }
diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
index 6ee3790a2a812..329e8bf8cd20d 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
@@ -549,6 +549,10 @@ struct sun8i_vi_layer *sun8i_vi_layer_init_one(struct drm_device *drm,
 	if (!layer)
 		return ERR_PTR(-ENOMEM);
 
+	layer->mixer = mixer;
+	layer->channel = index;
+	layer->overlay = 0;
+
 	if (mixer->cfg->is_de3) {
 		formats = sun8i_vi_layer_de3_formats;
 		format_count = ARRAY_SIZE(sun8i_vi_layer_de3_formats);
@@ -607,9 +611,6 @@ struct sun8i_vi_layer *sun8i_vi_layer_init_one(struct drm_device *drm,
 	}
 
 	drm_plane_helper_add(&layer->plane, &sun8i_vi_layer_helper_funcs);
-	layer->mixer = mixer;
-	layer->channel = index;
-	layer->overlay = 0;
 
 	return layer;
 }
-- 
2.45.2

