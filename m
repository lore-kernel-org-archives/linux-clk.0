Received: from fout6-smtp.messagingengine.com (fout6-smtp.messagingengine.com [103.168.172.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 943E81AB91B;
	Thu, 20 Jun 2024 11:34:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718883251; cv=none; b=DK8ihdlkIZaXCn0VufeeAFYuTeeHTtKdK/mACITWuQVwtKCG+smp9ZTezyow6ghKt3/BSjETHsHJHuFx09uXKy0SdbaAb4C4ZioAjCoAOBwPCQY/DGwX2Gk/UaQr7BqeF8gHhYNmG53/EA7kIl7be+r1ZkMbR8ZizDSzn5IWMz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718883251; c=relaxed/simple;
	bh=eEd7MAOppw+QYk1fJEgHtcHuNqeZIFWAlYYqvZXDjLQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dC7ZERZJpCOi313JtVywI82OhRhTDX7AGKEP+XQ5Cf9qRkbLPbcykQReVAb0vZzDcVtJB5HSgD6DIUyFd8zpZNmOcFFUtDCA7fy2Tp/2xo7sP16qDRoJpTWsd8xrznmpjfhVQREjI5xjxieEv/uDku4mny+ajdj76kiBkSYhXTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com; spf=pass smtp.mailfrom=testtoast.com; dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b=F3WYIjou; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=ux9TMxwp; arc=none smtp.client-ip=103.168.172.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=testtoast.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b="F3WYIjou";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="ux9TMxwp"
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailfout.nyi.internal (Postfix) with ESMTP id DF2F01380503;
	Thu, 20 Jun 2024 07:34:07 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Thu, 20 Jun 2024 07:34:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1718883247; x=
	1718969647; bh=W54qNAIgfswH0qufxPq1pk+nBXXlOeRKiKQkbLO+VCU=; b=F
	3WYIjouU0phOqu7Gv0kkUbllmmHf3UR4+MN75E4C5wNYjvURXQq5TmikpGAeLGyd
	j1UV3y1uv7Y8TUylf9kl8hFOkHh4Ge2pd2kga4rnODtzMIy1gQ1t5crBcQ0Pti8d
	I06eEorbJlckew8GjuS2Oh2u728KnVSQDdg4NABrqt+IqQVz68gqY58g0iTUMRR0
	MLIae7qjztAGqdSbNKc5Xj4wI7A0BO+HlzTtJhdzJ0iR6th4Yh+AUX9/gu1ASXlp
	YhQBrEaFkV4Z22jBiX2fmXXvmZm1r2I59XEY85i2+D7CgPXOe7lj+jDrriVqKp84
	bWbhsPwsEFTaKYocERbgw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1718883247; x=
	1718969647; bh=W54qNAIgfswH0qufxPq1pk+nBXXlOeRKiKQkbLO+VCU=; b=u
	x9TMxwpFZJg6zHd41C7yQl39p8Ugy9TPVpqvKYZT+yizmX2RxgSi8rKfYAoEF40r
	WJkkdlM5ywXhabnQPqmeMe5+6J3YzGtuIp92J60t0yZ4essIQWcAWljnfR/ZAz28
	9gTYrQyww6yiBn3xB2tlxcayRqVgwjizYAWjFIJAjK/l4O1LyEU1sSFClL8QF7Us
	VDs/PTx8L8nQtKaw61OiH0bI5gCNlt/Jt2GNOP7RZ/l5gP56hx0ZVydbTG39dMvH
	ax1MCqwCqCy3i5teQNBvFglyjI0jTTCm5XpsfaoRUA/JRNZ9DvsbMk7ysssXh6/b
	R+gfdKAyjisnbEIqbXTXg==
X-ME-Sender: <xms:rxN0ZnmEofRWCC1hoBKEIG5LQ14KmJPEon33Reyyxm6oOYitCQ47_g>
    <xme:rxN0Zq05TJtgs6PbvQGrmvqpNe3HLhUh3hM3wTAZKurbx_69t1artJU053C734GUC
    lJT3F3i8EFsNDkynw>
X-ME-Received: <xmr:rxN0ZtpUIsS3aK3SZ_NQB2OwxH9hgL6L03IujGXXvOpEnrYk6fIESX2IgE-pQlNcjiI2Ou5aO7RFnIihjN2Vtin1fPUFlrKjksFKy7wtBxWSVZrP>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfeefvddggedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomheptfihrghn
    ucghrghlkhhlihhnuceorhihrghnsehtvghsthhtohgrshhtrdgtohhmqeenucggtffrrg
    htthgvrhhnpeffheeiffegtdfgffejteevgeefkeelieelkeevueetffetteduffevgeei
    ieehteenucevlhhushhtvghrufhiiigvpedvnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hrhigrnhesthgvshhtthhorghsthdrtghomh
X-ME-Proxy: <xmx:rxN0ZvloteQmCwm0m7nkVh86ROBwuurY3y6h1DJ7w-6Ktl6aVif3ew>
    <xmx:rxN0Zl0sXU1l-qUVuNy-qBLXp-BOo7sI0YRSv2M9kaIOwtC3_RKWQg>
    <xmx:rxN0ZusNKrM5bkqJz_ldK_6T93kAvTUrkvrXEx8EebIfWCd2ZNAGjg>
    <xmx:rxN0ZpWgqiIW6oX2JF_g4ChD5n5yQ8byBB8iYVDeJpf67e_WWAJRzg>
    <xmx:rxN0ZjlPt43TzsVKsFQqXss-WYyl1yRDfK_9nTYke60YwmXBWkd4bOnO>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 20 Jun 2024 07:34:02 -0400 (EDT)
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
Subject: [PATCH 21/23] drm: sun4i: de33: vi_scaler: add Display Engine 3.3 (DE33) support
Date: Thu, 20 Jun 2024 23:29:59 +1200
Message-ID: <20240620113150.83466-22-ryan@testtoast.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240620113150.83466-1-ryan@testtoast.com>
References: <20240620113150.83466-1-ryan@testtoast.com>
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
 drivers/gpu/drm/sun4i/sun8i_ui_layer.c  | 19 +++++++++++++++----
 drivers/gpu/drm/sun4i/sun8i_vi_scaler.c |  7 ++++++-
 2 files changed, 21 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
index 7f4d4dcfdc03d..1649816fe435e 100644
--- a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
@@ -146,12 +146,23 @@ static int sun8i_ui_layer_update_coord(struct sun8i_mixer *mixer, int channel,
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
+			sun8i_vi_scaler_disable(mixer, channel);
+		else
+			sun8i_ui_scaler_enable(mixer, channel, false);
 	}
 
 	/* Set base coordinates */
diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_scaler.c b/drivers/gpu/drm/sun4i/sun8i_vi_scaler.c
index e7242301b312c..9c7f6e7d71d50 100644
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
@@ -845,6 +847,9 @@ static u32 sun8i_vi_scaler_base(struct sun8i_mixer *mixer, int channel)
 
 static bool sun8i_vi_scaler_is_vi_plane(struct sun8i_mixer *mixer, int channel)
 {
+	if (mixer->cfg->de_type == sun8i_mixer_de33)
+		return mixer->cfg->map[channel] < mixer->cfg->vi_num;
+
 	return true;
 }
 
-- 
2.45.2

