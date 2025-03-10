Received: from fhigh-a4-smtp.messagingengine.com (fhigh-a4-smtp.messagingengine.com [103.168.172.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C2912206A4;
	Mon, 10 Mar 2025 09:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741598671; cv=none; b=mzvyAXuYSwV+PWGPUBPxtwgWThWmQ9BQa3DqlXOTxyi/2j6Chqp7NjQ+oN7opreD4SJN5aklrVEwXug+uTugGOjyu38kYGT/Od0rEMz+dmGJHh5+CuksHEghPo4JFqUrtpUBP1I4VP75c3v0iOrOpbqIXbIGC8fRdUNUgo83j1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741598671; c=relaxed/simple;
	bh=359TpViH1ZUKNmUJtlhD0FWuI8PgTTd3TinY+Na8bQw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TDO5kZeOEjO8L62braQ6XdCETtiNu/VY2x3UcqyygfX7Jd0XIfvRkvZS6NsL20bK8yegzwzMTJgl5qI62r3U5tPgoZu49UtVOCg9bn+FzuFdnEZRqdVtC8jH8gaaDWVO63jvWI/UHRFjIg05IqVTcgcBf4dv/u5p+GjiN/DClXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com; spf=pass smtp.mailfrom=testtoast.com; dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b=Z8yrxwY/; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=VBSEQ7Ua; arc=none smtp.client-ip=103.168.172.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=testtoast.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b="Z8yrxwY/";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="VBSEQ7Ua"
Received: from phl-compute-01.internal (phl-compute-01.phl.internal [10.202.2.41])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 7265C114011F;
	Mon, 10 Mar 2025 05:24:29 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Mon, 10 Mar 2025 05:24:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1741598669; x=
	1741685069; bh=TAmJYyEumzEou620QY11fdpDk+WMryARn7BRuJePqUo=; b=Z
	8yrxwY/Oz7joEWm4RohGpeoObdIptXmdxxqQH/kIIKjHbLbsCBE+zsWQy8SN6axF
	epwihAZtoHfhSrH+trsGbM/B2KYqXYS5RykHjAXQSB9fTmp7tA0DdDgHGSTkuwrv
	3CFnYY2+KynxcfL1RB3hxmRkjeYTYMobLztrKGiHDefyEyb4AEfNTu/uDTmF1r4K
	aRD+Qsyu24du2OhOF0SbsuasShxQhUHSIHbW7ykKkKlXsswDmInFE/pY7QR55Pa+
	S/gmxFuy4KhXMGvxMFE8Fnvzn+rhPaVmXx8yFo3z+9VAX7srg6BfuXot2JTAs7dM
	YvowPLhQYxKKFb9s6QSvw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1741598669; x=1741685069; bh=T
	AmJYyEumzEou620QY11fdpDk+WMryARn7BRuJePqUo=; b=VBSEQ7Ua8Ok6PRaIU
	2tSYUx6XPMf7oGvvIb6lZ4YsBeRqTl+nhYgHdyP2fiBOMSNkHFPgC0Yb1NScWrQd
	9BOpgFj8q2PZjaB1abvXafknYXanc3YIly7mKNtgZppnoILO4r5sxX1tbdU8ffP3
	T59Rz3ecDjBBZw/1Q92yQo2Q5Q5bNx0wWo6vg5zvZaKp9AmfYEqsJ/kcTfX75cD2
	XFFIu9h1hrxdV4GMKfjtPA6IaMBTOe5xX3cSflhKImagyBK2SYzH6stwKpM0Xzv9
	aEGatj4Z6QSBr78OBplOoyrEAVgKmSQjp50fMkFY0iOkjh+geZ5MXMLa1gGZ+ESw
	naNFw==
X-ME-Sender: <xms:zK_OZ6MKrk7N5tpWgqNwY_ulmvP6c6becnLuDDb9v-4wbo28P9YVww>
    <xme:zK_OZ48V402KYBASaHG9Vv27GZU07Pz4GOL2h7eNFR1zGCuCxoJD54sdZi5PrUTGI
    Kp4qGwBCnqBq55-EQ>
X-ME-Received: <xmr:zK_OZxQAQwgyY60oMLANYPhct5J_g7gaYceFWo1nYaWUXCgG0OT0jDT4VYqJMo9mFZk2Vm_MusLBq98J0jkmjzlR72zDXwj4a32E6Li_mB4i>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduudekleekucetufdoteggodetrf
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
X-ME-Proxy: <xmx:zK_OZ6ts7GUwpQMAhjMfNNdHkh_J3OerBtxO44RJCXr1M3RjSfwqEg>
    <xmx:zK_OZyerM4Ovj9MQh3wiDADZkl5hSHyUnac5IGFtRuvu67m9qUVrIw>
    <xmx:zK_OZ-2Fn2MS2s4GRoiDM9b-YOEPP51H29hEdpgw0ITE37X4zJbvZA>
    <xmx:zK_OZ2-FWCzaCJBEE-8NIrkEqhYiwH2VnIOU9n9JVGKV2QTs3FB7ug>
    <xmx:za_OZzt8L4iRAXjkMCfucEnEtOxktSXpCy5nR-QTiLKwqF6YwQyFnyDV>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 10 Mar 2025 05:24:22 -0400 (EDT)
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
Subject: [PATCH v8 03/11] drm: sun4i: de2/de3: add generic blender register reference function
Date: Mon, 10 Mar 2025 22:09:49 +1300
Message-ID: <20250310092345.31708-4-ryan@testtoast.com>
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

The DE2 and DE3 engines have a blender register range within the
mixer engine register map, whereas the DE33 separates this out into
a separate display group.

Prepare for this by adding a function to look the blender reference up,
with a subsequent patch to add a conditional based on the DE type.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Signed-off-by: Ryan Walklin <ryan@testtoast.com>
---
 drivers/gpu/drm/sun4i/sun8i_mixer.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.h b/drivers/gpu/drm/sun4i/sun8i_mixer.h
index 7fe5ce20082a..43c413052a22 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.h
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.h
@@ -217,6 +217,12 @@ sun8i_blender_base(struct sun8i_mixer *mixer)
 	return mixer->cfg->de_type == sun8i_mixer_de3 ? DE3_BLD_BASE : DE2_BLD_BASE;
 }
 
+static inline struct regmap *
+sun8i_blender_regmap(struct sun8i_mixer *mixer)
+{
+	return mixer->engine.regs;
+}
+
 static inline u32
 sun8i_channel_base(struct sun8i_mixer *mixer, int channel)
 {
-- 
2.48.1

