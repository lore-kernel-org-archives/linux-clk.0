Received: from fout-a2-smtp.messagingengine.com (fout-a2-smtp.messagingengine.com [103.168.172.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A48611078F;
	Sun, 20 Oct 2024 08:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729413133; cv=none; b=FNA2nCDHMqzSJoGeqhiRM8rRtCJspSLdpbojyzAl3BCc9XMTjDO1sF9PLrzQTe9DEPRg/lWFPJLznSL8mTBuXjSsC9LZUjbQOjxktXM8QQRC1osWIBN4x8X29Qf85rinr/r6mqkrblaOKmX+fniOuY9/LKMybhhpM9B09Sscoo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729413133; c=relaxed/simple;
	bh=h4wLFpuAR63e2mMmyr+TY8i9E+RI9mhwX/uHGt9fehg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cc9KnL/SbzEEb/iiA1WWfv6CEgm3JtrLItU+u1PqOv6dSJZxEKhM+Tu15BhA2EtCk2VQ8wS/raNYh+Hr7MZ9iCVAnRb4jT09hjGVPS6HLBhJZmbICo9qT61Rpuv0Hhk36AvpoCiK6ZiVmzPl3ZdZkr6bjIqHpG9Fp9CvAox5a38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com; spf=pass smtp.mailfrom=testtoast.com; dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b=NhB3qeOQ; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=gxHjeMCG; arc=none smtp.client-ip=103.168.172.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=testtoast.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b="NhB3qeOQ";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="gxHjeMCG"
Received: from phl-compute-03.internal (phl-compute-03.phl.internal [10.202.2.43])
	by mailfout.phl.internal (Postfix) with ESMTP id D1D481380181;
	Sun, 20 Oct 2024 04:32:10 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Sun, 20 Oct 2024 04:32:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1729413130; x=
	1729499530; bh=570RR7RRbKp4auuNkeZ4HJ7qmm9vuQy/ZAbAZMAZEWg=; b=N
	hB3qeOQGG1KPeXe+uDXi8+czs3fNJRwIHLt4ttyRmP39ZivzGjpNIom4aibmiLjC
	5o4ig6hFz91uVQuKbtCEvIQPaU6DztDfhVymJDqpiLWqt/OaoGgT6PBvb89vZ8QK
	82xHy40F4A21/CDVoZITXBPOvPiNHYda+l7PmJfFv4gbUwB5zEWZsr14J3hY9F4Z
	c3p7iE4pMVYAcYuiVWMZCND72n3R76dltNoaYg7rV1C5+xHbZlOlNbIq8YknszId
	phd0jQFlAlNoz0JaoFoNwcBp29DzoP6/ZQMq8TX9wJ5SgFhmoziniA/OaaPliYYt
	ZsdlFXDFk1xyvqAHfjlDQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1729413130; x=
	1729499530; bh=570RR7RRbKp4auuNkeZ4HJ7qmm9vuQy/ZAbAZMAZEWg=; b=g
	xHjeMCGCIxt2WEPqkAVv8JeYBc9BMGyvQZYVkhYL8zt0Gr6Gb0s+ybkifGTQ3pMy
	UFV8fteWa0n5NsS9VNnMUvmsuD15zBDovCzQo7KwEX/PMse4NJd2jrr7tBLWfvjr
	k195ug2KvJlJjndgMGbqLZhpmI8Xl8uWm0B8HgnX6q6tnOFf1X59/yxzT8ncps6+
	tx8T+/CRKl0kqynbcAfccshHtSfEGm37hNbfNhBFeq3dl/qCn/O1zpZberbPQ4c8
	RtkOmPyarURNLkQMbR3qiFeNGNW/XNZEvEZg45IMELZ79kknL1yQTSYlApUugf0b
	V/t6BMsMHvnDd7fAtObOA==
X-ME-Sender: <xms:CsAUZ-gO1LABWJo5Upl-s_YupVa0XUxrZof42uGO8RIViPM87FbxHg>
    <xme:CsAUZ_DkhAU9bmXAEaQ5QDXJeiSC4SzkU-nt0d4YPLVVe4sfEyoaZsDvO95dIjst_
    d-X2_eSyFp6VOQyVg>
X-ME-Received: <xmr:CsAUZ2Fy5eMxQqcrP_mFroU88EsukaQlrXQ4F_k9LVB1TAUxzNVux7fVr1W-aqo-znUKZWJPNT1KGTY8YbVV7o11uYmKcBEU0DmranlL0smwdaUA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdehjedgtdehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttden
    ucfhrhhomheptfihrghnucghrghlkhhlihhnuceorhihrghnsehtvghsthhtohgrshhtrd
    gtohhmqeenucggtffrrghtthgvrhhnpeffheeiffegtdfgffejteevgeefkeelieelkeev
    ueetffetteduffevgeeiieehteenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
    epmhgrihhlfhhrohhmpehrhigrnhesthgvshhtthhorghsthdrtghomhdpnhgspghrtghp
    thhtohepudehpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehlghhirhgufihooh
    gusehgmhgrihhlrdgtohhmpdhrtghpthhtohepsghrohhonhhivgeskhgvrhhnvghlrdho
    rhhgpdhrtghpthhtohepphgvrhgvgiesphgvrhgvgidrtgiipdhrtghpthhtohepthhifi
    grihesshhushgvrdgtohhmpdhrtghpthhtohepfigvnhhssegtshhivgdrohhrghdprhgt
    phhtthhopehjvghrnhgvjhdrshhkrhgrsggvtgesghhmrghilhdrtghomhdprhgtphhtth
    hopehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgpdhrtghpthhtohepmhgrtghrohgr
    lhhphhgrkedvsehgmhgrihhlrdgtohhmpdhrtghpthhtohepshhimhhonhhsrdhphhhilh
    hiphhpvgesghhmrghilhdrtghomh
X-ME-Proxy: <xmx:CsAUZ3RFxAE3Au_3TXL6WXFj7wotiFpq7eJmYRn4dmYDkB8xcOjsmg>
    <xmx:CsAUZ7yOK_JKnm8oVV6NdK3hp-rGlk-0dG_EC_2i39RYOp0GFqIijA>
    <xmx:CsAUZ15K_1wzOzd463-bdxkhHubOPQhSbeDPokxO4cOfFECyM4cOeQ>
    <xmx:CsAUZ4yvyHpKADS4p6w31FckjLIpiHVlRJDB2bFaLHKhA5XNNgaIXg>
    <xmx:CsAUZ7BQjdR9uoN9Ljr811TsVoyyrK0wpsTEZlNYOFoMxrVvoj-F5q1J>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 20 Oct 2024 04:32:06 -0400 (EDT)
From: Ryan Walklin <ryan@testtoast.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Chris Morgan <macroalpha82@gmail.com>,
	Philippe Simons <simons.philippe@gmail.com>
Cc: linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Ryan Walklin <ryan@testtoast.com>
Subject: [PATCH v2 2/7] dt-bindings: allwinner: add H616 sun4i audio codec binding
Date: Sun, 20 Oct 2024 21:30:52 +1300
Message-ID: <20241020083124.174724-3-ryan@testtoast.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241020083124.174724-1-ryan@testtoast.com>
References: <20241020083124.174724-1-ryan@testtoast.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The H616 has an audio codec compatible with the sun4i-a10 driver.

The codec is relatively cut down compared to some of the other Allwinner
SoCs and only has a single line-out route (relying on a separate digital
microphone IP block for input). HDMI and SPDIF audio are handled
separately by an audio hub IP block, which is not currently implemented
in mainline kernels. This requires some additional flexibility in the
DMA bindings.

Add compatible string and routing for the H616 audio codec, and update
the required DMA descriptions.

Signed-off-by: Ryan Walklin <ryan@testtoast.com>

---
Changelog v1..v2:
- Remove PLL_AUDIO_4X clock from definition (defined internally but
  not used by driver and so not required in DTSI)
- Restrict TX-only DMA definition to H616
---
 .../sound/allwinner,sun4i-a10-codec.yaml      | 53 ++++++++++++++++---
 1 file changed, 47 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-codec.yaml b/Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-codec.yaml
index 78273647f7665..db4fde5122686 100644
--- a/Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-codec.yaml
+++ b/Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-codec.yaml
@@ -22,6 +22,7 @@ properties:
       - allwinner,sun8i-a23-codec
       - allwinner,sun8i-h3-codec
       - allwinner,sun8i-v3s-codec
+      - allwinner,sun50i-h616-codec
 
   reg:
     maxItems: 1
@@ -40,14 +41,20 @@ properties:
       - const: codec
 
   dmas:
-    items:
-      - description: RX DMA Channel
-      - description: TX DMA Channel
+    oneOf:
+      - items:
+          - description: RX DMA Channel
+          - description: TX DMA Channel
+      - items:
+          - description: TX DMA Channel
 
   dma-names:
-    items:
-      - const: rx
-      - const: tx
+    oneOf:
+      - items:
+          - const: rx
+          - const: tx
+      - items:
+          - const: tx
 
   resets:
     maxItems: 1
@@ -229,6 +236,40 @@ allOf:
               - Mic
               - Speaker
 
+    if:
+      properties:
+        compatible:
+          enum:
+            - allwinner,sun50i-h616-codec
+
+    then:
+      properties:
+        allwinner,audio-routing:
+          items:
+            enum:
+              - LINEOUT
+              - Line Out
+
+        dmas:
+          items:
+            - description: TX DMA Channel
+
+        dma-names:
+          items:
+            - const: tx
+
+    else:
+      properties:
+        dmas:
+          items:
+            - description: RX DMA Channel
+            - description: TX DMA Channel
+
+        dma-names:
+          items:
+            - const: rx
+            - const: tx
+
 unevaluatedProperties: false
 
 examples:
-- 
2.47.0

