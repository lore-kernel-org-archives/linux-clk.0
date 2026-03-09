Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58AA4366817;
	Mon,  9 Mar 2026 07:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.153.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773042871; cv=none; b=CW7RPpmSEIVbC7sDWrOpxG+TdH7Gf6JI18ynzv9GtSsFWAraszs3TgGLvnY4liQP31pVS22NY9wC/EjlRoz1W4V8Bzgv3FO51QXwvNUyXY3FQAK/VDmFlhVW4oJxcKvFzhIsx+4siwX6mzvlFe+DJQmFzLAtrkMkxKYd+n1Tknw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773042871; c=relaxed/simple;
	bh=WF17STSmbvctX89fLvoNysQ2fmO08+e+Vz1+yaw54WQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=B+qykgxfOAkemKHiElCfgnh8t5BHD4C30ts6TTm/T2f1VMZ1qVZMg2XC2v9MxSiueSDU74BA8oQPO10ezWTI7/Nz35yuoIGBM8qxFLBepRSpA3a6WOdxu/Hsv2F1sdysAhrKfr6iXbIIW63AMqH+feZcauW/58GJZC54c1CTQv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=nzqCPAjT; arc=none smtp.client-ip=68.232.153.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="nzqCPAjT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1773042870; x=1804578870;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=WF17STSmbvctX89fLvoNysQ2fmO08+e+Vz1+yaw54WQ=;
  b=nzqCPAjTkeab83vVlUAonQYDezCQstRpjLpVuNdN41fNT1rBC7W+XbpK
   YoXcpfy2kEKabAyzlwmtFQo4FvuTF/KwEO/5EF1aNWMtqGBrtARvyq1on
   pPK5zm7h92dMSSA99UCfsM1iag8eOgrpENS8sR8/zmdezDZ1S/IGTO1Ey
   ZCyU6C4zAWSvPcRiWfQbX09Z/wmFO+Se/INIk17FAxOBivgtDhawT3uC6
   FE0LCQMOBso38XcDtqSs8vHjkjBYQLv/WSyLSh/3M/rVuU7za4Ot4n96U
   3Rf21sbvSR66yL3PtHGDXNB2cTHSQAUf7hsJAqB0/Rbhr2XSQo3vE9fDW
   w==;
X-CSE-ConnectionGUID: MQLX6i0wSQyzKKrNx9vzaw==
X-CSE-MsgGUID: a1zaP8o4T+mQSEDjrmPJpA==
X-IronPort-AV: E=Sophos;i="6.23,109,1770620400"; 
   d="scan'208";a="285774736"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2026 00:54:24 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex2.mchp-main.com (10.10.87.31) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.35; Mon, 9 Mar 2026 00:53:53 -0700
Received: from archlinux.mchp-main.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Mon, 9 Mar 2026 00:53:49 -0700
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
Date: Mon, 9 Mar 2026 09:53:27 +0200
Message-ID: <20260309075329.1528-3-mihai.sain@microchip.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260309075329.1528-1-mihai.sain@microchip.com>
References: <20260309075329.1528-1-mihai.sain@microchip.com>
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

