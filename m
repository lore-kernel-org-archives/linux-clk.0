Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECF643A1E79;
	Fri, 16 Jan 2026 20:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.153.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768594048; cv=none; b=sFMMXmxHOXQoZ/QxgA+voeGgb5LASRbHlJXmaM5gGoHvhBbEh7eaFNYfZls1EiBQKKg+ZnAhQI144yGPsjwSJyn3iLIuBo2Ln1eh/9L7Dsnede6QeZEqxjpDWHoobVZg079D+rznZ9pV/BGxT2gd7RiLVq/ek5ifBlpLlI4Nuc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768594048; c=relaxed/simple;
	bh=Un8zLv2FoiIl5H2AOAWw2PcOrYODM0MvdE9ONc7dFAw=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=OK8VFXM+E5t4gCv3Ams45lqcVthXu6lrKLaZ4JZtsaqrjvDq7dtKs1+33F9RYgpkQMceHQGV/BBe69qm5MJPjcTI1d8nhWDfnYvgoscB9VVR4jNdlu/OH6nowFBQNl8UkIdYX7kOq0badlA+/gw0StYmhTbaJdO5oSeOWJz5Xbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=sQu/2J5E; arc=none smtp.client-ip=68.232.153.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="sQu/2J5E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1768594045; x=1800130045;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Un8zLv2FoiIl5H2AOAWw2PcOrYODM0MvdE9ONc7dFAw=;
  b=sQu/2J5Eprg0nx22j2Vik++X+BMMTeF41v6b6CKn9J3HgT2x1HDHVpdI
   xbK3MEZ1PFeJtNYbdLlYyXXCqYrki19S1m2ZBJ6xopDPWus9JdM8PBuAG
   iRsBpXfUAxzPDqx2ID2wCP0Nps5C+oGg/bdvlbldm0cpjMyLTeKtePM6J
   UXyIczYVSCy6nVoxHqeUTCjpUGbOKQ2UvycT9DrDUKU0Kaqa9dVGjvJaM
   kBOzTc3dli3PPOeqnhu+uumi9w7owp9R8ExV8vQ9rGL+Tam8Kay62XOJk
   Y5pMRqhhrhVPgm2qxLGgLzQCSGTtnRlGGeeZoj8JfJsm0UyA4/pNQd2Va
   Q==;
