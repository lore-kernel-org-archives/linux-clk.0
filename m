Received: from fout-a2-smtp.messagingengine.com (fout-a2-smtp.messagingengine.com [103.168.172.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AC0F7BB0A;
	Sun, 20 Oct 2024 08:32:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729413154; cv=none; b=WG1/vAYEq460zRKuUoXesag9baiDpIDlPI9kgFtarNxgvcB2NwErsSCivpJDa2zTc471Sj4aK7yE0d7OW7PASHWHxjGqTuD+60JAXeDjKJ9kzzMYT0AD646SoYuYl9VLCWg0vcK1m/0b1J0fGXxcOs6ym0q583JaSL8dG/gbygk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729413154; c=relaxed/simple;
	bh=VN/PbEmDh0z3AJE20/UU6Vkz+uNS6Tqn47s1sacamys=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MhoZ/hVjo4I2yMko8WATxOYdPU7rIAOBgCnLplUxINgaTMTO7C8PDV1CUdoFjDcR0nE+q8DNJbAgZeKTCQnLRqc3pBVbooM3+6201o8QwoSrVWpX2O6iepjGXnwT32t4r/rJCdNXzyMuThI/arFMy2cUY6wYqrR6pcAw2gdKppo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com; spf=pass smtp.mailfrom=testtoast.com; dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b=XH61Dmu+; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=F3ViEY0r; arc=none smtp.client-ip=103.168.172.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=testtoast.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b="XH61Dmu+";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="F3ViEY0r"
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfout.phl.internal (Postfix) with ESMTP id 6C57F1380195;
	Sun, 20 Oct 2024 04:32:31 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-10.internal (MEProxy); Sun, 20 Oct 2024 04:32:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1729413151; x=
	1729499551; bh=ScGK5naKYCxATXKuhVnLGjUINgnyhmSIRubNjuS3Zco=; b=X
	H61Dmu+c2ZTwuUbwSpCFzJmZev68v3jk58sfWjsmATU7P6t0uza6Sq4ns+EOHsjR
	BV5yUNk3l4NC8imuB2tx2ynpHB9E2tidLf3S/Eabw8rdnhHBgRSONbVjdj3JPX7H
	qsPBSCqnVwpXE9w1joVEPZl+Og8xoE4bvemhiK9ydGOWy7pS9Wn03jliQ0xl8oEo
	D027ZI9yS9NXLuReYJjNFiz1MQ0614wU+fE2I9c4HIAwAaNCc9iQ3U7EcLBo2nkX
	uF6t5rXmp0JsAdyFaRjozCPafFRPk4FlQM+jgFoDYdlk/oBtKkTOwq+nblClZT83
	2SO/qRa5tfcg0juzGlwSQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1729413151; x=
	1729499551; bh=ScGK5naKYCxATXKuhVnLGjUINgnyhmSIRubNjuS3Zco=; b=F
	3ViEY0rsUBvXAqgWVjFup4qF+vifvmGmsjoqayTEEJkUeRoAT6UUry6qod2Acz9H
	at1hSv1QMzu+wpzgL3GmhqPw4mw41VEhUPoKNqC6OyTI6WDa6+62d0aGyuNBxZ3I
	g+ZBnRKbf7fIsuktZSOYmvNX/bFV3Ii0lHNBTULrMMGRCFQM35XAEmju2N5LLqqd
	MDITrDmXbCMC+UCI6BFjGLkwZS7vbDPKChFuT39QsumMy03TOkOuMjg8Jwy+Hp8i
	MgKUV/5e3YE3bIW5oMTpdsV21JO0A5lFtsUxVmOxP5yVUexCtfLSR53WjOZspL0K
	L7F0nj3PIt7havUnPaGGA==
X-ME-Sender: <xms:HsAUZ5sQtLUObjeljWxmsKm-koj1UXL8IaknfqMpt1T42ke8O-CoQQ>
    <xme:HsAUZydwcCXBK1LrPrUCf88j3WNDX5jApVXELNp3wUvtJL_IPGjAWYyHWAOMPtRky
    2U9uFq1V-koeYfBCg>
X-ME-Received: <xmr:HsAUZ8wi9yIlx81hxJ8JXwFfGWIZRBd_Kb_btgQfpItfMMcJ8eaYLm0HlQpPcCn8sCqLB9sOP_Boe2mn5WPO_Q5Rr5WncxXJbZb-2QxZgHCbJkuG>
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
X-ME-Proxy: <xmx:H8AUZwOFcC1XiNuK9LtiWcIwujVC2xsXwTV8UTUnm7UBtXfq8UF0IQ>
    <xmx:H8AUZ58YceWMhuy73yvJ9I0ESNcxb68ahV99BO_m7_algMwSsIlebA>
    <xmx:H8AUZwXywGIWO4QrHnU6FdeLMj_hHDUlQ-kvqVTI62C2VqsmKns1Tw>
    <xmx:H8AUZ6cb0UoZlJPykPkT-iMLSP8bBJV5CN86jmahFy6kry7Utg-Fmg>
    <xmx:H8AUZ4dfvSvKAI6kmCmk6yGJk1AAaLmLAcD7fQHhaahMPdaJDGa6tepo>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 20 Oct 2024 04:32:26 -0400 (EDT)
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
Subject: [PATCH v2 6/7] arm64: dts: allwinner: h616: Add audio codec node
Date: Sun, 20 Oct 2024 21:30:56 +1300
Message-ID: <20241020083124.174724-7-ryan@testtoast.com>
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

Now that the sun4i codec driver supports the H616, add a node in the
device tree for it (correcting the spdif block location at the same
time).

Signed-off-by: Ryan Walklin <ryan@testtoast.com>

---
Changelog v1..v2:
- Remove 4x clock from the codec block, this is not used in the driver and does not require a reference.
- Move the codec (and spdif) blocks below the lradc block so that they are in address-order.
---
 .../arm64/boot/dts/allwinner/sun50i-h616.dtsi | 44 ++++++++++++-------
 1 file changed, 29 insertions(+), 15 deletions(-)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
index 0131f9b3132b8..3788f65a7d0eb 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
@@ -762,21 +762,6 @@ mdio0: mdio {
 			};
 		};
 
-		spdif: spdif@5093000 {
-			compatible = "allwinner,sun50i-h616-spdif";
-			reg = <0x05093000 0x400>;
-			interrupts = <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&ccu CLK_BUS_SPDIF>, <&ccu CLK_SPDIF>;
-			clock-names = "apb", "spdif";
-			resets = <&ccu RST_BUS_SPDIF>;
-			dmas = <&dma 2>;
-			dma-names = "tx";
-			pinctrl-names = "default";
-			pinctrl-0 = <&spdif_tx_pin>;
-			#sound-dai-cells = <0>;
-			status = "disabled";
-		};
-
 		gpadc: adc@5070000 {
 			compatible = "allwinner,sun50i-h616-gpadc",
 				     "allwinner,sun20i-d1-gpadc";
@@ -811,6 +796,35 @@ lradc: lradc@5070800 {
 			status = "disabled";
 		};
 
+		spdif: spdif@5093000 {
+			compatible = "allwinner,sun50i-h616-spdif";
+			reg = <0x05093000 0x400>;
+			interrupts = <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_BUS_SPDIF>, <&ccu CLK_SPDIF>;
+			clock-names = "apb", "spdif";
+			resets = <&ccu RST_BUS_SPDIF>;
+			dmas = <&dma 2>;
+			dma-names = "tx";
+			pinctrl-names = "default";
+			pinctrl-0 = <&spdif_tx_pin>;
+			#sound-dai-cells = <0>;
+			status = "disabled";
+		};
+
+		codec: codec@05096000 {
+			#sound-dai-cells = <0>;
+			compatible = "allwinner,sun50i-h616-codec";
+			reg = <0x05096000 0x31c>;
+			interrupts = <GIC_SPI 58 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_BUS_AUDIO_CODEC>,
+				 <&ccu CLK_AUDIO_CODEC_1X>;
+			clock-names = "apb", "codec";
+			resets = <&ccu RST_BUS_AUDIO_CODEC>;
+			dmas = <&dma 6>;
+			dma-names = "tx";
+			status = "disabled";
+		};
+
 		usbotg: usb@5100000 {
 			compatible = "allwinner,sun50i-h616-musb",
 				     "allwinner,sun8i-h3-musb";
-- 
2.47.0

