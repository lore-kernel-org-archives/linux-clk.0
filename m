Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=68.232.154.123
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795685804;
	b=pyMVgTkSKdlTyG39EqKyT4GMjj4eh+zqMt5XpMDaVpqH+pUVqbimZQ1FPYG2sy0Gd9GU
	 bLNX1FPUPKdYaJuT4glL2iypBeIqRMRjbhTthgs0Eh7ntRqHQRucm11WA+MZeUrZQORlG
	 MsMCNVv5Y92/SL4eT+YKxr7w9QHTcdJE0PiyU+9Vn5TdKva7kVbXW4a7Bz+LEW+3AhbOT
	 aPdIc54zyzQP8mmYxeat8pIhzctGTTiCbDiwPwohFoaPxkLuSnyKsWMHm05lFcURUr1v8
	 Rlnj+NJ3EYjkMSP+HCArGZE/vGf4U2XJNAc/nRSIRf0u3/6CSMs8H4pr8AsLxvbrLYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795685804;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-Amp-Result:Received:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	bh=+WBC7MDi0ocp1UUde/a/DTjxd2HuXWCXxnYR4WW7ncc=;
	b=iY3f9FRYmKSPHP3iTRcy6uKKkiIGHKDym+od8oC7Jnus1izavaw3zNFbyS6Awxbaz2w4
	 LaR/zFWTyBRm8kOeTltISnR53N732bYrF1poGR9tMXDxRKQclx3sxg8q7QZGHncmJ8lVM
	 2j3LoGrSRqb0Zg1zkeCFGc5epDsWTCqwsFMnpjTpGEsjWFrr0i4NdpckCIwO/Q9DveWyO
	 CsrrVxLqvLgPiw7u2RmBI2//s7ixXLGxrzA+IVgEQZCowYiazi9xYwXbLivg/wdwFAsCA
	 njr40xE37GvT4KffrlZvwUfkeYVCVHLQNh/zT2VxWZ78D51gM/r2KLasfBzAMk7b/4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=microchip.com;
	spf=pass smtp.mailfrom=microchip.com;
	dkim=pass header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=NG2ESuhg;
	arc=none smtp.remote-ip=68.232.154.123
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D21060A260D;
	Thu, 26 Nov 2026 09:36:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D21060A260D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=NG2ESuhg
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1795685802; x=1827221802;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=2MtqUnZ5qT621k4FFoy4jHeQztMHO7R/bs+SYayBC4o=;
  b=NG2ESuhgsNuCRF/klN2AINcRZk1F4Q6TD+OlLWeYwnSugFST0DSQlxGt
   Nj6s2hHRMmG84G8zmbPx9/auJMhvOl6/jwCWB27r4RGBQEDCU23m2Fm/o
   m3tPHoO+kMQKgUKRbfEm0apgxgKuQf9HVaY7r0zEUpsfAQ5/BvQK99K5h
   lK2Mpar5OiNcpM7YZkuIUxfmUVQxi4P7O1MV2GsrOffsnMP4k8R0iLD0F
   4zCcKIHKwZmWFvze+aNTPAhe8YXyrycc+8V1pOu2iKZbTeMPn5e/84oIn
   U+99Z9srs+BPmAKh7lF/XC2drrwfMgepYT1QM29yiVsGleufwECo0oSxT
   w==;
X-CSE-ConnectionGUID: SnxyTJEcRC6a/y6k/vmACw==
X-CSE-MsgGUID: DiUC24p+RE6zqJ+ro3GdsQ==
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; 
   d="scan'208";a="66104118"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 26 Nov 2026 02:36:41 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Thu, 26 Nov 2026 02:36:41 -0700
Received: from archlinux.mchp-main.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Thu, 26 Nov 2026 02:36:39 -0700
From: Mihai Sain <mihai.sain@microchip.com>
To: <sboyd@kernel.org>, <bmasney+clk@redhat.com>, <jbrunet+clk@baylibre.com>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>
CC: <linux-clk@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Mihai Sain
	<mihai.sain@microchip.com>
Subject: [PATCH v2 0/3] clk: at91: sam9x7: Fix GMAC TSU clock configuration
Date: Thu, 26 Nov 2026 11:36:03 +0200
Message-ID: <20261126093606.13271-1-mihai.sain@microchip.com>
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

Changelog:

v1 -> v2:
- Add the correct fixes tag

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

