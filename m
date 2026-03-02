Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCAD43FD130;
	Mon,  2 Mar 2026 14:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.154.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772461267; cv=none; b=aqdhQ4UPnMDwSUpd4wD/T/4J3Ap63hWuKzfeCS/jUq5PsC1e3e3c44XwTb3knvRtazOyyxZc4/kqZisQOsO/zmVM4OdbHKEVyI+Z8dgaMOrIT02mTJv5/tFVkEcANzpXKI1wQS22nqTHnIp3PxDdWx7Lx59o8iOP8adiV0NPAGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772461267; c=relaxed/simple;
	bh=HJY0wdSVelljhVy5XonzAMfl6FFec1mLbXSyxYUN/sQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ozwYV4H9oRrWL9Ll/mvDG46z30iO+vRhmwesNyq1UqoNr1s+7gUZjDlCzDXBPQ9sp0Xwsu4+YHf980pstdJWTv3gxQt9Gssap2x6i9ZSVDvxDZacoiAFMpix+GCvgbz+22rAepG402Fjq5fr9idW1LTqGK+x1US4uuyEBq7rygQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=gzuwePIF; arc=none smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="gzuwePIF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1772461265; x=1803997265;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=HJY0wdSVelljhVy5XonzAMfl6FFec1mLbXSyxYUN/sQ=;
  b=gzuwePIF47Y/HiUuYA8+b38+VjP/lPZ21rCKHYauaFkmJGgrYvMfyh05
   4cIIyj2gv3ejFOiAtpKqYgPAVklgIsedsCnAAUvYH9BJ7Dqkl17LTArRy
   cMSwHMUwWRWnh9YMBHTj+QNWyJOD4ycnom9onNCxdFFTs7T2nXtaRdwOR
   QU8ul6kDLzRoGBiRR9X82fhDAS8MrykWJBL0O0VF4pd3iDHU0GSG4NTIL
   o2vz+R2LUJ+MBJ6FOzDNEEbiyGNK6xsbf/27SSOVGsjgZa9l+0DRE/Sjn
   JC7tuKnwfhuG0yPUrQmk9LcEjp54xYzvOPQtcji2VB7oE1ke8QSeXTsaw
   A==;
X-CSE-ConnectionGUID: QKICduWAQ5ynFNkWd4cNxQ==
X-CSE-MsgGUID: zY7Ptu/AQQyv8r4ZKbZDKw==
X-IronPort-AV: E=Sophos;i="6.21,320,1763449200"; 
   d="scan'208";a="221349855"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2026 07:20:57 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.87.151) by
 chn-vm-ex3.mchp-main.com (10.10.87.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.35; Mon, 2 Mar 2026 07:20:33 -0700
Received: from archlinux.mchp-main.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Mon, 2 Mar 2026 07:20:29 -0700
From: Mihai Sain <mihai.sain@microchip.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <varshini.rajendran@microchip.com>,
	<cristian.birsan@microchip.com>, <balamanikandan.gunasundar@microchip.com>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <linux-clk@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<ryan.wanner@microchip.com>, Mihai Sain <mihai.sain@microchip.com>
Subject: [PATCH 4/4] ARM: dts: microchip: sam9x7: fix GMAC clock configuration
Date: Mon, 2 Mar 2026 16:20:08 +0200
Message-ID: <20260302142008.3253-5-mihai.sain@microchip.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260302142008.3253-1-mihai.sain@microchip.com>
References: <20260302142008.3253-1-mihai.sain@microchip.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

The GMAC node incorrectly listed four clocks, including a separate
tx_clk and a TSU GCK clock sourced from ID 67.
According to the SAM9X7 clocking scheme, the GMAC uses only three
clocks: HCLK, PCLK, and the TSU GCK derived from the GMAC peripheral
clock (ID 24).

This patch removes the unused tx_clk, updates the clock-names accordingly,
and corrects the assigned clock to use GCK 24 instead of GCK 67.
This aligns the device tree with the actual hardware clock topology
and prevents misconfiguration of the GMAC clock tree.

[root@SAM9X75 ~]$ cat /sys/kernel/debug/clk/clk_summary | grep gmac

gmac_gclk      1       1        1        266666666   0          0     50000      Y         f802c000.ethernet           tsu_clk
                                                                                           f802c000.ethernet           tsu_clk
gmac_clk       2       2        0        266666666   0          0     50000      Y         f802c000.ethernet           hclk
                                                                                           f802c000.ethernet           pclk

Fixes: 41af45af8bc3 ("ARM: dts: at91: sam9x7: add device tree for SoC")
Signed-off-by: Mihai Sain <mihai.sain@microchip.com>
---
 arch/arm/boot/dts/microchip/sam9x7.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/microchip/sam9x7.dtsi b/arch/arm/boot/dts/microchip/sam9x7.dtsi
index 46dacbbd201d..a42716e18da3 100644
--- a/arch/arm/boot/dts/microchip/sam9x7.dtsi
+++ b/arch/arm/boot/dts/microchip/sam9x7.dtsi
@@ -990,9 +990,9 @@ gmac: ethernet@f802c000 {
 				     <62 IRQ_TYPE_LEVEL_HIGH 3>,	/* Queue 3 */
 				     <63 IRQ_TYPE_LEVEL_HIGH 3>,	/* Queue 4 */
 				     <64 IRQ_TYPE_LEVEL_HIGH 3>;	/* Queue 5 */
-			clocks = <&pmc PMC_TYPE_PERIPHERAL 24>, <&pmc PMC_TYPE_PERIPHERAL 24>, <&pmc PMC_TYPE_GCK 24>, <&pmc PMC_TYPE_GCK 67>;
-			clock-names = "hclk", "pclk", "tx_clk", "tsu_clk";
-			assigned-clocks = <&pmc PMC_TYPE_GCK 67>;
+			clocks = <&pmc PMC_TYPE_PERIPHERAL 24>, <&pmc PMC_TYPE_PERIPHERAL 24>, <&pmc PMC_TYPE_GCK 24>;
+			clock-names = "hclk", "pclk", "tsu_clk";
+			assigned-clocks = <&pmc PMC_TYPE_GCK 24>;
 			assigned-clock-rates = <266666666>;
 			status = "disabled";
 		};
-- 
2.53.0

