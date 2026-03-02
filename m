Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B84A335066;
	Mon,  2 Mar 2026 14:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.154.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772461266; cv=none; b=NXEzIpW2Ef2KhKHJ26dMkXcT+1byJRbhsaOFN0l4mSoE2RYVxSryQ5vOuwLucnxeTIyce4jrtkJNrL5m82pOtujHwkWEYdQNF04xjP0E3nzTxLFu0mEjLQbtavAXev2sFK2QKkCist2VZdQXUZ9obqR02Nss/Kr7PHs7SD/1jIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772461266; c=relaxed/simple;
	bh=WF17STSmbvctX89fLvoNysQ2fmO08+e+Vz1+yaw54WQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eA6uZ/bqR3x4JP0klCDw0clK6pQqnOCa0Npn20BiyTee4KMs3XqNVI9KZX8zNAJSyBmmmVzvBr5E6PrFFSX0SOOIfis1M200dpsJFvJF2rCffhLvn+NNBm9mewZFWEyeyd42YudHgh8sX8ucajGfiQddl6dFxfz+7x6k92CsoBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=0yT+/LNF; arc=none smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="0yT+/LNF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1772461265; x=1803997265;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=WF17STSmbvctX89fLvoNysQ2fmO08+e+Vz1+yaw54WQ=;
  b=0yT+/LNFAVEOtoL5r2C2IR7nruNxfdhwRgQw7Dccxb9ybhzV1o3TN2aX
   xpisOqBX8XbMo2leIO0pFXyParyj6WvRelnIZdpKJJtR63p4G4TJbhVrc
   Oeg2eRAQ8G5hrU+D4QO8Fm55acInC1MdXP8Pmf0VZY3WqEAxfIpxgSqCN
   ZOwbaqAytETm1x1+MTlznzuh4hCm9hf26kQh7U9zE55l5Zfdkd9nUFOqV
   VfLAE2CitN33TAfsohGou6ju/UwGkbSnfMYn/VcI5W6HD5oueKYiM+dcd
   4r2bEZcA3+vU1eHqfTw5yf4MqxaiK8tmAe9J9m5OvyQpzO4bmJ2tLUbYY
   A==;
X-CSE-ConnectionGUID: QKICduWAQ5ynFNkWd4cNxQ==
X-CSE-MsgGUID: /DLabcaGQkCQ3gmxXwN0Pg==
X-IronPort-AV: E=Sophos;i="6.21,320,1763449200"; 
   d="scan'208";a="221349854"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2026 07:20:57 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.87.151) by
 chn-vm-ex3.mchp-main.com (10.10.87.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.35; Mon, 2 Mar 2026 07:20:25 -0700
Received: from archlinux.mchp-main.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Mon, 2 Mar 2026 07:20:21 -0700
From: Mihai Sain <mihai.sain@microchip.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <varshini.rajendran@microchip.com>,
	<cristian.birsan@microchip.com>, <balamanikandan.gunasundar@microchip.com>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <linux-clk@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<ryan.wanner@microchip.com>, Mihai Sain <mihai.sain@microchip.com>
Subject: [PATCH v3 2/4] clk: at91: sam9x7: Rename macb0_clk to gmac_clk
Date: Mon, 2 Mar 2026 16:20:06 +0200
Message-ID: <20260302142008.3253-3-mihai.sain@microchip.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260302142008.3253-1-mihai.sain@microchip.com>
References: <20260302142008.3253-1-mihai.sain@microchip.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Update the peripheral clock name for ID 24 from macb0_clk to gmac_clk
to match the actual GMAC hardware block present on SAM9X7 SoCs.
This aligns the clock naming with the device tree and avoids confusion
with legacy MACB controllers.

Signed-off-by: Mihai Sain <mihai.sain@microchip.com>
---
 drivers/clk/at91/sam9x7.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/at91/sam9x7.c b/drivers/clk/at91/sam9x7.c
index 66aadebc51a4..32c082b4ca4b 100644
--- a/drivers/clk/at91/sam9x7.c
+++ b/drivers/clk/at91/sam9x7.c
@@ -387,7 +387,7 @@ static const struct {
 	{ .n = "dma0_clk",	.id = 20, },
 	{ .n = "uhphs_clk",	.id = 22, },
 	{ .n = "udphs_clk",	.id = 23, },
-	{ .n = "macb0_clk",	.id = 24, },
+	{ .n = "gmac_clk",	.id = 24, },
 	{ .n = "lcd_clk",	.id = 25, },
 	{ .n = "sdmmc1_clk",	.id = 26, },
 	{ .n = "ssc_clk",	.id = 28, },
-- 
2.53.0

