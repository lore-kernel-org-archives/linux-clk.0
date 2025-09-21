Received: from pidgin.makrotopia.org (pidgin.makrotopia.org [185.142.180.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED3FC2566DF;
	Sun, 21 Sep 2025 17:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.142.180.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758477533; cv=none; b=bEJh6RdGD/OcSmEhMsubin6WwiqEQhw6ZeGD5Tfn3ykXiotDtAeRaePa5+NQjT553EhhGpHb21UtuGLlXKG0zil/DW4JwrCH901SQmrTC99GabFFVsMl+eh/gFhpfLbnbFypX/QM+1XAw8GXCogvW6fV2gfKelghGl85f7mXCC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758477533; c=relaxed/simple;
	bh=vbO9pZpd1mosZXsJ+ToALwJNXEC1lzmacW36CP3HY4w=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=vC6HPdUZu2qnAGVueKn/ILiDEVLTMETayUbRDr1DQJab+QKsMjN3sWm/HZ87Fq7Ixe37DMn7tRBBXkeDBUSDPoGsAKGtFkgEUJVbZ/BMwtWoOErFvHSM0fUO5uHrEEAjhGU9mnI4PLBL7SgRGst2RlF2ElWvOkTaQBjx64csFYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org; spf=pass smtp.mailfrom=makrotopia.org; arc=none smtp.client-ip=185.142.180.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=makrotopia.org
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.98.2)
	(envelope-from <daniel@makrotopia.org>)
	id 1v0OKa-000000004Nn-0Rcb;
	Sun, 21 Sep 2025 17:58:36 +0000
Date: Sun, 21 Sep 2025 18:58:29 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Sam Shih <sam.shih@mediatek.com>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH RESEND] clk: mediatek: mt7988-infracfg: SPI0 clocks are not
 critical
Message-ID: <49fb368b4da6f5ed11812dceb45f174ceca8f10a.1758477397.git.daniel@makrotopia.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

SPI0 clocks have wrongly been marked as critical while, probably due
to the SPI driver not requesting them. This can (and should) be addressed
in device tree instead.
Remove CLK_IS_CRITICAL flag from clocks related to SPI0.

Fixes: 4b4719437d85 ("clk: mediatek: add drivers for MT7988 SoC")
Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
Patch originally sent 2024-10-31 but never received any feedback.

 drivers/clk/mediatek/clk-mt7988-infracfg.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt7988-infracfg.c b/drivers/clk/mediatek/clk-mt7988-infracfg.c
index ef8267319d91..c40e18c27f12 100644
--- a/drivers/clk/mediatek/clk-mt7988-infracfg.c
+++ b/drivers/clk/mediatek/clk-mt7988-infracfg.c
@@ -196,12 +196,10 @@ static const struct mtk_gate infra_clks[] = {
 	GATE_INFRA2(CLK_INFRA_SPINFI, "infra_f_fspinfi", "spinfi_sel", 10),
 	GATE_INFRA2_FLAGS(CLK_INFRA_66M_NFI_HCK, "infra_hf_66m_nfi_hck", "sysaxi_sel", 11,
 			  CLK_IS_CRITICAL),
-	GATE_INFRA2_FLAGS(CLK_INFRA_104M_SPI0, "infra_hf_104m_spi0", "infra_mux_spi0_sel", 12,
-			  CLK_IS_CRITICAL),
+	GATE_INFRA2(CLK_INFRA_104M_SPI0, "infra_hf_104m_spi0", "infra_mux_spi0_sel", 12),
 	GATE_INFRA2(CLK_INFRA_104M_SPI1, "infra_hf_104m_spi1", "infra_mux_spi1_sel", 13),
 	GATE_INFRA2(CLK_INFRA_104M_SPI2_BCK, "infra_hf_104m_spi2_bck", "infra_mux_spi2_sel", 14),
-	GATE_INFRA2_FLAGS(CLK_INFRA_66M_SPI0_HCK, "infra_hf_66m_spi0_hck", "sysaxi_sel", 15,
-			  CLK_IS_CRITICAL),
+	GATE_INFRA2(CLK_INFRA_66M_SPI0_HCK, "infra_hf_66m_spi0_hck", "sysaxi_sel", 15),
 	GATE_INFRA2(CLK_INFRA_66M_SPI1_HCK, "infra_hf_66m_spi1_hck", "sysaxi_sel", 16),
 	GATE_INFRA2(CLK_INFRA_66M_SPI2_HCK, "infra_hf_66m_spi2_hck", "sysaxi_sel", 17),
 	GATE_INFRA2(CLK_INFRA_66M_FLASHIF_AXI, "infra_hf_66m_flashif_axi", "sysaxi_sel", 18),
-- 
2.51.0

