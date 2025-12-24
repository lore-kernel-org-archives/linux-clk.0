Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 065C726FDBF;
	Wed, 24 Dec 2025 07:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766561433; cv=none; b=op0t9vE6Nhq3pJh/Qb5lRnuQIU6BL5kBKBsjUxSj+QBUtG5rDXWWe0RFrz+fOLxUwpIGxa2ueRLIpYSf2IpdaQ9+JsF6VFZjqJQNfGAwcNzCKlpQNNNQFtFkh5zO0ITKDT0UUiG7Y3j7ZF1U3GRMcMzsD7utH5UL42Qb4wHD1HA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766561433; c=relaxed/simple;
	bh=eYu8Nq+w5A2A6v7D8iAIPR9NzDkFmS/GlSo/NzWVz0Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cnJGQ/ylssOSDjZBQulfz0IutHv/NnMYKoMsfO3wijNNGAOzFhcQxn66bmuwtOIEdnjMfs4UVq8acGGZavy7v6XLWJYwTkwKzJ2qEJW5U/8dWqafHFCBbYfn7sOhYCdLRRxaxv+YAb7xwyZgIMf4SaNXE8cRJExDg6mAKCrKWvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=o0StNlF6; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="o0StNlF6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1766561429;
	bh=eYu8Nq+w5A2A6v7D8iAIPR9NzDkFmS/GlSo/NzWVz0Q=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=o0StNlF6AT/Im/wgG6NhEi2JBngssBhzjkCacTC0TOmAuU/4x3vg88cz2kXd8yDBl
	 fbyBBdPBljnfHOoh5OQwn+y9d7eiZRkaioh5PaV5EERmrQ+WZrVm8kbe3SPzc1EJMB
	 trMS5oowhPYhp76N/W6fa0/Di0leSPniy1TwwrGKWA37t0zMaGQqqTLdwI1OCvk9Nc
	 eiYkd9gyPpyHeJGNHeUdnETBzSy/HF33DIYt6jF+Y+myz7h3Dyg+fOmgALIGkHuifE
	 p0RMBe7Qm5PYJ5ifqmg06d3ZH0n8/i76LbOq4Y++Ic7OQ3mEo7f/jstszLPoqJBLDj
	 wJzwVpgBhU8zQ==
Received: from beast.luon.net (simons.connected.by.freedominter.net [45.83.240.172])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sjoerd)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 23D0717E10F8;
	Wed, 24 Dec 2025 08:30:29 +0100 (CET)
Received: by beast.luon.net (Postfix, from userid 1000)
	id CBF5D11A3A2DB; Wed, 24 Dec 2025 08:30:28 +0100 (CET)
From: Sjoerd Simons <sjoerd@collabora.com>
Date: Wed, 24 Dec 2025 08:30:13 +0100
Subject: [PATCH 4/4] clk: mediatek: Declare MT7988 infra muxes as no-gate
 muxes
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251224-mtk-not-a-gate-v1-4-d4667e3b7856@collabora.com>
References: <20251224-mtk-not-a-gate-v1-0-d4667e3b7856@collabora.com>
In-Reply-To: <20251224-mtk-not-a-gate-v1-0-d4667e3b7856@collabora.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jianhui Zhao <zhaojh329@gmail.com>, Daniel Golle <daniel@makrotopia.org>, 
 Sam Shih <sam.shih@mediatek.com>, Ryder Lee <ryder.lee@kernel.org>
Cc: kernel@collabora.com, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Sjoerd Simons <sjoerd@collabora.com>
X-Mailer: b4 0.14.3

A MUX_GATE without a gate, is really just a MUX. Adjust the mux
declarations to match that. This fixes out-of-bounds shifts due to no
longer trying to enable/disable the gate with a shift of (u8)-1.

Fixes: 4b4719437d85 ("clk: mediatek: add drivers for MT7988 SoC")
Signed-off-by: Sjoerd Simons <sjoerd@collabora.com>
---
 drivers/clk/mediatek/clk-mt7988-infracfg.c | 88 ++++++++++++++++--------------
 1 file changed, 46 insertions(+), 42 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt7988-infracfg.c b/drivers/clk/mediatek/clk-mt7988-infracfg.c
