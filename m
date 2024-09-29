Received: from fhigh-a2-smtp.messagingengine.com (fhigh-a2-smtp.messagingengine.com [103.168.172.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5CAF14EC79;
	Sun, 29 Sep 2024 10:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727604505; cv=none; b=n5zaPVR+/z0n6Lt8RKWmlzwg3bkOjycyjQRuhRIcdV+P450WXfmEfrX3tp2IPybXh0twhOpG7FThbc4Vvzy8C+XE2jjcT9zdpanzXqtNfdZgRyM27/Elkz/yaRndHTD8XommJSgzHXkYan/13tAU00aq7blXhYl4mbHd9bIc5IQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727604505; c=relaxed/simple;
	bh=FAysSLtF4bmarv2M82yp2XFvqGD8AuInp7K5nSd99Cg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mc2O8ZeyG1OFnP+uKQ6lYGRYrjBJjDp06sSb8MrsnxNJgM3+hRROH6BmZq1TojLoIgSldQdjzizof2ejR9nmx1MkgHZdLlFyQavwKgXZ1EAHJzzgiCQe9nVBmJ75+IR52/KTeVjDCyyZxlTQ+vFdjdeRBdjrQoKaKXu8Zt9zdL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com; spf=pass smtp.mailfrom=testtoast.com; dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b=W7QxWS6m; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=IMhD28jo; arc=none smtp.client-ip=103.168.172.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=testtoast.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b="W7QxWS6m";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="IMhD28jo"
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 35E5D11402B6;
	Sun, 29 Sep 2024 06:08:23 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Sun, 29 Sep 2024 06:08:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1727604503; x=
	1727690903; bh=lC8SNcb098lNqNGIZkeNhkroHm/BrSc1dzW9sPJ4q7M=; b=W
	7QxWS6mbfhS9DCW/jYpBj1U6F7hiaA2t6feK/tORA38d2TsfqEH6rBxQayo48Nh4
	wB6w08ElHa6bmw60oDMM3RWKeOqiTq1CDOZ27qRpt+XAxszU8UdrJTlTaG3STKVt
	jD3sVjA+4zuFjLPBj+XPOC6os92AZ+tZ1YTsIhB70XPl5pUIYTalOx9q1hkPIlMv
	f0rDMyRDOVD8uuMhAnRiiKXwwsiIh/+5PsybZoYG4LB6YWglr4rfQKGaLEj6pxuW
	QdKDvFFl3mC4CAHft2ErXlJDmX1c6jgl9Xvgdz2S/5qSN9iNcaydgjVZP1oacsA7
	3NMgl/5iq1v8Wg7h3J0zA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1727604503; x=
	1727690903; bh=lC8SNcb098lNqNGIZkeNhkroHm/BrSc1dzW9sPJ4q7M=; b=I
	MhD28joWycI6C+nCJ5zhMGjo5kouXKvEwnqOtZyLcc172N10Q2eFdECMzle58wpr
	q0iuG0wfl0li+AYZpnfxTOUPd8jDmCYytbDmWQBahzKCySRrCdm0hFC6LHEr7vg/
	JHK6C9Y0MGgcl6LGYXROjwHXFMjyHLIgbSUY5DMdHW1eGiLyHEHcIgXr0Ere5Am9
	9uqkSsrpkrMQjyyMm/w88erxluJfh9ssr9DM4UrvPOl/lV1vs/+ko/nI9gNJ6Saq
	wNnu2PNNx4ilhpw81lXcTXQoUfSXZJbuNUelDOxwrOKEoryuXkgQlYWG/9Y94reQ
	VGmnP4kQ8S3xayQK16Mtg==
X-ME-Sender: <xms:Fif5ZqwJPfbUjGbB1fETkZWf1yNvudl5eMUjlKhahsy659wnoxw4jw>
    <xme:Fif5ZmTCMwkoqATtY_1m-QLfJ4zORvdkW_xf6sVQ9hyIDE_l08oR6zi2brjok3O02
    2-lSBl9X_YyKEyIeA>
X-ME-Received: <xmr:Fif5ZsX0P0_v9MWeOGtkc9PlmlMNtt10hb_gWzr6qGaSiHN1-oGRHBl06MsfFCCRnOXf-UUG7E-UUC_e2JROQX7kbA158nFIJfSp65KffxidDzsO>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvddufedgvdejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttden
    ucfhrhhomheptfihrghnucghrghlkhhlihhnuceorhihrghnsehtvghsthhtohgrshhtrd
    gtohhmqeenucggtffrrghtthgvrhhnpeffheeiffegtdfgffejteevgeefkeelieelkeev
    ueetffetteduffevgeeiieehteenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
    epmhgrihhlfhhrohhmpehrhigrnhesthgvshhtthhorghsthdrtghomhdpnhgspghrtghp
    thhtohepudefpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehlghhirhgufihooh
    gusehgmhgrihhlrdgtohhmpdhrtghpthhtohepsghrohhonhhivgeskhgvrhhnvghlrdho
    rhhgpdhrtghpthhtohepphgvrhgvgiesphgvrhgvgidrtgiipdhrtghpthhtohepthhifi
    grihesshhushgvrdgtohhmpdhrtghpthhtohepfigvnhhssegtshhivgdrohhrghdprhgt
    phhtthhopehjvghrnhgvjhdrshhkrhgrsggvtgesghhmrghilhdrtghomhdprhgtphhtth
    hopehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgpdhrtghpthhtoheplhhinhhugidq
    shhouhhnugesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqd
    grrhhmqdhkvghrnhgvlheslhhishhtshdrihhnfhhrrgguvggrugdrohhrgh
X-ME-Proxy: <xmx:Fyf5Zgiio_Tdvke_MygWfa9Xs4pzs_9jiOxrqgpuV_RSAGl1bvar5w>
    <xmx:Fyf5ZsDx4rhvayYOe1Z11qObBfYZDf3INQPi-jekWiVRjT23KZa9NQ>
    <xmx:Fyf5ZhILunvzGnBkTz6yVCJ2kocpH_DRmF7pQXWZmepY4vZIBQlddA>
    <xmx:Fyf5ZjB0XhefVJAW8I7G2tOhVuQJx9Ca01y8cjQF9eh05sdc7Fc8cw>
    <xmx:Fyf5ZgysCw8_RKwaeVMY_T0dJaFFN8ANDTyXl8h_NeU8f_PBfWtOL82->
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 29 Sep 2024 06:08:19 -0400 (EDT)
From: Ryan Walklin <ryan@testtoast.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Ryan Walklin <ryan@testtoast.com>
Subject: [PATCH 4/6] dt-bindings: allwinner: add H616 sun4i audio codec binding
Date: Sun, 29 Sep 2024 23:06:05 +1300
Message-ID: <20240929100750.860329-5-ryan@testtoast.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20240929100750.860329-1-ryan@testtoast.com>
References: <20240929100750.860329-1-ryan@testtoast.com>
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
in mainline kernels. This and the use of SDM requires some additional
flexibility to the DMA and clock bindings.

Add compatible string and routing for the H616 audio codec, and update
the required clock and DMA descriptions.

Signed-off-by: Ryan Walklin <ryan@testtoast.com>
---
 .../sound/allwinner,sun4i-a10-codec.yaml      | 55 +++++++++++++++----
 1 file changed, 43 insertions(+), 12 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-codec.yaml b/Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-codec.yaml
index 78273647f7665..5838600dbc730 100644
--- a/Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-codec.yaml
+++ b/Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-codec.yaml
@@ -22,6 +22,7 @@ properties:
       - allwinner,sun8i-a23-codec
       - allwinner,sun8i-h3-codec
       - allwinner,sun8i-v3s-codec
+      - allwinner,sun50i-h616-codec
 
   reg:
     maxItems: 1
@@ -30,24 +31,40 @@ properties:
     maxItems: 1
 
   clocks:
-    items:
-      - description: Bus Clock
-      - description: Module Clock
+    oneOf:
+      - items:
+          - description: Bus Clock
+          - description: Module Clock
+      - items:
+          - description: Bus Clock
+          - description: Module Clock
+          - description: Module Clock (4X)
 
   clock-names:
-    items:
-      - const: apb
-      - const: codec
+    oneOf:
+      - items:
+          - const: apb
+          - const: codec
+      - items:
+          - const: apb
+          - const: codec
+          - const: audio-codec-4x
 
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
@@ -229,6 +246,20 @@ allOf:
               - Mic
               - Speaker
 
+  - if:
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
 unevaluatedProperties: false
 
 examples:
-- 
2.46.1

