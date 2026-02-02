Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA40735B138;
	Mon,  2 Feb 2026 10:44:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.153.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770029069; cv=none; b=uf2+NlofpnjIrOx0LN00C7V+tq86lV/j8hK6PUXVKQ4ag6IXbRfX9CGbs9zWBn3To66KzjbJLi3R/SqjXqhRj2Umg7mozuCIULKkSgvLbUuCXRtjacZF6bsR5rIGk41cy0D4wq4LXUah1X3/zfxppBY6h8LpNynviapPCW9ckHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770029069; c=relaxed/simple;
	bh=9g5CCiQU1ItiH0FskuKxbTunuhIDJpCKXVV65BaI9V0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bhUBxc/T6luGyBXGdJ5s4+0Na5UGs8Ob0z/zGCKGPRxEGu+sfx3jF7PB5X+jpT3rhaGtTdPao5AMxn+LfwwMjaOngWr/KjsArqmWW9KL7BBw060EJtSmtyw5pVfHoG1wP2xAvB2QF+FDYjybZoNgwZl15RbPbTbd5vJZNUdQ1Jk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=LZaQoaXd; arc=none smtp.client-ip=68.232.153.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="LZaQoaXd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1770029067; x=1801565067;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=9g5CCiQU1ItiH0FskuKxbTunuhIDJpCKXVV65BaI9V0=;
  b=LZaQoaXdkbIsy2AOiBxknLOqd7DEKFYKttxQCSznE9UnqTRH8LjBtNsm
   SPUL9E9ponC9wqprmMNo82nqN8BjRmJUOFGq5IqzvYspp9KBZNzYZBys9
   pienLLNlSKTs2nnchdZgG4WFu42PzLm8wxsrdsPQktOkoTYbVWO3FmuK0
   BENLK48rbzBDTQRunJwVBNPuIEGHle84/6vdPoBFBVVuL3z+5G44HFZOl
   4gQkfQ4THHOPc9zF8Sx2JXHcAO/0Rg8CxNf2I4Bax/qFHGj+8Aad+rXXM
   iGyb3MFQOVzCBdIp/KKPU80a0WyPQi4GaU3eI71tJoi7o97KSIGuAv4Sc
   g==;
X-CSE-ConnectionGUID: 4Ir6ehGOSMSwNcM0kpvUsg==
X-CSE-MsgGUID: hIZX4jERQv6ymGlGZoEvMA==
X-IronPort-AV: E=Sophos;i="6.21,268,1763449200"; 
   d="scan'208";a="59959601"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 02 Feb 2026 03:41:15 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Mon, 2 Feb 2026 03:40:52 -0700
Received: from archlinux.mchp-main.com (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Mon, 2 Feb 2026 03:40:49 -0700
From: Mihai Sain <mihai.sain@microchip.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <varshini.rajendran@microchip.com>,
	<cristian.birsan@microchip.com>, <balamanikandan.gunasundar@microchip.com>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <linux-clk@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<ryan.wanner@microchip.com>, Mihai Sain <mihai.sain@microchip.com>
Subject: [PATCH 4/5] ARM: dts: microchip: sam9x7: Remove the tx_clk from gmac node
Date: Mon, 2 Feb 2026 12:40:24 +0200
Message-ID: <20260202104025.3781-5-mihai.sain@microchip.com>
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

The gmac controller on sam9x7 has no internal pll to generate
the 125MHz clock source for rgmii mode.
This clock is generated on external board by eth-phy or
clock oscillator.
This change drops the tx_clk entry from gmac node.

Signed-off-by: Mihai Sain <mihai.sain@microchip.com>
---
 arch/arm/boot/dts/microchip/sam9x7.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/microchip/sam9x7.dtsi b/arch/arm/boot/dts/microchip/sam9x7.dtsi
index 46dacbbd201d..da94865c57e9 100644
--- a/arch/arm/boot/dts/microchip/sam9x7.dtsi
+++ b/arch/arm/boot/dts/microchip/sam9x7.dtsi
@@ -991,7 +991,7 @@ gmac: ethernet@f802c000 {
 				     <63 IRQ_TYPE_LEVEL_HIGH 3>,	/* Queue 4 */
 				     <64 IRQ_TYPE_LEVEL_HIGH 3>;	/* Queue 5 */
 			clocks = <&pmc PMC_TYPE_PERIPHERAL 24>, <&pmc PMC_TYPE_PERIPHERAL 24>, <&pmc PMC_TYPE_GCK 24>, <&pmc PMC_TYPE_GCK 67>;
-			clock-names = "hclk", "pclk", "tx_clk", "tsu_clk";
+			clock-names = "hclk", "pclk", "tsu_clk";
 			assigned-clocks = <&pmc PMC_TYPE_GCK 67>;
 			assigned-clock-rates = <266666666>;
 			status = "disabled";
-- 
2.52.0

