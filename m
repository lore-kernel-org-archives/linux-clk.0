Received: from fhigh-b7-smtp.messagingengine.com (fhigh-b7-smtp.messagingengine.com [202.12.124.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B56931A3141;
	Sun, 11 May 2025 10:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746960170; cv=none; b=q4OiPzTUjJK+VyMLO907btAD+PK4AdKcjqIHDGWIZOCIddGG3Amn7XISARNCStBaZbNaeFR0Hk/ZMV67wum0f8+Kz7nXBSVnn0wMWoYuxx5L0pWvwXofH1xECV9zfW29hsu5aF4mE0zVusWcLts/X+H3ghs1cohUT0JAw/NXZTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746960170; c=relaxed/simple;
	bh=01SGTuUZq2iCNSFxmrHHonQPTVrC55gR7rrcTjpaVnc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J3KfWQBWV8QlzprEj9kwufBREpWXhMHEP6dpM0TYUkcyR7qMArPvha3o77FcoRoin+gXcyW03I780DfBU+OdssgvsnPuoVrO64PMXlEaK7NK3uuP3z0g+9yccXgAXVypkMhrcxw/VIFgAGmxNfhAhBblvqGoU/X1AKNyHBujKkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com; spf=pass smtp.mailfrom=testtoast.com; dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b=gKldsTgC; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=kqQI1rkB; arc=none smtp.client-ip=202.12.124.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=testtoast.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b="gKldsTgC";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="kqQI1rkB"
Received: from phl-compute-04.internal (phl-compute-04.phl.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 5C12025400F4;
	Sun, 11 May 2025 06:42:47 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Sun, 11 May 2025 06:42:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1746960167; x=
	1747046567; bh=7NkCp18/Yuhg5ybR4dfOeqyUzMpfRweO1qk/tseFdhw=; b=g
	KldsTgCXJfspWmNdSRasTperLwxKyFxccxFxY7JVhIZhU+/xXHVIElgRKumUC6Ju
	8SoIiljNxgXFXNGvfSnlL48E6PPQCNXYTtDmbwGStVDBn9OVWQr32ug8MQQRyVp1
	0QUTgAjev+W1vNMK906GV4+PQTOAyfeXBNcnN9PfNh1scglDHuPgMf8jaZEEGcxV
	UBQZNDvwX0jcfAyNbBrZ+Jztj049Li9vwRSae2l2ieZcPaICKm7IUf88v/YUMz2K
	oaLC5vpiesDz6Tefc8p16dLZrqBE5UQy6i9HKbjkwY0R/iQm98FKIhPQzJepJZBH
	pRKpikfj0hmGuvFEWL6sA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1746960167; x=1747046567; bh=7
	NkCp18/Yuhg5ybR4dfOeqyUzMpfRweO1qk/tseFdhw=; b=kqQI1rkBWBH1FNaY4
	ArOOsRF+cP/pgONE6mE3WWEp+tHLIY84b+/VKgvpCvwK7uFHfFSAOhxP29AVrcHT
	TB3MRBrKUu5E5WiJYsBJmMS7x/6dEkhL2KzIZo57jjMGm8bCMZtek5V17p9/65o3
	8GDgYCZF37tfDFzed9Cn7+ZHbn1NSbLQEWY/+t0f0sWA/uFRlq6jGvmOWPJxQFMX
	AMf29OyC6EFWtezypE7HzZIF5PGJ/Gth64h4OLYAgb+MsTAPw5Sv+Zd8TZnUKfPY
	47+DnxHvslPnXcTYL3jM4qFLPAXlDEC7BH535nv7MpbjwaprIpgZPcJZqpjc7Tle
	OcvMQ==
X-ME-Sender: <xms:J38gaG6QG0RI_PIhZfeiQYLMH-oic8cE2IqOiA_8ZC64k7pLndDA2A>
    <xme:J38gaP5u3ZTU0J6aGbZ9-mzI0QKN1ktMvGYcIB47HMm1lExKRB8NjRw5zgKCb5Ylt
    bkPaJ4Hrye4xcvUVQ>
X-ME-Received: <xmr:J38gaFfOiOFwjTqF3pGEwGptwFzCmoPFfp5eH_qzSWdFu2-aC6YohquGK3YHiIizGbB1OlSa27e6BIIhlDb-ur7ZZmtR3D__hSPFkQjLEkP2>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvleekudejucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredt
    tdenucfhrhhomheptfihrghnucghrghlkhhlihhnuceorhihrghnsehtvghsthhtohgrsh
    htrdgtohhmqeenucggtffrrghtthgvrhhnpeffheeiffegtdfgffejteevgeefkeelieel
    keevueetffetteduffevgeeiieehteenucevlhhushhtvghrufhiiigvpedtnecurfgrrh
    grmhepmhgrihhlfhhrohhmpehrhigrnhesthgvshhtthhorghsthdrtghomhdpnhgspghr
    tghpthhtohepvdegpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehmrhhiphgrrh
    gusehkvghrnhgvlhdrohhrghdprhgtphhtthhopeifvghnshestghsihgvrdhorhhgpdhr
    tghpthhtohepmhgrrghrthgvnhdrlhgrnhhkhhhorhhstheslhhinhhugidrihhnthgvlh
    drtghomhdprhgtphhtthhopehtiihimhhmvghrmhgrnhhnsehsuhhsvgdruggvpdhrtghp
    thhtoheprghirhhlihgvugesghhmrghilhdrtghomhdprhgtphhtthhopegurghnihgvlh
    esfhhffihllhdrtghhpdhrtghpthhtohepjhgvrhhnvghjrdhskhhrrggsvggtsehgmhgr
    ihhlrdgtohhmpdhrtghpthhtohepshgrmhhuvghlsehshhholhhlrghnugdrohhrghdprh
    gtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:J38gaDJxud_CuDBWQVoA8-UeF-aoPyo_jfc4mB5JjXuomLwnjO-Row>
    <xmx:J38gaKLiA9Cg5dIeYMGAV5m8WWXtQqfme7LV6JZuum3IdPO3AH1-3Q>
    <xmx:J38gaEyng_l6ChDOEUbehRQ7iPxyS99mEQWi0S39B-bU14Z4cuLfqA>
    <xmx:J38gaOIUChpbLxw5F4yNKAm0nblR-sQjBEQUcjwR2gjT4JPPUbChyg>
    <xmx:J38gaMx0cWjOkIIUKyWdDQSfnm2rqQotyBFRD33kYiAYgiAjs-w9HxMM>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 11 May 2025 06:42:40 -0400 (EDT)
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
Subject: [PATCH v10 11/11] drm: sun4i: de33: mixer: add mixer configuration for the H616
Date: Sun, 11 May 2025 22:31:20 +1200
Message-ID: <20250511104042.24249-12-ryan@testtoast.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250511104042.24249-1-ryan@testtoast.com>
References: <20250511104042.24249-1-ryan@testtoast.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jernej Skrabec <jernej.skrabec@gmail.com>

The H616 (and related SoC packages sharing the same die) carry the new
DE33 display engine.

Add the mixer configuration and a compatible string for the H616 to the
mixer.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Signed-off-by: Ryan Walklin <ryan@testtoast.com>

--
Changelog v7..v8:
- Separate DE33 support and H616 enablement in the mixer.
---
 drivers/gpu/drm/sun4i/sun8i_mixer.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c b/drivers/gpu/drm/sun4i/sun8i_mixer.c
index 0d4695132dae..f774b693634d 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
@@ -799,6 +799,17 @@ static const struct sun8i_mixer_cfg sun50i_h6_mixer0_cfg = {
 	.vi_num		= 1,
 };
 
+static const struct sun8i_mixer_cfg sun50i_h616_mixer0_cfg = {
+	.ccsc		= CCSC_MIXER0_LAYOUT,
+	.de_type	= sun8i_mixer_de33,
+	.mod_rate	= 600000000,
+	.scaler_mask	= 0xf,
+	.scanline_yuv	= 4096,
+	.ui_num		= 3,
+	.vi_num		= 1,
+	.map		= {0, 6, 7, 8},
+};
+
 static const struct of_device_id sun8i_mixer_of_table[] = {
 	{
 		.compatible = "allwinner,sun8i-a83t-de2-mixer-0",
@@ -844,6 +855,10 @@ static const struct of_device_id sun8i_mixer_of_table[] = {
 		.compatible = "allwinner,sun50i-h6-de3-mixer-0",
 		.data = &sun50i_h6_mixer0_cfg,
 	},
+	{
+		.compatible = "allwinner,sun50i-h616-de33-mixer-0",
+		.data = &sun50i_h616_mixer0_cfg,
+	},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, sun8i_mixer_of_table);
-- 
2.49.0

