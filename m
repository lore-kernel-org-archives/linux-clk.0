Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5D3D36AB70;
	Mon,  9 Mar 2026 07:54:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.154.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773042874; cv=none; b=PWiyRyylNRlqv9B6RcWRPvxbP3NGJXAfZ1GlbdTmbS0cz2a+adMOmXMrYIymy9Dw3W1l/L4JTwcFlttQaUZy96+Hn635xOlifV3eKem4OId0Qzp7ZmCf60cLJIDqQpRQ107HneBDsCC7PzOrzlx1lUEfc44L7wxH0pExTS8h4xo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773042874; c=relaxed/simple;
	bh=HJY0wdSVelljhVy5XonzAMfl6FFec1mLbXSyxYUN/sQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PuoYi86wi1iMnwhfigtUENbbyZCpAbtfnam1yYUMNb76u+heLmrG/roBQ6rPqM9OLRd4OkCVdFXANxSHYeWpt4xIg4di39vtXbWIgRRE34MVotWTpj53omAepnhx+1/A3Z66Z9A98s9DJbLt8I5dbiwyZoSRVoYXw7ATKTlJPkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=lA1xQawW; arc=none smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="lA1xQawW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1773042872; x=1804578872;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=HJY0wdSVelljhVy5XonzAMfl6FFec1mLbXSyxYUN/sQ=;
  b=lA1xQawWY4/K7YZQrDpYJ+ejgmUzidmtLRRkdUyXGFjJeAist2WVT0k9
   H4LJpehJtn8NOmVucDX6dEqMxnkWmfrJNJv62unuXPr2JOLooXvqkoSLk
   /VmMA5IeA9+MeZxIufF8LJ6gnACpGmk9ABsP+od6otsNQkQnfmK3bzVA6
   MRi/E6N8brcDx0fPVrq3oyie8kMpjx6pGnSwQp4vus8I+0kw7kNIr8TqH
   a+8TMxwUsrOWioi2y9AC1smU6nwgxQWXo8SQUlm8+UqtQEkPOhccrrISu
   6dvBKWyCQNTsWcaCrrCBNhkmACS2V3vCcEMK45ItouQ/g1aM3/zhfth6L
   w==;
X-CSE-ConnectionGUID: tohcI+xlTFuZY9DEYkPeaw==
X-CSE-MsgGUID: 25hFYKZgQha65hgLEmT5QA==
X-IronPort-AV: E=Sophos;i="6.23,109,1770620400"; 
   d="scan'208";a="221659646"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 09 Mar 2026 00:54:32 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Mon, 9 Mar 2026 00:54:01 -0700
Received: from archlinux.mchp-main.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Mon, 9 Mar 2026 00:53:57 -0700
From: Mihai Sain <mihai.sain@microchip.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <varshini.rajendran@microchip.com>,
	<cristian.birsan@microchip.com>, <balamanikandan.gunasundar@microchip.com>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <linux-clk@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<ryan.wanner@microchip.com>, Mihai Sain <mihai.sain@microchip.com>
Subject: [PATCH v3 4/4] ARM: dts: microchip: sam9x7: fix GMAC clock configuration
Date: Mon, 9 Mar 2026 09:53:29 +0200
Message-ID: <20260309075329.1528-5-mihai.sain@microchip.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260309075329.1528-1-mihai.sain@microchip.com>
References: <20260309075329.1528-1-mihai.sain@microchip.com>
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

