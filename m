Received: from fout-a2-smtp.messagingengine.com (fout-a2-smtp.messagingengine.com [103.168.172.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F84B41C77;
	Sun, 20 Oct 2024 08:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729413144; cv=none; b=MIGY2h4/lrL7v00JItrQ3p+gPIcwJEtXRZi/4ZMot9qTZc5uA44NIBeh/zvcM3TWcslyJg6i4RAXxJqqd8h6hiSf5JZgw5+uyf3d5yam69oRZFXna806XGM/dq/0E7wHLRQzO0eeE9Mw1+VYU8IrGNQZTwLHv4oqDLaGIJWXdX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729413144; c=relaxed/simple;
	bh=/mSgfyqg1y21ZsnpVUThzUt70LhdCl7aY9Q5WjOwC68=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F+xcHU1rQFV06oQ+zubRknFpnYv+67vgmEYIuV38oCq65ugERKHL0RXyAL2FdqvuY0G0rMIMW19vF5aeGUW4Umz3/mDJCvXUlv4sxPx1HsAvFQzxTvYCiidkDHqaumZZJYbVkNdXWxGMrxifeRyyhkbi+su63UD2H2T2cLtPpmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com; spf=pass smtp.mailfrom=testtoast.com; dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b=iemaZ4ML; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=jCmjUsCD; arc=none smtp.client-ip=103.168.172.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=testtoast.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b="iemaZ4ML";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="jCmjUsCD"
Received: from phl-compute-07.internal (phl-compute-07.phl.internal [10.202.2.47])
	by mailfout.phl.internal (Postfix) with ESMTP id 958C71380193;
	Sun, 20 Oct 2024 04:32:21 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-07.internal (MEProxy); Sun, 20 Oct 2024 04:32:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1729413141; x=
	1729499541; bh=xS44AXDI4lnpzbhQMtWqkM8bv8mASrDHIVk7kelq4ys=; b=i
	emaZ4MLVaRUI9BTuMws8xCIOkHd3HtUAeL1/5m4COuGI2dxJLqU2kUkYy3/XMpmo
	O56/K5RkGTrxC6LZboe8Zx8uAiaUvjQIs4VTYAwQvUgPwZkPettE0hiMwvOgVAp0
	f/a33YoYOL0ncF7QCO+G2HDj0qPohqbluSRofjKb1oGfE0hRwwjK8PhXkuMm8fDn
	UelawQRDo2mJAcLPVNv3kwLbZy6WBYb5ZNvdnRyGid0WP6yfjCScwk7PVucrkDrD
	mLFgey7USqoplT6D/0vXEQqa1WZZ/JB9JzpeCTeoDfRRj5VITNPZisHPqZYkz67n
	JDLMyzhtFuo2ZWL3eFHYQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1729413141; x=
	1729499541; bh=xS44AXDI4lnpzbhQMtWqkM8bv8mASrDHIVk7kelq4ys=; b=j
	CmjUsCDL+wPFw5/GvWmQgyU0PgxnF2VjG0riM6dx+3IokKxMmwo2bIGQd5KDcUiy
	SF8XNVF8vaD8Wy4HFItibN3INCJtdQdChh8KORQVrrKkQRfpyjzvRwlxgHYwUlTu
	j5LVBozVCvyNKb5xTobVDOmP5myeU6Md7AF8GgV6xH99SUaDdSaaRLen7PkjVRr3
	EEj9a5NHIv+8EZDgc9Iv+KsIbIlU612u3KzDAcBUbPFtZVtfshYtIqbJRdsepRxX
	V5fwkOBJl1QYjpeE6Lrcuvifzu5f7imeSpoR4274dEN/w1aM+tXYAoRwzZ+VyEXQ
	3sH78jhk9lX6h/Ry9fyhg==
X-ME-Sender: <xms:FcAUZ9N7g_chx1hQSvOapoAKd_SdGqIwTuJiau45OBFEZTyoRS9zwQ>
    <xme:FcAUZ_9mtex2KeJRX9oJ2jZsxArQxNnt0N9neOwITKQG6m4hrp6V5onkhi3IzTSjg
    -jwMnBfBoj6uO9KnA>
X-ME-Received: <xmr:FcAUZ8RMOtCVFSrNdXx_otQ184KrKsjiAaIKW40CtlOw5KwQ1YGck-BxVwtA9Ek8nVchV9xgs86g8u0nQRT3v4aOGjGSmhY_VXYdlDHXemQ2q3Ap>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdehjedgtdegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttden
    ucfhrhhomheptfihrghnucghrghlkhhlihhnuceorhihrghnsehtvghsthhtohgrshhtrd
    gtohhmqeenucggtffrrghtthgvrhhnpeffheeiffegtdfgffejteevgeefkeelieelkeev
    ueetffetteduffevgeeiieehteenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
    epmhgrihhlfhhrohhmpehrhigrnhesthgvshhtthhorghsthdrtghomhdpnhgspghrtghp
    thhtohepudeipdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehlghhirhgufihooh
    gusehgmhgrihhlrdgtohhmpdhrtghpthhtohepsghrohhonhhivgeskhgvrhhnvghlrdho
    rhhgpdhrtghpthhtohepphgvrhgvgiesphgvrhgvgidrtgiipdhrtghpthhtohepthhifi
    grihesshhushgvrdgtohhmpdhrtghpthhtohepfigvnhhssegtshhivgdrohhrghdprhgt
    phhtthhopehjvghrnhgvjhdrshhkrhgrsggvtgesghhmrghilhdrtghomhdprhgtphhtth
    hopehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgpdhrtghpthhtohepmhgrtghrohgr
    lhhphhgrkedvsehgmhgrihhlrdgtohhmpdhrtghpthhtohepshhimhhonhhsrdhphhhilh
    hiphhpvgesghhmrghilhdrtghomh
X-ME-Proxy: <xmx:FcAUZ5szXgtB-Nrppy6g31XR6ZFnYvRI12n8T4R0mxbNjkRZA3d3lA>
    <xmx:FcAUZ1f_oLJenGVoK_zSbTHZO_Fm8RG6yNPYYe8areK97qt7zZS1Gw>
    <xmx:FcAUZ11-Dwt6wFJ7Z6Vf9QXG0kJr_ME-pvUYrDQtPAalI75mrZt8xw>
    <xmx:FcAUZx_teTf8AgsNzonI4IBVeTl9Iz-TG-CZeqBEPRJ9cHOcwGZlxw>
    <xmx:FcAUZwtWRyZNl0zufJ7q7Y_ttw_iImf9zXDBGh0xGtPKZow4II4Zg5XF>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 20 Oct 2024 04:32:16 -0400 (EDT)
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
	Marcus Cooper <codekipper@gmail.com>,
	Ryan Walklin <ryan@testtoast.com>
Subject: [PATCH v2 4/7] ASoC: sun4i-codec: Add playback only flag to quirks
Date: Sun, 20 Oct 2024 21:30:54 +1300
Message-ID: <20241020083124.174724-5-ryan@testtoast.com>
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

From: Marcus Cooper <codekipper@gmail.com>

Some devices only have the playback side of the codec implemented
so add a quirk to check for this.

Signed-off-by: Marcus Cooper <codekipper@gmail.com>
Signed-off-by: Ryan Walklin <ryan@testtoast.com>
---
 sound/soc/sunxi/sun4i-codec.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/sound/soc/sunxi/sun4i-codec.c b/sound/soc/sunxi/sun4i-codec.c
index 37f5678b55291..312d2655c3f4e 100644
--- a/sound/soc/sunxi/sun4i-codec.c
+++ b/sound/soc/sunxi/sun4i-codec.c
@@ -1571,6 +1571,7 @@ struct sun4i_codec_quirks {
 	unsigned int reg_dac_txdata;	/* TX FIFO offset for DMA config */
 	unsigned int reg_adc_rxdata;	/* RX FIFO offset for DMA config */
 	bool has_reset;
+	bool playback_only;
 };
 
 static const struct sun4i_codec_quirks sun4i_codec_quirks = {
@@ -1779,10 +1780,13 @@ static int sun4i_codec_probe(struct platform_device *pdev)
 	scodec->playback_dma_data.maxburst = 8;
 	scodec->playback_dma_data.addr_width = DMA_SLAVE_BUSWIDTH_2_BYTES;
 
-	/* DMA configuration for RX FIFO */
-	scodec->capture_dma_data.addr = res->start + quirks->reg_adc_rxdata;
-	scodec->capture_dma_data.maxburst = 8;
-	scodec->capture_dma_data.addr_width = DMA_SLAVE_BUSWIDTH_2_BYTES;
+	if (!quirks->playback_only) {
+		/* DMA configuration for RX FIFO */
+		scodec->capture_dma_data.addr = res->start +
+						quirks->reg_adc_rxdata;
+		scodec->capture_dma_data.maxburst = 8;
+		scodec->capture_dma_data.addr_width = DMA_SLAVE_BUSWIDTH_2_BYTES;
+	}
 
 	ret = devm_snd_soc_register_component(&pdev->dev, quirks->codec,
 				     &sun4i_codec_dai, 1);
-- 
2.47.0

