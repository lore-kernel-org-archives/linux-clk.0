Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FAFC21578D;
	Wed, 18 Mar 2026 05:53:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.153.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773813240; cv=none; b=PUazjM1euxb/En18hydD8jMZU/g652gvhCB+oNlgP48Z8ndDe9gDxt8ikumVj0tpYRK+6Uan74405rbcgpMy6wLFwFNbrqaFj4VbfjmLRshvTWcrfqFgt4VhJzScKb0W0AhsNNdu8yuCASOds9/2UnApqszDMshELzgT32UvN6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773813240; c=relaxed/simple;
	bh=PUYnKeKHUBCeKind9Npf1NIbjQzWI2oBFhL1pRGpyEw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=I7/0q15bm9GbzOlc7Pr6nqvgCgMCxbKffqtSRk6HSns8NnZowu0vHycbtUjYVEoVgAudJxixUTYBFpDNOLG6pf/MVMDDEfKsvHcu6mJerFu8U2k0XoYVX8ZNH39dNErp1gUtvmyShiyJiG8BwdhvJkHAV5lXFEZ4FytKN8E4n1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=Rf0ByEDu; arc=none smtp.client-ip=68.232.153.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="Rf0ByEDu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1773813240; x=1805349240;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=PUYnKeKHUBCeKind9Npf1NIbjQzWI2oBFhL1pRGpyEw=;
  b=Rf0ByEDuMYIOY5XSaUUSLxCMfnMZ3HJqBUTtHrKVDgvyDyL06HMYdoVV
   Pr/YLdvRajgrdcBbxulcsAFozrWAljSxHFvKBP86qNr3Q44GvMQiG5c1K
   vqobPJtdTkU2aJHd32jbAqZAata7uLBbZQ1uyIII5iNxwQlec5xbFULeL
   5clA6mcDGlwgRG5zkQMthmtFtr8ynDT3FPPxWVFjikzHEORb7WtZd4IP9
   FpqYV+x/4x5Zrwx5kCVXyjLGL5uxqtzMVchVf07lCOcYCTPF1UT/vUIn5
   MlNVpVhWwWjtXdhZrCABTEADtKlwD+9CwNarFwvVWOvjR3Q1mnFi4W7Rh
   Q==;
X-CSE-ConnectionGUID: xkXXVVUnT4qAvA583ZC2ng==
X-CSE-MsgGUID: CCe9pDnlTXOVgU+q5Ub90Q==
X-IronPort-AV: E=Sophos;i="6.23,126,1770620400"; 
   d="scan'208";a="286208466"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 22:53:59 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.87.152) by
 chn-vm-ex3.mchp-main.com (10.10.87.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.35; Tue, 17 Mar 2026 22:53:28 -0700
Received: from che-lt-i67131.microchip.com (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Tue, 17 Mar 2026 22:53:19 -0700
From: Manikandan Muralidharan <manikandan.m@microchip.com>
To: <alexandre.belloni@bootlin.com>, <Frank.Li@nxp.com>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nicolas.ferre@microchip.com>,
	<claudiu.beznea@tuxon.dev>, <linux@armlinux.org.uk>,
	<mturquette@baylibre.com>, <sboyd@kernel.org>, <ardb@kernel.org>,
	<martin.petersen@oracle.com>, <ebiggers@google.com>, <tytso@mit.edu>,
	<cristian.birsan@microchip.com>, <adrian.hunter@intel.com>,
	<jarkko.nikula@linux.intel.com>, <kees@kernel.org>, <npitre@baylibre.com>,
	<linux-i3c@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-clk@vger.kernel.org>
CC: <manikandan.m@microchip.com>, Durai Manickam KR
	<durai.manickamkr@microchip.com>
Subject: [PATCH v4 4/5] ARM: dts: microchip: add I3C controller
Date: Wed, 18 Mar 2026 11:22:29 +0530
Message-ID: <20260318055230.307030-5-manikandan.m@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260318055230.307030-1-manikandan.m@microchip.com>
References: <20260318055230.307030-1-manikandan.m@microchip.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Durai Manickam KR <durai.manickamkr@microchip.com>

Add I3C controller for sama7d65 SoC.

Signed-off-by: Durai Manickam KR <durai.manickamkr@microchip.com>
Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
---
Changes in v3:
- Remove clock-names property as driver enables the clk in bulk
---
 arch/arm/boot/dts/microchip/sama7d65.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/microchip/sama7d65.dtsi b/arch/arm/boot/dts/microchip/sama7d65.dtsi
index e21556f46384..f358aae3ec59 100644
--- a/arch/arm/boot/dts/microchip/sama7d65.dtsi
+++ b/arch/arm/boot/dts/microchip/sama7d65.dtsi
@@ -1015,5 +1015,13 @@ gic: interrupt-controller@e8c11000 {
 			#address-cells = <0>;
 			interrupt-controller;
 		};
+
+		i3c: i3c@e9000000 {
+			compatible = "microchip,sama7d65-i3c-hci";
+			reg = <0xe9000000 0x300>;
+			interrupts = <GIC_SPI 105 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&pmc PMC_TYPE_PERIPHERAL 105>, <&pmc PMC_TYPE_GCK 105>;
+			status = "disabled";
+		};
 	};
 };
-- 
2.25.1

