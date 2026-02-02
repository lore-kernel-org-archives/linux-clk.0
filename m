Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DF0C35BDD5;
	Mon,  2 Feb 2026 10:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.153.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770029067; cv=none; b=JF4i0PlykmbqRJbDqJvfi32ArBHWGnJ1kVGNrsIaD6i3SuDyG935GBM3PJHoxHjP7qve9Vowz/rXMVOBCjUDDpeve/gV57aM8lU0qpKM1M5tKE24tg7ebIcNgzbXptSUeYIROsq66Py4R0+kLyZ05Y30srZhpzqRrS53Uim/Ufg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770029067; c=relaxed/simple;
	bh=CQDItOjg4vFi2oY4AFpL1SrpyEnw1EaJxRuwwh3G9ls=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=V4YCYWG3DS9OW/MOV7QHVcmdJLIpWQscd+82JqgXtwKxeIUf9VieX2OPbVUv6dcH4FvEbpXWnbJWLSdhCqYU0AHqVnRHrelQFP1usWxI6SS6q8ocBFY5C4mu0Nyd4epD0dzOKedpl2etkEwXxHS5BibOZlNEf6cIAfoafEHHNUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=xXZmWv8a; arc=none smtp.client-ip=68.232.153.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="xXZmWv8a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1770029066; x=1801565066;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=CQDItOjg4vFi2oY4AFpL1SrpyEnw1EaJxRuwwh3G9ls=;
  b=xXZmWv8aIU/+GIsRowmsgGKCc9yXHFz+qmbVTxlB0wsZMkTF4ytzbQTu
   HmATZu76fGcVvNHAf0kpJ2+goxFSRoP2VPMZLmLFC5h/XhQLz3qnaQZ4n
   mmhkBDeqvxAsfo4QcAG1PXnE8LYjTStLuM0zf/1oRDs3++ZsRDW+Ch9Wj
   QhUWtz8qNY+eSl4tr4YTZCWCQiqy4ibFvOacxVn1LNXsA5H6vlnWidFDt
   GJaWp0zdKqEq1tgDeb/C5Km1MJjK73RqFWZYeXprEAYmOWa5bRCDNJTAM
   iwiYXwxG1iQepaKcVETLfABvuiQ5sbDcmT0GW6B10slk5fZ6s3t8SfuGx
   Q==;
X-CSE-ConnectionGUID: 4Ir6ehGOSMSwNcM0kpvUsg==
X-CSE-MsgGUID: PjNnYzkfTRWbnRr57rBzvw==
X-IronPort-AV: E=Sophos;i="6.21,268,1763449200"; 
   d="scan'208";a="59959599"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 02 Feb 2026 03:41:15 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Mon, 2 Feb 2026 03:40:49 -0700
Received: from archlinux.mchp-main.com (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Mon, 2 Feb 2026 03:40:45 -0700
From: Mihai Sain <mihai.sain@microchip.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <varshini.rajendran@microchip.com>,
	<cristian.birsan@microchip.com>, <balamanikandan.gunasundar@microchip.com>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <linux-clk@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<ryan.wanner@microchip.com>, Mihai Sain <mihai.sain@microchip.com>
Subject: [PATCH 3/5] clk: at91: sam9x7: Add gmac generic clock entry with ID 24
Date: Mon, 2 Feb 2026 12:40:23 +0200
Message-ID: <20260202104025.3781-4-mihai.sain@microchip.com>
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

According with datasheet table 12.1 the instance ID 24 is used
for gmac generic clock.
This change adds the gmac_gclk entry in SAM9X7 clock description
table.

Signed-off-by: Mihai Sain <mihai.sain@microchip.com>
---
 drivers/clk/at91/sam9x7.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/clk/at91/sam9x7.c b/drivers/clk/at91/sam9x7.c
index 68e569bd70f5..8b52da194849 100644
--- a/drivers/clk/at91/sam9x7.c
+++ b/drivers/clk/at91/sam9x7.c
@@ -568,6 +568,15 @@ static const struct {
 		.pp_chg_id = INT_MIN,
 	},
 
+	{
+		.n = "gmac_gclk",
+		.id = 24,
+		.pp = { "audiopll_divpmcck", "plla_div2pmcck", },
+		.pp_mux_table = { 6, 8, },
+		.pp_count = 2,
+		.pp_chg_id = INT_MIN,
+	},
+
 	{
 		.n = "lcd_gclk",
 		.id = 25,
-- 
2.52.0

