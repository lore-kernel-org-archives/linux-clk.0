Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C83E73ACA77;
	Tue,  5 May 2026 07:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.154.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777965224; cv=none; b=RsPGz1m/kWvwDClKw0r2fhTWXOuqatu47nag8GIT4mllSdjRWDzznWiIBjyGBYb20prjGLqen+x2HaIOSWZWRJFsc6hYTGWiw7bUW5jBjGUJ94sMib8Ll8K1Kn/bb76POZcjyN2HJKKS2Mw2xu+uz65ThzZeHElF0hXejS6BjKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777965224; c=relaxed/simple;
	bh=iwXssjVwXEDAaIusnOPanGw93zeO92i+J3UbzMTOgxg=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=tALpdPr9nUAJd5pO6fWCpxTts11qLfItlxCRbNHfNDtmpfvyrAye/WthFSx6WiCRvzpd6jeZ0XVnIUlk1wQUGshcGtrjDI3PsoojeQAYwWAxrdTsboy4ZSSvD+V+ZePqjZ2H1NXy2VkN30WgBqp2Njcd2cxWSzi9P4UW1Lb/Reo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=aUt7hcQF; arc=none smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="aUt7hcQF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1777965223; x=1809501223;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=iwXssjVwXEDAaIusnOPanGw93zeO92i+J3UbzMTOgxg=;
  b=aUt7hcQF6RcCA+WbDcHlpEgtiO1Zh6togUueobzA4oiBEJBQhgsPA464
   BBOBx7UG+R2JbsKMUlL3GcYNHVjIQUkS9/xlfBFf/ochjKK2LxgQdaQXP
   4/Z0TS1Xokrsx6Qei03zkWGQAVgYEJMXeguZkWJXBKZCe/r9EM4SZ0HQk
   w4amG+ajTbYz2dAz/QBNKgcIl5dDi1QmNcgsG15biKTPyUQ4tCedysMh1
   3hWMYZkh8Fd4ojwNWqM464B/QFy/M5nR+nVv09furloHLqbEk285alVGf
   MPnFsLMtBjtwsqGB/Q2XhTcF84yYYDB5kpexe2GpGNUdJjGfgV3BRBwxY
   g==;
X-CSE-ConnectionGUID: PjmAzx6DT7WFLSUsQRH7eQ==
X-CSE-MsgGUID: y95fZyx9Qz2BMZILXZ8CqQ==
X-IronPort-AV: E=Sophos;i="6.23,217,1770620400"; 
   d="scan'208";a="57457000"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2026 00:13:42 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.87.152) by
 chn-vm-ex1.mchp-main.com (10.10.87.30) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.37; Tue, 5 May 2026 00:13:41 -0700
Received: from che-lt-i67131.microchip.com (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Tue, 5 May 2026 00:13:33 -0700
From: Manikandan Muralidharan <manikandan.m@microchip.com>
To: <alexandre.belloni@bootlin.com>, <Frank.Li@nxp.com>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nicolas.ferre@microchip.com>,
	<claudiu.beznea@tuxon.dev>, <linux@armlinux.org.uk>,
	<mturquette@baylibre.com>, <sboyd@kernel.org>, <Ryan.Wanner@microchip.com>,
	<tytso@mit.edu>, <romain.sioen@microchip.com>,
	<aubin.constans@microchip.com>, <cristian.birsan@microchip.com>,
	<adrian.hunter@intel.com>, <jarkko.nikula@linux.intel.com>,
	<npitre@baylibre.com>, <linux-i3c@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-clk@vger.kernel.org>
CC: <manikandan.m@microchip.com>
Subject: [PATCH v5 0/5] Add microchip sama7d65 SoC I3C support
Date: Tue, 5 May 2026 12:43:22 +0530
Message-ID: <20260505071327.125787-1-manikandan.m@microchip.com>
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

Durai Manickam KR (3):
  clk: at91: sama7d65: add peripheral clock for I3C
  ARM: dts: microchip: add I3C controller
  ARM: configs: at91: sama7: add sama7d65 i3c-hci

Manikandan Muralidharan (2):
  dt-bindings: i3c: mipi-i3c-hci: add Microchip SAMA7D65 compatible
  i3c: mipi-i3c-hci: add microchip sama7d65 SoC compatible with the
    required quirk

 .../devicetree/bindings/i3c/mipi-i3c-hci.yaml | 27 ++++++++++++++++---
 arch/arm/boot/dts/microchip/sama7d65.dtsi     |  8 ++++++
 arch/arm/configs/sama7_defconfig              |  2 ++
 drivers/clk/at91/sama7d65.c                   |  1 +
 drivers/i3c/master/mipi-i3c-hci/core.c        | 10 +++++++
 5 files changed, 44 insertions(+), 4 deletions(-)

-- 
2.25.1

