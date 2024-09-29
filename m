Received: from fout-a3-smtp.messagingengine.com (fout-a3-smtp.messagingengine.com [103.168.172.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2241B149002;
	Sun, 29 Sep 2024 09:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727601222; cv=none; b=lO3vhEsjC9mssMsYpyz1LsjpYbEDJNfr6JIHpDCaaKmGkv+CJIqSZeIVGtKQ+JO2diuxiRhw6HIHHuxAo9+psZMrtPqVSDJbCUz7doW+bDPCR+dOxVox6xPKwNzEDO0YKf4yX/HW84f5QfFzgO3ZdfqV2t4IZQ9MZkJmkDH94Dk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727601222; c=relaxed/simple;
	bh=8AJ4HYXuRgC3du7TpMCrb3F3b3Wzs0+cHFgXaMD6mi8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WTQMV5suYfJMULM6lVyB/xqvVNHKpJd83mRAECEr6OBA1jfJqWiT7GLdI7HMuwy1wy8+QQDO9J0ZNubsrFvgb2B7xmV1c9zzXYzVlKsuCvHYaCp1GQjJz8GATCQ1+yQHawJN+WaZM2Z0cbym5pFMGVvL1Ho5yRM6Vsu1AgXy2c8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com; spf=pass smtp.mailfrom=testtoast.com; dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b=jeZ+0LHa; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=c1TO+Lqv; arc=none smtp.client-ip=103.168.172.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=testtoast.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b="jeZ+0LHa";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="c1TO+Lqv"
Received: from phl-compute-01.internal (phl-compute-01.phl.internal [10.202.2.41])
	by mailfout.phl.internal (Postfix) with ESMTP id 6871513802B7;
	Sun, 29 Sep 2024 05:13:40 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Sun, 29 Sep 2024 05:13:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1727601220; x=
	1727687620; bh=soe6UnfOFlClSHMdY3T8JKZaxKLApa1PT2tNRAMa+Co=; b=j
	eZ+0LHavLtW6gv9lKOttzMnBrVEv1pDuz7QNHovPQaGUnLRtw66cdAtyQ2dKp0fC
	NvQzPKN1CNTnXgP3KOgcZtLqyvvamhnUT8ELQH/cS5D3YsesmNp7QccgLihHy4Yd
	IVeMDJgc0FEOySWhN605n36BAMeKrSNjwR8GrI3/f95IGhdnmaCM2e8XPWUZ97Y5
	gVUaBbXI+n3XT6KVKX31OaYm5JkMqMCCSgi2IcRw0RFcxvSLi/w2uhUJdBMVKTKm
	iD5xIbCLw/1fjmaNiYZgPgxYqmAOoMit7UefxdL43LNJ8bFfOLMDcLK0tpE2rKUi
	av78ccGVTmn86z0U3oMRA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1727601220; x=
	1727687620; bh=soe6UnfOFlClSHMdY3T8JKZaxKLApa1PT2tNRAMa+Co=; b=c
	1TO+LqvDAqkMAtOoFpJ/TInlUwD3D3gRmzJfK6wWhU9eN42zztIZ/kfHNk9XVhlw
	Wq0EEhsvXoPvcvPmB4MQFsivOG5UUiY5GOvoB1oXMbSEBO++Ry3PV3SPzeaz6XQi
	afXWGHttyCuyhCbEhGOq6fu2AU+xWoqEb9DCqGEjRKCKmvsARAbVznVSaD3oRVBp
	UHRrB6QZFv4EOBYNBb5srdGmwuhbBwj6d3F2NKkO8FRQOXg+BZggCF7vDvlEqHNl
	m2yo7UmbxgIFmTV07Zagweajrj20QUlTd9uatHscAWGv6kmu3adk5wYuGlHCvjE/
	IsT/xPepMC8COxDf6X8lA==
X-ME-Sender: <xms:RBr5ZpfhcQbtFqYC-9L95TBMmvkMVaSf0FMO8MhGOE6xysK-XXwoWQ>
    <xme:RBr5ZnPTVEDElrwliDokIdjv0Rc5O4f37mdabHBszuxSEH7LK4VP1l5xz9I754b4Q
    0bbpbJAeg2-nxXM5Q>
X-ME-Received: <xmr:RBr5Ziiyezlme4kX_EqZQ8vDXgc4niXOrxJ_T3c8YuQuPcJM8OeS2mBFdvYVju0gzRptLCVWk1lxlpoVWmNumWUdHds_wUP4h8YaBlRp-bzDzI_L>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvddufedgudegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttden
    ucfhrhhomheptfihrghnucghrghlkhhlihhnuceorhihrghnsehtvghsthhtohgrshhtrd
    gtohhmqeenucggtffrrghtthgvrhhnpeffheeiffegtdfgffejteevgeefkeelieelkeev
    ueetffetteduffevgeeiieehteenucevlhhushhtvghrufhiiigvpeegnecurfgrrhgrmh
    epmhgrihhlfhhrohhmpehrhigrnhesthgvshhtthhorghsthdrtghomhdpnhgspghrtghp
    thhtohepvddvpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehmrhhiphgrrhguse
    hkvghrnhgvlhdrohhrghdprhgtphhtthhopeifvghnshestghsihgvrdhorhhgpdhrtghp
    thhtohepmhgrrghrthgvnhdrlhgrnhhkhhhorhhstheslhhinhhugidrihhnthgvlhdrtg
    homhdprhgtphhtthhopehtiihimhhmvghrmhgrnhhnsehsuhhsvgdruggvpdhrtghpthht
    oheprghirhhlihgvugesghhmrghilhdrtghomhdprhgtphhtthhopegurghnihgvlhesfh
    hffihllhdrtghhpdhrtghpthhtohepjhgvrhhnvghjrdhskhhrrggsvggtsehgmhgrihhl
    rdgtohhmpdhrtghpthhtohepshgrmhhuvghlsehshhholhhlrghnugdrohhrghdprhgtph
    htthhopehrohgshheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:RBr5Zi83fs2gkx8bOD4TyXYBmoh4TSdgqQrf_AFel7cri5t2lrgIYQ>
    <xmx:RBr5Zlt96cFUQ_S9cgRwWTd88XW7qtojN9gasNIxsky544KNtyElWQ>
    <xmx:RBr5ZhG-1FFeplP3Tdhpjnwa7pH0PO6DKomK6NjjAh-HVWHN0nbQZg>
    <xmx:RBr5ZsPEoWL6R1EfjaFZwwIuFuOt8TRJCV5i15yd66syF0b4HIcKmw>
    <xmx:RBr5ZleTwq9SPu_KGgP4EKjhzB2PwYF92dxb-wrj1NNeqz6qYh7zN5tZ>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 29 Sep 2024 05:13:34 -0400 (EDT)
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
Subject: [PATCH v5 21/26] dt-bindings: allwinner: add H616 DE33 mixer binding
Date: Sun, 29 Sep 2024 22:04:53 +1300
Message-ID: <20240929091107.838023-22-ryan@testtoast.com>
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

The mixer configuration registers are significantly different to the DE3
and DE2 revisions, being split into separate top and display blocks,
therefore a fallback for the mixer compatible is not provided.

Add a display engine mixer binding for the DE33.

Signed-off-by: Ryan Walklin <ryan@testtoast.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Chen-Yu Tsai <wens@csie.org>

---
Changelog v2..v3:
- Separate content into three patches for three separate subsystems
---
 .../bindings/display/allwinner,sun8i-a83t-de2-mixer.yaml         | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-de2-mixer.yaml b/Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-de2-mixer.yaml
index b75c1ec686ad2..c37eb8ae1b8ee 100644
--- a/Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-de2-mixer.yaml
+++ b/Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-de2-mixer.yaml
@@ -24,6 +24,7 @@ properties:
       - allwinner,sun50i-a64-de2-mixer-0
       - allwinner,sun50i-a64-de2-mixer-1
       - allwinner,sun50i-h6-de3-mixer-0
+      - allwinner,sun50i-h616-de33-mixer-0
 
   reg:
     maxItems: 1
-- 
2.46.1

