Received: from fhigh-a2-smtp.messagingengine.com (fhigh-a2-smtp.messagingengine.com [103.168.172.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B899114290C;
	Sun, 29 Sep 2024 09:13:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727601216; cv=none; b=fT1K5ne3CEYA7Yhcr5DW8cZQSh2TqeBUESnXoTHSpxBrDrGt1jhfyXQvFd9uF2AMqXrBFlE77op6uqskbn6vsh4ksxqvX32mWEpS3hs7rcK3XkmsBWP5lo+mbUh26xmjN4sw4PObYojia4aJqNfHwtcYN0UhcpuA0PO2xkz+9Bc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727601216; c=relaxed/simple;
	bh=wS49w2o/JgYeJSGZgJyPKBuwaWrwQv/DJbnmpzvVDs0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BqaS/vTyqpHP8bTJjswDYE0TMOmvWY+rksgHpe6rdpwP23hbYO0u4mzLJ0XMG7nIQ233kIARyUVe6BzAlCJcGQLFR5I8XiVFaLUSCXwOYt+up8hM7O2z7YePp/199alHDhY0gZSrMsILIS2JzyrfZtk+az1I/prMf4smJEajDOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com; spf=pass smtp.mailfrom=testtoast.com; dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b=w4yaxGMQ; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=cqHmvjlK; arc=none smtp.client-ip=103.168.172.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=testtoast.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b="w4yaxGMQ";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="cqHmvjlK"
Received: from phl-compute-01.internal (phl-compute-01.phl.internal [10.202.2.41])
	by mailfhigh.phl.internal (Postfix) with ESMTP id F0A6111401F9;
	Sun, 29 Sep 2024 05:13:33 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Sun, 29 Sep 2024 05:13:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1727601213; x=
	1727687613; bh=ABgqTd7uObbDYR1wm8fD08OQQ8fryUdjNqzFp1bmI3g=; b=w
	4yaxGMQ5of1GigN3ues6TlAE3BD8XYyEvxk+gi3Lc/J4Y2KPna0XF5hV/rWKFLKJ
	oT9jTjNUL9TfDYiSTHgqbAb+zgTei+eYeH4cs+EWEV3BObc96FEt8dC8EU/mvsbU
	BQrnmQ7oYvQJdymxDRSYFOgNsVfKhvJ9enrzgmYs3/dKL/dP3KsOrrrEqcTq0Evv
	lk5dzd3ThAJ9/GHBhcbkkHaBVhDeNmoitpCBkzGuqdGeYuQ6IC0nXjaDUNGEhFPm
	5Jg7xDUAeftAOoZhuHUkM6zK9Yeo1nQrmewAebYc7wpMSNbNVbsBI0Kww4xNCmPP
	cyAT4buuKrJ3zTkHgIDMQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1727601213; x=
	1727687613; bh=ABgqTd7uObbDYR1wm8fD08OQQ8fryUdjNqzFp1bmI3g=; b=c
	qHmvjlKfOJXQbKfGYflcJ692s+O2uWf9jJz5odql8Y3RXcPLNevGXFKLVA3UQ0a3
	m9T2nNKtKMjABXijsFxMRaHFIE1eX5KppvxCHI0CITScKnZLnvGI9+RwbCfsIRK5
	LzdNFtK0tIy4kzOVt2VqKFwMSFGNLsxAoeLC1CpefjtBLAvTEilawlV4P+pdGjPH
	qyw9S6UjvY7xNmdRu8DuodoOIF4VulbJFhKV8ti9HNksqIZTdaVpwh5fah3YFkGU
	GfKnfcId78TBeEUg1j4CtskRnhMalyc3Fk+ZhAkS5Pyp+72oQ1nk9Ylxe6b0ieLu
	rlBmm6y0LTH/OZHu0d6TA==
X-ME-Sender: <xms:PRr5ZiCJpEehNN0pUHu8N5cRwCO6HVt3oMnyh1FFndgdxqB4O-ZVew>
    <xme:PRr5Zsg-t8VuJRfCTJi-RElbbMbqHl7VGHEB65hOPQGPRGjNi3QwdE52bz5gOe2hC
    cfUcVXnluwb7nzqqw>
X-ME-Received: <xmr:PRr5ZlnDLRkm0EcVtIUd53QPZ6o1dTI7lz1eiQVgvtBVSHswpp4Jm3qn3q2PmcLLx8pLtEJEtoXPBjn90hBpDiZ0ggvzzeZoRmwKY6uKZndQ3rDv>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvddufedgudegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttden
    ucfhrhhomheptfihrghnucghrghlkhhlihhnuceorhihrghnsehtvghsthhtohgrshhtrd
    gtohhmqeenucggtffrrghtthgvrhhnpeffheeiffegtdfgffejteevgeefkeelieelkeev
    ueetffetteduffevgeeiieehteenucevlhhushhtvghrufhiiigvpeefnecurfgrrhgrmh
    epmhgrihhlfhhrohhmpehrhigrnhesthgvshhtthhorghsthdrtghomhdpnhgspghrtghp
    thhtohepvddvpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehmrhhiphgrrhguse
    hkvghrnhgvlhdrohhrghdprhgtphhtthhopeifvghnshestghsihgvrdhorhhgpdhrtghp
    thhtohepmhgrrghrthgvnhdrlhgrnhhkhhhorhhstheslhhinhhugidrihhnthgvlhdrtg
    homhdprhgtphhtthhopehtiihimhhmvghrmhgrnhhnsehsuhhsvgdruggvpdhrtghpthht
    oheprghirhhlihgvugesghhmrghilhdrtghomhdprhgtphhtthhopegurghnihgvlhesfh
    hffihllhdrtghhpdhrtghpthhtohepjhgvrhhnvghjrdhskhhrrggsvggtsehgmhgrihhl
    rdgtohhmpdhrtghpthhtohepshgrmhhuvghlsehshhholhhlrghnugdrohhrghdprhgtph
    htthhopehrohgshheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:PRr5ZgyP7V50h9zGNI8UpiwGxQ29g__1BT5VdPNljv3vVmN8Enne5A>
    <xmx:PRr5ZnR0_lxVMZDxiPxkUiiIY1MDqm3_5MRGjWa3-KcL4HNbHnNc3A>
    <xmx:PRr5ZrZpzqi_4YgY_MKyDhzku-2lgwOFpJ-QfIQUnFUAcdnAhave4A>
    <xmx:PRr5ZgQYQg0c_zGZJveMnzDrPXNcenBb5jsXSrfa2D_24Hkhg0HT-A>
    <xmx:PRr5ZmCzNLN8znZ1G6WwQRojLjBdn6AfDN4lK28vJmvys3DCNEu4hkh7>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 29 Sep 2024 05:13:27 -0400 (EDT)
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
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Ryan Walklin <ryan@testtoast.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v5 20/26] dt-bindings: allwinner: add H616 DE33 clock binding
Date: Sun, 29 Sep 2024 22:04:52 +1300
Message-ID: <20240929091107.838023-21-ryan@testtoast.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20240929091107.838023-1-ryan@testtoast.com>
References: <20240929091107.838023-1-ryan@testtoast.com>
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
index 70369bd633e40..7fcd55d468d49 100644
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
2.46.1

