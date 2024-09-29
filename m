Received: from fhigh-a2-smtp.messagingengine.com (fhigh-a2-smtp.messagingengine.com [103.168.172.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1376B14AD3B;
	Sun, 29 Sep 2024 10:08:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727604496; cv=none; b=MxZYQkmZTslq+5+lZqxn8fNu4/2KGwpJGyKzkAwb8Bf3D+LLECfeNkPslRfGWtgLOsM3QhRIBrlblr4Jq+H5GzOnW51qBuuWlRiuvXOeit2+ooEMmz817/ADEV2JowwKIO522FXXvH7XhuuBuYFRhBCnlVPJ5aRbbo28bdRuLiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727604496; c=relaxed/simple;
	bh=RR561Jv4M1VyqZKRHfps8iKtlrF5G2TCcOulKkCScKQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PPNyM/Vv4f2kdDUZBZF5l3RldeP9DQjZah35fEswmffY794p/+s4bgy4MtXgWUeaci5het8DcXye+O0E/TFZa26Xa93xXsBIOr+YMAdS6TPX6NmYnkw3sy1cq2l2gQrAiLJbS/VGw1+fnf4jKh2NiQIwNl8W+8RPxi48F2mX7DY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com; spf=pass smtp.mailfrom=testtoast.com; dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b=1QAR/pU5; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=hv0zyUO6; arc=none smtp.client-ip=103.168.172.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=testtoast.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b="1QAR/pU5";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="hv0zyUO6"
Received: from phl-compute-01.internal (phl-compute-01.phl.internal [10.202.2.41])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 6E02211402B9;
	Sun, 29 Sep 2024 06:08:14 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Sun, 29 Sep 2024 06:08:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1727604494; x=
	1727690894; bh=Gapjbk+ookg77hG37AEo2heIKpdsIDco5i07rh1QMgA=; b=1
	QAR/pU5fb3qbHRv2bxMEs3ELzK49FxPaD2JD2nkaYvfGfasaqJUUOxmr4jnSDSRL
	FjmjRyHQWV/b1C6lMO+Y8oW8CTxVoTcFliZKGiszXwsqeH9cOFWNuvT663lrjXnM
	7YGY1tVmdwT3iZu9dqB27l+z3RWI0LtLXpgouIlrlqv9S8ut8PtdFMmRFm4Wo92d
	x8zRbS/S8T4iz707rOKF0qyLbdT5LIfCe7tF9+we1KukiCMzYQS3qGu81gZ1ldYP
	1ZYWDbWkluZeUm/0THnLM5r/hmL+Jyyn3+jip5qaynxyaAJfDgOBjsRNqcv/0Fbp
	opoQRM4Jisd69zsGdPk9w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1727604494; x=
	1727690894; bh=Gapjbk+ookg77hG37AEo2heIKpdsIDco5i07rh1QMgA=; b=h
	v0zyUO6uaSldDsBM8qT0xu+5p8qRcXbDuimViIyaMw/I1pSuJb63aRlpe49PXegL
	6GbXunHIl4V3w6GdMYgoG7hI7pL1r2/jthaxMwfnHpS78oOa/S/hZfUwZCLfxb24
	k8EyxKN8W2xfDUJ8hFA0n3Qbdf5Jp8EFuOawO23kd8uLXOUn2t17Bl3WObIa8Q4v
	7fHJ87gPpYD+PziCFJzHGc/5LBQGR14Exbp3JyzxpsLD6ypuaTug94Lcr5UVJCA1
	arjb40U+oG6mktTP0CxwGFOffZOHEaSldRzrX5qb97U09202fiQqYxt32W71t7II
	W/epnGJcOv/mb2vsJvB+A==
X-ME-Sender: <xms:Dif5ZjlbylVwR4X3p80Z1JsU5OX7NlQmqPf1aK4TBomvK_oZOh_-vw>
    <xme:Dif5Zm0poCNWnp3z19zvX3xSDdJHNuUwycK1R7u7ONflPVeyB4KN94CLFV9-hvJhO
    kpdT6IAD2seLmsOtQ>
X-ME-Received: <xmr:Dif5ZprpRb5gno_qA4TeJuVKXOfNPGKyUlLap7lBIJKyMvGzdrsBpp35p5lMClg_aIlMBOzC5NIW_Jv4BHsQqg7rKOrtJbkN1B5UUVigaE4-NKA_>
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
X-ME-Proxy: <xmx:Dif5Zrk-gP6IHODWcrv-aUXPRQxpUPq_s0JKaQHCC6Q8VwPlNuR5rQ>
    <xmx:Dif5Zh2vxBFdz7eC5Ecn-4BcKoNwXywmem2xUYPVOkC81W8X-u53bQ>
    <xmx:Dif5Zqs5tVs6DL0pbzoaMeKtPuqFlBwiRwZsrODKjSy6HIvcKX2HPQ>
    <xmx:Dif5ZlXBOsSC52Bt7LcfPwaiyIx_KnfSlAgQooTv49DYxXREvWUE8g>
    <xmx:Dif5ZrOFwZ-uftJ2dluNRBLv3hHMy0-SLGN2v_958F_yDn8W9zUkjqKW>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 29 Sep 2024 06:08:10 -0400 (EDT)
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
Subject: [PATCH 2/6] ASoC: sun4i-codec: Add playback only flag to quirks
Date: Sun, 29 Sep 2024 23:06:03 +1300
Message-ID: <20240929100750.860329-3-ryan@testtoast.com>
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
2.46.1

