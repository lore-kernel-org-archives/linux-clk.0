Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=68.232.153.233
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795684716;
	b=BmI80CD5oFizC0DQKer91NA80CzFUJ8wwuU8UtytUWHgdcR0DeKdxf1b1zlAHRJ7s2Ha
	 By8+JLv6DNUX+Lbjy2siM8p9le91zSfWcxruxxyt9EQztJSyvIhXCiQUZJgNaY78O+++9
	 Ub9OBT9DhvQVPubvNHqW15DaZNi9QD0hzjSjAdfSJ4tUPYRk1QpccW7koDz3YEZOcMRGg
	 aPa2SZt7xwWfLgUjTPFZ7wa6hCeEWFvhTvjODwpx/ik4Fj9UJWq0eEesQ392W336maebO
	 CGJba4dV6+L7xbQvGJ1CJBJzdX2Yk+j8VllwswX8AiR3nO5Pn9j+ADPxl0umsZ8+dsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795684716;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-Amp-Result:Received:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	bh=wvNQx1NXiQyGJrBACF7QW0QjuyjuClcYVEKZhGIr/Nc=;
	b=FOn8CBIBzXY/70HxYNJigH8TrwU5L1L/X0OGad9kD0iThr3YJNdwjst/VFrxDBCLuf8D
	 QAvG2Yc+mOeL4pbVJEa6/fB0dCMEr1/kEYFEEAaRadA9n0S4lYkAj8WtTdGJhzgVDtD76
	 rf7DGcd/hiRxyoQrBy/v/STBek9KB6CdxYBV6IsLdm18hxYBYKfhUnXT2tbm2I/8k6lzZ
	 ZPd1VFt9MzgvPYXhWtqOlF8K+DSncLOLeDwQR60qkZqMA9H3XadAi5FuAghNwZEL1ab73
	 dWyBsu6vb+rm1C6qv/kVJNaAOocPY0nfOwmm6mS/BebQh3VXo4rtXfLHUwzfPOFNhaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=microchip.com;
	spf=pass smtp.mailfrom=microchip.com;
	dkim=pass header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=MDOR3KAA;
	arc=none smtp.remote-ip=68.232.153.233
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 562DE606A31C;
	Thu, 26 Nov 2026 09:18:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 562DE606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=MDOR3KAA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1795684716; x=1827220716;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=gOLzHIL0GQIjaNNNM7qZ1IqEql6yXuMHaUjknU/ArWE=;
  b=MDOR3KAAVG39Fe2TnDONonCGKmsKwAWvC3/SGGCgjuZvak9JwPlWMsSS
   R3lh682Mt/UdM9znfJXhQUOdtJwGXSVIN12I04D339HlzZPwlQMutfZPm
   W5dT0wiyS7M0ZHNzKP8HHYGe7DqIDE4KNQRab6DIBqt96epHe7fBtZm+h
   HOvsiHPl+PdCJN4MdYF+JXlNrYvbKb2HmLt0o3dj8Agbi7UI2h+0m92b7
   uWqhsiQJ82JUfgfEEg+WcLHcLf9HjOrTD/Jt/2JNDNal5uQo1ApNIJC4W
   dDKOFGPCje9fx+RygzizPVFsGNs4+ugOKplvct842SzCUfedeVfaespqY
   w==;
X-CSE-ConnectionGUID: GWLb76C1Qw6aglWXaZtdvQ==
X-CSE-MsgGUID: kmXuFq4QQmuF4ScOxmJHaw==
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; 
   d="scan'208";a="67088741"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2026 02:18:35 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.87.71) by
 chn-vm-ex3.mchp-main.com (10.10.87.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.57; Thu, 26 Nov 2026 02:18:34 -0700
Received: from archlinux.mchp-main.com (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Thu, 26 Nov 2026 02:18:32 -0700
From: Mihai Sain <mihai.sain@microchip.com>
To: <sboyd@kernel.org>, <bmasney+clk@redhat.com>, <jbrunet+clk@baylibre.com>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>
CC: <linux-clk@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<devicetree@vger.kernel.org>, Mihai Sain <mihai.sain@microchip.com>
Subject: [PATCH 0/3] clk: at91: sam9x7: Fix GMAC TSU clock configuration
Date: Thu, 26 Nov 2026 11:18:06 +0200
Message-ID: <20261126091809.13012-1-mihai.sain@microchip.com>
X-Mailer: git-send-email 2.56.1
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

This series fixes the GMAC Time Stamp Unit (TSU) clock configuration for
the Microchip SAM9X7 SoC.

The fixes cover the TSU generic clock definition in the clock driver and
the corresponding clock ID and frequency in the device tree.

Mismatches in these definitions can result in an incorrect clock configuration
for the GMAC TSU.

Mihai Sain (3):
  clk: at91: sam9x7: Fix GMAC TSU generic clock definition
  ARM: dts: microchip: sam9x7: Fix GMAC TSU clock ID
  ARM: dts: microchip: sam9x7: Fix GMAC TSU clock frequency

 arch/arm/boot/dts/microchip/sam9x7.dtsi |  6 +++---
 drivers/clk/at91/sam9x7.c               | 10 ++++++++++
 2 files changed, 13 insertions(+), 3 deletions(-)

base-commit: 25faec9ce61c01fb45abf812a222c5b43c3cd5c5
-- 
2.56.1

