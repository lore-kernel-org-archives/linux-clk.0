Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=77.73.98.243
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795189088;
	b=xH3+Dy0YmHN0SWTpT6SKHWJrYijkGFTvlBRKwQaY3MOa0tPXHP+qLeYM4+uPgaFM1EBT
	 JbfDNmNar+VgwBaFAqa3gPIOYNbAIGE0uciCxlC74fQJwgn4fqwGxPQg7thAsF/qUD1xM
	 oNwS9eI1LGRP8ZY+QfNwEHSYpo/u/2WBNYL3hHhpBTHmPDXqpeTQ9hUAUCH5NjtiIDvs8
	 GiefKqz4K4OznoKZirrwAYauCthOPk3/jmwScFTJNWM7+FKoHf7SEK+VUUVbJpTDluSWf
	 e2ebTpXQ1pdYgLH0FmulFsDenibt2lzhFMhPzSlq1Yz9VzvjfjbPrHjYpheeBnncRCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795189088;
	h=DMARC-Filter:Received:DKIM-Signature:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=KFSasBaQ8OA2KKDICReL5AyVNlfF5o5HYocfZ1mZcWk=;
	b=kwU1BM2pQKoZuAvXDmT1i4NYQxCeyVaeX+zFKxRac+2GpXWFvNmCzCMieFpcNx2YFvA4
	 Xo/Wtzp1dURa6lJNdWNutcx+SeU991T5x2DgTGbLh5IQP/O+qthr5uM8SDU602aMkOBMT
	 bXhr2IkHjW+rdMmB9hKSjWhfbNnJtPk0OmEiKo7DnoFuFCYnz8IIJu0/W7eTT56jqHDd/
	 mihLRPdQMMQ9nTzPVDKcszazv/sVwvkzD7siCWMG4RyWL7m8RKzQqvKroNe+N8kg8SIa1
	 3U0IzTCuUC+aVb06EfRkpBTNNKYOoIILNCLkyemqzud0YACMCXceZH/4yz9Fk9VF6Zg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=octarion.eu;
	spf=pass smtp.mailfrom=octarion.eu;
	dkim=pass header.d=octarion.eu header.i=@octarion.eu header.a=rsa-sha256 header.s=mail header.b=kMxL3zg1;
	arc=none smtp.remote-ip=77.73.98.243
Received: from mail.octarion.eu (mail.octarion.eu [77.73.98.243])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52772606A32A
	for <linux-clk@vger.kernel.org>; Fri, 20 Nov 2026 15:38:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52772606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=octarion.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=octarion.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=octarion.eu header.i=@octarion.eu header.a=rsa-sha256 header.s=mail header.b=kMxL3zg1
Received: from mail.octarion.eu (localhost [127.0.0.1])
	by mail.octarion.eu (Postfix) with ESMTP id D1F8F4ABFFA
	for <linux-clk@vger.kernel.org>; Fri, 20 Nov 2026 15:37:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=octarion.eu; s=mail; t=1795189077; h=from:to:subject:date:message-id:mime-version; bh=KFSasBaQ8OA2KKDICReL5AyVNlfF5o5HYocfZ1mZcWk=; b=kMxL3zg1yr5R7HP5w9hCzCdsls68BJkrDbxotdBCYWeAYdzCy+caZF9QvYRb51gXSlkSH/UKkeVS
	CSQbyJWatmwbDsKXXgHbKsc9L5jDStAhC8tYScviUieqOYGLY2P+gindRa0fPs1C6S//CDpzueFY
	I6cyGrbWluqsO5rv1gAdyX30nzZXE+zXR++vKoabbT74MK3TdJwrNcIxMb9B6RKQN1h38sT4aBw4
	Rj+bkDKR5eUVIwYfuHwsv8bnLmwdi3uoqIhiwE9CD6kfmJcjfhL9wn//M0QrlIsKzOSfbdImAhFK
	Lj6fBs/rlJvB9w3U69I7l0rUhyDA0d/votFRIg==
Received: from localhost.localdomain (unknown [IPv6:2a02:1807:3930:3611:dd78:6350:fd25:20d0])
	by mail.octarion.eu (Postfix) with ESMTPSA id F09294AC0B1;
	Fri, 20 Nov 2026 15:37:56 +0000 (UTC)
