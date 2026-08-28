Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84ADB46D2C8;
	Fri, 28 Aug 2026 13:48:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787924923; cv=none; b=lumzuMN/t3Ztn+UVW+9b5DghWWoWcsF2zaZbehbdptq7fpmK9xIgMIAGI52NegQqIS2H9hXJoNXmowwK+Kos4l75TOVX8SkD6+PNpTsXPxhdx3MLMZLLMDKT+UqUlVcir/x3DVCtJnlxzBnfLwmsdCu53HVS86+qeJNpAKEVaQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787924923; c=relaxed/simple;
	bh=EHapSsmMSkVfYfo53Mu7ZIXxC9xACaryKG8DHUnwB0E=;
	h=From:Date:Subject:MIME-Version:Message-Id:In-Reply-To:To:Cc:
	 Content-Type:References; b=OrvZmdd28/FJ1ib+EZS4rnMVj2KEh4hkU+6GzDo9Y7iHa4irIRpO23vB5eMvLA7WBGE5KD1lpiJDhUnAuBCS7pbRN6xm0QejptQrwRuCPHFjiEremnt1NEZRNEoScAk2aLobkiPumTrqiRCXjeKPL2E1Vdb7qDkjeQS4752HAdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=L8xMPwm/; arc=none smtp.client-ip=210.118.77.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="L8xMPwm/"
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20260828134830euoutp025596a92c5b2f14e3a49354843aa00eb0~P-DvI9clk2566925669euoutp02f;
	Fri, 28 Aug 2026 13:48:30 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20260828134830euoutp025596a92c5b2f14e3a49354843aa00eb0~P-DvI9clk2566925669euoutp02f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1787924910;
	bh=hce3Us/XDNiCKANeFbDzQxcrrHgd9MSsPe8r8AHhC0A=;
	h=From:Date:Subject:In-Reply-To:To:Cc:References:From;
	b=L8xMPwm/lgWrAI2GvkWa7uWbzghuaJU3VKM5qODDiEBPBfWW+UcQSh7figUMpH2MH
	 NwLg0vt6XKIV0NAl6vseRPnwFh7OvzXBGr9XSSKsqd5UmJTb1NZy+E198phGIDO5+G
	 Mde9q05pZbNOwA6ZVioHsdAbPEXvb1vphFFqbjRk=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20260828134830eucas1p1188cde4642239a10afedf46b415dfde4~P-DuoGIV31592715927eucas1p1M;
	Fri, 28 Aug 2026 13:48:30 +0000 (GMT)
Received: from AMDC4942.eu.corp.samsungelectronics.net (unknown
	[106.210.136.40]) by eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20260828134828eusmtip1e10f1777df471d94950c3265ef92b9ac~P-Ds8YdKI2833728337eusmtip16;
	Fri, 28 Aug 2026 13:48:28 +0000 (GMT)
From: Michal Wilczynski <m.wilczynski@samsung.com>
Date: Fri, 28 Aug 2026 15:47:33 +0200
Subject: [PATCH v2 09/15] clk: starfive: jh7110-vout: Allow pixel clock rate
 propagation
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-Id: <20260828-jh7110-clean-send-v2-9-331680c8b9d1@samsung.com>
In-Reply-To: <20260828-jh7110-clean-send-v2-0-331680c8b9d1@samsung.com>
To: Vinod Koul <vkoul@kernel.org>,  Neil Armstrong
	<neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>,  Krzysztof
	Kozlowski <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>, Andrzej
	Hajda <andrzej.hajda@intel.com>,  Robert Foss <rfoss@kernel.org>,  Laurent
	Pinchart <Laurent.pinchart@ideasonboard.com>,  Jonas Karlman
	<jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,  Luca Ceresoli
	<luca.ceresoli@bootlin.com>, David Airlie <airlied@gmail.com>,  Simona
	Vetter <simona@ffwll.ch>,  Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>,  Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,  Lee Jones <lee@kernel.org>, Andy
	Yan <andy.yan@rock-chips.com>,  Philipp Zabel <p.zabel@pengutronix.de>, 
	Emil Renner Berthing <kernel@esmil.dk>,  Hal Feng
	<hal.feng@starfivetech.com>,  Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,  Heiko
	Stuebner <heiko@sntech.de>, Conor Dooley <conor@kernel.org>,  Paul Walmsley
	<pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,  Albert Ou
	<aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,  Dominique
	Belhachemi <db@domibel.de>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	mfd@lists.linux.dev, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-riscv@lists.infradead.org, Icenowy Zheng <uwu@icenowy.me>,  Andy Yan
	<andyshrk@163.com>, Marek Szyprowski <m.szyprowski@samsung.com>,  Maud
	Spierings <maudspierings@gocontroll.com>,  Graham Markall
	<hello@big-grey.co.uk>,  Michal Wilczynski <m.wilczynski@samsung.com>
