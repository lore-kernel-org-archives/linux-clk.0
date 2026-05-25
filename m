Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8878039A80E;
	Mon, 25 May 2026 09:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.153.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779701129; cv=none; b=RpGY/0dAcU6iHSzJeaXhdhVqpqm0R3rj55/Ql0uSUGFO4RWu78y7ek/gA0oFnuDZg0s+tmERH0dzyAIIaBzsazW0h/CfQwey+ghXSGccjviDWepUvYLcC3sY4OAGjWsHarUE5a69fLh1BKloZC6QzBudp/iC1fB7AuvvTDQ5nAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779701129; c=relaxed/simple;
	bh=7CxDZVVmjINNZ+C53/a94GTagFviQSU25grn7lkf6Eo=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=TRq8ujUm4qSKhSBS2WzwoGOSGUCQzUILNhmSdPdUwgzoosD3KQx1YkMDkmt6YIOPnDMTDg1bQ2sMHmdTRubZ2G4nU6MysSVa4T7SpL9cpgehQOtfEWYAN74sFA24OkLlGEANR3BOJ72mX+csCYUnbO+VEdnxZSW7LdP9ehR4QVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=Ou8sHegU; arc=none smtp.client-ip=68.232.153.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="Ou8sHegU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1779701129; x=1811237129;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=7CxDZVVmjINNZ+C53/a94GTagFviQSU25grn7lkf6Eo=;
  b=Ou8sHegUrJxPzL+HOwf9m0kBJRtatXgUWQU0dffqr5uHNBRzcJ4/uisQ
   7RfRcQt9GwwWF0mZPXGGGWTp15orc8Ff7HqfsL++l7QQjhcNJh1qQwtLC
   JkZymq+M3v9jjoyfxanQeHkruFvZGUGmINkKxp4GZZssDH/m68uLgBJpP
   nvDQFNRJWuC+OWVywG7YfhjBevH/+GZF5CJBRHvlhHfL32zMimoWQXKul
   OgjITN3hlR8k2o6kbmxT/bA5+kGz7xDt33e6Kb7tm4gZUegJmHKMuxpXP
   bzpqZhWQLHVBO8XZRjLllGQfW4KTdOtKEzl2Bbj9x4uIdtPN0NzABHW0U
   A==;
X-CSE-ConnectionGUID: wvjAqM3FQdeLmQ7dIPVoPw==
X-CSE-MsgGUID: YkXV8BsvQQ+4KBfx+XgkPA==
X-IronPort-AV: E=Sophos;i="6.24,167,1774335600"; 
   d="scan'208";a="289388351"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 25 May 2026 02:24:21 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Mon, 25 May 2026 02:24:20 -0700
Received: from che-lt-i67131.microchip.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Mon, 25 May 2026 02:24:12 -0700
From: Manikandan Muralidharan <manikandan.m@microchip.com>
To: <alexandre.belloni@bootlin.com>, <Frank.Li@nxp.com>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nicolas.ferre@microchip.com>,
	<claudiu.beznea@tuxon.dev>, <linux@armlinux.org.uk>,
	<mturquette@baylibre.com>, <sboyd@kernel.org>, <bmasney@redhat.com>,
	<aubin.constans@microchip.com>, <Ryan.Wanner@microchip.com>,
	<romain.sioen@microchip.com>, <tytso@mit.edu>,
	<cristian.birsan@microchip.com>, <adrian.hunter@intel.com>,
	<npitre@baylibre.com>, <linux-i3c@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-clk@vger.kernel.org>
CC: Manikandan Muralidharan <manikandan.m@microchip.com>
Subject: [PATCH v7 0/5] Add microchip sama7d65 SoC I3C support
Date: Mon, 25 May 2026 14:54:00 +0530
Message-ID: <20260525092405.1514213-1-manikandan.m@microchip.com>
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
mipi-i3c-hci driver using existing quirks.

I3C in master mode supports up to 12.5MHz, SDR mode data transfer in
mixed bus mode (I2C and I3C target devices on same i3c bus).

Please refer to the individual patches for changelogs.

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

