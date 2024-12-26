Received: from mx.denx.de (mx.denx.de [89.58.32.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 382A228F5;
	Thu, 26 Dec 2024 15:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.58.32.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735227020; cv=none; b=Z7YLkSVMP9dUgIvnHCJFMfyN9oQtbMFWzFkMQ5SsjYTWl3Hd0IE5F2BjFPohaBO8dRlGHhjzTYJ10xfvfYUxPI8wR1x/CKMyFsx8UpYtK4LVQT1yQh8FCkF/aOrkV9NuBrD6cdhKD3zD8GDPqiQkPRP51eisWDB2pdmFQjm5CSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735227020; c=relaxed/simple;
	bh=u9eql7vdz+ZUQKM5oYSxd91V2cufg/ew7s8kDcjzrGg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i9tm7W2RJ9wl6Z3e7tDqxQSN/Z33zvcQnZM2C7/6/W3t1wN/nKBHkdK3I0G6tpjsZP7Vm8DqoM+JfKK1Bot0qK7Gm7jN0V6s8yOGkh+u/1xDtJVZCKdRx026um2sDZywUhvel/NXqBMCgfuBisMEhoucu6Lke3BOdXcFLaCxExw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=YSH+q6Bc; arc=none smtp.client-ip=89.58.32.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="YSH+q6Bc"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1AC8B1040DBDA;
	Thu, 26 Dec 2024 16:30:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1735227014;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4lftua6+040aig03z//Hzik9BGubV19zUMB6MbPELuA=;
	b=YSH+q6BcooCNUNPUsqEr34VMRo2eLKYwCNx31W/ijatsRyeJ7DckwrHTPwWmLFP948zY3O
	g8PF70lZg0+GadPlOL5o/BICvIOoq4TcEHZNIBx5ar/F7E0hAujcIhIzwb68dJ7g0OcaHW
	+qxt39reaKAMBHWfIsJ2x9O7Ce+8fQaEJwL+aia2/gQa6QO4H9aFp19okfNCJYEBIOtBt5
	cQeUg/DKLvAE4fZDT7++NSVs4LHDCnN0UnDjjQ00mjX3C8BUNfkaqIpO4/xHwS5DaJ+XKC
	xLkfUH+e1OjNFlUo7xuE2FFHBIfJenntDkTB0QIxW9DL2qjIfQ1zfcAcwsyt+w==
From: Marek Vasut <marex@denx.de>
To: linux-sound@vger.kernel.org
Cc: Marek Vasut <marex@denx.de>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Michael Walle <michael@walle.cc>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Takashi Iwai <tiwai@suse.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH 2/2] ASoC: fsl_sai: Add RX/TX BCLK swap support
Date: Thu, 26 Dec 2024 16:29:46 +0100
Message-ID: <20241226152953.36230-2-marex@denx.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241226152953.36230-1-marex@denx.de>
References: <20241226152953.36230-1-marex@denx.de>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Add support for setting the Bit Clock Swap bit in CR2 register
via new "fsl,sai-bit-clock-swap" DT property. This bit swaps the
bit clock used by the transmitter or receiver in asynchronous mode,
i.e. makes transmitter use RX_BCLK and TX_SYNC, and vice versa,
makes receiver use TX_BCLK and RX_SYNC.

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Michael Walle <michael@walle.cc>
Cc: Nicolin Chen <nicoleotsuka@gmail.com>
Cc: Rob Herring <robh@kernel.org>
Cc: Shengjiu Wang <shengjiu.wang@gmail.com>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: Takashi Iwai <tiwai@suse.com>
Cc: Xiubo Li <Xiubo.Lee@gmail.com>
Cc: devicetree@vger.kernel.org
Cc: linux-clk@vger.kernel.org
Cc: linux-sound@vger.kernel.org
---
 sound/soc/fsl/fsl_sai.c | 7 ++++++-
 sound/soc/fsl/fsl_sai.h | 2 ++
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
index c4eb87c5d39e4..3b1b51c482d50 100644
--- a/sound/soc/fsl/fsl_sai.c
+++ b/sound/soc/fsl/fsl_sai.c
@@ -276,6 +276,9 @@ static int fsl_sai_set_dai_fmt_tr(struct snd_soc_dai *cpu_dai,
 	unsigned int ofs = sai->soc_data->reg_offset;
 	u32 val_cr2 = 0, val_cr4 = 0;
 
+	if (sai->is_bit_clock_swap)
+		val_cr2 |= FSL_SAI_CR2_BCS;
+
 	if (!sai->is_lsb_first)
 		val_cr4 |= FSL_SAI_CR4_MF;
 
@@ -375,7 +378,8 @@ static int fsl_sai_set_dai_fmt_tr(struct snd_soc_dai *cpu_dai,
 	}
 
 	regmap_update_bits(sai->regmap, FSL_SAI_xCR2(tx, ofs),
-			   FSL_SAI_CR2_BCP | FSL_SAI_CR2_BCD_MSTR, val_cr2);
+			   FSL_SAI_CR2_BCS | FSL_SAI_CR2_BCP | FSL_SAI_CR2_BCD_MSTR,
+			   val_cr2);
 	regmap_update_bits(sai->regmap, FSL_SAI_xCR4(tx, ofs),
 			   FSL_SAI_CR4_MF | FSL_SAI_CR4_FSE |
 			   FSL_SAI_CR4_FSP | FSL_SAI_CR4_FSD_MSTR, val_cr4);
@@ -1395,6 +1399,7 @@ static int fsl_sai_probe(struct platform_device *pdev)
 	sai->soc_data = of_device_get_match_data(dev);
 
 	sai->is_lsb_first = of_property_read_bool(np, "lsb-first");
+	sai->is_bit_clock_swap = of_property_read_bool(np, "fsl,sai-bit-clock-swap");
 
 	base = devm_platform_get_and_ioremap_resource(pdev, 0, &sai->res);
 	if (IS_ERR(base))
diff --git a/sound/soc/fsl/fsl_sai.h b/sound/soc/fsl/fsl_sai.h
index 0e25e2fc7ce0d..f58ff39497366 100644
--- a/sound/soc/fsl/fsl_sai.h
+++ b/sound/soc/fsl/fsl_sai.h
@@ -118,6 +118,7 @@
 
 /* SAI Transmit and Receive Configuration 2 Register */
 #define FSL_SAI_CR2_SYNC	BIT(30)
+#define FSL_SAI_CR2_BCS		BIT(29)
 #define FSL_SAI_CR2_BCI		BIT(28)
 #define FSL_SAI_CR2_MSEL_MASK	(0x3 << 26)
 #define FSL_SAI_CR2_MSEL_BUS	0
@@ -293,6 +294,7 @@ struct fsl_sai {
 	struct fsl_sai_dl_cfg *dl_cfg;
 	unsigned int dl_cfg_cnt;
 	bool mclk_direction_output;
+	bool is_bit_clock_swap;
 
 	unsigned int mclk_id[2];
 	unsigned int mclk_streams;
-- 
2.45.2

