Received: from fhigh-a6-smtp.messagingengine.com (fhigh-a6-smtp.messagingengine.com [103.168.172.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8C7141C77;
	Sun, 20 Oct 2024 08:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729413128; cv=none; b=hTAbdq8sTYw4WQA6jUTtUGdURjWqFHA7MLwbmTqvWv/uyu8esoUYBlRlwcU7cTtLL/eSVC9evA8hEXOS6lEUaPJSL/nkgydZv7ricSV4zgEAcPh0jwGpbtlY/B85IIGS2QuAby0pwrKzSjp/COb4d5ntI3ZiKbufHC1hRu4dPfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729413128; c=relaxed/simple;
	bh=O7Bo6a/S0qTVEyRyoj0tlITWAH65xZ3E38Q/5WCliwY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PwJhvbZngZQjNNm6FYm85LPSpJgCJqVQ3YG2VRyGgc796xDFENcbgWjve9Hp6OZZFvAukCOFKDMfEGv/cMvc9K7qesnFPEmtJ0wzzF48dQDUjJ4neb7mS6Ow1/ntcbQeEI3Tm6gjNyNTEwm/6rIOtADjnrDBWbGYEogaeS7PqPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com; spf=pass smtp.mailfrom=testtoast.com; dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b=a8nmSs51; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=jPapQcMM; arc=none smtp.client-ip=103.168.172.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=testtoast.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b="a8nmSs51";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="jPapQcMM"
Received: from phl-compute-01.internal (phl-compute-01.phl.internal [10.202.2.41])
	by mailfhigh.phl.internal (Postfix) with ESMTP id BB6F911400AB;
	Sun, 20 Oct 2024 04:32:05 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Sun, 20 Oct 2024 04:32:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1729413125; x=
	1729499525; bh=bDcm263UYUaGEA/iNqFzzVeGEBlSTxFs3r/ACbxDKm8=; b=a
	8nmSs51z/Vm4WVptd+9TeUqIa4OcEfe240qiSFG/RM6B5FZsN1zo2KnH/Lh/1cqY
	RMQrHNBHtoS9hcOiNo1zDX+aGSOjLegsZb9BSKTOjsu2E5enhmALEKnnDzx/7PFO
	x+oz8oZ2Eu3FssB81GYwMncB5TUZ40hH+myjBMLePJAJ2vvMDoiaE6COiM42fCkb
	pzAvJkP2OUjP8BHXHOHhHJHIVBex7sAXmBDABG483+292dmo2h7EeXYZDMCORohL
	2CcFU2MWbQasOezD9gAcdX4ntFvVrGcCcJuc0RpymA+IMQBSKzYN257gKsnmTGOs
	PHvOlFXxZrAJcbvWyOvlQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1729413125; x=
	1729499525; bh=bDcm263UYUaGEA/iNqFzzVeGEBlSTxFs3r/ACbxDKm8=; b=j
	PapQcMMrB0PHDJUY5r6mkBiP/GmOZqk3vbNIASObJvV14ww12Gbdzk2g6UNTBDJw
	AN2SOM+S/QvlsdZnkID/tQM1dTdBHPl35makpMXp5Y46IC4xQp3Jt+F6jM85FKFK
	ggj2JXFTr7tdDr4VVjnclFzlzgOX+nce4PddBEZJOLiSWdjf3seMYomhyEJ6JODs
	HBoe5obUfhg1LjxlVE2Li0lGFbkbLhK5TGHG9jSIgND8GOP4XGH6RyEHXZJPRr+e
	tswjPMLLxBAFSf4fiLpLzcP/+Cimw8Kpo2HcygDIs+ZDfQ8ZfJu1acrC3AyV1GWR
	VAHWC9UzPlpN+quHqwcCQ==
X-ME-Sender: <xms:BcAUZ4SNWe5WjDWI53ASp960gW7zcbHsexvrjzYJYwcyDAvJEV0dxQ>
    <xme:BcAUZ1z16yb5AjoF-5tD2O-p65O2g_VJvogMCW1fBbFcNvm5yRkqlTtdg1Xarb3vR
    l7TvUyjtmj7GhyFPw>
X-ME-Received: <xmr:BcAUZ114GIExOXYbVIDwvNizCm5JHccsCh4iLRR3yYfdhlgvKSD_OrFy2i4AwmKj8KoC5Dm_fD7FoRsMTY_ShTuWLFL4wajCtnvEersjy4w5-yzy>
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
X-ME-Proxy: <xmx:BcAUZ8A5LtQFRRWaGf7TZ5_CpsP2StBYPOr5rgMNYSf4t262Okk7qA>
    <xmx:BcAUZxjb1Nje_XrYaRZ0J1dAUV0EMoBZzfVNBW_isegwahgzSz45pg>
    <xmx:BcAUZ4p1f9owIav_0ftVWPBSgGCIOXstIyAfogJLPZ37qTerMrTrUg>
    <xmx:BcAUZ0iZtAWagGaOT4vTzRWQxkIR6heBrP5DLT4yNcJi_sEWyl2uFw>
    <xmx:BcAUZ5zVBS9bmUvMxvv3xqpWa2d67UzpuWdsPe1mnKqs2kAo5um7nDg9>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 20 Oct 2024 04:32:01 -0400 (EDT)
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
Subject: [PATCH v2 1/7] clk: sunxi-ng: h616: Add sigma-delta modulation settings for audio PLL
Date: Sun, 20 Oct 2024 21:30:51 +1300
Message-ID: <20241020083124.174724-2-ryan@testtoast.com>
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

Allwinner has previously released a H616 audio driver which also
provides sigma-delta modulation for the audio PLL clocks. This approach
is used in other Allwinner SoCs, including the H3 and A64.

The manual-provided clock values are:
PLL_AUDIO(hs) = 24 MHz*N/M1
PLL_AUDIO(4X) = 24 MHz*N/M0/M1/P
PLL_AUDIO(2X) = 24 MHz*N/M0/M1/P/2
PLL_AUDIO(1X) = 24 MHz*N/M0/M1/P/4

A fixed post-divider of 2 is used to account for a fixed M0 divider of
2 (taken from the vendor BSP driver).

Using SDM allows correction of the PLL_AUDIO_(4,2,1)X clock fixed
dividers to the datasheet-specified values of 1/2/4 respectively.

Add SDM to the H616 clock control unit driver.

Signed-off-by: Ryan Walklin <ryan@testtoast.com>

---
Changelog v1..v2:
- Add fixed_post_div to high-speed audio clock to correct M0 value to 1 (ie divide by 2) based on manual
- Correct PLL_AUDIO_(4/2/1)X clocks to manual-provided values
- Add/correct inline comments for the above.
- add CCU_FEATURE_FIXED_POSTDIV to pll_audio_hs_clk.common.features
---
 drivers/clk/sunxi-ng/ccu-sun50i-h616.c | 44 ++++++++++++++++----------
 1 file changed, 28 insertions(+), 16 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu-sun50i-h616.c b/drivers/clk/sunxi-ng/ccu-sun50i-h616.c
index 6c7623d4c59ea..42feaaf5a59c6 100644
--- a/drivers/clk/sunxi-ng/ccu-sun50i-h616.c
+++ b/drivers/clk/sunxi-ng/ccu-sun50i-h616.c
@@ -215,20 +215,28 @@ static struct ccu_nkmp pll_de_clk = {
 	},
 };
 
-/*
- * TODO: Determine SDM settings for the audio PLL. The manual suggests
- * PLL_FACTOR_N=16, PLL_POST_DIV_P=2, OUTPUT_DIV=2, pattern=0xe000c49b
- * for 24.576 MHz, and PLL_FACTOR_N=22, PLL_POST_DIV_P=3, OUTPUT_DIV=2,
- * pattern=0xe001288c for 22.5792 MHz.
- * This clashes with our fixed PLL_POST_DIV_P.
+/* 
+ * Sigma-delta modulation settings table obtained from the vendor SDK driver.
+ * There are additional M0 and M1 divider bits not modelled here, so forced to
+ * fixed values in the probe routine.
  */
+static struct ccu_sdm_setting pll_audio_sdm_table[] = {
+	{ .rate = 90316800, .pattern = 0xc001288d, .m = 3, .n = 22 },
+	{ .rate = 98304000, .pattern = 0xc001eb85, .m = 5, .n = 40 },
+};
+
 #define SUN50I_H616_PLL_AUDIO_REG	0x078
 static struct ccu_nm pll_audio_hs_clk = {
 	.enable		= BIT(31),
 	.lock		= BIT(28),
 	.n		= _SUNXI_CCU_MULT_MIN(8, 8, 12),
-	.m		= _SUNXI_CCU_DIV(1, 1), /* input divider */
+	.m		= _SUNXI_CCU_DIV(16, 6),
+	.sdm		= _SUNXI_CCU_SDM(pll_audio_sdm_table,
+					 BIT(24), 0x178, BIT(31)),
+	.fixed_post_div = 2,
 	.common		= {
+		.features	= CCU_FEATURE_FIXED_POSTDIV | 
+				  CCU_FEATURE_SIGMA_DELTA_MOD,
 		.reg		= 0x078,
 		.hw.init	= CLK_HW_INIT("pll-audio-hs", "osc24M",
 					      &ccu_nm_ops,
@@ -701,18 +709,20 @@ static const struct clk_hw *clk_parent_pll_audio[] = {
 };
 
 /*
- * The divider of pll-audio is fixed to 24 for now, so 24576000 and 22579200
- * rates can be set exactly in conjunction with sigma-delta modulation.
+ * The PLL_AUDIO_4X clock defaults to 24.5714 MHz according to the manual, with 
+ * a final divider of 1. The 2X and 1X clocks use 2 and 4 respectively. The 1x 
+ * clock is set to either 24576000 or 22579200 for 48Khz and 44.1Khz (and 
+ * multiples) in conjunction with sigma-delta modulation.
  */
 static CLK_FIXED_FACTOR_HWS(pll_audio_1x_clk, "pll-audio-1x",
 			    clk_parent_pll_audio,
-			    96, 1, CLK_SET_RATE_PARENT);
+			    4, 1, CLK_SET_RATE_PARENT);
 static CLK_FIXED_FACTOR_HWS(pll_audio_2x_clk, "pll-audio-2x",
 			    clk_parent_pll_audio,
-			    48, 1, CLK_SET_RATE_PARENT);
+			    2, 1, CLK_SET_RATE_PARENT);
 static CLK_FIXED_FACTOR_HWS(pll_audio_4x_clk, "pll-audio-4x",
 			    clk_parent_pll_audio,
-			    24, 1, CLK_SET_RATE_PARENT);
+			    1, 1, CLK_SET_RATE_PARENT);
 
 static const struct clk_hw *pll_periph0_parents[] = {
 	&pll_periph0_clk.common.hw
@@ -1162,12 +1172,14 @@ static int sun50i_h616_ccu_probe(struct platform_device *pdev)
 	}
 
 	/*
-	 * Force the post-divider of pll-audio to 12 and the output divider
-	 * of it to 2, so 24576000 and 22579200 rates can be set exactly.
+	 * Set the output-divider for the pll-audio clocks (M0) to 2 and the
+	 * input divider (M1) to 1 as recommended by the manual when using 
+	 * SDM. 
 	 */
 	val = readl(reg + SUN50I_H616_PLL_AUDIO_REG);
-	val &= ~(GENMASK(21, 16) | BIT(0));
-	writel(val | (11 << 16) | BIT(0), reg + SUN50I_H616_PLL_AUDIO_REG);
+	val &= ~BIT(1);
+	val |= BIT(0);
+	writel(val, reg + SUN50I_H616_PLL_AUDIO_REG);
 
 	/*
 	 * First clock parent (osc32K) is unusable for CEC. But since there
-- 
2.47.0

