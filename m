Received: from fhigh-a4-smtp.messagingengine.com (fhigh-a4-smtp.messagingengine.com [103.168.172.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5760A224B06;
	Mon, 10 Mar 2025 09:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741598695; cv=none; b=a+cIO+RQEwak0vZG5KdmnxC0eLn5966gzz8DV6+KzVlvpYYNJFc9Bho0BypePwzkmismX6YqSUdnw5jx4mNv2grG5W2gqjbhy9Rw66dkiT/86Ta23gyni+4i6BiLddYlddfU3G+jfMKpA7KuT3JKCnBdqLJBEsZ7LpiJsPWOe4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741598695; c=relaxed/simple;
	bh=E8OYEBmP+kvO+km0Fidyq0V/UvQ7/37A0eeZu2A5fSs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y80pMwoZX/0sBflnyorZftjBHnOz9/a+nHyNDdco0ox57BCe92kmqjz2qBsSePT2jrsYCcE8nr1uU1IV2KDyfKUKXT5Jpc2/fpOTu4hEVhE5qeGjqBf+vokQ/UjmqsXJ35H0FYz8bGEJGKUNgXoF14l3+nyDALK5DmAdUfHg7GI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com; spf=pass smtp.mailfrom=testtoast.com; dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b=AOd+e0xA; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=JJGyEvFS; arc=none smtp.client-ip=103.168.172.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=testtoast.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b="AOd+e0xA";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="JJGyEvFS"
Received: from phl-compute-11.internal (phl-compute-11.phl.internal [10.202.2.51])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 8FFC31140154;
	Mon, 10 Mar 2025 05:24:52 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-11.internal (MEProxy); Mon, 10 Mar 2025 05:24:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1741598692; x=
	1741685092; bh=ph3w5BGlFyH2zwSiNWVZ5MH48BfIXv3Sx1cCe/xo8EY=; b=A
	Od+e0xAIVpFp3fjCaPhbjFpeTc4vyInlHe22S5W+5JRrThCP6oOzgaj9ZhR/02v0
	OioZw6koQ86di1jZq2o5xU3+Jneru1WYRshHbkMkeu9d6zPuMSWWVkwC0ygFOLuW
	2I3/c5Fu0JcwNnz6zZd2mCpHunhip0ync2/cyz3UMm5BNw04AQr093/pLSmxfia2
	sg2VWcTs/npkwBxh/d/+FWSu5VMxYNukL5WhW1wcG539IB9jMjfSKOZxFCMcufHU
	KVaShs+O0s2DZ2GZAf/K6MhamhybEHOZWnCfjFIJX6+NH29TlRSYk1KBV8QyCcnp
	jqXv41qumV6mAHL+5IqAw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1741598692; x=1741685092; bh=p
	h3w5BGlFyH2zwSiNWVZ5MH48BfIXv3Sx1cCe/xo8EY=; b=JJGyEvFSfJ/t/rxP1
	mcZChDEgfzmJxRA8RzE9zvpuawjgEYk9b7FnHjoQafuYM+lXTZGI/FkwF+Gs/S6+
	9bbRXn0bpUWW6byvgROQs3O07epR3UKjfBQiBhfB4E3o+I3AOeoDDIx2cwCZmVWo
	kSSy9qEikJg0weFvPCwyKUdK/xVjiQzAqxHWeRXzVJhtt83NP+pR/tzJP4aWNvK/
	wnPALwWXf4joOuSyutEz3oxJDHnWGfo+8yp1Fsb1DbQ5T1M/qRP2HCjYHm2QBB1G
	dSwjTXnU2Oo2SfAPylVCG7aAl6p4Gp+vR/knVy3pAAt9EEOydlLPg5UrVQJTkCQ8
	88OwQ==
X-ME-Sender: <xms:5K_OZynwi1coSuF-TGl6PG9RLvx6Z6OCj3I4nMGz0yUHM0_IUZUvGg>
    <xme:5K_OZ50zHDw3o5jh1mpHRBwABfMRZncVUjlLk9gv2W4mGlsI1SBmLqb0oKyX9u-ig
    xIx-nnDGyPYzCe0jw>
X-ME-Received: <xmr:5K_OZwpgfaCGg9mkkdZjPYZ405QEC8ElKXK4TDVz6ygwm6Ew0LyGS0YzuQX5VHyOqDAT2dWRbEGJVu766YJfdSSJ3f04YRGyjqFPxJ6IJPXS>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduudekleekucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredt
    tdenucfhrhhomheptfihrghnucghrghlkhhlihhnuceorhihrghnsehtvghsthhtohgrsh
    htrdgtohhmqeenucggtffrrghtthgvrhhnpeffheeiffegtdfgffejteevgeefkeelieel
    keevueetffetteduffevgeeiieehteenucevlhhushhtvghrufhiiigvpedunecurfgrrh
    grmhepmhgrihhlfhhrohhmpehrhigrnhesthgvshhtthhorghsthdrtghomhdpnhgspghr
    tghpthhtohepvdehpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehmrhhiphgrrh
    gusehkvghrnhgvlhdrohhrghdprhgtphhtthhopeifvghnshestghsihgvrdhorhhgpdhr
    tghpthhtohepmhgrrghrthgvnhdrlhgrnhhkhhhorhhstheslhhinhhugidrihhnthgvlh
    drtghomhdprhgtphhtthhopehtiihimhhmvghrmhgrnhhnsehsuhhsvgdruggvpdhrtghp
    thhtoheprghirhhlihgvugesghhmrghilhdrtghomhdprhgtphhtthhopegurghnihgvlh
    esfhhffihllhdrtghhpdhrtghpthhtohepjhgvrhhnvghjrdhskhhrrggsvggtsehgmhgr
    ihhlrdgtohhmpdhrtghpthhtohepshgrmhhuvghlsehshhholhhlrghnugdrohhrghdprh
    gtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:5K_OZ2lMxnMmLX-pna7m9U8PALrKbfpq53a85HUicGlaNkYvNKiiWA>
    <xmx:5K_OZw2jJC_e19pOp-EwDRgA2a5hZBGItRgUTH6sKxr-jlpyER9nmQ>
    <xmx:5K_OZ9u2-ROvqGe1F57va2K9x5B5W1FalreULpTAmvxfX7tkVa6YBg>
    <xmx:5K_OZ8UuHcrswd1V49554yz4jysHwLG87-ZluNYtnabM2hBLkTjcRg>
    <xmx:5K_OZ9c6eZpVEZySgyLzGv_6X21W0Ga5GLIoBMOX80-1WPRJnAhN_CqR>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 10 Mar 2025 05:24:45 -0400 (EDT)
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
	Ryan Walklin <ryan@testtoast.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v8 06/11] dt-bindings: allwinner: add H616 DE33 clock binding
Date: Mon, 10 Mar 2025 22:09:52 +1300
Message-ID: <20250310092345.31708-7-ryan@testtoast.com>
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

The Allwinner H616 and variants have a new display engine revision
(DE33).

Add a clock binding for the DE33.

Signed-off-by: Ryan Walklin <ryan@testtoast.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Chen-Yu Tsai <wens@csie.org>

---
Changelog v2..v3:
- Separate content into three patches for three separate subsystems
---
 .../devicetree/bindings/clock/allwinner,sun8i-a83t-de2-clk.yaml  | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/clock/allwinner,sun8i-a83t-de2-clk.yaml b/Documentation/devicetree/bindings/clock/allwinner,sun8i-a83t-de2-clk.yaml
index 70369bd633e4..7fcd55d468d4 100644
--- a/Documentation/devicetree/bindings/clock/allwinner,sun8i-a83t-de2-clk.yaml
+++ b/Documentation/devicetree/bindings/clock/allwinner,sun8i-a83t-de2-clk.yaml
@@ -25,6 +25,7 @@ properties:
       - const: allwinner,sun50i-a64-de2-clk
       - const: allwinner,sun50i-h5-de2-clk
       - const: allwinner,sun50i-h6-de3-clk
+      - const: allwinner,sun50i-h616-de33-clk
       - items:
           - const: allwinner,sun8i-r40-de2-clk
           - const: allwinner,sun8i-h3-de2-clk
-- 
2.48.1

