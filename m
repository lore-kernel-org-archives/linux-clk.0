Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 326207D40D
	for <linux-clk@vger.kernel.org>; Fri, 31 May 2024 20:27:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717187233; cv=none; b=dJuU1sl2+eNoweI9qLw82B9zHsa0jRo1aik1C9evNYbhQbQTdbziJz7TqyhzOwM4Wa04wIe8CtHqzTHRNJcUuYdnQ5cn7MmiTEsiTBpzxNFpdWd6Q8imEElyXqJ3L6i299UViz3rmRKrAPA+FefPgO6MTFeGIQ0e/5KcM3teu0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717187233; c=relaxed/simple;
	bh=ixcKqYywwhhVOgxQe69BbhPiEYE4PIE4mUoLjYmoHHI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QR1rmVBj6lgP7oafOW2lgjuedIwBpI/A3lMTRGBV3UGm5b7J1vyMv0lcHOagl1kLSeyUsDZAuwpXgkxItcVk3X6mnbjCXnUaXg4cwYmFeKef4RZkGnx7iNgh3YAEulau9e8Uzd+abuKdxivLjib2CYgtwsWPSwaUSVWgAiOS+B8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=Rw02wwlp; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="Rw02wwlp"
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 7C3BE880FB;
	Fri, 31 May 2024 22:27:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1717187229;
	bh=pG52++7gBSviTnxXJPWSTkc6y2jX4BjJltbX+3OBuNw=;
	h=From:To:Cc:Subject:Date:From;
	b=Rw02wwlpnk1YKUICtQpth2Wl6jcJWz/9jc8loAcnz4glRtOQzSVoLIibYxL7Gd6lq
	 E1q1LDXVHa/tzy6HO6xYspbbW48GitPwaKwi3H+gQlp2WmwBDWuvgnlZaVkE+eTOnJ
	 kxpEc93UQaQQzI+t/2w5Az2TwG42n1mp6vUnuAda+2K6z1Y6vBGrp5joJSqDPd7uk7
	 zWvje2a8VJ5yg+ejGbq5lUpSD+s7hIQDcqirrZLNeXTxVfa+EcE0Zcddl41hXtPahB
	 oX0jrd3CFFHnqFACVKENR55NT40FMK/hPCIXiqQJBI0OLPvBevcEg2tq4qZWKfHtVe
	 GstH1+NmjPmTg==
From: Marek Vasut <marex@denx.de>
To: linux-clk@vger.kernel.org
Cc: Marek Vasut <marex@denx.de>,
	Abel Vesa <abelvesa@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	"Lukas F . Hartmann" <lukas@mntmn.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	imx@lists.linux.dev,
	kernel@dh-electronics.com,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] clk: imx: clk-imx8mp: Allow media_disp pixel clock reconfigure parent rate
Date: Fri, 31 May 2024 22:26:26 +0200
Message-ID: <20240531202648.277078-1-marex@denx.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean

The media_disp[12]_pix clock supply LCDIFv3 pixel clock output. These
clocks are usually the only downstream clock from Video PLL on i.MX8MP.
Allow these clocks to reconfigure the Video PLL, as that results in
accurate pixel clock. If the Video PLL is not reconfigured, the pixel
clock accuracy is low.

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Abel Vesa <abelvesa@kernel.org>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Lukas F. Hartmann <lukas@mntmn.com>
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Peng Fan <peng.fan@nxp.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: imx@lists.linux.dev
Cc: kernel@dh-electronics.com
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-clk@vger.kernel.org
---
 drivers/clk/imx/clk-imx8mp.c | 4 ++--
 drivers/clk/imx/clk.h        | 4 ++++
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/imx/clk-imx8mp.c b/drivers/clk/imx/clk-imx8mp.c
index 670aa2bab3017..f11dfe2028319 100644
--- a/drivers/clk/imx/clk-imx8mp.c
+++ b/drivers/clk/imx/clk-imx8mp.c
@@ -547,7 +547,7 @@ static int imx8mp_clocks_probe(struct platform_device *pdev)
 	hws[IMX8MP_CLK_AHB] = imx8m_clk_hw_composite_bus_critical("ahb_root", imx8mp_ahb_sels, ccm_base + 0x9000);
 	hws[IMX8MP_CLK_AUDIO_AHB] = imx8m_clk_hw_composite_bus("audio_ahb", imx8mp_audio_ahb_sels, ccm_base + 0x9100);
 	hws[IMX8MP_CLK_MIPI_DSI_ESC_RX] = imx8m_clk_hw_composite_bus("mipi_dsi_esc_rx", imx8mp_mipi_dsi_esc_rx_sels, ccm_base + 0x9200);
