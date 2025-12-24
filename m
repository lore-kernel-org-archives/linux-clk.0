Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 729E1299AAA;
	Wed, 24 Dec 2025 07:30:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766561433; cv=none; b=ptDA6CpnNI1rXGoL3edQRShApZJ01ZswvBNBoaeg24F58zAk8cRtrT4dpLrvbR+JstsUJuecML7KEaVjCECMszuxntrEN90jXb17oz1wl/rN0bRCw69gKbv852MwnbYdMMOEh9+ZbSACVUWBK2RGg+yzx69UvNQvYWuEPgH3Vqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766561433; c=relaxed/simple;
	bh=kOjJJ3yhYsXVNfnfRW4c9WXxuQnl+ptCy0MnkCOqvw8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=T+5P53O7ky2PkaxiHsFZ6KohdXs5R13VKdJt1QoD+BRWgohllulJYeC/UFonYqUPzySLNJ3vZ3ICwtZFMfAkpxZVFm47Tu0z6qGaevE6H4f5CVB9lfHqRHaG46+jHA+cOFiNOGcMHC+tkkGTNY13TLzh8SzTuZwzKxEX4pqHX20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=OtEqJXyi; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="OtEqJXyi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1766561429;
	bh=kOjJJ3yhYsXVNfnfRW4c9WXxuQnl+ptCy0MnkCOqvw8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=OtEqJXyihwbhZtT2hdF3kuFl4oK1w9+7P6VFISJThaYG0DYBroTbL7VqMivpIMKLV
	 GSTg60F/Suvo2HkQb+QNaNUgEd8J1HArE83QRUbm0NEbyuNzagiaYBt+nOhfxzxa5w
	 jJVOdSHfmXTukZ2LQLQYSAvHNtlasDrRJH8jNWJZ9xmnBatNCP/9vbg225cWp0QRAJ
	 S7xqNoNn9BvahWMHJ7G+LMYghTDj9u+3y4PO+NVZuSBba20MvVgusvTKU2C1IdT+rt
	 qM3tDzGD4Zh76o8MxMLYFNk58zfLCcpF1G3+IcKPy0elHAZcCGLITkgiiv8+LTJU7V
	 A6AWXwnbAItvA==
Received: from beast.luon.net (simons.connected.by.freedominter.net [45.83.240.172])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sjoerd)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3C09F17E1345;
	Wed, 24 Dec 2025 08:30:29 +0100 (CET)
Received: by beast.luon.net (Postfix, from userid 1000)
	id C661411A3A2D9; Wed, 24 Dec 2025 08:30:28 +0100 (CET)
From: Sjoerd Simons <sjoerd@collabora.com>
Date: Wed, 24 Dec 2025 08:30:12 +0100
Subject: [PATCH 3/4] clk: mediatek: Declare MT7986 infra muxes as no-gate
 muxes
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251224-mtk-not-a-gate-v1-3-d4667e3b7856@collabora.com>
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

Fixes: ec97d23c8e22 ("clk: mediatek: add mt7986 clock support")
Signed-off-by: Sjoerd Simons <sjoerd@collabora.com>
---
 drivers/clk/mediatek/clk-mt7986-infracfg.c | 45 ++++++++++++------------------
 1 file changed, 18 insertions(+), 27 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt7986-infracfg.c b/drivers/clk/mediatek/clk-mt7986-infracfg.c