X-Mailer: b4 0.15-dev
X-CMS-MailID: 20260828134830eucas1p1188cde4642239a10afedf46b415dfde4
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260828134830eucas1p1188cde4642239a10afedf46b415dfde4
X-EPHeader: CA
X-CMS-RootMailID: 20260828134830eucas1p1188cde4642239a10afedf46b415dfde4
References: <20260828-jh7110-clean-send-v2-0-331680c8b9d1@samsung.com>
	<CGME20260828134830eucas1p1188cde4642239a10afedf46b415dfde4@eucas1p1.samsung.com>

The dc8200_pix0 and dc8200_pix1 MUXes feed the display controller, and
the rate they carry is ultimately produced by the HDMI PHY, which
registers hdmitx0_pixelclk as a clock provider.

Add CLK_SET_RATE_PARENT to both MUXes so a rate requested on them
reaches that parent, instead of being clamped to whatever rate the
parent already happens to run at.

Co-developed-by: Dominique Belhachemi <db@domibel.de>
Signed-off-by: Dominique Belhachemi <db@domibel.de>
Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
---
 drivers/clk/starfive/clk-starfive-jh7110-vout.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/starfive/clk-starfive-jh7110-vout.c b/drivers/clk/starfive/clk-starfive-jh7110-vout.c
index bad20d5d794a72f071b4d547b7304786a8ba9afa..b608fe358031109a15962a623b1c14d424023c02 100644
--- a/drivers/clk/starfive/clk-starfive-jh7110-vout.c
+++ b/drivers/clk/starfive/clk-starfive-jh7110-vout.c
@@ -40,10 +40,10 @@ static const struct jh71x0_clk_data jh7110_voutclk_data[] = {
 	JH71X0_GATE(JH7110_VOUTCLK_DC8200_AXI, "dc8200_axi", 0, JH7110_VOUTCLK_VOUT_TOP_AXI),
 	JH71X0_GATE(JH7110_VOUTCLK_DC8200_CORE, "dc8200_core", 0, JH7110_VOUTCLK_VOUT_TOP_AXI),
 	JH71X0_GATE(JH7110_VOUTCLK_DC8200_AHB, "dc8200_ahb", 0, JH7110_VOUTCLK_VOUT_TOP_AHB),
-	JH71X0_GMUX(JH7110_VOUTCLK_DC8200_PIX0, "dc8200_pix0", 0, 2,
+	JH71X0_GMUX(JH7110_VOUTCLK_DC8200_PIX0, "dc8200_pix0", CLK_SET_RATE_PARENT, 2,
 		    JH7110_VOUTCLK_DC8200_PIX,
 		    JH7110_VOUTCLK_HDMITX0_PIXELCLK),
-	JH71X0_GMUX(JH7110_VOUTCLK_DC8200_PIX1, "dc8200_pix1", 0, 2,
+	JH71X0_GMUX(JH7110_VOUTCLK_DC8200_PIX1, "dc8200_pix1", CLK_SET_RATE_PARENT, 2,
 		    JH7110_VOUTCLK_DC8200_PIX,
 		    JH7110_VOUTCLK_HDMITX0_PIXELCLK),
 	/* LCD */

-- 
2.34.1

