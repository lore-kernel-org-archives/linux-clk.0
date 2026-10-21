Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792588241;
	b=znqAaqw+e9JxF65Rkr0aFK5aoXx9beOkMhYVQUm8JczVg3jITLEXan5fq/w5rZ4Hs8Nz
	 rYq1T00S1cUFNVuL+5Mi0ROKHWf2RXnS2PW7j64gxlQCTK+Lbp2R2RXI7x8gZnO7xO9KU
	 LBw9eYMrQkIoUbE3y5TPY4kz7XDNaI/WeSp5vA6vgH4/RTKHUQ3vIjp7RyrO0+MX4gKZ4
	 PsxjzR6LiLlH30yd3fqjTNBYQwwMpHuFwyP2IdEQI/5OXD7mFrFCHWqldB7p5sPpzSSGl
	 d+WT8ZoZMfSee5DrQtI4iZV1ziwButU1JOK5wSJoCqT+O56Jbp17TtSpRv5rzUObhlQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792588241;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=Mk/EmLAbArXDwABwfTeuWrbYj+xRxrhMiTK2YzPCRAs=;
	b=TofGmFFfes2e/KhCc2HbUtyiiwX2Jy9ajiRnAoQEZme0NM+SAljzoiE1Hg+IVnpHsGK4
	 qnRonXi/r/H8/02stvcAVQU9VqksLG9AMBv7JQfdW6mjd6IQHHJGWAg4NcteU6xl8d4HD
	 Z74XNPzXXh/RD8XVrBuPZCUaVUL7hz02tQ2HFLARnrfftu9gKu8CylA5L5it3cX4owlPB
	 QsRDigSNZvwLZ778Zt+K0sLyRpocUB1kqksMPW1zoeV1Z2c2i1MPgtS5eQMCCfg6ddzxl
	 uF4xAAVU06kR5b/y/uuYKsu6sb6U0WYXLMXRprlubkJbA2f+Hwnm9qus2+T8zASFMbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=XBLIMupC;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6725C606A31E;
	Wed, 21 Oct 2026 13:10:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6725C606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=XBLIMupC
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id CF3721A12AF;
	Wed, 21 Oct 2026 13:10:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9C9AB606E3;
	Wed, 21 Oct 2026 13:10:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5D497103289F5;
	Wed, 21 Oct 2026 15:10:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792588236; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Mk/EmLAbArXDwABwfTeuWrbYj+xRxrhMiTK2YzPCRAs=;
	b=XBLIMupC7V/0WzmciI5aiMtmhmBG5o4yWKGwObXxgKDLwIi6T2TveosHAQRV12Is4nhlZX
	ZYuWjqRHZlzQOQQRzOegHkk4kTwwx1qPxhnK9pm6KZ/z8trv0/ILJFs3CflPIZ/jhjU+Kz
	Brw4kDxaz5+IYTNhnLn8KU1Jo/GvEUWdOZ5THF18RxgPYpsqiGm1VA0bn+BGXnVw/NMFaM
	0t1KOaVZFvk+Y6tbNFwzk5z5yhXClKv9wNWuAzBnjib10sLS4fSH0QQPODGfBOprIjvAj2
	urcAzWX2V5/BLYD2t2jc1OVq+JlowEywVg3p6DjvpO45QgtstapflYH91YRObg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Wed, 21 Oct 2026 15:10:00 +0200
Subject: [PATCH 4/5] clk: imx8mp: Set v2 rate negociation to LDB and pixel
 clocks
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261021-ge-clk-lcm-v1-4-246cc35b5ffb@bootlin.com>
References: <20261021-ge-clk-lcm-v1-0-246cc35b5ffb@bootlin.com>
In-Reply-To: <20261021-ge-clk-lcm-v1-0-246cc35b5ffb@bootlin.com>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Abel Vesa <abelvesa@kernel.org>, 
 Peng Fan <peng.fan@nxp.com>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Ian Ray <ian.ray@gehealthcare.com>, 
 =?utf-8?q?Herv=C3=A9_Codina?= <herve.codina@bootlin.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

