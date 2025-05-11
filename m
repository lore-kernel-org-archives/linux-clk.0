Received: from fout-b1-smtp.messagingengine.com (fout-b1-smtp.messagingengine.com [202.12.124.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67FD21C8623;
	Sun, 11 May 2025 10:42:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746960140; cv=none; b=RdOIXPDN2rTvwUPqgrPQQV6vTI8NZwwEuIoFO/GRLV/dhSY+tXllaOiWeWn5PY95pzEWQBtdhESRc+avYmKTXwO3P4hwaCUeO0ANBfmd2NBqFf/qBo0c+/sWJl7FtbTGOVg9o1s0KuCxjwzSd+kb2+bu05X5uwD34DyN/Qf8Bk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746960140; c=relaxed/simple;
	bh=2+ggvqWODRwKK3AJVwy/sX1Bl4Inx26+M90asSZSiU8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PSnHOYIF+qNhQJR8li1zVhz+vH/WCpnvc/dRhTOeTmwk4wLGgIXe23zDb0BQKiMpPf7isgiA1lWf4JwRUSSqt2AYXHa+h2oUyBdbv95btXgzxHP+BHUgQXUBFr6lG3bnfPgpqwTESk43hyRR243CW+RGHgGq+tGXJqU3uTL1zK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com; spf=pass smtp.mailfrom=testtoast.com; dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b=PT6pZMgU; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=ILv7M9UV; arc=none smtp.client-ip=202.12.124.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=testtoast.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b="PT6pZMgU";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="ILv7M9UV"
Received: from phl-compute-03.internal (phl-compute-03.phl.internal [10.202.2.43])
	by mailfout.stl.internal (Postfix) with ESMTP id 0D85611400F0;
	Sun, 11 May 2025 06:42:17 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Sun, 11 May 2025 06:42:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1746960136; x=
	1747046536; bh=4ZgdUse53vau2XzUwr5zJ/pZRDyidcmlLPObrF7kKqQ=; b=P
	T6pZMgUIz8Ym8ajDN9+70xlW0KylftdLn/TjCpozabuZPHYmweyEGy/vRHGIfdi0
	EuqWo1lAuzYmY7zMHjekNnXFMxGEkhf99nOC2Tf/jAdubGevPvJIS+BeITWAEMSa
	iz5qLFnM9qnT4TLgBvVHtgLUciFFFt1UIg4I09d4lO4Oc0JAT4ry66YJZlH1gXqT
	kePHkbjwuaJotyspRXCdnl6C+kV6wupDQa5eh1WGIQspY5ZYnYVT/4x2DWB8ErcP
	+RgNCeSJDY88qGmRA8U0BruXCbWPVsOVJOV9gIS2Aj4L9yqsKOma+sLvh52n1gvv
	2EfWM7/NgmqAJm8RADeuA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1746960136; x=1747046536; bh=4
	ZgdUse53vau2XzUwr5zJ/pZRDyidcmlLPObrF7kKqQ=; b=ILv7M9UVEpztpk4K/
	IIDAdn2f5T3JjtPJzD4ajvc2bU6VWDHhyaePQamWfCCf9G2ysB4YLdUripCUdhEo
	0xjdgxHW0XAz4xR8tc1ykIsbmg71vB3q50Ntu8GhEUWE/+ExbipBzWeHbKgMh+TE
	U4K14VEoUMmdmhex48aq0uSeXAUazk/qaS2OFolVJzp+qRwopBJcNdlyAbVdeOiG
	mSEx73qfFFclTabKNelIyn4+xu70ighUTRW1DCIg9CI4o+EmHr0YbOzYRV7CglvE
	VoylLz+027/ZaCEX2ewL0IMOAv+iqy6pUkD5kBNW2cVgCDs0fAsaPC/0Moh/uOVj
	kkNaw==
X-ME-Sender: <xms:CH8gaKmonlfToUXal23opRouyQ93_QZjLeeeG2aWtq63UVdUSxLS0A>
    <xme:CH8gaB3C1yvdSnQ5GuG0x1tREbVsV_gBHmLLQfvTwi1vrKlfAr271ysZKzLKtFHWx
    lbkjR0_ViV8qnZmPg>
X-ME-Received: <xmr:CH8gaIoMYJPcwox9BzA9IKYpgEwzWtaWH-nA-MB9mZSkkL_Qrtsa7C-D6laNylBx_5-LH0y6GNyQeN5gaD3klnO3Mk3DSaRLmTpv9BTOiQNw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvleekudeiucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredt
    tdenucfhrhhomheptfihrghnucghrghlkhhlihhnuceorhihrghnsehtvghsthhtohgrsh
    htrdgtohhmqeenucggtffrrghtthgvrhhnpeffheeiffegtdfgffejteevgeefkeelieel
    keevueetffetteduffevgeeiieehteenucevlhhushhtvghrufhiiigvpedtnecurfgrrh
    grmhepmhgrihhlfhhrohhmpehrhigrnhesthgvshhtthhorghsthdrtghomhdpnhgspghr
    tghpthhtohepvdeipdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehmrhhiphgrrh
    gusehkvghrnhgvlhdrohhrghdprhgtphhtthhopeifvghnshestghsihgvrdhorhhgpdhr
    tghpthhtohepmhgrrghrthgvnhdrlhgrnhhkhhhorhhstheslhhinhhugidrihhnthgvlh
    drtghomhdprhgtphhtthhopehtiihimhhmvghrmhgrnhhnsehsuhhsvgdruggvpdhrtghp
    thhtoheprghirhhlihgvugesghhmrghilhdrtghomhdprhgtphhtthhopegurghnihgvlh
    esfhhffihllhdrtghhpdhrtghpthhtohepjhgvrhhnvghjrdhskhhrrggsvggtsehgmhgr
    ihhlrdgtohhmpdhrtghpthhtohepshgrmhhuvghlsehshhholhhlrghnugdrohhrghdprh
    gtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:CH8gaOm-RIse3vuC1Dy7B-kP-65iIwKnG2A221AjxP53Ou0ufx9r-Q>
    <xmx:CH8gaI1j2lgtrufPpqb9SimjM_kuiDx4PBxisKQ5lgEohn2DRiqu4A>
    <xmx:CH8gaFutT5fXbtDddzfbq-H1lQgsJsa1wiDWqcxSEcmzwxRn1zx1Gg>
    <xmx:CH8gaEUjLi8bb3kpbwaxX65ytdBhYTwNNT5pNLwIGM3VxLmK7AU6mA>
    <xmx:CH8gaE4qaIghs9MIadwLWEqiwFFg-p-Uo7VyDx0J0DhDt0f6MtpkBh3g>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 11 May 2025 06:42:10 -0400 (EDT)
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
	Conor Dooley <conor.dooley@microchip.com>,
	Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH v10 07/11] dt-bindings: allwinner: add H616 DE33 mixer binding
Date: Sun, 11 May 2025 22:31:16 +1200
Message-ID: <20250511104042.24249-8-ryan@testtoast.com>
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

The Allwinner H616 and variants have a new display engine revision
(DE33).

The mixer configuration registers are significantly different to the DE3
and DE2 revisions, being split into separate top and display blocks,
therefore a fallback for the mixer compatible is not provided.

Note that the DE33 mixer requires 3 register blocks instead of 1. The maxItems
value for registers is therefore conditionally removed for the H616 and
replaced with the block names from the vendor BSP kernel.

Add a display engine mixer binding for the DE33.

Signed-off-by: Ryan Walklin <ryan@testtoast.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Chen-Yu Tsai <wens@csie.org>
Signed-off-by: Chris Morgan <macromorgan@hotmail.com>

---
Changelog v2..v3:
- Separate content into three patches for three separate subsystems

Changelog v5..v6:
- increase reg maxItems to 3 and add conditional for h616-de33

- Increase reg maxItems to 3.

Changelog v9..v10:
- Use named register blocks rather than by count as names are available from the Allwinner BSP kernel.
---
 .../allwinner,sun8i-a83t-de2-mixer.yaml       | 34 +++++++++++++++++--
 1 file changed, 32 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-de2-mixer.yaml b/Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-de2-mixer.yaml
index b75c1ec686ad..cbd18fd83e52 100644
--- a/Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-de2-mixer.yaml
+++ b/Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-de2-mixer.yaml
@@ -24,9 +24,11 @@ properties:
       - allwinner,sun50i-a64-de2-mixer-0
       - allwinner,sun50i-a64-de2-mixer-1
       - allwinner,sun50i-h6-de3-mixer-0
+      - allwinner,sun50i-h616-de33-mixer-0
 
-  reg:
-    maxItems: 1
+  reg: true
+
+  reg-names: true
 
   clocks:
     items:
@@ -61,6 +63,34 @@ properties:
     required:
       - port@1
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - allwinner,sun50i-h616-de33-mixer-0
+    then:
+      properties:
+        reg:
+          description: |
+            Registers for controlling individual layers of the display
+            engine (layers), global control (top), and display blending
+            control (display). Names are from Allwinner BSP kernel.
+          maxItems: 3
+        reg-names:
+          items:
+            - const: layers
+            - const: top
+            - const: display
+      required:
+        - reg-names
+
+    else:
+      properties:
+        reg:
+          maxItems: 1
+
 required:
   - compatible
   - reg
-- 
2.49.0

