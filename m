Received: from fout-a2-smtp.messagingengine.com (fout-a2-smtp.messagingengine.com [103.168.172.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 474B91078F;
	Sun, 20 Oct 2024 08:32:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729413139; cv=none; b=Y52P02hNJXGqq5hKUe8xUsziQZgljWdvwM768+dB7JO88XNqNqADDqibf6hnml3fVLQKX3lothEDRpapUdOoKp+WqG7/e9mG+tSZAvJ8c2eG6CTvkIQKHtr+017HgoJ/SQtAbMJoRrxGH51d0icdltMbpHYM0kmAaxGo9yXMpto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729413139; c=relaxed/simple;
	bh=PxyUKfqZfElaYII/3CJXtslrWYSdl6tsKomMpk8BkeA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hsqAFjULWnZXbZk41YuRNyT/DkxQdhu9Fz9ZQjBd4zA9M+jXrx36/+Ey2T0bfVYMleD025zPNtDJK0Uk2ltOjYuOP1QLBzNkYBybELe5PFSNmtG4u4JlTiRxQT+a6tb09QWiofOgUmbUEAMBu9+y8eIK01jbsFCxzFMd40DgwEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com; spf=pass smtp.mailfrom=testtoast.com; dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b=Ux1BJ5F7; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=PZ58aez0; arc=none smtp.client-ip=103.168.172.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=testtoast.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b="Ux1BJ5F7";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="PZ58aez0"
Received: from phl-compute-09.internal (phl-compute-09.phl.internal [10.202.2.49])
	by mailfout.phl.internal (Postfix) with ESMTP id 76ECA1380191;
	Sun, 20 Oct 2024 04:32:16 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-09.internal (MEProxy); Sun, 20 Oct 2024 04:32:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1729413136; x=
	1729499536; bh=Z2bi4VV4tB+2C35KiLjZn51cDIttz6219Ig2nhnskLc=; b=U
	x1BJ5F79VEefxIJrE72pfiC1R3b3yjisXMapUdnW88oF7WMO6rZ9zHCYnmjvJ52n
	6Vcm1Cv+A0iDPLgGWK623EHEUMAnClIgDTB2aExsKqsalC5cUbBtFtKFo9zLFV6B
	C5qJfR4u2lMzCpmd2kYLOWj6trGvfYWvXl1JlnTnpjbj8A/Bq2qBIVnA4z3el/lu
	nxXs3LPdUAZurtwOasjze4kqSQiyFMIWC3X/y+8DRCIn+39ryubXRs52SeSQ0BB+
	Ej/W8rJ+YI3dXWcm6saDZrgVg+Em8+v5ZvC9VcQson2CvxCyJ6XahEwSFHKtQmz4
	HtT/meBSJHHR5404Wbb8Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1729413136; x=
	1729499536; bh=Z2bi4VV4tB+2C35KiLjZn51cDIttz6219Ig2nhnskLc=; b=P
	Z58aez08nZZsAfHSKaM1ilBLSzap7n4/haYARP1bb2DQWh081FWjdHwDqi6EPraK
	qwgSnl9srOwCrqLOOvFmmVKCHUAAcEtDWGl6tkkKVEswukwxpWs+4d7RUJbdS7/V
	+c/jDlTfKgy77H5j6hwVwd+D+K2OlfZPycDIEBS97vtDrOHbS8B+SibWzG5L43sd
	l/OekROwFPOHm2bvb9OXN8LhU2PZUhfVkZNxNCCvYOCILmtf6seEVqJdtju2zBvN
	ZWgvlYWDfzcXVId4Jkhg1ky6uPWFeytEiR0MvDU2+T/nZmMGthy1jv74pJSqH8/+
	9+SFxmlzrJR17r9gCSmbQ==
X-ME-Sender: <xms:D8AUZ6qcPc238ycoBFyblkOPXzwcYIAKAAuiyZmB-pueLYf8oRUlag>
    <xme:D8AUZ4qMqt5P3ugz4QkGbL-9PthfOLdHhjbuW3cNFpFl21WisRUAo5lqntAwZ-gl0
    d0UuxR3lX0YDVW53w>
X-ME-Received: <xmr:D8AUZ_Mqejs11-SFZ74nRNQ4jcb_-8RJT0ayL-thyDI2uy-oQul0cchOWmkEizYG9TEPn_bmp47mtkbLR7Iq41RkwWZLSdo7tAxqNND0L4ySkNjq>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdehjedgtdehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttden
    ucfhrhhomheptfihrghnucghrghlkhhlihhnuceorhihrghnsehtvghsthhtohgrshhtrd
    gtohhmqeenucggtffrrghtthgvrhhnpeffheeiffegtdfgffejteevgeefkeelieelkeev
    ueetffetteduffevgeeiieehteenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
    epmhgrihhlfhhrohhmpehrhigrnhesthgvshhtthhorghsthdrtghomhdpnhgspghrtghp
    thhtohepudejpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehlghhirhgufihooh
    gusehgmhgrihhlrdgtohhmpdhrtghpthhtohepsghrohhonhhivgeskhgvrhhnvghlrdho
    rhhgpdhrtghpthhtohepphgvrhgvgiesphgvrhgvgidrtgiipdhrtghpthhtohepthhifi
    grihesshhushgvrdgtohhmpdhrtghpthhtohepfigvnhhssegtshhivgdrohhrghdprhgt
    phhtthhopehjvghrnhgvjhdrshhkrhgrsggvtgesghhmrghilhdrtghomhdprhgtphhtth
    hopehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgpdhrtghpthhtohepmhgrtghrohgr
    lhhphhgrkedvsehgmhgrihhlrdgtohhmpdhrtghpthhtohepshhimhhonhhsrdhphhhilh
    hiphhpvgesghhmrghilhdrtghomh
X-ME-Proxy: <xmx:D8AUZ54HgqxFzMwss3nQI7uJM_IuIZXDENj0ueM_WD-D0z6Zpdymgw>
    <xmx:D8AUZ572IIxfpgFMFaMTdbmDCOXlmOV8rqUX_wXtOCD-CBdnDthG3w>
    <xmx:D8AUZ5iRKSa0F_sjs4ggzVl4I0-ZFs1QPeKmOHKirk0ywA5IU6MGlQ>
    <xmx:D8AUZz4fPxMwf9ZTly3-Hisnn_aAPs-yE50cf28vXOhEGdqyU-6pew>
    <xmx:EMAUZ6PigRslocDJ1c3qZA18UhllwUFCAlqSz_0pc5TZjDyd1ZOOSF1B>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 20 Oct 2024 04:32:11 -0400 (EDT)
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
Subject: [PATCH v2 3/7] ASoC: sun4i-codec: Add support for different DAC FIFOC addresses to quirks
Date: Sun, 20 Oct 2024 21:30:53 +1300
Message-ID: <20241020083124.174724-4-ryan@testtoast.com>
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

The Allwinner H616 SoC  uses a different register address to control the
output FIFO.

Allow this to be specified separately from the ADC FIFO control
register.

Signed-off-by: Marcus Cooper <codekipper@gmail.com>
Signed-off-by: Ryan Walklin <ryan@testtoast.com>
Reviewed-by: Andre Przywara <andre.przywara@arm.com>
---
 sound/soc/sunxi/sun4i-codec.c | 83 +++++++++++++++++++++--------------
 1 file changed, 51 insertions(+), 32 deletions(-)

diff --git a/sound/soc/sunxi/sun4i-codec.c b/sound/soc/sunxi/sun4i-codec.c
index 330bc0c09f56b..37f5678b55291 100644
--- a/sound/soc/sunxi/sun4i-codec.c
+++ b/sound/soc/sunxi/sun4i-codec.c
@@ -238,6 +238,8 @@ struct sun4i_codec {
 
 	/* ADC_FIFOC register is at different offset on different SoCs */
 	struct regmap_field *reg_adc_fifoc;
+	/* DAC_FIFOC register is at different offset on different SoCs */
+	struct regmap_field *reg_dac_fifoc;
 
 	struct snd_dmaengine_dai_dma_data	capture_dma_data;
 	struct snd_dmaengine_dai_dma_data	playback_dma_data;
@@ -246,19 +248,19 @@ struct sun4i_codec {
 static void sun4i_codec_start_playback(struct sun4i_codec *scodec)
 {
 	/* Flush TX FIFO */
-	regmap_set_bits(scodec->regmap, SUN4I_CODEC_DAC_FIFOC,
-			BIT(SUN4I_CODEC_DAC_FIFOC_FIFO_FLUSH));
+	regmap_field_set_bits(scodec->reg_dac_fifoc,
+			      BIT(SUN4I_CODEC_DAC_FIFOC_FIFO_FLUSH));
 
 	/* Enable DAC DRQ */
-	regmap_set_bits(scodec->regmap, SUN4I_CODEC_DAC_FIFOC,
-			BIT(SUN4I_CODEC_DAC_FIFOC_DAC_DRQ_EN));
+	regmap_field_set_bits(scodec->reg_dac_fifoc,
+			      BIT(SUN4I_CODEC_DAC_FIFOC_DAC_DRQ_EN));
 }
 
 static void sun4i_codec_stop_playback(struct sun4i_codec *scodec)
 {
 	/* Disable DAC DRQ */
-	regmap_clear_bits(scodec->regmap, SUN4I_CODEC_DAC_FIFOC,
-			  BIT(SUN4I_CODEC_DAC_FIFOC_DAC_DRQ_EN));
+	regmap_field_clear_bits(scodec->reg_dac_fifoc,
+				BIT(SUN4I_CODEC_DAC_FIFOC_DAC_DRQ_EN));
 }
 
 static void sun4i_codec_start_capture(struct sun4i_codec *scodec)
@@ -356,13 +358,13 @@ static int sun4i_codec_prepare_playback(struct snd_pcm_substream *substream,
 	u32 val;
 
 	/* Flush the TX FIFO */
-	regmap_set_bits(scodec->regmap, SUN4I_CODEC_DAC_FIFOC,
-			   BIT(SUN4I_CODEC_DAC_FIFOC_FIFO_FLUSH));
+	regmap_field_set_bits(scodec->reg_dac_fifoc,
+			      BIT(SUN4I_CODEC_DAC_FIFOC_FIFO_FLUSH));
 
 	/* Set TX FIFO Empty Trigger Level */
-	regmap_update_bits(scodec->regmap, SUN4I_CODEC_DAC_FIFOC,
-			   0x3f << SUN4I_CODEC_DAC_FIFOC_TX_TRIG_LEVEL,
-			   0xf << SUN4I_CODEC_DAC_FIFOC_TX_TRIG_LEVEL);
+	regmap_field_update_bits(scodec->reg_dac_fifoc,
+				 0x3f << SUN4I_CODEC_DAC_FIFOC_TX_TRIG_LEVEL,
+				 0xf << SUN4I_CODEC_DAC_FIFOC_TX_TRIG_LEVEL);
 
 	if (substream->runtime->rate > 32000)
 		/* Use 64 bits FIR filter */
@@ -371,13 +373,13 @@ static int sun4i_codec_prepare_playback(struct snd_pcm_substream *substream,
 		/* Use 32 bits FIR filter */
 		val = BIT(SUN4I_CODEC_DAC_FIFOC_FIR_VERSION);
 
-	regmap_update_bits(scodec->regmap, SUN4I_CODEC_DAC_FIFOC,
-			   BIT(SUN4I_CODEC_DAC_FIFOC_FIR_VERSION),
-			   val);
+	regmap_field_update_bits(scodec->reg_dac_fifoc,
+				 BIT(SUN4I_CODEC_DAC_FIFOC_FIR_VERSION),
+				 val);
 
 	/* Send zeros when we have an underrun */
-	regmap_clear_bits(scodec->regmap, SUN4I_CODEC_DAC_FIFOC,
-			   BIT(SUN4I_CODEC_DAC_FIFOC_SEND_LASAT));
+	regmap_field_clear_bits(scodec->reg_dac_fifoc,
+				BIT(SUN4I_CODEC_DAC_FIFOC_SEND_LASAT));
 
 	return 0;
 };
@@ -510,9 +512,9 @@ static int sun4i_codec_hw_params_playback(struct sun4i_codec *scodec,
 	u32 val;
 
 	/* Set DAC sample rate */
-	regmap_update_bits(scodec->regmap, SUN4I_CODEC_DAC_FIFOC,
-			   7 << SUN4I_CODEC_DAC_FIFOC_DAC_FS,
-			   hwrate << SUN4I_CODEC_DAC_FIFOC_DAC_FS);
+	regmap_field_update_bits(scodec->reg_dac_fifoc,
+				 7 << SUN4I_CODEC_DAC_FIFOC_DAC_FS,
+				 hwrate << SUN4I_CODEC_DAC_FIFOC_DAC_FS);
 
 	/* Set the number of channels we want to use */
 	if (params_channels(params) == 1)
@@ -520,27 +522,27 @@ static int sun4i_codec_hw_params_playback(struct sun4i_codec *scodec,
 	else
 		val = 0;
 
-	regmap_update_bits(scodec->regmap, SUN4I_CODEC_DAC_FIFOC,
-			   BIT(SUN4I_CODEC_DAC_FIFOC_MONO_EN),
-			   val);
+	regmap_field_update_bits(scodec->reg_dac_fifoc,
+				 BIT(SUN4I_CODEC_DAC_FIFOC_MONO_EN),
+				 val);
 
 	/* Set the number of sample bits to either 16 or 24 bits */
 	if (hw_param_interval(params, SNDRV_PCM_HW_PARAM_SAMPLE_BITS)->min == 32) {
-		regmap_set_bits(scodec->regmap, SUN4I_CODEC_DAC_FIFOC,
-				   BIT(SUN4I_CODEC_DAC_FIFOC_TX_SAMPLE_BITS));
+		regmap_field_set_bits(scodec->reg_dac_fifoc,
+				      BIT(SUN4I_CODEC_DAC_FIFOC_TX_SAMPLE_BITS));
 
 		/* Set TX FIFO mode to padding the LSBs with 0 */
-		regmap_clear_bits(scodec->regmap, SUN4I_CODEC_DAC_FIFOC,
-				   BIT(SUN4I_CODEC_DAC_FIFOC_TX_FIFO_MODE));
+		regmap_field_clear_bits(scodec->reg_dac_fifoc,
+					BIT(SUN4I_CODEC_DAC_FIFOC_TX_FIFO_MODE));
 
 		scodec->playback_dma_data.addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
 	} else {
-		regmap_clear_bits(scodec->regmap, SUN4I_CODEC_DAC_FIFOC,
-				   BIT(SUN4I_CODEC_DAC_FIFOC_TX_SAMPLE_BITS));
+		regmap_field_clear_bits(scodec->reg_dac_fifoc,
+					BIT(SUN4I_CODEC_DAC_FIFOC_TX_SAMPLE_BITS));
 
 		/* Set TX FIFO mode to repeat the MSB */
-		regmap_set_bits(scodec->regmap, SUN4I_CODEC_DAC_FIFOC,
-				   BIT(SUN4I_CODEC_DAC_FIFOC_TX_FIFO_MODE));
+		regmap_field_set_bits(scodec->reg_dac_fifoc,
+				      BIT(SUN4I_CODEC_DAC_FIFOC_TX_FIFO_MODE));
 
 		scodec->playback_dma_data.addr_width = DMA_SLAVE_BUSWIDTH_2_BYTES;
 	}
@@ -587,8 +589,8 @@ static int sun4i_codec_startup(struct snd_pcm_substream *substream,
 	 * Stop issuing DRQ when we have room for less than 16 samples
 	 * in our TX FIFO
 	 */
-	regmap_set_bits(scodec->regmap, SUN4I_CODEC_DAC_FIFOC,
-			   3 << SUN4I_CODEC_DAC_FIFOC_DRQ_CLR_CNT);
+	regmap_field_set_bits(scodec->reg_dac_fifoc,
+			      3 << SUN4I_CODEC_DAC_FIFOC_DRQ_CLR_CNT);
 
 	return clk_prepare_enable(scodec->clk_module);
 }
@@ -1565,6 +1567,7 @@ struct sun4i_codec_quirks {
 	const struct snd_soc_component_driver *codec;
 	struct snd_soc_card * (*create_card)(struct device *dev);
 	struct reg_field reg_adc_fifoc;	/* used for regmap_field */
+	struct reg_field reg_dac_fifoc;	/* used for regmap_field */
 	unsigned int reg_dac_txdata;	/* TX FIFO offset for DMA config */
 	unsigned int reg_adc_rxdata;	/* RX FIFO offset for DMA config */
 	bool has_reset;
@@ -1575,6 +1578,7 @@ static const struct sun4i_codec_quirks sun4i_codec_quirks = {
 	.codec		= &sun4i_codec_codec,
 	.create_card	= sun4i_codec_create_card,
 	.reg_adc_fifoc	= REG_FIELD(SUN4I_CODEC_ADC_FIFOC, 0, 31),
+	.reg_dac_fifoc	= REG_FIELD(SUN4I_CODEC_DAC_FIFOC, 0, 31),
 	.reg_dac_txdata	= SUN4I_CODEC_DAC_TXDATA,
 	.reg_adc_rxdata	= SUN4I_CODEC_ADC_RXDATA,
 };
@@ -1584,6 +1588,7 @@ static const struct sun4i_codec_quirks sun6i_a31_codec_quirks = {
 	.codec		= &sun6i_codec_codec,
 	.create_card	= sun6i_codec_create_card,
 	.reg_adc_fifoc	= REG_FIELD(SUN6I_CODEC_ADC_FIFOC, 0, 31),
+	.reg_dac_fifoc	= REG_FIELD(SUN4I_CODEC_DAC_FIFOC, 0, 31),
 	.reg_dac_txdata	= SUN4I_CODEC_DAC_TXDATA,
 	.reg_adc_rxdata	= SUN6I_CODEC_ADC_RXDATA,
 	.has_reset	= true,
@@ -1594,6 +1599,7 @@ static const struct sun4i_codec_quirks sun7i_codec_quirks = {
 	.codec		= &sun7i_codec_codec,
 	.create_card	= sun4i_codec_create_card,
 	.reg_adc_fifoc	= REG_FIELD(SUN4I_CODEC_ADC_FIFOC, 0, 31),
+	.reg_dac_fifoc	= REG_FIELD(SUN4I_CODEC_DAC_FIFOC, 0, 31),
 	.reg_dac_txdata	= SUN4I_CODEC_DAC_TXDATA,
 	.reg_adc_rxdata	= SUN4I_CODEC_ADC_RXDATA,
 };
@@ -1603,6 +1609,7 @@ static const struct sun4i_codec_quirks sun8i_a23_codec_quirks = {
 	.codec		= &sun8i_a23_codec_codec,
 	.create_card	= sun8i_a23_codec_create_card,
 	.reg_adc_fifoc	= REG_FIELD(SUN6I_CODEC_ADC_FIFOC, 0, 31),
+	.reg_dac_fifoc	= REG_FIELD(SUN4I_CODEC_DAC_FIFOC, 0, 31),
 	.reg_dac_txdata	= SUN4I_CODEC_DAC_TXDATA,
 	.reg_adc_rxdata	= SUN6I_CODEC_ADC_RXDATA,
 	.has_reset	= true,
@@ -1618,6 +1625,7 @@ static const struct sun4i_codec_quirks sun8i_h3_codec_quirks = {
 	.codec		= &sun8i_a23_codec_codec,
 	.create_card	= sun8i_h3_codec_create_card,
 	.reg_adc_fifoc	= REG_FIELD(SUN6I_CODEC_ADC_FIFOC, 0, 31),
+	.reg_dac_fifoc	= REG_FIELD(SUN4I_CODEC_DAC_FIFOC, 0, 31),
 	.reg_dac_txdata	= SUN8I_H3_CODEC_DAC_TXDATA,
 	.reg_adc_rxdata	= SUN6I_CODEC_ADC_RXDATA,
 	.has_reset	= true,
@@ -1632,6 +1640,7 @@ static const struct sun4i_codec_quirks sun8i_v3s_codec_quirks = {
 	.codec		= &sun8i_a23_codec_codec,
 	.create_card	= sun8i_v3s_codec_create_card,
 	.reg_adc_fifoc	= REG_FIELD(SUN6I_CODEC_ADC_FIFOC, 0, 31),
+	.reg_dac_fifoc	= REG_FIELD(SUN4I_CODEC_DAC_FIFOC, 0, 31),
 	.reg_dac_txdata	= SUN8I_H3_CODEC_DAC_TXDATA,
 	.reg_adc_rxdata	= SUN6I_CODEC_ADC_RXDATA,
 	.has_reset	= true,
@@ -1739,6 +1748,16 @@ static int sun4i_codec_probe(struct platform_device *pdev)
 		return ret;
 	}
 
+	scodec->reg_dac_fifoc = devm_regmap_field_alloc(&pdev->dev,
+							scodec->regmap,
+							quirks->reg_dac_fifoc);
+	if (IS_ERR(scodec->reg_dac_fifoc)) {
+		ret = PTR_ERR(scodec->reg_dac_fifoc);
+		dev_err(&pdev->dev, "Failed to create regmap fields: %d\n",
+			ret);
+		return ret;
+	}
+
 	/* Enable the bus clock */
 	if (clk_prepare_enable(scodec->clk_apb)) {
 		dev_err(&pdev->dev, "Failed to enable the APB clock\n");
-- 
2.47.0

