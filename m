Received: from fout-b6-smtp.messagingengine.com (fout-b6-smtp.messagingengine.com [202.12.124.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2D1316EB4C;
	Sun, 16 Feb 2025 08:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739696296; cv=none; b=QE4F1DxbWOlombkNR2DiotwC5TP5/WcNah6ndbWgbCgf1AV4gB4Z2Ir5fkTFY2rX98o1YrLpADajwUlUvtoe9a4Vkf3x779vgAKb0zgpvkZGom9dZQFMY97eInpSHXPj7XL632cisREHXmGJ5ylcGDwn/hX4nUDV6TjGkAEvyH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739696296; c=relaxed/simple;
	bh=GxmJA29+HiacNFcc1pD/DAk2xoAeB9EDa9VQhsNGzZ8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GooV/mE7ZowxPFWDUuzjFDJbwSiSaONm/L//WCPvp0RQqK+m8FY2dQKfrmjCQU6NbLpPA8C/fAFPmbtyQZFoWekox5gyiebVKM/Ae5XnFevA48YHM+fMUDmHkNKUC6JpbZ3+GVUdxCOQGambKdZFPXh2PD4NH9QovM3TbjM5nMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com; spf=pass smtp.mailfrom=testtoast.com; dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b=oElcBui2; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=ANWtG75V; arc=none smtp.client-ip=202.12.124.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=testtoast.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b="oElcBui2";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="ANWtG75V"
Received: from phl-compute-02.internal (phl-compute-02.phl.internal [10.202.2.42])
	by mailfout.stl.internal (Postfix) with ESMTP id 4E5531140132;
	Sun, 16 Feb 2025 03:58:13 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Sun, 16 Feb 2025 03:58:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1739696293; x=
	1739782693; bh=BJw/apkD9aGn51IELkXxp/idESG6pC1H6gAPScSoptk=; b=o
	ElcBui24Qlq2zx1oSgK3qwLOp7MFxqRmhvRIfR4timFnM2HIqEp9S1yZOnljq5zc
	2tvgX+a61XcrmAguZBeSXAtyJWJ2S72PKA3VomOSl5VnxIhMKPQmUSs/2XjKZy1q
	1sOwQi1D0rNDwPWJ45FLIDQIf4Od4okxHBAdPISYrvNOOPPIkfZYm7TYotxYWNG1
	0s+0LQeBOnR6hxsx1qFsxfm0hA9QoszkmWzNelvEaCYEj57WWY5S8xxbAUePlcYH
	UTauxz3M+ejqnEAa0Et1rOnCNzhz1ddvO23OTs3d2u96VklhaG0VmEq6dn1ePLk8
	ZHFUtmwjOLt4fOwZFoa1Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1739696293; x=1739782693; bh=B
	Jw/apkD9aGn51IELkXxp/idESG6pC1H6gAPScSoptk=; b=ANWtG75VbxqB/5Wma
	VP/rdeBJIztZ3uS2rBkTMyF/L8dM1fOhjSdH/hiuGJPbQH1pZcbVFyEMExmEb6L7
	RSL62FFacTP8Em8WDb1T4xEW4CtYUEZThMysUmloTlusnY6BRJP5VoH3NFvpmAYk
	jKnHFnLwRVM3RK5LfmMk5gsSP+YK9Fz6OvT85Ko2RFuXJaKyHyJ3qjNQYNzIkYWy
	jTYhq/jXig15tpfyXwhf4PMQaCt3nhxY51TYoInCLbuyxAJFnQ54l8HS3BC4oP1f
	3HePJDZ8495fLMRK9I7GV8wDtCEHK7D4h/7gqKry2FmRnuqkGS7fIiunm1c6AGpr
	4uyzg==
X-ME-Sender: <xms:paixZ_qr2QTAm8i2p4q73N7NZXi7cCkfCfkFCXbsd_MfIQ9xaoki0w>
    <xme:paixZ5rxnj--Za1-M7LLZom9ir3fXK9j-fp45ugPlzLpNaQztP6DiJnac3HhNTMtF
    u2y_iNiMn_LEtcHfw>
X-ME-Received: <xmr:paixZ8OSFSG_abclg50PFXJjCKN1q_SbRu701aNA4Cn8-hasIIJnkXlIH3oinFZaEqhV_k3l54oBzNRK8RSFlSQIyDihOsHpRLLax_3LBGLq>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdehhedtgecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddt
    necuhfhrohhmpefthigrnhcuhggrlhhklhhinhcuoehrhigrnhesthgvshhtthhorghsth
    drtghomheqnecuggftrfgrthhtvghrnhepffehieffgedtgfffjeetveegfeekleeileek
    veeuteffteetudffveegieeiheetnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomheprhihrghnsehtvghsthhtohgrshhtrdgtohhmpdhnsggprhgt
    phhtthhopedvhedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepmhhrihhprghrug
    eskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepfigvnhhssegtshhivgdrohhrghdprhgt
    phhtthhopehmrggrrhhtvghnrdhlrghnkhhhohhrshhtsehlihhnuhigrdhinhhtvghlrd
    gtohhmpdhrtghpthhtohepthiiihhmmhgvrhhmrghnnhesshhushgvrdguvgdprhgtphht
    thhopegrihhrlhhivggusehgmhgrihhlrdgtohhmpdhrtghpthhtohepuggrnhhivghlse
    hffhiflhhlrdgthhdprhgtphhtthhopehjvghrnhgvjhdrshhkrhgrsggvtgesghhmrghi
    lhdrtghomhdprhgtphhtthhopehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgpdhrtg
    hpthhtoheprhhosghhsehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:paixZy4bsiKKDncRFzXMqtSB2yo8onRytPz58JUpMsUM27q25Sf6HQ>
    <xmx:paixZ-6q7Pi28wEBwNkTqAJ6RH8X2_DVUbdK6EbBKttH1-548uLucA>
    <xmx:paixZ6g3pRZgJ8Xjshw965bHQLKMojtB0RXnWZqKBbdjLu1a4Etl6Q>
    <xmx:paixZw4014UsUfzebGjfbvFhHCiOI6D56QA4QKJMynDI3IMQlyh7aQ>
    <xmx:paixZxzQ1AlfKIplLF0MQeYb3Eh9bk9VfZid3pg2482pjTUeDSSy91Rs>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 16 Feb 2025 03:58:06 -0500 (EST)
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
Subject: [PATCH v6 20/27] dt-bindings: allwinner: add H616 DE33 bus binding
Date: Sun, 16 Feb 2025 21:50:51 +1300
Message-ID: <20250216085432.6373-22-ryan@testtoast.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250216085432.6373-2-ryan@testtoast.com>
References: <20250216085432.6373-2-ryan@testtoast.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Allwinner H616 and variants have a new display engine revision
(DE33).

Add a display engine bus binding for the DE33 and increase reg maxItems
to 3 to accommodate additional register blocks.

Signed-off-by: Ryan Walklin <ryan@testtoast.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Chen-Yu Tsai <wens@csie.org>

---
Changelog v1..v2:
- Correct DE2 bus enum to reflect fallback devices accurately.

Changelog v2..v3:
- Separate content into three patches for three separate subsystems

Changelog v5..v6:
- Increase reg maxItems to 3.
---
 .../devicetree/bindings/bus/allwinner,sun50i-a64-de2.yaml  | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/bus/allwinner,sun50i-a64-de2.yaml b/Documentation/devicetree/bindings/bus/allwinner,sun50i-a64-de2.yaml
index 9845a187bdf65..317a27cf590b3 100644
--- a/Documentation/devicetree/bindings/bus/allwinner,sun50i-a64-de2.yaml
+++ b/Documentation/devicetree/bindings/bus/allwinner,sun50i-a64-de2.yaml
@@ -24,11 +24,14 @@ properties:
     oneOf:
       - const: allwinner,sun50i-a64-de2
       - items:
-          - const: allwinner,sun50i-h6-de3
+          - enum:
+              - allwinner,sun50i-h6-de3
+              - allwinner,sun50i-h616-de33
           - const: allwinner,sun50i-a64-de2
 
   reg:
-    maxItems: 1
+    minItems: 1
+    maxItems: 3
 
   allwinner,sram:
     description:
-- 
2.48.1

