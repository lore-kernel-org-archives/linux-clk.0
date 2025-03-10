Received: from fout-a1-smtp.messagingengine.com (fout-a1-smtp.messagingengine.com [103.168.172.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 231C8224AF8;
	Mon, 10 Mar 2025 09:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741598717; cv=none; b=HI6nknqaKnyPiedYH6hRqgScRdp82goL/SH0aP9LoVIRbnOiZwjlxd/geess+3sGJzluvX7PE8Ax9B1LAfa0Ehsy7Q8ROrnHFkOA2jMrZUUfihevTn/0QtFQYKg+VegjzizaoZPpAxSaxV85M1ikRypifnHiBbiTjuIjc9Ivnkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741598717; c=relaxed/simple;
	bh=EQT37SJh4CnRj3hkGqL3/4KRmL2bA/LjCpEHqmDddjU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ECJu86yQmC0f3RLSor4S0AxDn36u+WUOjPRrWehGwBdzjq3h9tJE3gKpUXzRkzeFJwji9Mkdy2uVGWKMWNZUFKQ8BkgVLSh8ttpKxBzUxRJKZEqTdQpGKt1or8Z99sQL3mSDeF+/bnD/3MEmCH/gNQS2KOuKbzpXVt0hCmCEV2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com; spf=pass smtp.mailfrom=testtoast.com; dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b=X1YYPJPo; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=M7qRP9MW; arc=none smtp.client-ip=103.168.172.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=testtoast.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b="X1YYPJPo";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="M7qRP9MW"
Received: from phl-compute-11.internal (phl-compute-11.phl.internal [10.202.2.51])
	by mailfout.phl.internal (Postfix) with ESMTP id 288861382D01;
	Mon, 10 Mar 2025 05:25:15 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-11.internal (MEProxy); Mon, 10 Mar 2025 05:25:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1741598715; x=
	1741685115; bh=USkd/Ib75I9pxb47d3WX9uTT5+0P0htoNTIIy0ymwPY=; b=X
	1YYPJPo6K/BWHHZC2GZg5niiYXlwRQfDPTwNv7QfQniTdkCk4iv0Dn8ow/gKn9q9
	lckZ64COIhXWEdAzWC3qkin/OCmHTWDKOI1DywyIkt3zA0Yz8mLkU+851XoOKTcK
	YWfgPZFliCrZwKDT1ItAZBH3zSRbUnZvS2RGgxC6iFLS/cAg+PxVoK7clf5xnN8X
	+hi8Sov4MoIubQzpAmDHAE45Z0w7mDtUCEKu0pde7Y2N1FMwLEQUc8tVkAxjXgWa
	b7glWMqIcA4GpS/QMsqypXqwQxeXyCW0/k35AZUgJP2JvOdC3TKtUMdQ/rjU4fxD
	50hbzouCt9IUorFWwQifw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1741598715; x=1741685115; bh=U
	Skd/Ib75I9pxb47d3WX9uTT5+0P0htoNTIIy0ymwPY=; b=M7qRP9MW0/FOobvg5
	PaJGZMgRrNZ51HfCBWLpNyxVA+V7tJdRo1m8x4I0LRExPDOh+IJUHUucExFTcN/G
	A8cxVJuRkvM5Cl3qHX6m1N+v7AG1O+epKzIyDGcApogqZXkYgR6ECj4/4+m1I0l1
	L1YPZQysS/uC5Ne/z9SeIoiFWCGeCKXQnusUK2MkgPYJYM3+TJj5rZS4/Y2VRWVz
	cqfwGmBalipokC0dpy3CsBMDx2ctQS8halJE/4Z+TLnnrMgB+ie6viBLlfY2G1YM
	K8b2RZDk5vfbMuuHplnF/TYCQ2uXwxh2Z+9xzbuBYV58t7hecJZjb9XXxepxcGxE
	qhLyA==
X-ME-Sender: <xms:-q_OZ1UWP91xASq3FvF2s8LxaqY7WpiFU3yrdAZ4fgP4_1JPvdLeuw>
    <xme:-q_OZ1n8PnZwVesD32ukjHANkPrTKfg3iKywu-XEvuWJl4IzggqXwuiWh5jnbOsbS
    T-FneTaZUO9RGM_HA>
X-ME-Received: <xmr:-q_OZxbA9baeBQdAj0zjYZrNzucupyn7tW5FFGeY776EdGuZa9KdiM63qc7dweVurJv1c_cz5g2my9OpTdc7kaBlVVysy1OCo60EasBpTKhl>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduudekleekucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredt
    tdenucfhrhhomheptfihrghnucghrghlkhhlihhnuceorhihrghnsehtvghsthhtohgrsh
    htrdgtohhmqeenucggtffrrghtthgvrhhnpeffheeiffegtdfgffejteevgeefkeelieel
    keevueetffetteduffevgeeiieehteenucevlhhushhtvghrufhiiigvpeegnecurfgrrh
    grmhepmhgrihhlfhhrohhmpehrhigrnhesthgvshhtthhorghsthdrtghomhdpnhgspghr
    tghpthhtohepvdegpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehmrhhiphgrrh
    gusehkvghrnhgvlhdrohhrghdprhgtphhtthhopeifvghnshestghsihgvrdhorhhgpdhr
    tghpthhtohepmhgrrghrthgvnhdrlhgrnhhkhhhorhhstheslhhinhhugidrihhnthgvlh
    drtghomhdprhgtphhtthhopehtiihimhhmvghrmhgrnhhnsehsuhhsvgdruggvpdhrtghp
    thhtoheprghirhhlihgvugesghhmrghilhdrtghomhdprhgtphhtthhopegurghnihgvlh
    esfhhffihllhdrtghhpdhrtghpthhtohepjhgvrhhnvghjrdhskhhrrggsvggtsehgmhgr
    ihhlrdgtohhmpdhrtghpthhtohepshgrmhhuvghlsehshhholhhlrghnugdrohhrghdprh
    gtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:-6_OZ4X5YR79aviAHO_cp3_2avDJZWFFkIzEWKuxS3R-BWp8B-7ocA>
    <xmx:-6_OZ_l_xI6P5IBRNhBz9-XPMiVbIWjvc0DvonlvZ2mNrUu5u-OOPg>
    <xmx:-6_OZ1fPFr2CBWoxE05VrvS9bNDAWQ-h6BIo1GS7IkwD8ueAJYGcUQ>
    <xmx:-6_OZ5ED0An3rhgTO35_g-iZAETkgntyf5uvrFEhGIvEdsWqk3zlXw>
    <xmx:-6_OZz1lHN1IjdkDdhtEigQwRg0xfTk3QjR6k9D9CdOGfSEKYP7NwH5E>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 10 Mar 2025 05:25:08 -0400 (EDT)
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
Subject: [PATCH v8 09/11] drm: sun4i: de33: vi_scaler: add Display Engine 3.3 (DE33) support
Date: Mon, 10 Mar 2025 22:09:55 +1300
Message-ID: <20250310092345.31708-10-ryan@testtoast.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250310092345.31708-1-ryan@testtoast.com>
References: <20250310092345.31708-1-ryan@testtoast.com>
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
 drivers/gpu/drm/sun4i/sun8i_ui_layer.c  | 20 ++++++++++++++++----
 drivers/gpu/drm/sun4i/sun8i_vi_scaler.c |  4 +++-
 2 files changed, 19 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
index 7a21d32ff1e4..3eefdb710dee 100644
--- a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
@@ -94,12 +94,24 @@ static int sun8i_ui_layer_update_coord(struct sun8i_mixer *mixer, int channel,
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
+			sun8i_vi_scaler_enable(mixer, channel, true);
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
+			sun8i_vi_scaler_enable(mixer, channel, false);
+		else
+			sun8i_ui_scaler_enable(mixer, channel, false);
 	}
 
 	/* Set base coordinates */
diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_scaler.c b/drivers/gpu/drm/sun4i/sun8i_vi_scaler.c
index ad87ab395803..6839fd5ab602 100644
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
-- 
2.48.1