-	hws[IMX8MP_CLK_MEDIA_DISP2_PIX] = imx8m_clk_hw_composite_bus("media_disp2_pix", imx8mp_media_disp_pix_sels, ccm_base + 0x9300);
+	hws[IMX8MP_CLK_MEDIA_DISP2_PIX] = imx8m_clk_hw_composite_bus_flags("media_disp2_pix", imx8mp_media_disp_pix_sels, ccm_base + 0x9300, CLK_SET_RATE_PARENT);
 
 	hws[IMX8MP_CLK_IPG_ROOT] = imx_clk_hw_divider2("ipg_root", "ahb_root", ccm_base + 0x9080, 0, 1);
 
@@ -609,7 +609,7 @@ static int imx8mp_clocks_probe(struct platform_device *pdev)
 	hws[IMX8MP_CLK_USDHC3] = imx8m_clk_hw_composite("usdhc3", imx8mp_usdhc3_sels, ccm_base + 0xbc80);
 	hws[IMX8MP_CLK_MEDIA_CAM1_PIX] = imx8m_clk_hw_composite("media_cam1_pix", imx8mp_media_cam1_pix_sels, ccm_base + 0xbd00);
 	hws[IMX8MP_CLK_MEDIA_MIPI_PHY1_REF] = imx8m_clk_hw_composite("media_mipi_phy1_ref", imx8mp_media_mipi_phy1_ref_sels, ccm_base + 0xbd80);
-	hws[IMX8MP_CLK_MEDIA_DISP1_PIX] = imx8m_clk_hw_composite("media_disp1_pix", imx8mp_media_disp_pix_sels, ccm_base + 0xbe00);
+	hws[IMX8MP_CLK_MEDIA_DISP1_PIX] = imx8m_clk_hw_composite_bus_flags("media_disp1_pix", imx8mp_media_disp_pix_sels, ccm_base + 0xbe00, CLK_SET_RATE_PARENT);
 	hws[IMX8MP_CLK_MEDIA_CAM2_PIX] = imx8m_clk_hw_composite("media_cam2_pix", imx8mp_media_cam2_pix_sels, ccm_base + 0xbe80);
 	hws[IMX8MP_CLK_MEDIA_LDB] = imx8m_clk_hw_composite("media_ldb", imx8mp_media_ldb_sels, ccm_base + 0xbf00);
 	hws[IMX8MP_CLK_MEMREPAIR] = imx8m_clk_hw_composite_critical("mem_repair", imx8mp_memrepair_sels, ccm_base + 0xbf80);
diff --git a/drivers/clk/imx/clk.h b/drivers/clk/imx/clk.h
index adb7ad649a0d2..aa5202f284f3d 100644
--- a/drivers/clk/imx/clk.h
+++ b/drivers/clk/imx/clk.h
@@ -442,6 +442,10 @@ struct clk_hw *__imx8m_clk_hw_composite(const char *name,
 	_imx8m_clk_hw_composite(name, parent_names, reg, \
 			IMX_COMPOSITE_BUS, IMX_COMPOSITE_CLK_FLAGS_DEFAULT)
 
+#define imx8m_clk_hw_composite_bus_flags(name, parent_names, reg, flags) \
+	_imx8m_clk_hw_composite(name, parent_names, reg, \
+			IMX_COMPOSITE_BUS, IMX_COMPOSITE_CLK_FLAGS_DEFAULT | flags)
+
 #define imx8m_clk_hw_composite_bus_critical(name, parent_names, reg)	\
 	_imx8m_clk_hw_composite(name, parent_names, reg, \
 			IMX_COMPOSITE_BUS, IMX_COMPOSITE_CLK_FLAGS_CRITICAL)
-- 
2.43.0

