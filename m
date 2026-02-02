Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D65535BDA0
	for <linux-clk@vger.kernel.org>; Mon,  2 Feb 2026 10:44:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.153.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770029070; cv=none; b=fqwv4pPlhonPXfX8n7a7FsR1WKRYn9z/eylJ4ZwHgEM4b5CrdJCpIi4qgzy/PYzCR7dXoemxQtb7E9j2fmgjTyEfKKYsEc37hqgbf754+oZOqdx4S1uTx5gED1SEaRAHSlJBY11WBENRbT8LWQLMoa0f+h5BYZ77YAalNed0F1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770029070; c=relaxed/simple;
	bh=2uvh5GR04a5ws4bAhWTfW3RAkctWft0/DaS7gLhvCZI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WcNB0rlo+JLH8S03YG/qHzSFmJhVZOuea1S81cuDUQHz6QNF+iYYZYZpXKlQrALOvQ/3VqK/fIEI3rQSXTlAtmbQuvITFFcL++UjMofLq8RmR0f/7qQzwYIVEpxDzvoWKiHfbeYSnDMlLr7vGagFknuuXmwYrJbu+g1Ud0smym0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=0JmG5ZQr; arc=none smtp.client-ip=68.232.153.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="0JmG5ZQr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1770029069; x=1801565069;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2uvh5GR04a5ws4bAhWTfW3RAkctWft0/DaS7gLhvCZI=;
  b=0JmG5ZQrK697mzBMh1HZAf/YwyKTcEbhJQknwgoaTJApm8cDJ9s4yBXX
   M6/Vgpp8bxfRl93oMd3dKVWKdx7dB3KKRId5A5BzPXYKmA4bsUaMlkFzj
   DIbg1ANRI7Y+DJ1IcUSVpX6OV1trzP6WfHPARzj0qCZJ/LcZPciWVtSjM
   csMr1D1UKjTFTEFlbEO0RA6Ace2Zq3DqV2BkoU63IupB+KNAHAwi0NXP6
   MmRYfz/Wygbe/2rUouV6duTidyi2P4VjozE0Xig93VLUYPZjZSkl4ZVle
   gFtT8GQ8GuJuF5EkXgVePwdSQXXNmqr3Fk7loh81juuhcnbxU0Llj27iM
   g==;
X-CSE-ConnectionGUID: 7oiJFARpQRyJAEDPNcfsaA==
X-CSE-MsgGUID: 53i4fbhYR6CsWbCdFGpabw==
X-IronPort-AV: E=Sophos;i="6.21,268,1763449200"; 
   d="scan'208";a="59959608"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2026 03:41:22 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.87.152) by
 chn-vm-ex4.mchp-main.com (10.10.87.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.35; Mon, 2 Feb 2026 03:40:58 -0700
Received: from archlinux.mchp-main.com (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Mon, 2 Feb 2026 03:40:53 -0700
From: Mihai Sain <mihai.sain@microchip.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <varshini.rajendran@microchip.com>,
	<cristian.birsan@microchip.com>, <balamanikandan.gunasundar@microchip.com>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <linux-clk@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<ryan.wanner@microchip.com>, Mihai Sain <mihai.sain@microchip.com>
Subject: [PATCH 5/5] ARM: dts: microchip: sam9x7: Update the tsu_clk to use the generic clock with ID 24
Date: Mon, 2 Feb 2026 12:40:25 +0200
Message-ID: <20260202104025.3781-6-mihai.sain@microchip.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260202104025.3781-1-mihai.sain@microchip.com>
References: <20260202104025.3781-1-mihai.sain@microchip.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Update the tsu_clk to use the generic clock with ID 24 instead
of ID 67.

[root@SAM9X75 ~]$ cat /sys/kernel/debug/clk/clk_summary | grep gmac

gmac_gclk      1       1        1        266666666   0          0     50000      Y         f802c000.ethernet           tsu_clk
                                                                                           f802c000.ethernet           tsu_clk
gmac_clk       2       2        0        266666666   0          0     50000      Y         f802c000.ethernet           hclk
                                                                                           f802c000.ethernet           pclk

Signed-off-by: Mihai Sain <mihai.sain@microchip.com>
---
 arch/arm/boot/dts/microchip/sam9x7.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/microchip/sam9x7.dtsi b/arch/arm/boot/dts/microchip/sam9x7.dtsi
index da94865c57e9..a42716e18da3 100644
--- a/arch/arm/boot/dts/microchip/sam9x7.dtsi
+++ b/arch/arm/boot/dts/microchip/sam9x7.dtsi
@@ -990,9 +990,9 @@ gmac: ethernet@f802c000 {
 				     <62 IRQ_TYPE_LEVEL_HIGH 3>,	/* Queue 3 */
 				     <63 IRQ_TYPE_LEVEL_HIGH 3>,	/* Queue 4 */
 				     <64 IRQ_TYPE_LEVEL_HIGH 3>;	/* Queue 5 */
-			clocks = <&pmc PMC_TYPE_PERIPHERAL 24>, <&pmc PMC_TYPE_PERIPHERAL 24>, <&pmc PMC_TYPE_GCK 24>, <&pmc PMC_TYPE_GCK 67>;
+			clocks = <&pmc PMC_TYPE_PERIPHERAL 24>, <&pmc PMC_TYPE_PERIPHERAL 24>, <&pmc PMC_TYPE_GCK 24>;
 			clock-names = "hclk", "pclk", "tsu_clk";
-			assigned-clocks = <&pmc PMC_TYPE_GCK 67>;
+			assigned-clocks = <&pmc PMC_TYPE_GCK 24>;
 			assigned-clock-rates = <266666666>;
 			status = "disabled";
 		};
-- 
2.52.0