X-CSE-ConnectionGUID: OTooRcwrRNCxZBlF1StIPQ==
X-CSE-MsgGUID: lGprxQS5S6i7v0+fJcCNYw==
X-IronPort-AV: E=Sophos;i="6.21,232,1763449200"; 
   d="scan'208";a="59042226"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2026 13:07:23 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex3.mchp-main.com (10.10.87.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.29; Fri, 16 Jan 2026 13:07:03 -0700
Received: from ryan-Precision-3630-Tower.microchip.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Fri, 16 Jan 2026 13:07:03 -0700
From: <ryan.wanner@microchip.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <bmasney@redhat.com>,
	<alexander.sverdlin@gmail.com>, <varshini.rajendran@microchip.com>
CC: <cristian.birsan@microchip.com>,
	<balamanikandan.gunasundar@microchip.com>, <linux-clk@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>, "Ryan
 Wanner" <ryan.wanner@microchip.com>
Subject: [PATCH v5 00/31] clk: at91: add support for parent_data and
Date: Fri, 16 Jan 2026 13:06:53 -0700
Message-ID: <cover.1768512290.git.ryan.wanner@microchip.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Ryan Wanner <ryan.wanner@microchip.com>

This series adds support for parent data and parent _hw on the at91
clock drivers. This also updates all the SoC specific clock drivers to
use this format as well.

This is a continuation of the V1 of this series here [1].

This has been tested on the SAMA5* SoCs, the sam9x* SoCs, and the SAMA7*
SoCs.

Changes v1 -> V2:
- Remove all the small sama7g54 SoC driver changes and put them in their
  own patch.
- Add the SAMA7D65 and the SAM9X75 to this update.
- Add a patch to move all common used macros into the pmc.h file.
- Update changes from v6.6 to v6.16.
- Remove patches that where style fixes and include those in the update.

Changes v2 -> v3:
- Adjust each patch so they are fully atomic.
- Add a patch to have the SAMA7D65 systemclocks use parent_data and
  parent_hw.
- Add a formatting cleanup patch for the SAM9X75.
- Adjust commit messages that no longer show invalid information.

Changes v3 -> v4:
- Adjusted the AT91_CLK_PD macros to not use the index and use the name
  and HW.
- Adjust the commit message for the sam9x7 to descibe the changes
  better.
- Remove the usage of clock indexes and use of_clk_get_parent_name().
- Adjust commit messages to better describe the changes.

Changes v4 -> v5:
- Update commit messages to make them more clear.
- Correct formatting issues.
- Remove unnecessary parent_data parameters.
- Remove the incorrect change to the xtal naming.
- Keep the check for the different naming of slow clock.

Claudiu Beznea (28):
  clk: at91: pmc: add macros for clk_parent_data
  clk: at91: clk-sam9x60-pll: use clk_parent_data
  clk: at91: clk-peripheral: switch to clk_parent_data
  clk: at91: clk-main: switch to clk parent data
  clk: at91: clk-utmi: use clk_parent_data
  clk: at91: clk-master: use clk_parent_data
  clk: at91: clk-programmable: use clk_parent_data
  clk: at91: clk-generated: use clk_parent_data
  clk: at91: clk-usb: add support for clk_parent_data
  clk: at91: clk-system: use clk_parent_data
  clk: at91: clk-pll: add support for parent_hw
  clk: at91: clk-audio-pll: add support for parent_hw
  clk: at91: clk-plldiv: add support for parent_data
  clk: at91: clk-h32mx: add support for parent_data
  clk: at91: clk-i2s-mux: add support for parent_data
  clk: at91: clk-smd: add support for clk_parent_data
  clk: at91: clk-slow: add support for parent_data
  clk: at91: dt-compat: switch to parent_hw and parent_data
  clk: at91: sam9x60: switch to parent_hw and parent_data
  clk: at91: sama5d2: switch to parent_hw and parent_data
  clk: at91: sama5d3: switch to parent_data and parent_hw
  clk: at91: sama5d4: switch to parent_data and parent_hw
  clk: at91: at91sam9x5: switch to parent_data and parent_hw
  clk: at91: at91rm9200: switch to parent_hw and parent_data
  clk: at91: at91sam9260: switch to parent_hw and parent_data
  clk: at91: at91sam9g45: switch to parent_data and parent_hw
  clk: at91: at91sam9n12: switch to parent_hw and parent_data
  clk: at91: at91sam9rl: switch to clk_parent_data

Ryan Wanner (3):
  clk: at91: pmc: Move macro to header file
  clk: at91: sam9x75: switch to parent_hw and parent_data
  clk: at91: sama7d65: switch system clocks to parent_hw and parent_data

 drivers/clk/at91/at91rm9200.c       |  79 ++++---
 drivers/clk/at91/at91sam9260.c      | 119 +++++-----
 drivers/clk/at91/at91sam9g45.c      |  73 ++++---
 drivers/clk/at91/at91sam9n12.c      |  90 ++++----
 drivers/clk/at91/at91sam9rl.c       |  49 +++--
 drivers/clk/at91/at91sam9x5.c       | 106 +++++----
 drivers/clk/at91/clk-audio-pll.c    |  28 ++-
 drivers/clk/at91/clk-generated.c    |   8 +-
 drivers/clk/at91/clk-h32mx.c        |  11 +-
 drivers/clk/at91/clk-i2s-mux.c      |   6 +-
 drivers/clk/at91/clk-main.c         |  16 +-
 drivers/clk/at91/clk-master.c       |  24 +--
 drivers/clk/at91/clk-peripheral.c   |  16 +-
 drivers/clk/at91/clk-pll.c          |   9 +-
 drivers/clk/at91/clk-plldiv.c       |  11 +-
 drivers/clk/at91/clk-programmable.c |   8 +-
 drivers/clk/at91/clk-sam9x60-pll.c  |  14 +-
 drivers/clk/at91/clk-slow.c         |   8 +-
 drivers/clk/at91/clk-smd.c          |  10 +-
 drivers/clk/at91/clk-system.c       |   8 +-
 drivers/clk/at91/clk-usb.c          |  41 ++--
 drivers/clk/at91/clk-utmi.c         |  16 +-
 drivers/clk/at91/dt-compat.c        |  80 ++++---
 drivers/clk/at91/pmc.h              |  68 +++---
 drivers/clk/at91/sam9x60.c          | 101 +++++----
 drivers/clk/at91/sam9x7.c           | 323 ++++++++++++++++------------
 drivers/clk/at91/sama5d2.c          | 153 +++++++------
 drivers/clk/at91/sama5d3.c          | 104 +++++----
 drivers/clk/at91/sama5d4.c          | 112 +++++-----
 drivers/clk/at91/sama7d65.c         | 155 +++++++------
 drivers/clk/at91/sama7g5.c          | 111 +++++-----
 31 files changed, 1115 insertions(+), 842 deletions(-)

-- 
2.43.0

