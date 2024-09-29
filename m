Received: from fhigh-a2-smtp.messagingengine.com (fhigh-a2-smtp.messagingengine.com [103.168.172.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86D1A14B970;
	Sun, 29 Sep 2024 10:08:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727604513; cv=none; b=dHqAGeimeiauDMOlBtpI8W+s0COFe7r3fyDam67Vtj/pLfqA6uMj6fTxoaupg+bwJ+sRth50sNAc+P4aeI8FusbZHvNO0LXhhagHuDJdty/DSGQcqL9YhoukuSMih+yRX/4bf01cMZJu7bzBfFebKdwSEJBUrDoGfFT03Rd2FPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727604513; c=relaxed/simple;
	bh=0caErVZPlpzndpHmj+voRZvMX3al5mRLBGXESVLHSSQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RssVOjUaMpQ6r1iEo69jml2Augg6XIOr3ct9EVCx2zrVvF9Ydqnj6fYo/GkxEEw5VidnDrH3j4WrE3JplU8z7MaFPzZUO2NPKkQYo/Elwm342m61G/BDCmcvWf20fiHkFord7FeQCZEn7lWFRR0aE4VgId1LUuLaN/4oD2u5ZPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com; spf=pass smtp.mailfrom=testtoast.com; dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b=SXNfqtJe; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=WgBBXh4d; arc=none smtp.client-ip=103.168.172.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=testtoast.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b="SXNfqtJe";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="WgBBXh4d"
Received: from phl-compute-04.internal (phl-compute-04.phl.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id B39B311402B9;
	Sun, 29 Sep 2024 06:08:31 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Sun, 29 Sep 2024 06:08:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1727604511; x=
	1727690911; bh=pz+twYS3K1z8m9MxHiKtXSoqES3mtjf9wkrxGDpITqs=; b=S
	XNfqtJewp84yXFraiGlUQYjljI//PHhEuR95vdGQ12I/4UvoN9X55ratDt2LMY8E
	g9+GePUvtKir2g9Sm9mCmZ4WVRgy1bnssHwbkmBtjAO0X2s52shGGsJMdUWHebIA
	/B5iAO5iuwK4Y33Wmx/PgNnLPRTZXjAdG1yuKgU7CoDrr/AvwsRDWlMik5n+ONzf
	i9ZTHwjEwUsjWoI3RNDVukyawwYaO5LAD41bwJJjrV5bDWc5hqtvo5g4NSRVyfa/
	1DnhL54XjdrqS33K8i/dke8NB/p+SAE+gcq1Igx5Lj+v8pwCL33n6qPr+LtRGCuC
	mNP9jHEgHdIUXaBqr7mPw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1727604511; x=
	1727690911; bh=pz+twYS3K1z8m9MxHiKtXSoqES3mtjf9wkrxGDpITqs=; b=W
	gBBXh4dCjZEdIrqzcKaVAci7dLpHyna7vu9b6R0z8n66DC3laRlZ1AZtdWde0Yoi
	FEuj2UovcqyaFwVb6PeE3S6APcJUgm1ScPSQiR642/9u6592rYnmG6G2YFoA3AOW
	1yLKiRQjixgcDsJKq0Kaf0YC6RLWl/NtNAhAOi4jCIKxPeAqVv3KC1wxXaUy0OdQ
	Kjrdyl2w0TukqBDc8XgcD9C+3UYIGhHBMTmthEhfdIEG0BoUPHpawaawAwHRejfV
	LuqVMbYZhibHReFwP7SETd96fVTJ3zwJ0yA1sqtlaqh/yFF0PsHLYBpUWGJunEjG
	2A3jr8Alcj14anwk5YIYg==
X-ME-Sender: <xms:Hyf5ZvFqLz8S0Fc-BkeHbnaTmWWk9PQNNbWWsSkGF1yFXxRncgO_aA>
    <xme:Hyf5ZsUqZ115lgurNo1WBUvvaOAR3fKWU9fIL94N5bpNVFJj0gPui6b8Tta88N8Zo
    VIuDkTWg0lrCnTwzA>
X-ME-Received: <xmr:Hyf5ZhKMVrA9MIc-OzS7BBMNgURTg5hNxQtXaZ4SZSjdtqzo3xUhVYgwQxFqJiqcVdhrn-UPpYmIChu9_ZMjhUqLGV37-vtoh7NwomW_JkV6BuOi>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvddufedgvdeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttden
    ucfhrhhomheptfihrghnucghrghlkhhlihhnuceorhihrghnsehtvghsthhtohgrshhtrd
    gtohhmqeenucggtffrrghtthgvrhhnpeffheeiffegtdfgffejteevgeefkeelieelkeev
    ueetffetteduffevgeeiieehteenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmh
    epmhgrihhlfhhrohhmpehrhigrnhesthgvshhtthhorghsthdrtghomhdpnhgspghrtghp
    thhtohepudefpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehlghhirhgufihooh
    gusehgmhgrihhlrdgtohhmpdhrtghpthhtohepsghrohhonhhivgeskhgvrhhnvghlrdho
    rhhgpdhrtghpthhtohepphgvrhgvgiesphgvrhgvgidrtgiipdhrtghpthhtohepthhifi
    grihesshhushgvrdgtohhmpdhrtghpthhtohepfigvnhhssegtshhivgdrohhrghdprhgt
    phhtthhopehjvghrnhgvjhdrshhkrhgrsggvtgesghhmrghilhdrtghomhdprhgtphhtth
    hopehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgpdhrtghpthhtoheplhhinhhugidq
    shhouhhnugesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqd
    grrhhmqdhkvghrnhgvlheslhhishhtshdrihhnfhhrrgguvggrugdrohhrgh
X-ME-Proxy: <xmx:Hyf5ZtE7LdhlwKjU-QqapCchWr1k2Aoqua1wXAbSJ03EaQ7I3xGYeQ>
    <xmx:Hyf5ZlUC8E2f9PIuopeJ-LCTusmk4CqUMQ2JxvxlhvTQ5SMbMOApKA>
    <xmx:Hyf5ZoP4iy75HM98llTlFnRUoey3z0-vCaht2JqSfeaPCd9-mGp0zQ>
    <xmx:Hyf5Zk0TQLgOODMutXc9_ZixS4pKob3xRrbBAnx6oYJp9TiaAtUonw>
    <xmx:Hyf5ZqWB7nYSKkfkJ5a_YpQ95jCz8hMjt4rRiTiXSUai48SUjMS0gRp5>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 29 Sep 2024 06:08:27 -0400 (EDT)
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
Subject: [PATCH 6/6] arm64: dts: allwinner: h616: Add audio codec node
Date: Sun, 29 Sep 2024 23:06:07 +1300
Message-ID: <20240929100750.860329-7-ryan@testtoast.com>
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

Now that the sun4i codec driver supports the H616, add a node in the
device tree for it.

Signed-off-by: Ryan Walklin <ryan@testtoast.com>
---
 arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
index e88c1fbac6acc..006fdb7e7e0ae 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
@@ -645,6 +645,21 @@ spdif: spdif@5093000 {
 			status = "disabled";
 		};
 
+		codec: codec@05096000 {
+			#sound-dai-cells = <0>;
+			compatible = "allwinner,sun50i-h616-codec";
+			reg = <0x05096000 0x31c>;
+			interrupts = <GIC_SPI 58 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_BUS_AUDIO_CODEC>,
+				 <&ccu CLK_AUDIO_CODEC_1X>,
+				 <&ccu CLK_AUDIO_CODEC_4X>;
+			clock-names = "apb", "codec", "audio-codec-4x";
+			resets = <&ccu RST_BUS_AUDIO_CODEC>;
+			dmas = <&dma 6>;
+			dma-names = "tx";
+			status = "disabled";
+		};
+
 		gpadc: adc@5070000 {
 			compatible = "allwinner,sun50i-h616-gpadc",
 				     "allwinner,sun20i-d1-gpadc";
-- 
2.46.1

