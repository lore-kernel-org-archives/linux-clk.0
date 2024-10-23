Received: from fout-a6-smtp.messagingengine.com (fout-a6-smtp.messagingengine.com [103.168.172.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25D83156880;
	Wed, 23 Oct 2024 08:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729670402; cv=none; b=R5FKn0JG1IzftihpPnqXEmtKujdxwQL06b7OvlRBCDPNS2HmZyP7T8fSguQrOBje0y3ZoI6YYayfUGPUmUTvpkc6zpTeIllmoA/4vI2nbR/CAhrOkPJ1rSoH1QO+zufIVPb/XPFqFmAlX4pFuHuHkoNaDoxyNKxBdx6W+519N2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729670402; c=relaxed/simple;
	bh=NwPwFeXdhPunp6H22hKIMjexKaBdIJC9X0NnaXqYRe0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DAXnxoWrE6YI3rQzZxuO3AmZKqSHJ1j7WRGsRJtQTzCQR+WIfmTkbxSgj4xHY9etsxbXCOh2uBCF+qlFGDkx1869ViQ83OHPcF51FoZuF3V9rbUOoLcdcMv8b4pACf+qD+UrcnEbwihCJ0IBRi7kIRTfn60i5IyW9qEMJH+SmCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com; spf=pass smtp.mailfrom=testtoast.com; dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b=ho4ni9E7; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=FgkGYGPw; arc=none smtp.client-ip=103.168.172.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=testtoast.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b="ho4ni9E7";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="FgkGYGPw"
Received: from phl-compute-08.internal (phl-compute-08.phl.internal [10.202.2.48])
	by mailfout.phl.internal (Postfix) with ESMTP id 86398138049A;
	Wed, 23 Oct 2024 04:00:00 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-08.internal (MEProxy); Wed, 23 Oct 2024 04:00:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1729670400; x=
	1729756800; bh=UqOYTjr4HjHtIjCwLKqxDQ8NxDpN6O4ML9VmLPSdjZ4=; b=h
	o4ni9E7abGvPTFVEvkWNzhua1EK9tXZiluxNrJ30F/H+jUvWqvx1DYGb9+hyrcOX
	yTIhYc0KJSxd6bsJYrKYvB12bPcBa0pWVt2RStnsPOgC2gaMBAnOO81gtGu4LPFp
	aC9ISuUDPyVJ9Q9T1RFkbS5uSG4Yc5U8zLTvOea7uHgqaUAGDTRqkTMw/PWbdepg
	XA6EwJ1O1E18RN/pla3t3teo3TQRrRov4Z3R5j6WQZHpyEW2QrN9nwEQxMOcLIDd
	1lpO0DcQaxyQYdB0p0xV6SUk7onXQ1NMaoyOhJpoH765l3qpg6LMf4LJz+DcsjCk
	2GXwKGhGMWI11qY07dbtg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1729670400; x=
	1729756800; bh=UqOYTjr4HjHtIjCwLKqxDQ8NxDpN6O4ML9VmLPSdjZ4=; b=F
	gkGYGPwtoePoNQyWEH8UH3ZMD73zDePRsw1RBbIjScomxrB+yU3vB7Q2Mp8eUw8z
	FeHL1ImvzUclBscmOy7VNqHnWwnxgeCKvuEeLNTImelYzFovbPKYl+JRINXujls8
	f3ivAVL/hcU1o9Nww9uji8hvhPwkwhUfkmIaKhEwEKw23z3iXgUH0yAssVkGblKm
	4IwL37HdYculcDc0KREEA5NF1JGBzaG9Xea/SLj+ukaMsljD5mlxKDiS/ocfiFSF
	ZOoo/apOq1AMVAIHQpMGX5onLni5fkcun6MwHpNn5a8an5CorPPXQm/MXyvKawyh
	VfJFYdHCJQjf5Cmajp17g==
X-ME-Sender: <xms:AK0YZwXyz1xOb_uDX8iidVYxdCoXoku4-8ujfATVDe-YfZ4nyjKupw>
    <xme:AK0YZ0mmjBKbBGu4o0feDR7fjzF5Rdh34fFnUxJ1swDktKrUwRP6tkD584dd9thiE
    CBUOXWKpECxym_D2w>
X-ME-Received: <xmr:AK0YZ0a79NM-8XD4rkmwN1sHJxANBWrX5UIOqN-bveJxtD9jFr8TqXWCsEuYVzB-gKoUjzJREc-hCJ6QiPsKBsssRYx6U-vb1cQrHqDOqGNvF5yR>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdeiiedguddvhecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddt
    necuhfhrohhmpefthigrnhcuhggrlhhklhhinhcuoehrhigrnhesthgvshhtthhorghsth
    drtghomheqnecuggftrfgrthhtvghrnhepffehieffgedtgfffjeetveegfeekleeileek
    veeuteffteetudffveegieeiheetnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomheprhihrghnsehtvghsthhtohgrshhtrdgtohhmpdhnsggprhgt
    phhtthhopeduiedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheplhhgihhrugifoh
    hougesghhmrghilhdrtghomhdprhgtphhtthhopegsrhhoohhnihgvsehkvghrnhgvlhdr
    ohhrghdprhgtphhtthhopehpvghrvgigsehpvghrvgigrdgtiidprhgtphhtthhopehtih
    ifrghisehsuhhsvgdrtghomhdprhgtphhtthhopeifvghnshestghsihgvrdhorhhgpdhr
    tghpthhtohepjhgvrhhnvghjrdhskhhrrggsvggtsehgmhgrihhlrdgtohhmpdhrtghpth
    htohepshgrmhhuvghlsehshhholhhlrghnugdrohhrghdprhgtphhtthhopehmrggtrhho
    rghlphhhrgekvdesghhmrghilhdrtghomhdprhgtphhtthhopehsihhmohhnshdrphhhih
    hlihhpphgvsehgmhgrihhlrdgtohhm
X-ME-Proxy: <xmx:AK0YZ_UM4LzqW7_9kA71RfbBgucX31GsdvTFxaWP1r1W-krby2UoYg>
    <xmx:AK0YZ6lmKVvgwSBQ7VmxusQOxxYrgRueccWCX7TdnGgyG4SwA1x5yw>
    <xmx:AK0YZ0coj7WyjVvUXmJ-TczL-Bd7ypBmZOAadofqRbUtVIc5943KoA>
    <xmx:AK0YZ8GBNRIslX7m3q1ooYo9VoE8oq1yJQuLIq2RCHuPV9pUCihHTg>
    <xmx:AK0YZ00H3XHVQhUEEppmsp9JUq_0SzgEn2Amj3rPfDLkirvAp2ZdEIes>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 23 Oct 2024 03:59:55 -0400 (EDT)
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
	Ryan Walklin <ryan@testtoast.com>,
	Andre Przywara <andre.przywara@arm.com>
Subject: [PATCH v3 6/7] arm64: dts: allwinner: h616: Add audio codec node
Date: Wed, 23 Oct 2024 20:57:02 +1300
Message-ID: <20241023075917.186835-7-ryan@testtoast.com>
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

Now that the sun4i codec driver supports the H616, add a node in the
device tree for it (correcting the spdif block location at the same
time).

Signed-off-by: Ryan Walklin <ryan@testtoast.com>
Reviewed-by: Andre Przywara <andre.przywara@arm.com>

---
Changelog v1..v2:
- Remove 4x clock from the codec block, this is not used in the driver and does not require a reference.
- Move the codec (and spdif) blocks below the lradc block so that they are in address-order.

Changelog v2..v3:
- Remove leading zero from codec address to match other node addressses.
---
 .../arm64/boot/dts/allwinner/sun50i-h616.dtsi | 44 ++++++++++++-------
 1 file changed, 29 insertions(+), 15 deletions(-)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
index 0131f9b3132b8..87cde36445cbf 100644
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
+		codec: codec@5096000 {
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

