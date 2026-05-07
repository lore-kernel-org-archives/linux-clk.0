Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED8D8399365;
	Thu,  7 May 2026 08:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.153.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778143716; cv=none; b=jFfNNfPSu3H944Qr5K+qiU9an6BEXChpXl1+mdm1d3+SJ36DGUh+DGzCdpPyq3m5Dg3Aw+8cPtVI8K9WEhDg2vGwjakBmmX/HIzPgIQO72zJ2J1+F/DpJR+lju7FYdlP3wLVwuvGuKr8Cp7KVVScKD3rpXAqcYAOFryHc6nVqOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778143716; c=relaxed/simple;
	bh=vPRwvxMb5A9mdiX3Oz9wTv571xXQ5Sv70RbsEc7FkgU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=mj2TD3dOqYXxfc4nwDv4CTJIdSZoN3tXlSTeYMS4w402AnqK4SfVI+2WSQ/MK9x/jWVSkCaSSRV5ASiErpNaDtzWJ7+ZfXXOzJCHNWWw8XPj1RM5hXGMlDAY4FWF5KBWWMFYo14HWujOQ1bQt951FlSFqCDRJxzjeGhhotubgu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=B5kAsUoE; arc=none smtp.client-ip=68.232.153.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="B5kAsUoE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1778143713; x=1809679713;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=vPRwvxMb5A9mdiX3Oz9wTv571xXQ5Sv70RbsEc7FkgU=;
  b=B5kAsUoEtuXpyq3uVcpTtTVrhGprXjh2ICIDMLw2hXLrathBjMZAU6hu
   PTd628Ks6Aan3ZlJOy7VXqnYwOgi1ULk/Hz6S23Wvo8d+2aYylkmWMnst
   BdXCPXGpb6a24kbF00SPxzwwB6+72EkbFo/HxmbaSy2HkQBgKMp5pZ1XQ
   I7Eqbt6D/MhK+RS5MZ2neQcKdkTcVdZRprYCsuUw5Llwi118+rCBZTt3C
   j8gdzKG3pHUeUECDu1fjfEMPMcTw/vd/coOF3NxlOdw8aEPPCvkTF9Cr9
   L4GkuEtVsCLAzfXYL9RTPDNmu9TLtkmoeAQdvSHnNpUeGJEcv7ykixna+
   Q==;
X-CSE-ConnectionGUID: ljsisRZxTBOMkS3YHim8dQ==
X-CSE-MsgGUID: Ig6znDXhROWm1UMuhm6iRw==
X-IronPort-AV: E=Sophos;i="6.23,221,1770620400"; 
   d="scan'208";a="288533272"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 07 May 2026 01:48:22 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Thu, 7 May 2026 01:48:21 -0700
Received: from che-lt-i67131.microchip.com (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Thu, 7 May 2026 01:48:12 -0700
From: Manikandan Muralidharan <manikandan.m@microchip.com>
To: <alexandre.belloni@bootlin.com>, <Frank.Li@nxp.com>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nicolas.ferre@microchip.com>,
	<claudiu.beznea@tuxon.dev>, <linux@armlinux.org.uk>,
	<mturquette@baylibre.com>, <sboyd@kernel.org>, <tytso@mit.edu>,
	<aubin.constans@microchip.com>, <Ryan.Wanner@microchip.com>,
	<romain.sioen@microchip.com>, <durai.manickamkr@microchip.com>,
	<cristian.birsan@microchip.com>, <adrian.hunter@intel.com>,
	<jarkko.nikula@linux.intel.com>, <npitre@baylibre.com>,
	<linux-i3c@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-clk@vger.kernel.org>
CC: <manikandan.m@microchip.com>
Subject: [PATCH v6 0/5] Add microchip sama7d65 SoC I3C support
Date: Thu, 7 May 2026 14:18:00 +0530
Message-ID: <20260507084805.481737-1-manikandan.m@microchip.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Add support for microchip sama7d65 SoC I3C master only IP which is
based on mipi-i3c-hci from synopsys implementing version 1.0
specification. The platform specific changes are integrated in the
mipi-i3c-hci driver using existing quirks

I3C in master mode supports up to 12.5MHz, SDR mode data transfer in
mixed bus mode (I2C and I3C target devices on same i3c bus).

Please refer to the individual patches for changelogs.

base-commit: 8ab992f815d6736b5c7a6f5fd7bfe7bc106bb3dc

Durai Manickam KR (2):
  clk: at91: sama7d65: add peripheral clock for I3C
  ARM: dts: microchip: add I3C controller

Manikandan Muralidharan (3):
  dt-bindings: i3c: mipi-i3c-hci: add Microchip SAMA7D65 compatible
  i3c: mipi-i3c-hci: add microchip sama7d65 SoC compatible with the
    required quirk
  ARM: configs: at91: sama7: add sama7d65 i3c-hci

 .../devicetree/bindings/i3c/mipi-i3c-hci.yaml | 27 ++++++++++++++++---
 arch/arm/boot/dts/microchip/sama7d65.dtsi     |  8 ++++++
 arch/arm/configs/sama7_defconfig              |  2 ++
 drivers/clk/at91/sama7d65.c                   |  1 +
 drivers/i3c/master/mipi-i3c-hci/core.c        | 10 +++++++
 5 files changed, 44 insertions(+), 4 deletions(-)

-- 
2.25.1

