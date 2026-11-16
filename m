Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794818709;
	b=nHgNd1HDKxX6kqgC89MFLD9QXgG4b2Nt+uQeY5QbBmhajT3N6UVg44xAWPGCuH8e/xGO
	 429pYFRFbxh5DazKZKAs6vBl3SE/CFFIqEgTnsar43povp5k9By2fVKGIub7OrOBr6uHw
	 D+9/I8ygsohL8Ewm15oCaVTmPhHO3mbZqWggrNHdrdgNHkGfz6dbQiCtW4kG64F1C3/Kd
	 gmCNuzzyA2ShzKGb57WnB0C4hTdhK4MBeG9CG2ULGb9Ke6TgIo4oa4GsJuUKJH73o71eC
	 drxKC6ak1khDqoezMcG/oo1uHnBZj/bgqg+6mLuOBzSOp+lCFzz8xm8vSCnsUk3TffA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794818709;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=Z4qmgXwM2I+am+EKwmSmoiLxNulMJ5aJrfNpjBxX2QM=;
	b=oSWDOJA7GL+YPFdHsrACaWrggjXFhgEaqBo/4dvdicBOvXSsLq+GT/v2+k2+2yVenKnG
	 EfkhPIyu2C2EbcG0XDmpE8aWiEska5sRGfsbhyjMfy4AjRji/AjLKxXv6xymJesqZvna3
	 2iK6xaYOy2vqwqCRJrScSw3gvZlGEYUfk2yJAf+yYnNEgpJmVED4yJjKEWzSPt6lBpqe1
	 XdB3Ahk4fxElB72tqQC86dL7BBXqZaIj2emy4OUvus0bpXcrDMxfrJjHJCrIDfHUeILmt
	 Y0io2brGrAkREY4lqak2fhEFdVC1wRPSPVtvbx3z1jwECI7pI0CR925rZV4A/fiW8kg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TyKTOqIy;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E725606A332;
	Mon, 16 Nov 2026 08:45:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TyKTOqIy
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794818709;
	b=D+D+St9UKRC0rB/ZIg3lEl1+BpFUf8TnhF+Ej3tE15hSm1UqyRuEv3P6DwYZqvRjWIA8
	 65jEvaz1PKCL5NSjRNn2spwcIjQXe2wKO5ZyNrHQMdJJcO4gUl6BWR3fePLHz1lhEMLZo
	 XYnYom+i78Jbtp6XKa9Nk2xeAdxwY614Yh9gY+Mowczl7TlS26sVjeMDf+bDh+VJhoLPY
	 CcxEsp2S/sBiS8yJXVdoLFU33Zp5HvwWvJ4vBwCnWJveKcHJ5ut+nH98kj+Mv7jjXYj6p
	 0TwcY62HI95LBWYXmOFCytW9mB2xwkmcV3K/z4WOfkZbz30cI+NO2Gm1DvSC0aTvFqQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794818709;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=Z4qmgXwM2I+am+EKwmSmoiLxNulMJ5aJrfNpjBxX2QM=;
	b=k1cbD5TCviaeLzLs6vx0rOoBal7Td5p3DT0o9alKBMIGKs74SlYjGt9aOTB8iBlWCU3W
	 iRRBdJ7p2bCakqgD6k+oyMxeGc54d8vQdduUJf3cgYF/W46tP15smSV7UeNyZx4CVbEJ6
	 fZ2ARpozJbe2w/xE1AuVOGU1H56TNBa6GmY1ir7W4cpxPuPapmPOJC/f/ENT6B81tPAL/
	 AtFf67sqNMRCCGxu889JaQDzTghQjMu/CALzEx7o0wsLCRGUuvdmKfRuZlK7t3aCDeJvn
	 tmFqEffpE+0+UU/yXIlWCMtZMjEMEwRgJIrfeu6ToFYdJA13jBtHcnxiTfFVla0UhgA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 06C671F000C4;
	Mon, 16 Nov 2026 08:45:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794818709;
	bh=Z4qmgXwM2I+am+EKwmSmoiLxNulMJ5aJrfNpjBxX2QM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=TyKTOqIylekrsjRO3i6r75Muw0/Qohjr/Ij/v33WpTiTdh1/V2PnER/pL9XmTJRuj
	 MGFxowdNGWCg4irxUfjbEd01ag8T3xPBEoHaIshuh6+ivfO1YCcSkZ1E3layFU4H25
	 YpUKDPjezrfDI9L8/iOCuhEMAoSSwSrQOAc2iVnK8IVQLhCOFOVP2uokGyprsMkPr2
	 ID+1PfYI/3OJM68Yl+tnSnY9SWtROaZxhQNp2V44SJMpPpIXOI2i41idWZw9Cv/xzM
	 0IT/iKXyqASr+X6ARSzauZduV0VtxUmSeN2SscDSpA930+PsXhYpcasnhywQU56PEB
	 Yd1d1Uhg9unkQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 741D84A3D1;
	Mon, 16 Nov 2026 08:45:07 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Mon, 16 Nov 2026 08:45:07 +0000
