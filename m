Received: from fhigh-a2-smtp.messagingengine.com (fhigh-a2-smtp.messagingengine.com [103.168.172.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F12214A093;
	Sun, 29 Sep 2024 10:08:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727604492; cv=none; b=s7qUQBl2tVlijtjBWtdB7K9W64gNxV3w37gdUjaqSc9l2mGES/FXUCoAXd6phNG9bc+vFBeoK6r0kJ1Mne1/yJeSzmRy7kORaSauHRM9UW+j7qRHaklgE8mhZ4pDKgZ9/jMvroWdJqIBwmXKC824ODmvvLKBsUGQo1edr12rTm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727604492; c=relaxed/simple;
	bh=WBk23ccCR9mOE3wROTyOggTZMPpfpJhdyTlTS1szbI4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qT8txxFcSQcelEtPIFYw8J+ZNnU2MxM8hTKuavb4f6h7YXRM23qMZIS/7AchJ7t6Q5DjC8MAS4BxIP7jE+GPwQmg0Bqrq2BB0Mo2REJJKxbzO7KRGZFk9zMtFKfIXfTP98BaQWRtoQ0/EA5NtyaYJEkX//EYWKVbAcLH3+5pr5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com; spf=pass smtp.mailfrom=testtoast.com; dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b=Pql1IFch; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=F1ItxVDo; arc=none smtp.client-ip=103.168.172.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=testtoast.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b="Pql1IFch";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="F1ItxVDo"
Received: from phl-compute-11.internal (phl-compute-11.phl.internal [10.202.2.51])
	by mailfhigh.phl.internal (Postfix) with ESMTP id C4D0911402BF;
	Sun, 29 Sep 2024 06:08:09 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-11.internal (MEProxy); Sun, 29 Sep 2024 06:08:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1727604489; x=
	1727690889; bh=EFiScj/984nCGA4n//1vHjnbKOyD5q/9GZKBNFnVWrA=; b=P
	ql1IFchcmaqDoRu+bAdvWStBjYg/nnuX4DX581XHORI4bO3GAK/sgDka3SezSX1s
	CiM2pA14EYYRPxrz1rXcnnI6LaVPaKZccENah4YbpwfYqonJuZ9wEPPdfs0j6bwh
	Tgc/K7kG7vyGz4gaTlvSbq3kQMhmBYcwVf/6idFqX/fjWLZjXGUgw+ZNsG9T0tlZ
	gMSGiBHGbXIAwDRhyO0ZTkACHrqkzxGZJrKWJuyI+OPQUnyH5VMa1t/JIg44O0r0
	IKvXl5L0o9Xv4zJwkUunDrqJQOfiyzMn+bms+cCuaDF1SLFcXtWCfbc9LiOKaNc/
	lvMZJvuvP/bkerKNBY0IQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1727604489; x=
	1727690889; bh=EFiScj/984nCGA4n//1vHjnbKOyD5q/9GZKBNFnVWrA=; b=F
	1ItxVDo0js7Vz/TPuqIrkE/GLlzwzSYv1OnTd/cPnRkLjJ9PJTpq2bpP/xL3mEqa
	Nu45RebC1R7BmVairXjtO6xu12zsSOx7nb4/b8GoQ555M6AbGs9HR3GaX0qCC7oi
	TNMpIW0kWkzZUbO5MxDoblqb2PrBVxSYg7gbCZLm0DKYCWN4+WMologppYvI8upp
	nh2ct49P+kpMNJ/eVcw/Mnugjs1PoEc90TwOZISFuiON11h5wiX/q8pDCGRHazkF
	/Ek/6e9UlkdsJi2lmo3fPmwwf2iFEVsxX9HmlHocH2H5cJm5jOO8KmWomZhMLYjG
	ElXIobuZBRkB+AFETNfvw==
X-ME-Sender: <xms:CSf5ZoCBeCbcSkpsYVUnRSnAdeduQIz14Cg9cv923EKrLyEPcjebJg>
    <xme:CSf5Zqg_nk-ZGNhpdzfxR-bo33wRygDkzUI6Mc1gJbdOk83clzPTZY2rTbSpi-Rqh
    lmHGXSk2DnG4YHx0w>
X-ME-Received: <xmr:CSf5Zrli0mkcjFzwGDytFWOGrodPqUwxgy0N54FLveoCeAVlsIwj2P3sIVMYPOwPHEAPTmYjZbo5-QTmvCKqAm00S7eKrqDZ49K26_tZievHfos->
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvddufedgvdeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttden
    ucfhrhhomheptfihrghnucghrghlkhhlihhnuceorhihrghnsehtvghsthhtohgrshhtrd
    gtohhmqeenucggtffrrghtthgvrhhnpeffheeiffegtdfgffejteevgeefkeelieelkeev
    ueetffetteduffevgeeiieehteenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
    epmhgrihhlfhhrohhmpehrhigrnhesthgvshhtthhorghsthdrtghomhdpnhgspghrtghp
    thhtohepudegpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehlghhirhgufihooh
    gusehgmhgrihhlrdgtohhmpdhrtghpthhtohepsghrohhonhhivgeskhgvrhhnvghlrdho
    rhhgpdhrtghpthhtohepphgvrhgvgiesphgvrhgvgidrtgiipdhrtghpthhtohepthhifi
    grihesshhushgvrdgtohhmpdhrtghpthhtohepfigvnhhssegtshhivgdrohhrghdprhgt
    phhtthhopehjvghrnhgvjhdrshhkrhgrsggvtgesghhmrghilhdrtghomhdprhgtphhtth
    hopehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgpdhrtghpthhtoheplhhinhhugidq
    shhouhhnugesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqd
    grrhhmqdhkvghrnhgvlheslhhishhtshdrihhnfhhrrgguvggrugdrohhrgh
X-ME-Proxy: <xmx:CSf5Zuyqtcji3WV0FP1Me8bJ8lC0amcx1kTm24_HXVUJJVsaBPlF_Q>
    <xmx:CSf5ZtSSvSK95QJfe_e3l7idaveMGufKBRvf_sR7ri8EV8N3PVzkwA>
    <xmx:CSf5ZpaY-NCLjBI33bL2DdIaPQ1-eCsQn0tEk4ix5L266q8A2WTxmA>
    <xmx:CSf5ZmRN1YPwZ_joLGY74bQ4L7YdkgJ2zrh8TKJK0qfJVVpJb7k14w>
    <xmx:CSf5Zprl-_m_bLFZ_6IOyFL7oVWSbstGmtgd0RYvn_q0TzBo6FolWYAN>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 29 Sep 2024 06:08:05 -0400 (EDT)
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
	Marcus Cooper <codekipper@gmail.com>,
	Ryan Walklin <ryan@testtoast.com>
Subject: [PATCH 1/6] ASoC: sun4i-codec: Add support for different DAC FIFOC addresses to quirks
Date: Sun, 29 Sep 2024 23:06:02 +1300
Message-ID: <20240929100750.860329-2-ryan@testtoast.com>
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

From: Marcus Cooper <codekipper@gmail.com>

The Allwinner H616 SoC uses a different register address to control the
output FIFO.

Allow this to be specified separately from the ADC FIFO control
register.

Signed-off-by: Marcus Cooper <codekipper@gmail.com>
Signed-off-by: Ryan Walklin <ryan@testtoast.com>
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
2.46.1

