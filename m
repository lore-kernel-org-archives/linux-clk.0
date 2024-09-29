Received: from fhigh-a2-smtp.messagingengine.com (fhigh-a2-smtp.messagingengine.com [103.168.172.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 102A014290C;
	Sun, 29 Sep 2024 09:13:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727601209; cv=none; b=Jb+UyhIZbwJDZlqHKxOOAaa917s0Dos+SHmSu/XYK1RPkR6do28Ea2H5CeWRylKVPrB2qoCvl6sOhtsSHkZUZXMUwel3ZdsK/ti6JVyddPG5Am7Fn4pHrFJpxbaTi7NcD1TTXSdyBYjbJ1niDWlURuM9VMBmODCDVtKvybwTm/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727601209; c=relaxed/simple;
	bh=H4VV+YGpOVYSHxozJzRpr+M/DNuMube0XHeOOvo6boU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ISuvrL0Xceh/GtpTFSKTDWeSY5wkjeQOf2Z+s100+KmjhtKgdnbYEoS0+os5IJu/27sZmUKYAen5o7vB4DgXhyuSOIHbsfFw06wj9CxYFCMLMkhWK50eBIJz2NaGYne2Vzw2JtkjmV6QKd1fOrfvCd7zv4p6/1RGNl4NU+9sDkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com; spf=pass smtp.mailfrom=testtoast.com; dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b=lzP4tUWN; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=l7wY80rE; arc=none smtp.client-ip=103.168.172.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=testtoast.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b="lzP4tUWN";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="l7wY80rE"
Received: from phl-compute-06.internal (phl-compute-06.phl.internal [10.202.2.46])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 6F74411401FB;
	Sun, 29 Sep 2024 05:13:27 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Sun, 29 Sep 2024 05:13:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1727601207; x=
	1727687607; bh=HUZkB4BTaGl4+olIKxefdYNCC1xPzS2oUWDhSekCT3I=; b=l
	zP4tUWNK64LLx9+bwrpPZYIgHmdnQo7essQ8FMwr8wkFv0y/Z3KpKF7n3JzDj65h
	EyX1dLK4Mcfd6bShN6+mzAegiAHup3STFvqLDdNzbHIzP27uASKQmCu9hbcq+ZMl
	ETWHzeVBu5gLcN5iosz2HqBw/IzKCgQUZv0R7QxfEL0ejI6kp7H0rMpKc6N7qgEZ
	2J0fTipUxO/UTa7CELfpJazNcLZUp1hH+xStMBQSfzLTOCxEXXJmiLAenDFwu9H+
	vzd21DiJ//OZPip6ymvHBqZi26dc1pMQek8Cwwo0tHgjR9zkoyEhvjepgojHEi9Z
	fXWZxxH3cO4IPRQ2o6N2w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1727601207; x=
	1727687607; bh=HUZkB4BTaGl4+olIKxefdYNCC1xPzS2oUWDhSekCT3I=; b=l
	7wY80rELUxSt7qLqc5BQY740J9P8w8fi9o++q7s6LU/xTR6/BM57et2CDNvwBp85
	tvQg7RkH3I/czPONBS6AVXObaXC5SCTFOFnBdJC0egRvbEobfqf9e3IeorOWTVt5
	xZDPWCvdl56FEx/2nDVv21wRNVaa6Q+5BI5uToZG9AfR2BeKH1CLvFinVfkL9rar
	M/fK768m8sIug3hwxkZFYKgER0zRUK+lenZcgoa58gJfyTQxtBF7ceLyE+hbvML8
	TvDApzdeIHW9e+1RHsGhdgSH44KK/kMMCOCsismFSv4j7RB4zekEZ3zRO5mf1vvZ
	x3AGf1kym2VLaZ/frflXg==
X-ME-Sender: <xms:Nxr5ZuQwR7z0HLQ3GWEURhSI8bLQmxZ2WN0vxYL-eFMSN-7yNAmGBQ>
    <xme:Nxr5ZjzFYjJ_Mm1L1xuVxQ2B_Z7OCigT-JYz2D1eYHFJywUsh92QBUAbl4ESqrw1i
    QJXMOVheU7iT6IdYg>
X-ME-Received: <xmr:Nxr5Zr068gN2v9RneHrmSW_WuD5qb-b-nRWjpovKsBkVQtoO1H1D-6k30psI4TZvL0K9GdueHNPw9aiAng3WjhRE6EKr69PPJgGhoXX5yikBkxF7>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvddufedgudehucetufdoteggodetrfdotf
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
X-ME-Proxy: <xmx:Nxr5ZqA8CKBgjAkjNmpS1AbZb2N8mbuN8afm82Z4ZR7hWRDctu8jfA>
    <xmx:Nxr5ZnhUvWmzf4yBMAihrWzoKG5zYCLkMdZ5iEQVqtH08y_cHE0ekQ>
    <xmx:Nxr5ZmpjB4-uAMwBkasJgRCbwMWUKHpdcMVjQLGG9SDsILa_tQuHew>
    <xmx:Nxr5ZqghzI38WoAzjhnkK0tE3qp0YFFhSaicV1M5jsZNZcGGFFHe3Q>
    <xmx:Nxr5ZiSNuibOBLlVtV_xeZi9uGuOoTrbOAAndsTAobuf534rdAIFuXlv>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 29 Sep 2024 05:13:21 -0400 (EDT)
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
Subject: [PATCH v5 19/26] dt-bindings: allwinner: add H616 DE33 bus binding
Date: Sun, 29 Sep 2024 22:04:51 +1300
Message-ID: <20240929091107.838023-20-ryan@testtoast.com>
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

Add a display engine bus binding for the DE33.

Signed-off-by: Ryan Walklin <ryan@testtoast.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Chen-Yu Tsai <wens@csie.org>

---
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