Subject: [PATCH v2 1/2] clk: sunxi-ng: h616: Gate the PLLs with their
 output enable bit
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261116-h616-pll-output-gate-v2-1-a418026ffae6@gmail.com>
References: <20261116-h616-pll-output-gate-v2-0-a418026ffae6@gmail.com>
In-Reply-To: <20261116-h616-pll-output-gate-v2-0-a418026ffae6@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: Andre Przywara <andre.przywara@arm.com>, 
 Maxime Ripard <mripard@kernel.org>, 
 Philippe Simons <simons.philippe@gmail.com>, 
 Ilya Titov <ilya.titov@wirenboard.com>, linux-clk@vger.kernel.org, 
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Arun Iyengar <aiyengar1990@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794818707; l=4955;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=8jODp0ifglQsXJHJh7FAOxppXVcA5WOgGJP8Gd4G8UQ=;
 b=lcVILKaaUIqNwmfPoDq7OsVPyU9PQI7Va8OL8g2mnN5zlfOtrwpotn90YOF1jCKJOVHhuRWM/
 oHmTpOlEoxABhhLOnTwnJ3zjebpso2ewYjnN8rF+mPt2w2mOgYgKyCH
X-Developer-Key: i=aiyengar1990@gmail.com; a=ed25519;
 pk=zXpRgUTrhaFe6jLyPqbBy3ccfkj04w0g2690Wv3mg+0=
X-Endpoint-Received: by B4 Relay for aiyengar1990@gmail.com/20261110 with
 auth_id=1480
X-Original-From: Arun Iyengar <aiyengar1990@gmail.com>
Reply-To: aiyengar1990@gmail.com
Content-Transfer-Encoding: 7bit

From: Arun Iyengar <aiyengar1990@gmail.com>

Gate the H616 PLLs with the output enable bit (27) instead of the enable
bit (31), which powers the PLL down, as the manual (3.3.3.6) recommends
and the A100, D1 and A523 drivers do. Power them up once at probe.

On an Orange Pi Zero2, powering pll-video0 down at 453 MHz crashes the
CPU doing the write.

