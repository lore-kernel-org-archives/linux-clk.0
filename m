Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB5124AED7
	for <linux-clk@vger.kernel.org>; Fri,  3 May 2024 15:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714750413; cv=none; b=uSZRGy0pvHN1rMu0qIyfgWQrIhb2mr9Po+2M6dYWFLg6P8Y6NcQcYA5l1LrMr0R8PIwm46BysHLMnj7uDG4MwLRaniVphWWNuwn8Jm8K++JNWCVW2iFnf6e78POtZKQSaSZ0QTX8OlbAvoFNedpR7Ur9J79VOPpSIcWinbPL3hg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714750413; c=relaxed/simple;
	bh=Le5NmeIM+Ofm1e9d7qcplMsBaC4rT6jerv9cueSAzr8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=mLpOE1tMRq51HqRqQPLBbx2mvl1fvMKjVlVhh1cl2a81S0eVawVG64j5q0Thzc+haTz10BMwO3tS/3/tUf6CpX7a9b4Yo/hOT+Eu3eLJ7D6N9kdfye35zCuu+E0suMStzbM29WvK8xNQuREBf7egbQ0MpuUZK53w+/kSLbX21T8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <l.stach@pengutronix.de>)
	id 1s2uuf-0000tI-OL; Fri, 03 May 2024 17:33:29 +0200
Received: from [2a0a:edc0:0:1101:1d::28] (helo=dude02.red.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <l.stach@pengutronix.de>)
	id 1s2uuf-00FjKU-7x; Fri, 03 May 2024 17:33:29 +0200
From: Lucas Stach <l.stach@pengutronix.de>
To: Heiko Stuebner <heiko@sntech.de>
Cc: linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	kernel@pengutronix.de,
	patchwork-lst@pengutronix.de
Subject: [PATCH] clk: rockchip: rk3568: Add PLL rate for 724 MHz
Date: Fri,  3 May 2024 17:33:29 +0200
Message-Id: <20240503153329.3906030-1-l.stach@pengutronix.de>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-clk@vger.kernel.org

This rate allows to provide a low-jitter 72,4 MHz pixelclock
for a custom eDP panel from the VPLL.

Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
---
 drivers/clk/rockchip/clk-rk3568.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/rockchip/clk-rk3568.c b/drivers/clk/rockchip/clk-rk3568.c
index 8cb21d10beca..292f2ef32958 100644
--- a/drivers/clk/rockchip/clk-rk3568.c
+++ b/drivers/clk/rockchip/clk-rk3568.c
@@ -64,6 +64,7 @@ static struct rockchip_pll_rate_table rk3568_pll_rates[] = {
 	RK3036_PLL_RATE(912000000, 1, 76, 2, 1, 1, 0),
 	RK3036_PLL_RATE(816000000, 1, 68, 2, 1, 1, 0),
 	RK3036_PLL_RATE(800000000, 3, 200, 2, 1, 1, 0),
+	RK3036_PLL_RATE(724000000, 3, 181, 2, 1, 1, 0),
 	RK3036_PLL_RATE(700000000, 3, 350, 4, 1, 1, 0),
 	RK3036_PLL_RATE(696000000, 1, 116, 4, 1, 1, 0),
 	RK3036_PLL_RATE(600000000, 1, 100, 4, 1, 1, 0),
-- 
2.39.2

