Received: from fhigh-a2-smtp.messagingengine.com (fhigh-a2-smtp.messagingengine.com [103.168.172.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79010156C5E;
	Wed, 23 Oct 2024 07:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729670393; cv=none; b=Z52xiU0fKRE32JJFZbbBJA854krIMV9kyj3+1qQ8TGPgyFh3tmm9ijRakDEpaaLGT1vp1XtiIz9NYT6apGjsSkbZv9Psncth8HcYd9pjV37E3jVrEuaTLHDGGB1yJUy50Q2mEogSMsOrMyE78qFHH64x6RVaA7VIxac8aMZU/yY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729670393; c=relaxed/simple;
	bh=OTvXuTVccNcEwDAwpJatJlduxjYK7C29ee8Ke8YpJhA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gIAqqX5dUTmxPFAT7RSI8+jQaWXcnORKO71pYyF7FJ3Lk/LSBkiHQNEryFuMs1IFJEJEqzFdmxBAJoQsC/DSUgndoNu+rXIKUrrwmH/j+ST5w+ZGHCj6oLmh0L47h3zwepYSsrHA3GMbr8zscs2wesw+Y7B6y0nT93JNJeSzt+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com; spf=pass smtp.mailfrom=testtoast.com; dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b=nXlPyz1e; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=ZD8Hn5J0; arc=none smtp.client-ip=103.168.172.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=testtoast.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b="nXlPyz1e";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="ZD8Hn5J0"
Received: from phl-compute-07.internal (phl-compute-07.phl.internal [10.202.2.47])
	by mailfhigh.phl.internal (Postfix) with ESMTP id B9A7A1140166;
	Wed, 23 Oct 2024 03:59:50 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-07.internal (MEProxy); Wed, 23 Oct 2024 03:59:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1729670390; x=
	1729756790; bh=a/v5cCrZeaL9FPFlnXB7oZQvMZPCQJrZbGhxMStyvGI=; b=n
	XlPyz1emlfEJr65II1A9/n8bd4Zd0beR/l5ltGiUe572r85aH9IzpYJaKDfcqYfs
	3frzQQUc8DMhjXH9EUWgyyVby/Y5OFu6PO+TH4XTXK0lp3n+s6YdE/ojdhquHIYK
	pLFQ9EVVx1GsI3t8z1/sQiWosafaXSMOr21uVGXVzd5wfUk+7eikenQzTR8UosIl
	UyDqKu5PaR0jKIXujc2YYe6bNq+iSKqjGjZjlQKSAQQj1n52qAhPtNak+gv4f92A
	5AuOb5qzXU/zuCHTpXpyOCZIJrhofUcBjaRrPN0KPgCIrYOnvFtZEikyitDwiRTI
	CFhOpXr42MIWipXLAZcMA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1729670390; x=
	1729756790; bh=a/v5cCrZeaL9FPFlnXB7oZQvMZPCQJrZbGhxMStyvGI=; b=Z
	D8Hn5J039uZ8apyvzNl2U4kB7BJyBZuKmbZd5M6XYsdksHarkjlBSAXv9Sv7PnGR
	ta+vBiAziwF4g0jGRsBbX8Q9qaCPvh6DPkFp6si4cAlC/ji2kI/CQjEzzLT1rk0J
	3q3FSHjLAO2AEnuUbu7LI8aygy/Q2U0e7VTBoPdMEl/tvVlgbNR2sKDNY6tN8Rjx
	BzaMk4EN3jn5Zw4m0zZ2HnDPiQ/+5rA7qaRsQ2hz7xObHk2wpRTKNtkonDjpYcAb
	JHVJMBMUkACjuDdQpensjBKVHGQmml+Zr+OoxalxCIcBxaLnZaDfJIRknZP2Ovgq
	uCkr6Nh86TCedaEfz6y+g==
X-ME-Sender: <xms:9qwYZ7ph7wYXA3oIvFm6zNUMOmYq-ICxmQGrOJb2CYoUQSVSiJ3Rww>
    <xme:9qwYZ1rUJ7GUrwnf25b0GJRd5Puz5u4iIOiA-khVAgK41TM1SBOe0EQWPO6Wjb7Y2
    NnT_FzeODeMjrwubg>
X-ME-Received: <xmr:9qwYZ4OeFv1RyY4GyuvKwaRlEJnk66pqw0AfGWR-f8PHN3uEIyXClQx7wM8_EwmRKIQgHsHC4ReB1qXSH8zALLk5R-RDfdCbd_pIgbgofVW8ASkY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdeiiedguddviecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddt
    necuhfhrohhmpefthigrnhcuhggrlhhklhhinhcuoehrhigrnhesthgvshhtthhorghsth
    drtghomheqnecuggftrfgrthhtvghrnhepffehieffgedtgfffjeetveegfeekleeileek
    veeuteffteetudffveegieeiheetnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrg
    hmpehmrghilhhfrhhomheprhihrghnsehtvghsthhtohgrshhtrdgtohhmpdhnsggprhgt
    phhtthhopedujedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheplhhgihhrugifoh
    hougesghhmrghilhdrtghomhdprhgtphhtthhopegsrhhoohhnihgvsehkvghrnhgvlhdr
    ohhrghdprhgtphhtthhopehpvghrvgigsehpvghrvgigrdgtiidprhgtphhtthhopehtih
    ifrghisehsuhhsvgdrtghomhdprhgtphhtthhopeifvghnshestghsihgvrdhorhhgpdhr
    tghpthhtohepjhgvrhhnvghjrdhskhhrrggsvggtsehgmhgrihhlrdgtohhmpdhrtghpth
    htohepshgrmhhuvghlsehshhholhhlrghnugdrohhrghdprhgtphhtthhopehmrggtrhho
    rghlphhhrgekvdesghhmrghilhdrtghomhdprhgtphhtthhopehsihhmohhnshdrphhhih
    hlihhpphgvsehgmhgrihhlrdgtohhm
X-ME-Proxy: <xmx:9qwYZ-6bshTzZi1drhauCH5lh4cyAPp3Nk17XTZiD1wgCD8vHLWDLw>
    <xmx:9qwYZ678z6fkoZ2VMKlrrjt29V8sHwxyycWywPhqiieEivPq2qtQIQ>
    <xmx:9qwYZ2iG4aWEL6YD_mgJweqnwULjTSx2ozqqtnODurKCdlbNM7QMQA>
    <xmx:9qwYZ847RcrnzX4pLEnXkV1NFwPJ_RzTb5f2NJF3G4f-QixY_mZrGA>
    <xmx:9qwYZ_Pkgq9N0Az_OJreYuis8yCWBojsOzSUaHX8fbTIMLiUfT4nKy0y>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 23 Oct 2024 03:59:46 -0400 (EDT)
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
	Ryan Walklin <ryan@testtoast.com>,
	Andre Przywara <andre.przywara@arm.com>
Subject: [PATCH v3 4/7] ASoC: sun4i-codec: Add playback only flag to quirks
Date: Wed, 23 Oct 2024 20:57:00 +1300
Message-ID: <20241023075917.186835-5-ryan@testtoast.com>
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

From: Marcus Cooper <codekipper@gmail.com>

Some devices only have the playback side of the codec implemented
so add a quirk to check for this. This flag is only required internally
within the codec driver, as the DAI is configured for playback only
(capture disabled) separately in the create_card() function for these
devices.

Signed-off-by: Marcus Cooper <codekipper@gmail.com>
Signed-off-by: Ryan Walklin <ryan@testtoast.com>
Reviewed-by: Andre Przywara <andre.przywara@arm.com>

---
Changelog v2..v3:
- Add a note regarding internal usage of the playback_only quirk.
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

