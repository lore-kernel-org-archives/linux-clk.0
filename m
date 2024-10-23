Received: from fout-a6-smtp.messagingengine.com (fout-a6-smtp.messagingengine.com [103.168.172.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53B2D156257;
	Wed, 23 Oct 2024 07:59:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729670383; cv=none; b=GDlf2WO3JZqMyZCjiC+GJoVoFoECTv5gCjrVU2mPH5RNhulV7lF2byZIpn+lzgRrIyo9Byl3x+FaYXT2pDfrKC8BTw+qQO39q4YEKHxnJWWQLfL/wsdmtpN4UHybdRhavNf+Voh9cjkkP75+zXvYNngP5utBdO1HcqTom3dfZpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729670383; c=relaxed/simple;
	bh=Y9J8xPb/+3dEUSQnl2nc0Bu/3DH5j0+j8ENQIY+At74=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uxXJ1G8UqDV/TpnlJbEEWCaqXOJatCL/IHpuGgmX0lktKjDPaG8iPNjK1WgjT0aLY06F8mkJ5QnM2LuN36zq+f/bligsBFxdanrXRf86/MKI4h5bbLw5xFckobOCJuRdV616wmhjcFnUTws63GX0hZ42Kl4vQtc3lZA2ph7dbO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com; spf=pass smtp.mailfrom=testtoast.com; dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b=A48tOkZi; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=bxSw88tT; arc=none smtp.client-ip=103.168.172.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=testtoast.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b="A48tOkZi";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="bxSw88tT"
Received: from phl-compute-06.internal (phl-compute-06.phl.internal [10.202.2.46])
	by mailfout.phl.internal (Postfix) with ESMTP id 7B1691380499;
	Wed, 23 Oct 2024 03:59:40 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Wed, 23 Oct 2024 03:59:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1729670380; x=
	1729756780; bh=7uiuJiInJUIv7ibp9q7xm1m4Q0qlEkTigyGQH0pLLlM=; b=A
	48tOkZiYCPIAd6kkdh0Z2MsRUbhkWy+35vFA9tvZQjqd/4Ynhs+YI8Of8PJSDMAm
	gge4g9Sg7F665QkDj7jI0fRPI4M4vPkVeVvM3m7/QcesfuZGnotOIQMCSbYODIJN
	Cd8rSbBaLof3naXYRj3u3zgnwaE9W0V/9KuHjb9YrIP8oCFCWDowD8qqRlO098YW
	I8JZls8S4M571hTlwvUYv+i8Pg7HV6sj0rbfxyv5minGqTPimgizHG4WsHbgMILB
	hIwyMhQ1QCq94P9kzbpL/6k6vj12WK2xKu1qgKUhs8lbGQ3trBAy8Afn1Y6m55tC
	ajJ0LulvmfaJsVOWmSy8w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1729670380; x=
	1729756780; bh=7uiuJiInJUIv7ibp9q7xm1m4Q0qlEkTigyGQH0pLLlM=; b=b
	xSw88tTvp9roxZcU09kNeMIjINrNr/Bn7XuDdWXSm8Ph92NAkZdm8n1SRdr5fK1c
	zC5JUxydz/4xYpZUf2swXlawk7azzbD4rhoaJxUoWidbSxF+X9A38TVV+bbrMrJ5
	vleOhM2Obp9ct/6hFwj4VB54sI2jCQIafEb9m9YRY6glz9HmpLPcc3xAnAtMALWS
	9l7IiMGCi+ms0s4O62l13HbZw2vu4HAIDq/SokFpT9e3knvMp7jDxXcKJyPoVaU8
	MzKWRQpG0+EfoD/7uhBBBpem5IVEIEFOF6IMik5j7zx3nfbY3NPh1DLym0LidOl/
	26bJ6jc5FDxA78n/gWJUg==
X-ME-Sender: <xms:7KwYZ3lsGwlf1ldtI-DQkdDCdMrKga1_rqxdzpH7KvMeC-2MnC2TKA>
    <xme:7KwYZ60BpLmnBRSB0GLTCULvPkRAPCRHGVtIDYDLoRGziKr4RWnNNsQEt-EDmIST4
    djG1sGYXwyYrzX9KA>
X-ME-Received: <xmr:7KwYZ9p8Mu0OsTzmLBNGHwgTXYrTjZkYduYG4ox3DJjCS_0eB4ExJOY9buj9WZy_miF9IdSWWrDyMRJt8cGW7nBGmCYu7PiEkMUdu91f-qaiVil3>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdeiiedguddviecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddt
    necuhfhrohhmpefthigrnhcuhggrlhhklhhinhcuoehrhigrnhesthgvshhtthhorghsth
    drtghomheqnecuggftrfgrthhtvghrnhepffehieffgedtgfffjeetveegfeekleeileek
    veeuteffteetudffveegieeiheetnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomheprhihrghnsehtvghsthhtohgrshhtrdgtohhmpdhnsggprhgt
    phhtthhopeduhedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheplhhgihhrugifoh
    hougesghhmrghilhdrtghomhdprhgtphhtthhopegsrhhoohhnihgvsehkvghrnhgvlhdr
    ohhrghdprhgtphhtthhopehpvghrvgigsehpvghrvgigrdgtiidprhgtphhtthhopehtih
    ifrghisehsuhhsvgdrtghomhdprhgtphhtthhopeifvghnshestghsihgvrdhorhhgpdhr
    tghpthhtohepjhgvrhhnvghjrdhskhhrrggsvggtsehgmhgrihhlrdgtohhmpdhrtghpth
    htohepshgrmhhuvghlsehshhholhhlrghnugdrohhrghdprhgtphhtthhopehmrggtrhho
    rghlphhhrgekvdesghhmrghilhdrtghomhdprhgtphhtthhopehsihhmohhnshdrphhhih
    hlihhpphgvsehgmhgrihhlrdgtohhm
X-ME-Proxy: <xmx:7KwYZ_lwhsRpMoJfYKD6G5uoDZFbhPsd6JMER858rvEVJIAM8Rhe0A>
    <xmx:7KwYZ12Ujcas7UXGaiQHsdVX3T2Xe-uGhTjsaqUlj0WsucBqu8ZgNQ>
    <xmx:7KwYZ-tVNqqTH989abu7ocFLbLwmFK7dvxRmQT2azy7QwcRd7q0svw>
    <xmx:7KwYZ5VIlbttYASOiPEZrMD3HboPkdeu2JsTuOe6bpYLUDov5-FKug>
    <xmx:7KwYZ035UgUPFuo-JhIuRhRycUsLUqXzt_zfIvWJY_LSv41fMN_rmrRZ>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 23 Oct 2024 03:59:36 -0400 (EDT)
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
Subject: [PATCH v3 2/7] dt-bindings: allwinner: add H616 sun4i audio codec binding
Date: Wed, 23 Oct 2024 20:56:58 +1300
Message-ID: <20241023075917.186835-3-ryan@testtoast.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241023075917.186835-1-ryan@testtoast.com>
References: <20241023075917.186835-1-ryan@testtoast.com>
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

Changelog v2..v3:

- Fix missing - in H616 conditional binding reported by dt_binding_check.
---
 .../sound/allwinner,sun4i-a10-codec.yaml      | 53 ++++++++++++++++---
 1 file changed, 47 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-codec.yaml b/Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-codec.yaml
index 78273647f7665..ebc9097f936ad 100644
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

