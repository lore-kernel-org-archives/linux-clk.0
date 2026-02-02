Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 670DD35B631;
	Mon,  2 Feb 2026 10:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.154.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770028949; cv=none; b=OXLi7DJ283zhSDgjsZnzCs5rpR70RdW78X2WW84xdZVaNrE6MYyp3bKKIAILZqyNcQmL9f/UkZ2QE3bmNOVJpUF53D9tSbHe+lqWK5lIDqOzdRfDhoKqT5K3pgbhz993gFuFkpMbIEYnt3zVaKtIyKrOvSf6hZHYcHQOkXTL1SQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770028949; c=relaxed/simple;
	bh=+QWneqm1Q/Y2a3cTEPQgF9g6VaX9xp5QUX4JxM6PcQ0=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=YMFcr9Y3VntWW/SVQwhBAdUsLrOS0qkj1GKRFYQxoU/kNlIpO3gnjK4PerbxzMrxM1ITwkzpJTifCR3RN27fjev123O7Ae4NeP0E4TMeg5UCue7mX9uqJb6QZICJcbq893GaJKoYnYeR/4VIQroYCf2zJFGnBg55IOYyJT/5bsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=D9W/8xgi; arc=none smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="D9W/8xgi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1770028945; x=1801564945;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=+QWneqm1Q/Y2a3cTEPQgF9g6VaX9xp5QUX4JxM6PcQ0=;
  b=D9W/8xgimYEkuBlOQ6rMqvoqsJ4tnkw+Qzybmuv5WJuUA0JJ1BS/wQmF
   2xoOD5xc2QzueHMIxAD+63yTzB0nMDHBr+tIwRrV/KDSPLDoGXJ8WAPoa
   9FcxdL2EfbS3y9gqM4VkBIyTbg1TWjw1hlRw65JfVVfpPjR3YX8a/vhyY
   5vQBlUYsk2WJzKffHWjMWyu/LeQmwEa4BRKLa1SyTGERtnYdkdKT7pRBp
   fEMI6ddOexasHnmyueAcfRg0dNIwIRJmP/OqI+JcGFzN34sXDqcXSCz+T
   kN30odT4IQ7p7O+AUxFy0KxffEQFX/ZZgr582avdfKIRgK2pmeopZIMmd
   Q==;
X-CSE-ConnectionGUID: 2J4f9FGyT5aY3iXJDJsmSA==
X-CSE-MsgGUID: nRUCAZQdTA6d9YeaU+9MPw==
X-IronPort-AV: E=Sophos;i="6.21,268,1763449200"; 
   d="scan'208";a="220077085"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2026 03:41:16 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.87.152) by
 chn-vm-ex1.mchp-main.com (10.10.87.30) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.35; Mon, 2 Feb 2026 03:40:37 -0700
Received: from archlinux.mchp-main.com (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Mon, 2 Feb 2026 03:40:34 -0700
From: Mihai Sain <mihai.sain@microchip.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <varshini.rajendran@microchip.com>,
	<cristian.birsan@microchip.com>, <balamanikandan.gunasundar@microchip.com>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <linux-clk@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<ryan.wanner@microchip.com>, Mihai Sain <mihai.sain@microchip.com>
Subject: [PATCH 0/5] Update gmac clocks and devicetree for sam9x7 mpu
Date: Mon, 2 Feb 2026 12:40:20 +0200
Message-ID: <20260202104025.3781-1-mihai.sain@microchip.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

This series updates the GMAC clock configuration for the
SAM9X7 family. The current clock definitions contain inconsistencies
around the GMAC peripheral and its associated generic clock IDs, which
lead to incorrect wiring in both the clock driver and the devicetree.

Mihai Sain (5):
  clk: at91: sam9x7: Remove gmac peripheral and generic clock entries with ID 67
  clk: at91: sam9x7: Rename macb0_clk to gmac_clk
  clk: at91: sam9x7: Add gmac generic clock entry with ID 24
  ARM: dts: microchip: sam9x7: Remove the tx_clk from gmac node
  ARM: dts: microchip: sam9x7: Update the tsu_clk to use the generic clock with ID 24

 arch/arm/boot/dts/microchip/sam9x7.dtsi |  6 +++---
 drivers/clk/at91/sam9x7.c               | 21 ++++++++++-----------
 2 files changed, 13 insertions(+), 14 deletions(-)


base-commit: 18f7fcd5e69a04df57b563360b88be72471d6b62
-- 
2.52.0