index 732c65e616de..458b26ff2efc 100644
--- a/drivers/clk/mediatek/clk-mt7986-infracfg.c
+++ b/drivers/clk/mediatek/clk-mt7986-infracfg.c
@@ -37,34 +37,25 @@ static const char *const infra_pcie_parents[] __initconst = {
 
 static const struct mtk_mux infra_muxes[] = {
 	/* MODULE_CLK_SEL_0 */
-	MUX_GATE_CLR_SET_UPD(CLK_INFRA_UART0_SEL, "infra_uart0_sel",
-			     infra_uart_parent, 0x0018, 0x0010, 0x0014, 0, 1,
-			     -1, -1, -1),
-	MUX_GATE_CLR_SET_UPD(CLK_INFRA_UART1_SEL, "infra_uart1_sel",
-			     infra_uart_parent, 0x0018, 0x0010, 0x0014, 1, 1,
-			     -1, -1, -1),
-	MUX_GATE_CLR_SET_UPD(CLK_INFRA_UART2_SEL, "infra_uart2_sel",
-			     infra_uart_parent, 0x0018, 0x0010, 0x0014, 2, 1,
-			     -1, -1, -1),
-	MUX_GATE_CLR_SET_UPD(CLK_INFRA_SPI0_SEL, "infra_spi0_sel",
-			     infra_spi_parents, 0x0018, 0x0010, 0x0014, 4, 1,
-			     -1, -1, -1),
-	MUX_GATE_CLR_SET_UPD(CLK_INFRA_SPI1_SEL, "infra_spi1_sel",
-			     infra_spi_parents, 0x0018, 0x0010, 0x0014, 5, 1,
-			     -1, -1, -1),
-	MUX_GATE_CLR_SET_UPD(CLK_INFRA_PWM1_SEL, "infra_pwm1_sel",
-			     infra_pwm_bsel_parents, 0x0018, 0x0010, 0x0014, 9,
-			     2, -1, -1, -1),
-	MUX_GATE_CLR_SET_UPD(CLK_INFRA_PWM2_SEL, "infra_pwm2_sel",
-			     infra_pwm_bsel_parents, 0x0018, 0x0010, 0x0014, 11,
-			     2, -1, -1, -1),
-	MUX_GATE_CLR_SET_UPD(CLK_INFRA_PWM_BSEL, "infra_pwm_bsel",
-			     infra_pwm_bsel_parents, 0x0018, 0x0010, 0x0014, 13,
-			     2, -1, -1, -1),
+	MUX_CLR_SET(CLK_INFRA_UART0_SEL, "infra_uart0_sel",
+		    infra_uart_parent, 0x0018, 0x0010, 0x0014, 0, 1),
+	MUX_CLR_SET(CLK_INFRA_UART1_SEL, "infra_uart1_sel",
+		    infra_uart_parent, 0x0018, 0x0010, 0x0014, 1, 1),
+	MUX_CLR_SET(CLK_INFRA_UART2_SEL, "infra_uart2_sel",
+		    infra_uart_parent, 0x0018, 0x0010, 0x0014, 2, 1),
+	MUX_CLR_SET(CLK_INFRA_SPI0_SEL, "infra_spi0_sel",
+		    infra_spi_parents, 0x0018, 0x0010, 0x0014, 4, 1),
+	MUX_CLR_SET(CLK_INFRA_SPI1_SEL, "infra_spi1_sel",
+		    infra_spi_parents, 0x0018, 0x0010, 0x0014, 5, 1),
+	MUX_CLR_SET(CLK_INFRA_PWM1_SEL, "infra_pwm1_sel",
+		    infra_pwm_bsel_parents, 0x0018, 0x0010, 0x0014, 9, 2),
+	MUX_CLR_SET(CLK_INFRA_PWM2_SEL, "infra_pwm2_sel",
+		    infra_pwm_bsel_parents, 0x0018, 0x0010, 0x0014, 11, 2),
+	MUX_CLR_SET(CLK_INFRA_PWM_BSEL, "infra_pwm_bsel",
+		    infra_pwm_bsel_parents, 0x0018, 0x0010, 0x0014, 13, 2),
 	/* MODULE_CLK_SEL_1 */
-	MUX_GATE_CLR_SET_UPD(CLK_INFRA_PCIE_SEL, "infra_pcie_sel",
-			     infra_pcie_parents, 0x0028, 0x0020, 0x0024, 0, 2,
-			     -1, -1, -1),
+	MUX_CLR_SET(CLK_INFRA_PCIE_SEL, "infra_pcie_sel",
+		    infra_pcie_parents, 0x0028, 0x0020, 0x0024, 0, 2),
 };
 
 static const struct mtk_gate_regs infra0_cg_regs = {

-- 
2.51.0

