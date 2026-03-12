Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 717A235A3B9;
	Thu, 12 Mar 2026 04:22:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.153.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773289322; cv=none; b=U8b6APnEHXdXgJbV6IslQt3+hEJBtsq4+Zeq8AucIPfxQ+LZDNg6s4g8EYmdq9lw+EIWoa3JDgz9dAQVqO9veEf79h2Lou0ZZ6knM7QBcOCqyeRdT8MGCmPCuB98EYBWLxU6ylrNQfMl/9BJdTBgWtIlzKNXG5ZXCXLrArcs+80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773289322; c=relaxed/simple;
	bh=KhmIAgIkXR/FVGhINWVvBX+bl1GcxmHxs9BhpZObeTQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=D/gs+HlHb113chR3zEfKlN40WTa6MAe1foCsRwLWQ9qbBBP8PiF/CiA/MPFiTWVcpI74L2PW6i5ict3h0VOg377qDktYRyhH+irhOLcc/mLjKSjKaeIzuMDVoyBg2oXcxZ+ufaILCbofTtd1UWcT1OjEFQmDlsM2COw3b4uiKQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=PeVlUOU9; arc=none smtp.client-ip=68.232.153.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="PeVlUOU9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1773289322; x=1804825322;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=KhmIAgIkXR/FVGhINWVvBX+bl1GcxmHxs9BhpZObeTQ=;
  b=PeVlUOU9fYaqafbay8M2AxwNWo6O6tyrn5kyKC0jsXnRmwKVz2RMyOun
   Nm7Nyn84X/FmWw5+VJAc+NZID08DO/FtHSnf/uOp/FwOCE7o041GoNUAw
   c32iYm9ev+/fz1/u/6XtQBtTz7JCMp8wKyEAq9rDUBcwZ2p1L3MFFj+Dg
   LxMGX+ehaLTNXloWuwPAlUmkqopbAushPPABVcxmgnqaoQKG6lhjS8XX1
   YoJCD1tUZ5af2jmtpC/D6w2yHhIzHn60+jcZa+d4tSY6OIgW3bnP946ft
   jUCBwYpvcxzLhScGQIqj2wBUeJ442xxSEiUpH3Nxd/xVCEhFn02e1J0Ju
   w==;
X-CSE-ConnectionGUID: b4F98pPuQMeYoHXJAA3Q6w==
X-CSE-MsgGUID: mp8RutGHQciMn0LqiiVDkQ==
X-IronPort-AV: E=Sophos;i="6.23,115,1770620400"; 
   d="scan'208";a="285933284"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2026 21:22:01 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.87.151) by
 chn-vm-ex1.mchp-main.com (10.10.87.30) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.35; Wed, 11 Mar 2026 21:21:58 -0700
Received: from che-lt-i67131.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Wed, 11 Mar 2026 21:21:49 -0700
From: Manikandan Muralidharan <manikandan.m@microchip.com>
To: <alexandre.belloni@bootlin.com>, <Frank.Li@nxp.com>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nicolas.ferre@microchip.com>,
	<claudiu.beznea@tuxon.dev>, <linux@armlinux.org.uk>,
	<mturquette@baylibre.com>, <sboyd@kernel.org>, <ardb@kernel.org>,
	<ebiggers@google.com>, <martin.petersen@oracle.com>, <tytso@mit.edu>,
	<cristian.birsan@microchip.com>, <adrian.hunter@intel.com>,
	<jarkko.nikula@linux.intel.com>, <kees@kernel.org>, <npitre@baylibre.com>,
	<linux-i3c@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-clk@vger.kernel.org>
CC: <manikandan.m@microchip.com>, Durai Manickam KR
	<durai.manickamkr@microchip.com>
Subject: [PATCH v3 5/5] ARM: configs: at91: sama7: add sama7d65 i3c-hci
Date: Thu, 12 Mar 2026 09:50:56 +0530
Message-ID: <20260312042056.309237-6-manikandan.m@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260312042056.309237-1-manikandan.m@microchip.com>
References: <20260312042056.309237-1-manikandan.m@microchip.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Durai Manickam KR <durai.manickamkr@microchip.com>

Enable the configs needed for I3C framework and microchip
sama7d65 i3c-hci driver.

Signed-off-by: Durai Manickam KR <durai.manickamkr@microchip.com>
Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
---
 arch/arm/configs/sama7_defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/configs/sama7_defconfig b/arch/arm/configs/sama7_defconfig
index e2ad9a05566f..a59b262e48e1 100644
--- a/arch/arm/configs/sama7_defconfig
+++ b/arch/arm/configs/sama7_defconfig
@@ -115,6 +115,8 @@ CONFIG_HW_RANDOM=y
 CONFIG_I2C=y
 CONFIG_I2C_CHARDEV=y
 CONFIG_I2C_AT91=y
+CONFIG_I3C=y
+CONFIG_MIPI_I3C_HCI=y
 CONFIG_SPI=y
 CONFIG_SPI_ATMEL=y
 CONFIG_SPI_ATMEL_QUADSPI=y
-- 
2.25.1

