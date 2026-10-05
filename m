Received: from mail.scd31.com (mail.scd31.com [205.209.125.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5364E4D7D53;
	Mon,  5 Oct 2026 17:27:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.209.125.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791221248; cv=none; b=XFDhrAxbi1JNpg0pY9t1y7e2pp6UAvGJhPNQkkK5V0/qMaOcQ/R/F9ysS1DgcjSjS3Ew76rcvisncXO8niZsfMJLQoVDZKkdtJSpH4iFfI/qVy6KJf0kdEl43E2riV6yjVCkmbOBlaO7J+6ylxlDrPxzjARyPgiyxp/VAyX7Lws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791221248; c=relaxed/simple;
	bh=iM3FDTUSJkdeCcHzPgGFZAFh4wP6orUAGtfWqLT20hk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AcZ+WUol1bOdS8lxaFsCAnELPxvzn/u2X8WVpUUk0jVAA0067g1xs9ShFnsd7OviKoFEaVjo+Bh0H+tNPQ8svkmb+hSWjlaHAWAYxIMtz08qFUBkFVWksuHN2MbzRRYkGBe2fFyYhR2m4SBw+MEP1FgIEhyle1xErcBQRHgYCS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=scd31.com; spf=pass smtp.mailfrom=scd31.com; dkim=pass (2048-bit key) header.d=scd31.com header.i=@scd31.com header.b=NkIZVHIe; arc=none smtp.client-ip=205.209.125.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=scd31.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=scd31.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=scd31.com header.i=@scd31.com header.b="NkIZVHIe"
From: Sophie D <patches@scd31.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=scd31.com; s=mail;
	t=1791220639;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=1ah6BRYlOqcajJUdl5DlnBTDzNHXdGvo5x5zaQWEpp8=;
	b=NkIZVHIe/NEIztwGEg5rftAncOzAtTd97OTgds4MCRjaTV/u3umbjksfKTQ9FIca5njqWK
	nMg0AiLZCR5QQctw/NiPKpQoIP2TcGME8CvMv/oxmWWUj0e3t+ysmtH0Hoqqig9DzG7SV/
	DCfTWlZTeL9Lz47VpWivUgLmhuRTkPUExavQDbOmRiOMb8I9JvaxzphsY7U/jbN0I/8cdm
	TB9YZ/dTHE8dC1mprBE1sYQ71q7dG4euLmlK+5bozG8LqXkHfzCV/qb1oh0zQU76aKH4MJ
	JDw0USNlv8wLTnmUEVuTsch++5vFwgnc06pl333eMOUBVHLENZlQmZei4I6Rcg==
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Sophie D <patches@scd31.com>
Subject: [PATCH] clk: mediatek: mt2701: Enable all subsystem clocks by default
Date: Mon,  5 Oct 2026 13:17:05 -0400
Message-ID: <20261005171706.2164743-1-patches@scd31.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Only the core MT2701 clock driver is enabled by default when building
for ARCH_MEDIATEK on ARM; none of the subsystem clock drivers are. As a
result, multi_v7_defconfig produces a kernel where Ethernet, PCIe, USB,
display, GPU and audio do not work on MT7623 boards such as the Banana
Pi BPI-R2, as their clocks live in ethsys, hifsys, mmsys, g3dsys and
audsys.

Default all of the MT2701 subsystem clock drivers to
COMMON_CLK_MT2701, in line with newer SoCs such as MT8173, MT8183 and
MT7986.

Signed-off-by: Sophie D <patches@scd31.com>
---
 drivers/clk/mediatek/Kconfig | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/clk/mediatek/Kconfig b/drivers/clk/mediatek/Kconfig
index 0e8dd82aa84e..a449ec878abc 100644
--- a/drivers/clk/mediatek/Kconfig
+++ b/drivers/clk/mediatek/Kconfig
@@ -29,48 +29,56 @@ config COMMON_CLK_MT2701
 config COMMON_CLK_MT2701_MMSYS
 	bool "Clock driver for MediaTek MT2701 mmsys"
 	depends on COMMON_CLK_MT2701
+	default COMMON_CLK_MT2701
 	help
 	  This driver supports MediaTek MT2701 mmsys clocks.
 
 config COMMON_CLK_MT2701_IMGSYS
 	bool "Clock driver for MediaTek MT2701 imgsys"
 	depends on COMMON_CLK_MT2701
+	default COMMON_CLK_MT2701
 	help
 	  This driver supports MediaTek MT2701 imgsys clocks.
 
 config COMMON_CLK_MT2701_VDECSYS
 	bool "Clock driver for MediaTek MT2701 vdecsys"
 	depends on COMMON_CLK_MT2701
+	default COMMON_CLK_MT2701
 	help
 	  This driver supports MediaTek MT2701 vdecsys clocks.
 
 config COMMON_CLK_MT2701_HIFSYS
 	bool "Clock driver for MediaTek MT2701 hifsys"
 	depends on COMMON_CLK_MT2701
+	default COMMON_CLK_MT2701
 	help
 	  This driver supports MediaTek MT2701 hifsys clocks.
 
 config COMMON_CLK_MT2701_ETHSYS
 	bool "Clock driver for MediaTek MT2701 ethsys"
 	depends on COMMON_CLK_MT2701
+	default COMMON_CLK_MT2701
 	help
 	  This driver supports MediaTek MT2701 ethsys clocks.
 
 config COMMON_CLK_MT2701_BDPSYS
 	bool "Clock driver for MediaTek MT2701 bdpsys"
 	depends on COMMON_CLK_MT2701
+	default COMMON_CLK_MT2701
 	help
 	  This driver supports MediaTek MT2701 bdpsys clocks.
 
 config COMMON_CLK_MT2701_AUDSYS
 	bool "Clock driver for Mediatek MT2701 audsys"
 	depends on COMMON_CLK_MT2701
+	default COMMON_CLK_MT2701
 	help
 	  This driver supports Mediatek MT2701 audsys clocks.
 
 config COMMON_CLK_MT2701_G3DSYS
 	bool "Clock driver for MediaTek MT2701 g3dsys"
 	depends on COMMON_CLK_MT2701
+	default COMMON_CLK_MT2701
 	help
 	  This driver supports MediaTek MT2701 g3dsys clocks.
 
-- 
2.55.0

