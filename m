Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4879363C5C;
	Mon,  9 Mar 2026 07:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.154.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773042845; cv=none; b=RC3hBqVRSbjC/8gv9wcvyGaUPslCo0Y8q3Z+CxLWA2Q8nAr0lZTgXGSaSA4RvwmKUZj0rckJ8zarVZT46dRiSp1FoxSp1lWzVnIocD6BwaipikPXMN+jV2y0rBUMm7q2v1mtrWORA8wrhIPj7vt+QaFi55No62cjOj0DGfyEIHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773042845; c=relaxed/simple;
	bh=QntaU4iicWXzgHMvjcDEMFDc8eb5pgaNlUYW7f+yomU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=M7KHcpQsM/SXTgrllKSH+aIajRz+9lKKvMbpkmiVJ0Hu7MgcKO4P8KemwQy4zp6xIyWDco5DvVHcXs6QViQOXbZuGg0jnC+7AJroSSkwwgQLWqmzLES1vkwD5OAjy9kkF7+LJL7U6JuGEMtteOCwYPB6MrS0lorjRuK+aJ8ZHFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=ub0DNSq9; arc=none smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="ub0DNSq9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1773042843; x=1804578843;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=QntaU4iicWXzgHMvjcDEMFDc8eb5pgaNlUYW7f+yomU=;
  b=ub0DNSq9SS4O9xiRka4RHZumZ4IOzH0V/gyWhMc4FUU18Ao8xb/22+cv
   Nge4hXFlVPudjBV1pChY6wyxl69UVLKe2VSu0gpsz0kLGGiaNqfQbPsZn
   jGeCCtB5Uwxfij7qbY7nGaiGYSo++S1Rv21TBTGryIztpo2m9pmjnZvq3
   kUrdw8Kypq04956VHV/sG7hf5p06t+P9vF0jEdC/FsKxnyd54PISEDdFf
   mBbUPVlwDzPVuVGdUs9ukb8HWRK7wS+vspJtJMJcbE4S5IEn7GU5xqs+P
   ddnhG0mHqf+XbbyYeIcBTkpAJYkIMbwdPQYMoNOtNWB7EZgqsiQG9D6Wq
   w==;
X-CSE-ConnectionGUID: u8JTaPxxQWWCViC89H2kCA==
X-CSE-MsgGUID: PkjVoswoS9OuKpH23vt/kQ==
X-IronPort-AV: E=Sophos;i="6.23,109,1770620400"; 
   d="scan'208";a="54818266"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 09 Mar 2026 00:53:56 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Mon, 9 Mar 2026 00:53:45 -0700
Received: from archlinux.mchp-main.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Mon, 9 Mar 2026 00:53:42 -0700
From: Mihai Sain <mihai.sain@microchip.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <varshini.rajendran@microchip.com>,
	<cristian.birsan@microchip.com>, <balamanikandan.gunasundar@microchip.com>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <linux-clk@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<ryan.wanner@microchip.com>, Mihai Sain <mihai.sain@microchip.com>
Subject: [PATCH v3 0/4] Update gmac clocks and devicetree for sam9x7 mpu
Date: Mon, 9 Mar 2026 09:53:25 +0200
Message-ID: <20260309075329.1528-1-mihai.sain@microchip.com>
X-Mailer: git-send-email 2.53.0
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

Changelog:

v2 -> v3:
- Rework patch 1 and 3 based on Claudiu's comments

v1 -> v2:
- Add only one patch for devicetree with detailed description

Mihai Sain (4):
  clk: at91: sam9x7: Remove gmac peripheral clock with ID 67
  clk: at91: sam9x7: Rename macb0_clk to gmac_clk
  clk: at91: sam9x7: Fix gmac_gclk clock definition
  ARM: dts: microchip: sam9x7: fix GMAC clock configuration

 arch/arm/boot/dts/microchip/sam9x7.dtsi |  6 +++---
 drivers/clk/at91/sam9x7.c               | 21 ++++++++++-----------
 2 files changed, 13 insertions(+), 14 deletions(-)


base-commit: 11439c4635edd669ae435eec308f4ab8a0804808
-- 
2.53.0