Both clocks are fed using the same PLL, but when modifying the PLL to
please one of the two, we must not break the other. Because of that, we
must enable the new negociation logic that does an LCM calculation and
preserves the existing rates while walking the subtree.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/clk/imx/clk-imx8mp.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/imx/clk-imx8mp.c b/drivers/clk/imx/clk-imx8mp.c
index 3540992b8940..96dc237c10ea 100644
--- a/drivers/clk/imx/clk-imx8mp.c
+++ b/drivers/clk/imx/clk-imx8mp.c
@@ -689,7 +689,7 @@ static int imx8mp_clocks_probe(struct platform_device *pdev)
 	hws[IMX8MP_CLK_AHB] = imx8m_clk_hw_composite_bus_critical("ahb_root", imx8mp_ahb_sels, ccm_base + 0x9000);
 	hws[IMX8MP_CLK_AUDIO_AHB] = imx8m_clk_hw_composite_bus("audio_ahb", imx8mp_audio_ahb_sels, ccm_base + 0x9100);
 	hws[IMX8MP_CLK_MIPI_DSI_ESC_RX] = imx8m_clk_hw_composite_bus("mipi_dsi_esc_rx", imx8mp_mipi_dsi_esc_rx_sels, ccm_base + 0x9200);
-	hws[IMX8MP_CLK_MEDIA_DISP2_PIX] = imx8m_clk_hw_composite_bus_flags("media_disp2_pix", imx8mp_media_disp_pix_sels, ccm_base + 0x9300, CLK_SET_RATE_PARENT);
+	hws[IMX8MP_CLK_MEDIA_DISP2_PIX] = imx8m_clk_hw_composite_bus_flags("media_disp2_pix", imx8mp_media_disp_pix_sels, ccm_base + 0x9300, CLK_SET_RATE_PARENT | CLK_V2_RATE_NEGOTIATION);
 
 	hws[IMX8MP_CLK_IPG_ROOT] = imx_clk_hw_divider2("ipg_root", "ahb_root", ccm_base + 0x9080, 0, 1);
 
@@ -751,9 +751,9 @@ static int imx8mp_clocks_probe(struct platform_device *pdev)
 	hws[IMX8MP_CLK_USDHC3] = imx8m_clk_hw_composite("usdhc3", imx8mp_usdhc3_sels, ccm_base + 0xbc80);
 	hws[IMX8MP_CLK_MEDIA_CAM1_PIX] = imx8m_clk_hw_composite("media_cam1_pix", imx8mp_media_cam1_pix_sels, ccm_base + 0xbd00);
 	hws[IMX8MP_CLK_MEDIA_MIPI_PHY1_REF] = imx8m_clk_hw_composite("media_mipi_phy1_ref", imx8mp_media_mipi_phy1_ref_sels, ccm_base + 0xbd80);
-	hws[IMX8MP_CLK_MEDIA_DISP1_PIX] = imx8m_clk_hw_composite_bus_flags("media_disp1_pix", imx8mp_media_disp_pix_sels, ccm_base + 0xbe00, CLK_SET_RATE_PARENT);
+	hws[IMX8MP_CLK_MEDIA_DISP1_PIX] = imx8m_clk_hw_composite_bus_flags("media_disp1_pix", imx8mp_media_disp_pix_sels, ccm_base + 0xbe00, CLK_SET_RATE_PARENT | CLK_V2_RATE_NEGOTIATION);
 	hws[IMX8MP_CLK_MEDIA_CAM2_PIX] = imx8m_clk_hw_composite("media_cam2_pix", imx8mp_media_cam2_pix_sels, ccm_base + 0xbe80);
-	hws[IMX8MP_CLK_MEDIA_LDB] = imx8m_clk_hw_composite_bus_flags("media_ldb", imx8mp_media_ldb_sels, ccm_base + 0xbf00, CLK_SET_RATE_PARENT);
+	hws[IMX8MP_CLK_MEDIA_LDB] = imx8m_clk_hw_composite_bus_flags("media_ldb", imx8mp_media_ldb_sels, ccm_base + 0xbf00, CLK_SET_RATE_PARENT | CLK_V2_RATE_NEGOTIATION);
 	hws[IMX8MP_CLK_MEMREPAIR] = imx8m_clk_hw_composite_critical("mem_repair", imx8mp_memrepair_sels, ccm_base + 0xbf80);
 	hws[IMX8MP_CLK_MEDIA_MIPI_TEST_BYTE] = imx8m_clk_hw_composite("media_mipi_test_byte", imx8mp_media_mipi_test_byte_sels, ccm_base + 0xc100);
 	hws[IMX8MP_CLK_ECSPI3] = imx8m_clk_hw_composite("ecspi3", imx8mp_ecspi3_sels, ccm_base + 0xc180);

-- 
2.56.0