index ef8267319d91..69e86fc29d73 100644
--- a/drivers/clk/mediatek/clk-mt7988-infracfg.c
+++ b/drivers/clk/mediatek/clk-mt7988-infracfg.c
@@ -56,49 +56,53 @@ static const char *const infra_pcie_gfmux_tl_ck_o_p3_parents[] __initconst = {
 
 static const struct mtk_mux infra_muxes[] = {
 	/* MODULE_CLK_SEL_0 */
-	MUX_GATE_CLR_SET_UPD(CLK_INFRA_MUX_UART0_SEL, "infra_mux_uart0_sel",
-			     infra_mux_uart0_parents, 0x0018, 0x0010, 0x0014, 0, 1, -1, -1, -1),
-	MUX_GATE_CLR_SET_UPD(CLK_INFRA_MUX_UART1_SEL, "infra_mux_uart1_sel",
-			     infra_mux_uart1_parents, 0x0018, 0x0010, 0x0014, 1, 1, -1, -1, -1),
-	MUX_GATE_CLR_SET_UPD(CLK_INFRA_MUX_UART2_SEL, "infra_mux_uart2_sel",
-			     infra_mux_uart2_parents, 0x0018, 0x0010, 0x0014, 2, 1, -1, -1, -1),
-	MUX_GATE_CLR_SET_UPD(CLK_INFRA_MUX_SPI0_SEL, "infra_mux_spi0_sel", infra_mux_spi0_parents,
-			     0x0018, 0x0010, 0x0014, 4, 1, -1, -1, -1),
-	MUX_GATE_CLR_SET_UPD(CLK_INFRA_MUX_SPI1_SEL, "infra_mux_spi1_sel", infra_mux_spi1_parents,
-			     0x0018, 0x0010, 0x0014, 5, 1, -1, -1, -1),
-	MUX_GATE_CLR_SET_UPD(CLK_INFRA_MUX_SPI2_SEL, "infra_mux_spi2_sel", infra_mux_spi0_parents,
-			     0x0018, 0x0010, 0x0014, 6, 1, -1, -1, -1),
-	MUX_GATE_CLR_SET_UPD(CLK_INFRA_PWM_SEL, "infra_pwm_sel", infra_pwm_bck_parents, 0x0018,
-			     0x0010, 0x0014, 14, 2, -1, -1, -1),
-	MUX_GATE_CLR_SET_UPD(CLK_INFRA_PWM_CK1_SEL, "infra_pwm_ck1_sel", infra_pwm_bck_parents,
-			     0x0018, 0x0010, 0x0014, 16, 2, -1, -1, -1),
-	MUX_GATE_CLR_SET_UPD(CLK_INFRA_PWM_CK2_SEL, "infra_pwm_ck2_sel", infra_pwm_bck_parents,
-			     0x0018, 0x0010, 0x0014, 18, 2, -1, -1, -1),
-	MUX_GATE_CLR_SET_UPD(CLK_INFRA_PWM_CK3_SEL, "infra_pwm_ck3_sel", infra_pwm_bck_parents,
-			     0x0018, 0x0010, 0x0014, 20, 2, -1, -1, -1),
-	MUX_GATE_CLR_SET_UPD(CLK_INFRA_PWM_CK4_SEL, "infra_pwm_ck4_sel", infra_pwm_bck_parents,
-			     0x0018, 0x0010, 0x0014, 22, 2, -1, -1, -1),
-	MUX_GATE_CLR_SET_UPD(CLK_INFRA_PWM_CK5_SEL, "infra_pwm_ck5_sel", infra_pwm_bck_parents,
-			     0x0018, 0x0010, 0x0014, 24, 2, -1, -1, -1),
-	MUX_GATE_CLR_SET_UPD(CLK_INFRA_PWM_CK6_SEL, "infra_pwm_ck6_sel", infra_pwm_bck_parents,
-			     0x0018, 0x0010, 0x0014, 26, 2, -1, -1, -1),
-	MUX_GATE_CLR_SET_UPD(CLK_INFRA_PWM_CK7_SEL, "infra_pwm_ck7_sel", infra_pwm_bck_parents,
-			     0x0018, 0x0010, 0x0014, 28, 2, -1, -1, -1),
-	MUX_GATE_CLR_SET_UPD(CLK_INFRA_PWM_CK8_SEL, "infra_pwm_ck8_sel", infra_pwm_bck_parents,
-			     0x0018, 0x0010, 0x0014, 30, 2, -1, -1, -1),
+	MUX_CLR_SET(CLK_INFRA_MUX_UART0_SEL, "infra_mux_uart0_sel",
+		    infra_mux_uart0_parents, 0x0018, 0x0010, 0x0014, 0, 1),
+	MUX_CLR_SET(CLK_INFRA_MUX_UART1_SEL, "infra_mux_uart1_sel",
+		    infra_mux_uart1_parents, 0x0018, 0x0010, 0x0014, 1, 1),
+	MUX_CLR_SET(CLK_INFRA_MUX_UART2_SEL, "infra_mux_uart2_sel",
+		    infra_mux_uart2_parents, 0x0018, 0x0010, 0x0014, 2, 1),
+	MUX_CLR_SET(CLK_INFRA_MUX_SPI0_SEL, "infra_mux_spi0_sel",
+		    infra_mux_spi0_parents, 0x0018, 0x0010, 0x0014, 4, 1),
+	MUX_CLR_SET(CLK_INFRA_MUX_SPI1_SEL, "infra_mux_spi1_sel",
+		    infra_mux_spi1_parents, 0x0018, 0x0010, 0x0014, 5, 1),
+	MUX_CLR_SET(CLK_INFRA_MUX_SPI2_SEL, "infra_mux_spi2_sel",
+		    infra_mux_spi0_parents, 0x0018, 0x0010, 0x0014, 6, 1),
+	MUX_CLR_SET(CLK_INFRA_PWM_SEL, "infra_pwm_sel",
+		    infra_pwm_bck_parents, 0x0018, 0x0010, 0x0014, 14, 2),
+	MUX_CLR_SET(CLK_INFRA_PWM_CK1_SEL, "infra_pwm_ck1_sel",
+		    infra_pwm_bck_parents, 0x0018, 0x0010, 0x0014, 16, 2),
+	MUX_CLR_SET(CLK_INFRA_PWM_CK2_SEL, "infra_pwm_ck2_sel",
+		    infra_pwm_bck_parents, 0x0018, 0x0010, 0x0014, 18, 2),
+	MUX_CLR_SET(CLK_INFRA_PWM_CK3_SEL, "infra_pwm_ck3_sel",
+		    infra_pwm_bck_parents, 0x0018, 0x0010, 0x0014, 20, 2),
+	MUX_CLR_SET(CLK_INFRA_PWM_CK4_SEL, "infra_pwm_ck4_sel",
+		    infra_pwm_bck_parents, 0x0018, 0x0010, 0x0014, 22, 2),
+	MUX_CLR_SET(CLK_INFRA_PWM_CK5_SEL, "infra_pwm_ck5_sel",
+		    infra_pwm_bck_parents, 0x0018, 0x0010, 0x0014, 24, 2),
+	MUX_CLR_SET(CLK_INFRA_PWM_CK6_SEL, "infra_pwm_ck6_sel",
+		    infra_pwm_bck_parents, 0x0018, 0x0010, 0x0014, 26, 2),
+	MUX_CLR_SET(CLK_INFRA_PWM_CK7_SEL, "infra_pwm_ck7_sel",
+		    infra_pwm_bck_parents, 0x0018, 0x0010, 0x0014, 28, 2),
+	MUX_CLR_SET(CLK_INFRA_PWM_CK8_SEL, "infra_pwm_ck8_sel",
+		    infra_pwm_bck_parents, 0x0018, 0x0010, 0x0014, 30, 2),
 	/* MODULE_CLK_SEL_1 */
-	MUX_GATE_CLR_SET_UPD(CLK_INFRA_PCIE_GFMUX_TL_O_P0_SEL, "infra_pcie_gfmux_tl_o_p0_sel",
-			     infra_pcie_gfmux_tl_ck_o_p0_parents, 0x0028, 0x0020, 0x0024, 0, 2, -1,
-			     -1, -1),
-	MUX_GATE_CLR_SET_UPD(CLK_INFRA_PCIE_GFMUX_TL_O_P1_SEL, "infra_pcie_gfmux_tl_o_p1_sel",
-			     infra_pcie_gfmux_tl_ck_o_p1_parents, 0x0028, 0x0020, 0x0024, 2, 2, -1,
-			     -1, -1),
-	MUX_GATE_CLR_SET_UPD(CLK_INFRA_PCIE_GFMUX_TL_O_P2_SEL, "infra_pcie_gfmux_tl_o_p2_sel",
-			     infra_pcie_gfmux_tl_ck_o_p2_parents, 0x0028, 0x0020, 0x0024, 4, 2, -1,
-			     -1, -1),
-	MUX_GATE_CLR_SET_UPD(CLK_INFRA_PCIE_GFMUX_TL_O_P3_SEL, "infra_pcie_gfmux_tl_o_p3_sel",
-			     infra_pcie_gfmux_tl_ck_o_p3_parents, 0x0028, 0x0020, 0x0024, 6, 2, -1,
-			     -1, -1),
+	MUX_CLR_SET(CLK_INFRA_PCIE_GFMUX_TL_O_P0_SEL,
+		    "infra_pcie_gfmux_tl_o_p0_sel",
+		    infra_pcie_gfmux_tl_ck_o_p0_parents,
+		    0x0028, 0x0020, 0x0024, 0, 2),
+	MUX_CLR_SET(CLK_INFRA_PCIE_GFMUX_TL_O_P1_SEL,
+		    "infra_pcie_gfmux_tl_o_p1_sel",
+		    infra_pcie_gfmux_tl_ck_o_p1_parents,
+		    0x0028, 0x0020, 0x0024, 2, 2),
+	MUX_CLR_SET(CLK_INFRA_PCIE_GFMUX_TL_O_P2_SEL,
+		    "infra_pcie_gfmux_tl_o_p2_sel",
+		    infra_pcie_gfmux_tl_ck_o_p2_parents,
+		    0x0028, 0x0020, 0x0024, 4, 2),
+	MUX_CLR_SET(CLK_INFRA_PCIE_GFMUX_TL_O_P3_SEL,
+		    "infra_pcie_gfmux_tl_o_p3_sel",
+		    infra_pcie_gfmux_tl_ck_o_p3_parents,
+		    0x0028, 0x0020, 0x0024, 6, 2),
 };
 
 static const struct mtk_gate_regs infra0_cg_regs = {

-- 
2.51.0

