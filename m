Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0655323EA83;
	Wed, 24 Dec 2025 07:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766561434; cv=none; b=VnXCVoih0RhraekLq/cd+mTmWaZM9r3ZN0H7mun30TM3MCjreSuXzTNGVweTwOugvpNoCLYKqzzIHeYUBRwIm2p0ksaAwq/9b+pL7lognTTdnvwqxVf/kDGUM1EpBGTrt6xpCQLOwBro8Z7DcxVytpdHg3hsylLI/+tTx1Mhpw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766561434; c=relaxed/simple;
	bh=275RkoijZ9ucMKuDaFvwXmFSOwPO0XBDoE4ljKpdgDI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hChYhGAIHXChpnBnIuuoaLhcFQP+FzZUGxJGS+SfTGsJjvAUZOGISMAlGMqMoXaV0xQpI/+Hej+KJ6bgWZqxS1kzyjOxreGn18xB4iQpP4PdHaPrtqQpLfZHQbDVt6e8dhNXNCAsSrm7MfpU1vSigVtsm1/kQCZoHZtnbfOw3KY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=aWESDHXb; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="aWESDHXb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1766561429;
	bh=275RkoijZ9ucMKuDaFvwXmFSOwPO0XBDoE4ljKpdgDI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=aWESDHXbqv7RTKQMVuvdt/+fXeF2L1RrwyjCRYiNqhAAQWCIVHxrSFvnrJ/F//Stn
	 H+Yq4kHYDk4yosaiyTyE8c7q3tg9HXub8yWl3uYhlTqLNju5nWilO274XHKZv5hV6b
	 aJ0cBid9Q6xLXqxWcEvU7MlJsH6IxC+E1JIWhx1ZgYRiW7FfE/+Kk+ceHqwgFptkmf
	 NpaxPWmRdkaoyVsrqm5W7ESsvwNoMS7CC29nkUQRgGvwqSYZYgBVtNoth5QvoW22/9
	 imPJg7f0NMcTOtKFOsFWD0bcJtomDmxxqKv3Z3Va1Kh+LaO/SljKEHSaEZqPW4nfiw
	 zXfUeZvoWe82g==
Received: from beast.luon.net (simons.connected.by.freedominter.net [45.83.240.172])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sjoerd)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 26C7017E1330;
	Wed, 24 Dec 2025 08:30:29 +0100 (CET)
Received: by beast.luon.net (Postfix, from userid 1000)
	id C077C11A3A2D7; Wed, 24 Dec 2025 08:30:28 +0100 (CET)
From: Sjoerd Simons <sjoerd@collabora.com>
Date: Wed, 24 Dec 2025 08:30:11 +0100
Subject: [PATCH 2/4] clk: mediatek: Declare MT7981 infra muxes as no-gate
 muxes
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251224-mtk-not-a-gate-v1-2-d4667e3b7856@collabora.com>
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

Fixes: 813c3b53b55b ("clk: mediatek: add MT7981 clock support")
Signed-off-by: Sjoerd Simons <sjoerd@collabora.com>
---
 drivers/clk/mediatek/clk-mt7981-infracfg.c | 55 ++++++++++++------------------
 1 file changed, 22 insertions(+), 33 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt7981-infracfg.c b/drivers/clk/mediatek/clk-mt7981-infracfg.c
index 0487b6bb80ae..574930e87fbe 100644
--- a/drivers/clk/mediatek/clk-mt7981-infracfg.c
+++ b/drivers/clk/mediatek/clk-mt7981-infracfg.c
@@ -44,40 +44,29 @@ static const char *const infra_pcie_parents[] __initconst = {
 
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
-			     infra_spi0_parents, 0x0018, 0x0010, 0x0014, 4, 1,
-			     -1, -1, -1),
-	MUX_GATE_CLR_SET_UPD(CLK_INFRA_SPI1_SEL, "infra_spi1_sel",
-			     infra_spi1_parents, 0x0018, 0x0010, 0x0014, 5, 1,
-			     -1, -1, -1),
-	MUX_GATE_CLR_SET_UPD(CLK_INFRA_SPI2_SEL, "infra_spi2_sel",
-			     infra_spi0_parents, 0x0018, 0x0010, 0x0014, 6, 1,
-			     -1, -1, -1),
-	MUX_GATE_CLR_SET_UPD(CLK_INFRA_PWM1_SEL, "infra_pwm1_sel",
-			     infra_pwm1_parents, 0x0018, 0x0010, 0x0014, 9, 1,
-			     -1, -1, -1),
-	MUX_GATE_CLR_SET_UPD(CLK_INFRA_PWM2_SEL, "infra_pwm2_sel",
-			     infra_pwm1_parents, 0x0018, 0x0010, 0x0014, 11, 1,
-			     -1, -1, -1),
-	MUX_GATE_CLR_SET_UPD(CLK_INFRA_PWM3_SEL, "infra_pwm3_sel",
-			     infra_pwm1_parents, 0x0018, 0x0010, 0x0014, 15, 1,
-			     -1, -1, -1),
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
+		    infra_spi0_parents, 0x0018, 0x0010, 0x0014, 4, 1),
+	MUX_CLR_SET(CLK_INFRA_SPI1_SEL, "infra_spi1_sel",
+		    infra_spi1_parents, 0x0018, 0x0010, 0x0014, 5, 1),
+	MUX_CLR_SET(CLK_INFRA_SPI2_SEL, "infra_spi2_sel",
+		    infra_spi0_parents, 0x0018, 0x0010, 0x0014, 6, 1),
+	MUX_CLR_SET(CLK_INFRA_PWM1_SEL, "infra_pwm1_sel",
+		    infra_pwm1_parents, 0x0018, 0x0010, 0x0014, 9, 1),
+	MUX_CLR_SET(CLK_INFRA_PWM2_SEL, "infra_pwm2_sel",
+		    infra_pwm1_parents, 0x0018, 0x0010, 0x0014, 11, 1),
+	MUX_CLR_SET(CLK_INFRA_PWM3_SEL, "infra_pwm3_sel",
+		    infra_pwm1_parents, 0x0018, 0x0010, 0x0014, 15, 1),
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