Fixes: 88dde5e23da1 ("clk: sunxi-ng: Add support for the Allwinner H616 CCU")
Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 drivers/clk/sunxi-ng/ccu-sun50i-h616.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu-sun50i-h616.c b/drivers/clk/sunxi-ng/ccu-sun50i-h616.c
index c5e5b3f78846..4037c5f022a8 100644
--- a/drivers/clk/sunxi-ng/ccu-sun50i-h616.c
+++ b/drivers/clk/sunxi-ng/ccu-sun50i-h616.c
@@ -36,7 +36,7 @@
  */
 #define SUN50I_H616_PLL_CPUX_REG	0x000
 static struct ccu_mult pll_cpux_clk = {
-	.enable		= BIT(31),
+	.enable		= BIT(27),
 	.lock		= BIT(28),
 	.mult		= _SUNXI_CCU_MULT_MIN(8, 8, 12),
 	.common		= {
@@ -50,7 +50,7 @@ static struct ccu_mult pll_cpux_clk = {
 /* Some PLLs are input * N / div1 / P. Model them as NKMP with no K */
 #define SUN50I_H616_PLL_DDR0_REG	0x010
 static struct ccu_nkmp pll_ddr0_clk = {
-	.enable		= BIT(31),
+	.enable		= BIT(27),
 	.lock		= BIT(28),
 	.n		= _SUNXI_CCU_MULT_MIN(8, 8, 12),
 	.m		= _SUNXI_CCU_DIV(1, 1), /* input divider */
@@ -65,7 +65,7 @@ static struct ccu_nkmp pll_ddr0_clk = {
 
 #define SUN50I_H616_PLL_DDR1_REG	0x018
 static struct ccu_nkmp pll_ddr1_clk = {
-	.enable		= BIT(31),
+	.enable		= BIT(27),
 	.lock		= BIT(28),
 	.n		= _SUNXI_CCU_MULT_MIN(8, 8, 12),
 	.m		= _SUNXI_CCU_DIV(1, 1), /* input divider */
@@ -80,7 +80,7 @@ static struct ccu_nkmp pll_ddr1_clk = {
 
 #define SUN50I_H616_PLL_PERIPH0_REG	0x020
 static struct ccu_nkmp pll_periph0_clk = {
-	.enable		= BIT(31),
+	.enable		= BIT(27),
 	.lock		= BIT(28),
 	.n		= _SUNXI_CCU_MULT_MIN(8, 8, 12),
 	.m		= _SUNXI_CCU_DIV(1, 1), /* input divider */
@@ -97,7 +97,7 @@ static struct ccu_nkmp pll_periph0_clk = {
 
 #define SUN50I_H616_PLL_PERIPH1_REG	0x028
 static struct ccu_nkmp pll_periph1_clk = {
-	.enable		= BIT(31),
+	.enable		= BIT(27),
 	.lock		= BIT(28),
 	.n		= _SUNXI_CCU_MULT_MIN(8, 8, 12),
 	.m		= _SUNXI_CCU_DIV(1, 1), /* input divider */
@@ -114,7 +114,7 @@ static struct ccu_nkmp pll_periph1_clk = {
 
 #define SUN50I_H616_PLL_GPU_REG		0x030
 static struct ccu_nkmp pll_gpu_clk = {
-	.enable		= BIT(31),
+	.enable		= BIT(27),
 	.lock		= BIT(28),
 	.n		= _SUNXI_CCU_MULT_MIN(8, 8, 12),
 	.m		= _SUNXI_CCU_DIV(1, 1), /* input divider */
@@ -133,7 +133,7 @@ static struct ccu_nkmp pll_gpu_clk = {
  */
 #define SUN50I_H616_PLL_VIDEO0_REG	0x040
 static struct ccu_nm pll_video0_clk = {
-	.enable		= BIT(31),
+	.enable		= BIT(27),
 	.lock		= BIT(28),
 	.n		= _SUNXI_CCU_MULT_MIN(8, 8, 12),
 	.m		= _SUNXI_CCU_DIV(1, 1), /* input divider */
@@ -151,7 +151,7 @@ static struct ccu_nm pll_video0_clk = {
 
 #define SUN50I_H616_PLL_VIDEO1_REG	0x048
 static struct ccu_nm pll_video1_clk = {
-	.enable		= BIT(31),
+	.enable		= BIT(27),
 	.lock		= BIT(28),
 	.n		= _SUNXI_CCU_MULT_MIN(8, 8, 12),
 	.m		= _SUNXI_CCU_DIV(1, 1), /* input divider */
@@ -169,7 +169,7 @@ static struct ccu_nm pll_video1_clk = {
 
 #define SUN50I_H616_PLL_VIDEO2_REG	0x050
 static struct ccu_nm pll_video2_clk = {
-	.enable		= BIT(31),
+	.enable		= BIT(27),
 	.lock		= BIT(28),
 	.n		= _SUNXI_CCU_MULT_MIN(8, 8, 12),
 	.m		= _SUNXI_CCU_DIV(1, 1), /* input divider */
@@ -187,7 +187,7 @@ static struct ccu_nm pll_video2_clk = {
 
 #define SUN50I_H616_PLL_VE_REG		0x058
 static struct ccu_nkmp pll_ve_clk = {
-	.enable		= BIT(31),
+	.enable		= BIT(27),
 	.lock		= BIT(28),
 	.n		= _SUNXI_CCU_MULT_MIN(8, 8, 12),
 	.m		= _SUNXI_CCU_DIV(1, 1), /* input divider */
@@ -202,7 +202,7 @@ static struct ccu_nkmp pll_ve_clk = {
 
 #define SUN50I_H616_PLL_DE_REG		0x060
 static struct ccu_nkmp pll_de_clk = {
-	.enable		= BIT(31),
+	.enable		= BIT(27),
 	.lock		= BIT(28),
 	.n		= _SUNXI_CCU_MULT_MIN(8, 8, 12),
 	.m		= _SUNXI_CCU_DIV(1, 1), /* input divider */
@@ -229,7 +229,7 @@ static struct ccu_sdm_setting pll_audio_sdm_table[] = {
 
 #define SUN50I_H616_PLL_AUDIO_REG	0x078
 static struct ccu_nm pll_audio_hs_clk = {
-	.enable		= BIT(31),
+	.enable		= BIT(27),
 	.lock		= BIT(28),
 	.n		= _SUNXI_CCU_MULT_MIN(8, 8, 12),
 	.m		= _SUNXI_CCU_DIV(16, 6),
@@ -1183,10 +1183,10 @@ static int sun50i_h616_ccu_probe(struct platform_device *pdev)
 	if (IS_ERR(reg))
 		return PTR_ERR(reg);
 
-	/* Enable the lock bits and the output enable bits on all PLLs */
+	/* Power up and lock-enable all PLLs; bit 27 gates them (3.3.3.6) */
 	for (i = 0; i < ARRAY_SIZE(pll_regs); i++) {
 		val = readl(reg + pll_regs[i]);
-		val |= BIT(29) | BIT(27);
+		val |= BIT(31) | BIT(29);
 		writel(val, reg + pll_regs[i]);
 	}
 

-- 
2.55.0


