Received: from fout6-smtp.messagingengine.com (fout6-smtp.messagingengine.com [103.168.172.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ED5E155CAE;
	Sat, 17 Aug 2024 23:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723936079; cv=none; b=I3rlKxjhWQpP+sYwpN3e8fhxMIzkCB7cSwRW+jOgd2lhGRFq/NqfcKtwb4CinFltQzBWfrnKbjxjgHkUGs7CNQ6UjmmQC2AAElG2mOzlEJOEGfH6gqVpmCk8EI9Gw7nCl2it/XvAj3t63QqSlWKZLrONEHQFYEQmHJVP6kQ4YeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723936079; c=relaxed/simple;
	bh=EDs7FwU4AU6c6qBVnGGmV+yzwo18BCy7CeA2an3Fc6E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bBbRd2SWvFZU8liACOeHMIqAnhRURflST3dl3h8E+vOClJOCzJG5TrkgH47euHmC4xgcCWr0qlHgwgazQ/Gn/ScFB3HO++90RU3nadEesbTykaFkri04/6/uMDBDTnXb6dulogKuNLrgjJ/+ecfaP5oP/ESzYZwMOVVXa2LN39s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com; spf=pass smtp.mailfrom=testtoast.com; dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b=j/Fq4pAw; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=a/oB83Hm; arc=none smtp.client-ip=103.168.172.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=testtoast.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b="j/Fq4pAw";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="a/oB83Hm"
Received: from phl-compute-08.internal (phl-compute-08.nyi.internal [10.202.2.48])
	by mailfout.nyi.internal (Postfix) with ESMTP id 998291388095;
	Sat, 17 Aug 2024 19:07:57 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-08.internal (MEProxy); Sat, 17 Aug 2024 19:07:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1723936077; x=
	1724022477; bh=ArgqruXeyttOR0gNKLEFp7kUu4hS3MvwuI1H2d6rlAA=; b=j
	/Fq4pAwSdQtK4IudTu97Rhr1f73xHWpmWquhWUc2FG4ziyOiYQrRrCg9KRSwFswF
	Ey1dd7khbwaRu+vEsn3jEApfqOf+aB565PdqyNnHcLx6H7POdyxMt/vESkh3urb2
	WObPS8DEzWyoSLWvNHV9V8LDRWrfqsXVaFBCy0VRRMykbcT3o2PafRC4cJ/cK6TE
	txWiy96LvW1k6NqTNniJnbfN9zA6hQ+IWl/oc9iFx7jh9ByGiMSYL0m2a9GRtUK/
	20wSkyy9avUTWIqoSzOpiiTOH2Gq5BmG14zcsk6uJetouq6/hqyHa36g+DUC/7I7
	IYG8ZBaHDzvLZc0NL8PVA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1723936077; x=
	1724022477; bh=ArgqruXeyttOR0gNKLEFp7kUu4hS3MvwuI1H2d6rlAA=; b=a
	/oB83HmOGU9mDY+f46yJ9/1aeHyTYvT9V1vf/8jrkYec30FU5ZpYUWlYMS8jUmqY
	+qWtLlI3duweMPAUsYdAX3z5ySPOhoQHqPgyUeV1++zVF56K1TNn75RSrk6F2+kR
	X7GWacl/4j9XHyb+fuhaiSPXK/s5DC5H9h6rzrQdru9smUXWQq3tJN2Xa+8CJdad
	YdggrPNdfQQfLE+pan4jao9iRgpLN8BNe1g+04+sKSzeYm6fMophKvmIiVRo0Cd1
	ZihlzTy4TsqS7dS3N5dcP2o2g2/7sUUiCNK40fHVZ0U+ayj4hdmbwlg28I94SXyj
	g5MZKvv0ZRxPaP0aFHtZw==
X-ME-Sender: <xms:TS3BZu7X1BB7RFLRzi8CQdE34HZUsRqP8yGcQyc9SpLtfuQdGJdcjg>
    <xme:TS3BZn7g_R9Y1yJciRZ4YdBSitVPf2dOg3Tm2r_uBtIVn-bY5NGdRs6yECmhkvq6b
    GkF76JsdxbBsd_7cg>
X-ME-Received: <xmr:TS3BZtchUubeipQopPlZBO-2HHX8JJs3uNfIZyEYvWKeHuyMvKfxKlBeaFt6ZI6oeypILMzKbYK6JMSKhxhHABWz6MWze1I9ZZbmGPDcpOKw92xq>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudduuddgudekucetufdoteggodetrfdotf
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
X-ME-Proxy: <xmx:TS3BZrL-dsSfLczCxr7PMKXPTbQUwUZiGYLeRdWZ3LqtfMh6LDJXYA>
    <xmx:TS3BZiIi2vONY9YShEqdBAlxeEWUJGOMUMTr4I6GPkZWriUaxIC9-A>
    <xmx:TS3BZsywyUISxQS4G_AVpRp80S9udgu8CrWNWpvrqf955QLvxbU97g>
    <xmx:TS3BZmIgZfvsU4XQh_JFp3z8mVwfDCVNvp5HpPvxITdLutg04_TWEg>
    <xmx:TS3BZnbn4jlQUYKsriXb_UvFfkxG4ZH_BAU9nB6yh183AX4IeHsL37Rg>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 17 Aug 2024 19:07:50 -0400 (EDT)
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
Subject: [PATCH v3 19/26] dt-bindings: allwinner: add H616 DE33 bus binding
Date: Sun, 18 Aug 2024 10:46:06 +1200
Message-ID: <20240817230503.158889-20-ryan@testtoast.com>
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

The Allwinner H616 and variants have a new display engine revision
(DE33).

Add a display engine bus binding for the DE33.

Signed-off-by: Ryan Walklin <ryan@testtoast.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>

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
2.46.0