From: Herman verschooten <Herman@octarion.eu>
To: Chen-Yu Tsai <wens@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Herman verschooten <Herman@octarion.eu>
Subject: [PATCH] clk: sunxi-ng: sun6i-a31: Fix LCD CH0 and IEP clock mux widths
Date: Fri, 20 Nov 2026 16:37:23 +0100
Message-ID: <20261120153723.85232-1-Herman@octarion.eu>
X-Mailer: git-send-email 2.56.1
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The source select fields of the LCD0/LCD1 CH0 clocks and the IEP DRC0,
DRC1, DEU0 and DEU1 clocks are 3 bits wide (bits 26:24), like those of
the BE, FE and MP clocks, but they are described as 2 bits wide. The LCD
CH0 clocks have 5 possible parents and the IEP clocks 6 (the same
de_parents as BE/FE/MP), so pll-mipi, pll9 and pll10 can never be
selected. Worse, if the bootloader left bit 26 set, Linux keeps it when
it reparents these clocks, and the register ends up selecting a
different or reserved source.

This happens on a Modecom FreeTab 8014 tablet, whose vendor bootloader
shows its boot logo on the LVDS panel and leaves bit 26 set in both the
LCD0 CH0 and the IEP DRC0 clock registers. Linux reparents them to
pll-video0-2x and pll-periph-2x by writing only bits 25:24, leaving both
registers at the reserved value 0b110: the TCON gets no clock and never
raises a vblank interrupt (drm_atomic_helper_wait_for_vblanks() times
out, the panel stays dark), and once the TCON clock is fixed by hand,
the unclocked DRC0 makes the panel show a flat colour instead of the
picture. When the same kernel is started over FEL, where these registers
start at zero, the display works.

Describe these muxes as 3 bits wide.

Fixes: c6e6c96d8fa6 ("clk: sunxi-ng: Add A31/A31s clocks")
Assisted-by: claude-opus-5-5
Signed-off-by: Herman verschooten <Herman@octarion.eu>
---
 drivers/clk/sunxi-ng/ccu-sun6i-a31.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu-sun6i-a31.c b/drivers/clk/sunxi-ng/ccu-sun6i-a31.c
index bab65cf..0884dc5 100644
--- a/drivers/clk/sunxi-ng/ccu-sun6i-a31.c
+++ b/drivers/clk/sunxi-ng/ccu-sun6i-a31.c
@@ -551,9 +551,9 @@ static const char * const lcd_ch0_parents[] = { "pll-video0", "pll-video1",
 						"pll-video0-2x",
 						"pll-video1-2x", "pll-mipi" };
 static SUNXI_CCU_MUX_WITH_GATE(lcd0_ch0_clk, "lcd0-ch0", lcd_ch0_parents,
-			       0x118, 24, 2, BIT(31), CLK_SET_RATE_PARENT);
+			       0x118, 24, 3, BIT(31), CLK_SET_RATE_PARENT);
 static SUNXI_CCU_MUX_WITH_GATE(lcd1_ch0_clk, "lcd1-ch0", lcd_ch0_parents,
-			       0x11c, 24, 2, BIT(31), CLK_SET_RATE_PARENT);
+			       0x11c, 24, 3, BIT(31), CLK_SET_RATE_PARENT);
 
 static const char * const lcd_ch1_parents[] = { "pll-video0", "pll-video1",
 						"pll-video0-2x",
@@ -645,13 +645,13 @@ static SUNXI_CCU_M_WITH_MUX_GATE(mipi_csi_dphy_clk, "mipi-csi-dphy",
 				 BIT(15), 0);
 
 static SUNXI_CCU_M_WITH_MUX_GATE(iep_drc0_clk, "iep-drc0", de_parents,
-				 0x180, 0, 3, 24, 2, BIT(31), 0);
+				 0x180, 0, 3, 24, 3, BIT(31), 0);
 static SUNXI_CCU_M_WITH_MUX_GATE(iep_drc1_clk, "iep-drc1", de_parents,
-				 0x184, 0, 3, 24, 2, BIT(31), 0);
+				 0x184, 0, 3, 24, 3, BIT(31), 0);
 static SUNXI_CCU_M_WITH_MUX_GATE(iep_deu0_clk, "iep-deu0", de_parents,
-				 0x188, 0, 3, 24, 2, BIT(31), 0);
+				 0x188, 0, 3, 24, 3, BIT(31), 0);
 static SUNXI_CCU_M_WITH_MUX_GATE(iep_deu1_clk, "iep-deu1", de_parents,
-				 0x18c, 0, 3, 24, 2, BIT(31), 0);
+				 0x18c, 0, 3, 24, 3, BIT(31), 0);
 
 static const char * const gpu_parents[] = { "pll-gpu", "pll-periph-2x",
 					    "pll-video0", "pll-video1",
-- 
2.56.1

