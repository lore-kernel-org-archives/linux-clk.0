Received: from fout-b4-smtp.messagingengine.com (fout-b4-smtp.messagingengine.com [202.12.124.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F41A38385;
	Sun, 16 Feb 2025 18:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739731140; cv=none; b=h7rU+zuAS21MZQ+4KXzpz08+xXI3yYEytZOKrTylW+PjIfjTit8bH9ZBICUdK/aSZHogLZKGWWBBJJHYh82zZfsy9v7Kutfz8zb+nedbPzdAIz9nzhAfpGyBSs8rV5bjBs25B1IKBzyQrHR6RIUwnBZEJYJKyVO7//fYURNw0cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739731140; c=relaxed/simple;
	bh=9JvHuKNb1HNTv2SFCS4Vc2HbrzSswSCllScgkrEDBvI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C/t24Nnn87Xu8IfNSFN9LAF/OL//RQ5ZJq0soBXA+D94YEBF999BX97ebZfSjNm/70CzxLkzymf+5grIq/3CMPwof3NRf24Ms8SUl2VoqJ44817EKwGSe1gZY2AHjScWMF/V+VfrNy85LXPlu/QnapP3ZXtqUB23Lnclos/AW7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com; spf=pass smtp.mailfrom=testtoast.com; dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b=LSrM/AZG; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=RoWgJcKF; arc=none smtp.client-ip=202.12.124.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=testtoast.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b="LSrM/AZG";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="RoWgJcKF"
Received: from phl-compute-04.internal (phl-compute-04.phl.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id E4F45114011D;
	Sun, 16 Feb 2025 13:38:56 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Sun, 16 Feb 2025 13:38:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1739731136; x=
	1739817536; bh=1dDCRF3dbNnQV39blNgTNc7VbdL72A86bgF17fXGjsc=; b=L
	SrM/AZGxoCD7XTONIZyJpALRhK9KM+A6vt918P9UB08hIUPpZyUSPwrsCrjyoeK0
	CEeB7RCLOK2ElZb/lIVB55vKdck7nhAUrR0N+z8FC3fI0JmgGRX8KMMTqABtS9EP
	3jXQYDngIO7elnj9pSbdSc5EISMg6p3Dnfrwkk99oWIFuXqh938bZbKxRK7kH92c
	ixR2X2/N6jfzktEKMjY9NnwHSZS3bs4nxst3lOa85FtsfZ2p8jdsRyAz3ItXSQcD
	bJRzMtC0qkQJoPMgYhOXItDM44WR9yMoG8djwf2UkWq6cnmKL3LcfYMLK7A76+aH
	iV0bkFeVRcQ/DcOvK52oQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1739731136; x=1739817536; bh=1
	dDCRF3dbNnQV39blNgTNc7VbdL72A86bgF17fXGjsc=; b=RoWgJcKFos9Gi0T5s
	R0WnFOT7nlLkjvszfKhlBmacy4GJD4lV9h3SfQRqDHXf4QIK+CAbm17uZbOJKpfq
	E7Qo2pcs/hB9uSxLNnJfy8ZMbzi7GNzY3wNrym0a2WfWIJjjBqh12RkSDI4/UuHb
	cT66w0chC6HJ5xHOD2Ixz1RVfljnmIu/Z9CA2Kn4thksm05F533YfWPlrNgHNT3T
	Xt5jmYN7VpqGOn5j4r1XvSPW/dmhpJ+hWYMWf41OMk6o0BeLHE9mOvBDQADAuYM8
	R6maPfOH3bYz8m3yw0aHqPwik+Dk6ED4Mtxqk4AmiWaMy8NMCqgjcA1Oe0TPAmNS
	S3KKA==
X-ME-Sender: <xms:wDCyZ5hy7KORBJna8IkWfD2h-mO9t22bNPQ1zlwmD-xqHUncP9iXIg>
    <xme:wDCyZ-B2t_YmPRnELSm2NprcCbOGTozMaTKl0B4NxPh1NQT3mRsQtDnHaLopZ65Zg
    zW7uBdK3JQu8mfb8A>
X-ME-Received: <xmr:wDCyZ5E1y640Q9hhN2bR8JOPwo01TedD4HT1LO5fK0EgjX-2dLlQMUD3FJ3RpjbMmO0O-z1t4Gu3B9lX9Wvsn1J7E85JSi3ogEO5V4sD5ZyA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdehiedvudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddt
    necuhfhrohhmpefthigrnhcuhggrlhhklhhinhcuoehrhigrnhesthgvshhtthhorghsth
    drtghomheqnecuggftrfgrthhtvghrnhepffehieffgedtgfffjeetveegfeekleeileek
    veeuteffteetudffveegieeiheetnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrg
    hmpehmrghilhhfrhhomheprhihrghnsehtvghsthhtohgrshhtrdgtohhmpdhnsggprhgt
    phhtthhopedvgedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepmhhrihhprghrug
    eskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepfigvnhhssegtshhivgdrohhrghdprhgt
    phhtthhopehmrggrrhhtvghnrdhlrghnkhhhohhrshhtsehlihhnuhigrdhinhhtvghlrd
    gtohhmpdhrtghpthhtohepthiiihhmmhgvrhhmrghnnhesshhushgvrdguvgdprhgtphht
    thhopegrihhrlhhivggusehgmhgrihhlrdgtohhmpdhrtghpthhtohepuggrnhhivghlse
    hffhiflhhlrdgthhdprhgtphhtthhopehjvghrnhgvjhdrshhkrhgrsggvtgesghhmrghi
    lhdrtghomhdprhgtphhtthhopehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgpdhrtg
    hpthhtoheprhhosghhsehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:wDCyZ-SANWMpdOICDGI2wZQY5Xjlmwk_NOFzGUu1hYum_qZfgwXciA>
    <xmx:wDCyZ2x9CBaEKkVUInf_WnX9W_fJ7nlzevao4Q7R5if5u7PRshf4vw>
    <xmx:wDCyZ04Lw8p8_LIwjAsKSXnalkdFSmoVQPxK9FsPIdDIfithNpWPrw>
    <xmx:wDCyZ7x1uRPe8mI0fKZBX8-DJ1VcVq5SwKUMXEtmrdS-VSnNoChOFQ>
    <xmx:wDCyZzg0uT0sE92lfD5Gfho7Icz0KzYq53b9KOBkPzZX1jr3f2n9dqxP>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 16 Feb 2025 13:38:50 -0500 (EST)
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
Subject: [PATCH v7 10/27] drm: sun4i: de3: pass mixer reference to ccsc setup function
Date: Mon, 17 Feb 2025 07:36:10 +1300
Message-ID: <20250216183710.8443-11-ryan@testtoast.com>
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

Configuration of the DE3 colorspace and dynamic range correction module
requires knowledge of the current video format and encoding.

Pass the display mixer by reference to the csc setup function, rather
than the register map alone, to allow access to this information.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Signed-off-by: Ryan Walklin <ryan@testtoast.com>

Changelog v5..v6:
- Pass mixer instead of engine now that mixer holds color information.
---
 drivers/gpu/drm/sun4i/sun8i_csc.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_csc.c b/drivers/gpu/drm/sun4i/sun8i_csc.c
index 558f7a4c1354e..7f3dc6a7b550d 100644
--- a/drivers/gpu/drm/sun4i/sun8i_csc.c
+++ b/drivers/gpu/drm/sun4i/sun8i_csc.c
@@ -148,17 +148,19 @@ static void sun8i_csc_setup(struct regmap *map, u32 base,
 	regmap_write(map, SUN8I_CSC_CTRL(base), val);
 }
 
-static void sun8i_de3_ccsc_setup(struct regmap *map, int layer,
+static void sun8i_de3_ccsc_setup(struct sun8i_mixer *mixer, int layer,
 				 enum sun8i_format_type fmt_type,
 				 enum drm_color_encoding encoding,
 				 enum drm_color_range range)
 {
 	u32 addr, val, mask;
+	struct regmap *map;
 	const u32 *table;
 	int i;
 
 	mask = SUN50I_MIXER_BLEND_CSC_CTL_EN(layer);
 	table = yuv2rgb_de3[range][encoding];
+	map = mixer->engine.regs;
 
 	switch (fmt_type) {
 	case FORMAT_TYPE_RGB:
@@ -204,7 +206,7 @@ void sun8i_csc_set_ccsc(struct sun8i_mixer *mixer, int layer,
 	u32 base;
 
 	if (mixer->cfg->is_de3) {
-		sun8i_de3_ccsc_setup(mixer->engine.regs, layer,
+		sun8i_de3_ccsc_setup(mixer, layer,
 				     fmt_type, encoding, range);
 		return;
 	}
-- 
2.48.1

