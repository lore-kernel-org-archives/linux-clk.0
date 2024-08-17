Received: from fout6-smtp.messagingengine.com (fout6-smtp.messagingengine.com [103.168.172.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17877143886;
	Sat, 17 Aug 2024 23:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723935992; cv=none; b=gOWABOoCpGolDI7MQHfLU8Eeq0cqUAxHe/TpamsZL49GWh3b1QPFpmxfWOrC0rUirz1YE0XnqfE24HSKGeOXAYBtwO2J/ykTWwJZ5VPI0/bpBuHWYA/ifuxssxR+uWNMhdzFKnShbl+QdR+d5WbebowKynMlubAz6gUQ6HzIeqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723935992; c=relaxed/simple;
	bh=EkfBurLeP8iQvutxGo7/70AZMrn812/QIXwKtsX+vU4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EhmVKgP/5kvx0kvHpLlnz4PAa0jPSZRZXVZk8mVg6jmsljVrf7/pa4CHrAgD3TVyhxQaI1Pu/sIDkurcBTp1se/lxJq5e2JVkboD+9px2a56xv9KNW2qaFzKhptJDj5xjgYhx/SaRqm2LQ8zb+GD+eFnIaGj7hqYm/c6QWUD5a4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com; spf=pass smtp.mailfrom=testtoast.com; dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b=ouE3fJ5l; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=REVJFsK+; arc=none smtp.client-ip=103.168.172.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=testtoast.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b="ouE3fJ5l";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="REVJFsK+"
Received: from phl-compute-04.internal (phl-compute-04.nyi.internal [10.202.2.44])
	by mailfout.nyi.internal (Postfix) with ESMTP id 6070F13855C2;
	Sat, 17 Aug 2024 19:06:29 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Sat, 17 Aug 2024 19:06:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1723935989; x=
	1724022389; bh=8PtqZKmxCd7W8I1iOM4PHrhvoZxUvSgPGDR2Y4VgBdU=; b=o
	uE3fJ5lgJQiXvz3HXH0eFEjzgaA+Wp+iJgst+Q7Jex1Mj+Iu2MjGHZrqDzk5zj9B
	Kq1fAw4VXc9zhkDZWkGWdr52lujDaQhstPU+RN24CUOGxIJDNq/M0o3ONeyJkEVf
	JDgmmdzDYjxFW9CuhM3zQEWU8bQaAdWad1wyjTp+9zZ5LbEyRGYruzMkOYUDeU7o
	qN+mjoq7pkwq7RVU0gR727jEdFrnX+DKb1As0PA5BN/D8V/f/jaDYnpjN5LMqPAC
	/bXtzIx7Da5z8XQN1otpPRZMDqZnBIeiZiDpXozN00GOT7tpi+jUBjZMHEo7BUpz
	qUAdT2WHpfs2dcnJ51UWg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1723935989; x=
	1724022389; bh=8PtqZKmxCd7W8I1iOM4PHrhvoZxUvSgPGDR2Y4VgBdU=; b=R
	EVJFsK+AtOWDjmYe10TpRVdaV/otWPkS8kTOEMID0zLBTFCmhB6ts/SEPVAkmdrC
	T1TJ1LjA4tF7Trs5EsJsnixSPlf4GUbCJG8QpikW/4XBV6yqcDQn72Z104CzUhLM
	xb38cjsVwJ840WE/4VyYZVIJdS32Y2sYPjNBQNij6RaEocwh6GawOH4BrFoSmn8a
	UItS8sQy+h5JVZ65gi4/ytltH7TbpCwQeowGi8U9pt2rwLgg8S/MQYowQJYOWf5l
	ZTr6A9pwgSE8quhxMEUHSXMv/ZBQEOx4E7/ojkYsRPXgLe4Jd+ZRAOPh5JY3n+Xw
	Ul/PpdJcGPtJD80bVKQ+A==
X-ME-Sender: <xms:9SzBZna37bG8uuI6yBCU6TSdiHTGdiWfrTSDqNZu62EVAcXiCKrIBQ>
    <xme:9SzBZmY9yRG62FrJtzexmrDoBUureAnVhR8BFWtL0oTeWF7Z7BynVPqDrysrM7AAL
    3Rry2FKMwlATORt_g>
X-ME-Received: <xmr:9SzBZp8gQWV8VPxqJ5Uyugtng688kDs3ZWJH9PjeCamAnbmzu_flcv-2YyCxQKOwcuPKA9JTlaSB-topGrQBJWbWk9CbCNJJGtFu-YMtaEHkyDVR>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudduuddgudejucetufdoteggodetrfdotf
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
X-ME-Proxy: <xmx:9SzBZtopgdkf2Z7Q8rxcVmJ2tA7s2csSSHlWYUsIPE8HsoRGme82cQ>
    <xmx:9SzBZipy1ISW7IR3koNsbaZe47bLaIBJGTdFaDp3xc7yx2lQA18G5Q>
    <xmx:9SzBZjT0pJjxTUZ0AxnG11XZmMjetHSmSEGJR85-d9xtLm3riNQ15w>
    <xmx:9SzBZqpDMNzXu656tudXcZYW6CHMLk8_o8HEhExFZDzkor1VufpM6w>
    <xmx:9SzBZrbEUbutbJ-u0clbi5GpL5BDR-kv-zEp5riaz_AXMcvSeeh6uRYn>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 17 Aug 2024 19:06:22 -0400 (EDT)
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
Subject: [PATCH v3 07/26] drm: sun4i: de3: add formatter flag to mixer config
Date: Sun, 18 Aug 2024 10:45:54 +1200
Message-ID: <20240817230503.158889-8-ryan@testtoast.com>
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
2.46.0

