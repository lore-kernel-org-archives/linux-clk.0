Received: from fout6-smtp.messagingengine.com (fout6-smtp.messagingengine.com [103.168.172.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D08FE161313;
	Sat, 21 Sep 2024 09:54:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726912465; cv=none; b=eJuqgtIiyWumT/o6rWmhbmt32uCNQxF8dLL+G1v/Ntd+DVzk3RhO3bxWdYIkOPMbzVCB6GR0YA7nCSD/5Xupk8haNee6jYfFr7WmWuC2JnNjxCUAqr48180yTwvbMnW7oq28W08AMa0ieoRJ05Cd1P42DN+3UKjr2DIVF5PsHlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726912465; c=relaxed/simple;
	bh=+iaIcq7MUeXGQip5+qqSWF7qBtl+THwxQlSqEVELyUI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KM1HMKuBiqTzBSb1TH5lKx3K1VO3WKypM9d2PeEf/gm4j4Jo2jlxuUVgYgzK3R9fIqAWOvvXNlPK96CJlfd4f+KLCjdjWxX+DoM2cIGcVLOSX1PuD6peTfW7j3+DuHE4pIO9r2YRb8AXjXqlXzH+S5JolJFBLO56sb9IRybVpDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com; spf=pass smtp.mailfrom=testtoast.com; dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b=LkvIdUJl; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=e+z4Slwy; arc=none smtp.client-ip=103.168.172.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=testtoast.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b="LkvIdUJl";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="e+z4Slwy"
Received: from phl-compute-06.internal (phl-compute-06.phl.internal [10.202.2.46])
	by mailfout.phl.internal (Postfix) with ESMTP id 3ACBD1380308;
	Sat, 21 Sep 2024 05:54:23 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Sat, 21 Sep 2024 05:54:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1726912463; x=
	1726998863; bh=hLFTY7LfqlCBqrZylORW1LybUYT0flYNwGJskC36IQ8=; b=L
	kvIdUJluL26RcNwSBwx7hsj1yvDEvNlHczzAkZTedt9VRmLXvTDAtrNEKGkE31pQ
	r01yjSRdA3ODMUMa4XK9NZI3DjuSMbfHR/vQbOIgb0sQ7uH8/IAphUzunVaM1eNj
	sJ/83a+7wD1NprrzDQlT3FAd8KUPX/EuSLoUgrzZrIIAyxHaysCYIZr3PWEVjp7V
	qVJNMcvr/MXES3bGnPzhZTkD1RoaY/hp7+I0hnzPmSETFa4IbA58TnQQrCu4e4tK
	RTZ0B7EcP5zqz6RNvj+ajpAqOnTdJm4cPjPE2ruzcMLII7IGEHpXdxFFesJEpLYV
	i23w25hLr6MLdCF0iD6Mg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1726912463; x=
	1726998863; bh=hLFTY7LfqlCBqrZylORW1LybUYT0flYNwGJskC36IQ8=; b=e
	+z4SlwyjGhyV4c9p8X5kLrel4/ntL4MeAwn0jVeY6X3Xf040mpk+xzaRYH6gqpg9
	Gh4UkDlup53Gzw5H0tWv/0PvWNT8WP41Eigyqgm/E1sKqIvrhmkIfEmy4KoEGpm3
	TtWLTffuDy0Cq5YhyPuLw4Q0ZDAyQ2iI0k4LbbCpP/vwyAVWtBqYMGnWU7a7ll6D
	nGePHfRelRovKqcHtHWxmZ1tyxQjdQaQczAfIFxD/EiWCrSvJgGWJi8iAj0qGHlX
	9kU1HQwjBPOqWafSARcPNGSFbuj+STYXYowrd4uUPHQZ+CblxN2mNVJQExNqX8CI
	Q/Nxhru58DykhA9wJRjaQ==
X-ME-Sender: <xms:zpfuZlKBuPd433h7XOM9TiXTQaXctiZwxuHufZDurTjEpKI-HRM6-w>
    <xme:zpfuZhLYTNl5HvNwl8OFb6o62HeF6UqYSTjFlesUt6tXI-k-Ohr7j84DHyyL8AGAF
    v9T1uecQxWlM-X_0A>
X-ME-Received: <xmr:zpfuZtuD0FP0uQdgSxhlj8WIHJBzIqUME403-eglJqGthdvudLv-EbJ0Ml62C_ar-rgyX_LDk-oGdtpICkazh3aXx1okHmfwQgdWo44KgFOzd0uR>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudelhedgvddvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttden
    ucfhrhhomheptfihrghnucghrghlkhhlihhnuceorhihrghnsehtvghsthhtohgrshhtrd
    gtohhmqeenucggtffrrghtthgvrhhnpeffheeiffegtdfgffejteevgeefkeelieelkeev
    ueetffetteduffevgeeiieehteenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmh
    epmhgrihhlfhhrohhmpehrhigrnhesthgvshhtthhorghsthdrtghomhdpnhgspghrtghp
    thhtohepvdefpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehmrhhiphgrrhguse
    hkvghrnhgvlhdrohhrghdprhgtphhtthhopeifvghnshestghsihgvrdhorhhgpdhrtghp
    thhtohepmhgrrghrthgvnhdrlhgrnhhkhhhorhhstheslhhinhhugidrihhnthgvlhdrtg
    homhdprhgtphhtthhopehtiihimhhmvghrmhgrnhhnsehsuhhsvgdruggvpdhrtghpthht
    oheprghirhhlihgvugesghhmrghilhdrtghomhdprhgtphhtthhopegurghnihgvlhesfh
    hffihllhdrtghhpdhrtghpthhtohepjhgvrhhnvghjrdhskhhrrggsvggtsehgmhgrihhl
    rdgtohhmpdhrtghpthhtohepshgrmhhuvghlsehshhholhhlrghnugdrohhrghdprhgtph
    htthhopehrohgshheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:zpfuZmZSBsNki_5xiv_bmvVHz9nsTx9EJiMHupEM944Iv-Dk3T2Ukw>
    <xmx:zpfuZsZ9BF4UVG0h-ITjdqVqsywynasX0jWoTzY15F3_li8WkV3NjA>
    <xmx:zpfuZqANWDit_n6LNT2crbZaU-p1yUVgTXsRYKOIvxokY8oKtxJXNA>
    <xmx:zpfuZqYe2dv5SUFnMBYTzSSutu5qsn1d8QSAPkemMTz2AyT9ICC-5w>
    <xmx:z5fuZgo5CcLk41nac5Pv-P_JETPhnY7QbNCGVEJjTPdZfN6x_wCTOsKj>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 21 Sep 2024 05:54:16 -0400 (EDT)
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
	Ryan Walklin <ryan@testtoast.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v4 19/26] dt-bindings: allwinner: add H616 DE33 bus binding
Date: Sat, 21 Sep 2024 21:46:08 +1200
Message-ID: <20240921095153.213568-20-ryan@testtoast.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20240921095153.213568-1-ryan@testtoast.com>
References: <20240921095153.213568-1-ryan@testtoast.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Allwinner H616 and variants have a new display engine revision
(DE33).

Add a display engine bus binding for the DE33.

Signed-off-by: Ryan Walklin <ryan@testtoast.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Chen-Yu Tsai <wens@csie.org>

--
Changelog v1..v2:
- Correct DE2 bus enum to reflect fallback devices accurately.

Changelog v2..v3:
- Separate content into three patches for three separate subsystems
---
 .../devicetree/bindings/bus/allwinner,sun50i-a64-de2.yaml     | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/bus/allwinner,sun50i-a64-de2.yaml b/Documentation/devicetree/bindings/bus/allwinner,sun50i-a64-de2.yaml
index 9845a187bdf65..ea7ee89158c61 100644
--- a/Documentation/devicetree/bindings/bus/allwinner,sun50i-a64-de2.yaml
+++ b/Documentation/devicetree/bindings/bus/allwinner,sun50i-a64-de2.yaml
@@ -24,7 +24,9 @@ properties:
     oneOf:
       - const: allwinner,sun50i-a64-de2
       - items:
-          - const: allwinner,sun50i-h6-de3
+          - enum:
+              - allwinner,sun50i-h6-de3
+              - allwinner,sun50i-h616-de33
           - const: allwinner,sun50i-a64-de2
 
   reg:
-- 
2.46.1

