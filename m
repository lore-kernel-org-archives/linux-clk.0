Received: from fout-a4-smtp.messagingengine.com (fout-a4-smtp.messagingengine.com [103.168.172.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEE0014D702;
	Sun, 29 Sep 2024 10:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727604501; cv=none; b=i5L47HKqB2R5o5AEEbpCunZRE5scibwVOnAxQ0eElZLy1FT6h8/fngQ+ksr2rcMqmMUxvpgBbwLSGsrZvpZtjyecmtB1j9LwqdoiJq5wlANbNc34Z69DDN796fa60VW7da6ci6f3XJgMR32tnL6wE3oLP+qviP1iegi4CEIMgUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727604501; c=relaxed/simple;
	bh=gUE/FvZfGbZZYs3ROH4eVbzmD9EmIopKd7PbshG/qfc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=m7L0juKUjpOQtS9jA2sfecqlqRri2mSejAjQA/BwVTD4JHQLAl2nML5DRii/2wRcWg7FJCMRU2WmiYtHMfb8LNtwTQaL/JQQllvKdaILYNvuK8uo44t3mpKtd7IPloYJqAq0z2dEja3D0qDC9PE96eFmLNhlNNaecCrldX2hprg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com; spf=pass smtp.mailfrom=testtoast.com; dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b=MwiRuyKS; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=RkeN1S+X; arc=none smtp.client-ip=103.168.172.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=testtoast.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b="MwiRuyKS";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="RkeN1S+X"
Received: from phl-compute-04.internal (phl-compute-04.phl.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id D92021380636;
	Sun, 29 Sep 2024 06:08:18 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Sun, 29 Sep 2024 06:08:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1727604498; x=
	1727690898; bh=F/j14D7b6HmCLnZ1nHpXKjHjHFDMrPILMvliS/babVY=; b=M
	wiRuyKSo+EoCiTWYypLrUF1yVXOU+++1gDFun0oE2juDWbh6D9ArPH9eow3Sk6kF
	vRsaewxS5RkJrDCW9D3RvWUVRkLQ57foSBYKk6r5ppKmC5rtydG3XTW8vAdWRdxB
	YLZqhDvegmjIswx0NqCVXsuFdYI5RSUrPZreR8YYkDT5SnX9zRrpwTFyf/tPR+/x
	8rpX7m0M2gPyfWC8If9h7RPTmotHoVKlvuWwDW335dJ3Lz3WCdIGKO8vKnKjQD1r
	PekQx/mZcGXwGVYtVEXlCen54q3Uo9HhpOj2ThKgMFxcCXaehXDuWO0s4ZNwt2VZ
	PoI5XRDX7WdpIpVJbUb1w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1727604498; x=
	1727690898; bh=F/j14D7b6HmCLnZ1nHpXKjHjHFDMrPILMvliS/babVY=; b=R
	keN1S+XRiRKeImJit6bNjdfhhidki+QZ8Ywd0YnibKTCE4/2J8EsG6fqc7o+kg2e
	c+qK95E5tpyJ1FxK2NLUEIAr92vmUw17VAA41DVl3RZL/CPtiTglYejDzjSYqSS2
	nlgwVLjKLqNnhNediBDQD7XaopYQQ3S2iNOJLKG1r5SE1I57kHhICgzljF4vy0zz
	VbxJhawOSeOj8o0N28sb+YRts1DijpZPKXnnTACbXzNK9DwiW1fSZsGIV0ZUztVS
	3ju7MgYAzJ3kiyVYwLTm1qMZcRzgAUK5vEZfLbxodiRDUrjtFOhDJX9W1YqAVybk
	5952o7HPK6+axoovrG7NQ==
X-ME-Sender: <xms:Eif5ZoQlMil6vU2yRnWLBU0Z-9wzjWZ5Yy3H1M4XqEAgBuR4kDAtlQ>
    <xme:Eif5ZlyttO04ywgdTNu82HtyaKiTH_tDi2cIfAz7vRYoIasUdQcSfpcmArGkhCBIB
    CflwW_3k4D15_NQiA>
X-ME-Received: <xmr:Eif5Zl3Q3hmT2Uc9U4KpXP24Ait6CkasL7Bl1yh0Pvk_dOW2cIeqp4yRa8-2Bs1mx8GdvKwIUmw9g-JuKdWxNJ3ZrM_fBL2qfNDiFV15lq-O7jy9>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvddufedgvdeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttden
    ucfhrhhomheptfihrghnucghrghlkhhlihhnuceorhihrghnsehtvghsthhtohgrshhtrd
    gtohhmqeenucggtffrrghtthgvrhhnpeffheeiffegtdfgffejteevgeefkeelieelkeev
    ueetffetteduffevgeeiieehteenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
    epmhgrihhlfhhrohhmpehrhigrnhesthgvshhtthhorghsthdrtghomhdpnhgspghrtghp
    thhtohepudefpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehlghhirhgufihooh
    gusehgmhgrihhlrdgtohhmpdhrtghpthhtohepsghrohhonhhivgeskhgvrhhnvghlrdho
    rhhgpdhrtghpthhtohepphgvrhgvgiesphgvrhgvgidrtgiipdhrtghpthhtohepthhifi
    grihesshhushgvrdgtohhmpdhrtghpthhtohepfigvnhhssegtshhivgdrohhrghdprhgt
    phhtthhopehjvghrnhgvjhdrshhkrhgrsggvtgesghhmrghilhdrtghomhdprhgtphhtth
    hopehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgpdhrtghpthhtoheplhhinhhugidq
    shhouhhnugesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqd
    grrhhmqdhkvghrnhgvlheslhhishhtshdrihhnfhhrrgguvggrugdrohhrgh
X-ME-Proxy: <xmx:Eif5ZsCxsTOvQ2d_fGACCD3LStuu2zZZI66Orc5AkN3nlLAT9FYTsA>
    <xmx:Eif5ZhjznkHkJl2P2WLpbMWge4k8ivKAoVvwDiKA1QvkiuET_ZvcqQ>
    <xmx:Eif5ZoqtGyoQEPWBQ0kIxc6t_QmHFQqvirNUlyHj3QcvjQFuoyLpmw>
    <xmx:Eif5ZkhxiOVntxX1766xGOrYzSWdOgd1SSLcGfWb4tcKXsK7wgYQUw>
    <xmx:Eif5ZkQ9iwkmYXWHqljxq2-PvBiJoKraBeL7LNdgXc9tc_6bKV87xdXV>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 29 Sep 2024 06:08:14 -0400 (EDT)
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
Subject: [PATCH 3/6] clk: sunxi-ng: h616: Add sigma-delta modulation settings for audio PLL
Date: Sun, 29 Sep 2024 23:06:04 +1300
Message-ID: <20240929100750.860329-4-ryan@testtoast.com>
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

Allwinner has previously released a H616 audio driver which also
provides sigma-delta modulation for the audio PLL clocks. This approach
is used in other Allwinner SoCs, including the H3 and A64.

One change from the vendor code is made to the PLL clocks, the 
vendor-specified dividers of 4/2/1 for the 1/2/4x clocks respectively result 
in audio playback that is too slow by 50%. Therefore the dividers are simply
doubled to 8/4/2 which results in correct playback rates.

Add SDM to the H616 clock control unit driver.

Signed-off-by: Ryan Walklin <ryan@testtoast.com>
---
 drivers/clk/sunxi-ng/ccu-sun50i-h616.c | 36 +++++++++++++-------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu-sun50i-h616.c b/drivers/clk/sunxi-ng/ccu-sun50i-h616.c
index 84e406ddf9d12..be272947b0fee 100644
--- a/drivers/clk/sunxi-ng/ccu-sun50i-h616.c
+++ b/drivers/clk/sunxi-ng/ccu-sun50i-h616.c
@@ -215,20 +215,23 @@ static struct ccu_nkmp pll_de_clk = {
 	},
 };
 
-/*
- * TODO: Determine SDM settings for the audio PLL. The manual suggests
- * PLL_FACTOR_N=16, PLL_POST_DIV_P=2, OUTPUT_DIV=2, pattern=0xe000c49b
- * for 24.576 MHz, and PLL_FACTOR_N=22, PLL_POST_DIV_P=3, OUTPUT_DIV=2,
- * pattern=0xe001288c for 22.5792 MHz.
- * This clashes with our fixed PLL_POST_DIV_P.
- */
 #define SUN50I_H616_PLL_AUDIO_REG	0x078
+
+static struct ccu_sdm_setting pll_audio_sdm_table[] = {
+	{ .rate = 90316800, .pattern = 0xc001288d, .m = 3, .n = 22 },
+	{ .rate = 98304000, .pattern = 0xc001eb85, .m = 5, .n = 40 },
+};
+
 static struct ccu_nm pll_audio_hs_clk = {
 	.enable		= BIT(31),
 	.lock		= BIT(28),
-	.n		= _SUNXI_CCU_MULT_MIN(8, 8, 12),
-	.m		= _SUNXI_CCU_DIV(1, 1), /* input divider */
+	.n			= _SUNXI_CCU_MULT_MIN(8, 8, 12),
+	.m			= _SUNXI_CCU_DIV(16, 6),
+	.sdm		= _SUNXI_CCU_SDM(pll_audio_sdm_table,
+				  BIT(24), 0x178, BIT(31)),
+
 	.common		= {
+		.features = CCU_FEATURE_SIGMA_DELTA_MOD,
 		.reg		= 0x078,
 		.hw.init	= CLK_HW_INIT("pll-audio-hs", "osc24M",
 					      &ccu_nm_ops,
@@ -690,13 +693,13 @@ static const struct clk_hw *clk_parent_pll_audio[] = {
  */
 static CLK_FIXED_FACTOR_HWS(pll_audio_1x_clk, "pll-audio-1x",
 			    clk_parent_pll_audio,
-			    96, 1, CLK_SET_RATE_PARENT);
+			    8, 1, CLK_SET_RATE_PARENT);
 static CLK_FIXED_FACTOR_HWS(pll_audio_2x_clk, "pll-audio-2x",
 			    clk_parent_pll_audio,
-			    48, 1, CLK_SET_RATE_PARENT);
+			    4, 1, CLK_SET_RATE_PARENT);
 static CLK_FIXED_FACTOR_HWS(pll_audio_4x_clk, "pll-audio-4x",
 			    clk_parent_pll_audio,
-			    24, 1, CLK_SET_RATE_PARENT);
+			    2, 1, CLK_SET_RATE_PARENT);
 
 static const struct clk_hw *pll_periph0_parents[] = {
 	&pll_periph0_clk.common.hw
@@ -1135,13 +1138,10 @@ static int sun50i_h616_ccu_probe(struct platform_device *pdev)
 		writel(val, reg + usb2_clk_regs[i]);
 	}
 
-	/*
-	 * Force the post-divider of pll-audio to 12 and the output divider
-	 * of it to 2, so 24576000 and 22579200 rates can be set exactly.
-	 */
 	val = readl(reg + SUN50I_H616_PLL_AUDIO_REG);
-	val &= ~(GENMASK(21, 16) | BIT(0));
-	writel(val | (11 << 16) | BIT(0), reg + SUN50I_H616_PLL_AUDIO_REG);
+	val &= ~BIT(1);
+	val |= BIT(0);
+	writel(val, reg + SUN50I_H616_PLL_AUDIO_REG);
 
 	/*
 	 * First clock parent (osc32K) is unusable for CEC. But since there
-- 
2.46.1

