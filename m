Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 178C0395D8E;
	Thu, 12 Mar 2026 04:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.154.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773289303; cv=none; b=IAeDO+or2xyv7u5zjyls+Mk/P9zuSYUono6gRZ6hF+4ndl18sd/7AOInZ103g6uwfLePr5QsgoVaU8msC1vTZPSw3n7aiIGSupNTZCJbGHRGMPq9cRDar/oQP+dmeSFqKj5PD3fl9LrjYf3x4DmSmoxxKVgru9R6igHQEykTeyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773289303; c=relaxed/simple;
	bh=wdI0p60YaCgXLrj/iUxMmmz6VvOV20Yk+z+tHEbhKv8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=S27oWu9z8qgb/ekRWgKKG9KQjwpU+j9gcCrnQ3yg8KF62wNM1nwxuQiRzAxHU/Tt8CsCiifUdhGGHzkoSiu3HLv36aL6NPxMYq+xNiFwIq7Y/JKRmQRmCTbw6F0OmK2JMzBdETmi9jgu/DRsUQ2XrMSsZBOXgZccxwE6KDSGlyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=uEhaaQFo; arc=none smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="uEhaaQFo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1773289300; x=1804825300;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=wdI0p60YaCgXLrj/iUxMmmz6VvOV20Yk+z+tHEbhKv8=;
  b=uEhaaQFoyjRmOSbGfLMETHyPCka7BTAXvB/MGeMlmFBrlXXcfbSyBFfY
   QjBNuDPFC/8oRdWNi+Ynz6XfXUYsHGq2PlHLfB6zRjmc9N1bkTEuPgbhd
   jszAqMmlRfhqqNVZKecQhPQZIAehm2lqlnI3tc5wcYo3NgI5ixfbeEijJ
   SzIstMOnPE4NCK1A16HETIesbVhdw7r2Kh52fMW4v8udBRcvuPOjCfgx9
   Ti8eq49QXm9OyF9KPvbJhnB4VcNJnzc0vP+c7htDXHxDwmhOm5n/wr8E7
   BWRnQHIpQ3AWD44KIVrgfh8CSLV1KIrrXtzcAgLFIDZoEe+U4r1HzEBMt
   Q==;
X-CSE-ConnectionGUID: uJrHAOLBREOlPHbMYZOtwQ==
X-CSE-MsgGUID: R7IJWLvAS6qm15x3KGqO0g==
X-IronPort-AV: E=Sophos;i="6.23,115,1770620400"; 
   d="scan'208";a="53801522"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 11 Mar 2026 21:21:39 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Wed, 11 Mar 2026 21:21:10 -0700
Received: from che-lt-i67131.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Wed, 11 Mar 2026 21:21:02 -0700
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
CC: <manikandan.m@microchip.com>
Subject: [PATCH v3 0/5] Add microchip sama7d65 SoC I3C support
Date: Thu, 12 Mar 2026 09:50:51 +0530
Message-ID: <20260312042056.309237-1-manikandan.m@microchip.com>
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
existing mipi-i3c-hci driver by introducing a quirk

I3C in master mode supports up to 12.5MHz, SDR mode data transfer in
mixed bus mode (I2C and I3C target devices on same i3c bus).

Durai Manickam KR (3):
  clk: at91: sama7d65: add peripheral clock for I3C
  ARM: dts: microchip: add I3C controller
  ARM: configs: at91: sama7: add sama7d65 i3c-hci

Manikandan Muralidharan (2):
  dt-bindings: i3c: mipi-i3c-hci: add Microchip SAMA7D65 compatible
  i3c: mipi-i3c-hci: add microchip sama7d65 SoC compatible with the
    appropriate quirk

 .../devicetree/bindings/i3c/mipi-i3c-hci.yaml | 22 +++++++++++++++----
 arch/arm/boot/dts/microchip/sama7d65.dtsi     |  8 +++++++
 arch/arm/configs/sama7_defconfig              |  2 ++
 drivers/clk/at91/sama7d65.c                   |  1 +
 drivers/i3c/master/mipi-i3c-hci/core.c        | 12 ++++++++++
 drivers/i3c/master/mipi-i3c-hci/hci.h         |  4 ++++
 6 files changed, 45 insertions(+), 4 deletions(-)

-- 
2.25.1

