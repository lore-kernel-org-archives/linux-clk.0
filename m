Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A337770FE;
	Thu, 12 Feb 2026 10:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.154.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770890573; cv=none; b=kbITP6hHKK/DN/pT+yMQQs8LIsApDku3BtBg1iszr0dD+xjGE7cF9KNTjEMBNUNFmR0FmVchjDxFnk91xYByx9muBnFgD1IYnUZJdG4sGp+LJOd7+PKGF5jDZEyX6yDUZJ8v5EJNiBBrandKvmaG5ind3SPBkh+NfDO7zmz3nG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770890573; c=relaxed/simple;
	bh=RgPLsEAvEIhX+x4fiqob1zN/Jh2A9AFXuJ2U8zEAWpM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nfq0ALu2AjnKW0pYif7Z1m8hpwNz+BS2eSzkwBOHbwCdyRjqVKnpVJULWiuzzDLE4XpcRjllKNY+BXb8wO/biXwTE8aYyAQl+WUDSBcxasB8QpKZG3nUhD39J67gJJqRElA9gls2ko2i+1Fy4r+AK+QcR5SvObkinNKGFARVU+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=xbIp8E93; arc=none smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="xbIp8E93"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1770890563; x=1802426563;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=RgPLsEAvEIhX+x4fiqob1zN/Jh2A9AFXuJ2U8zEAWpM=;
  b=xbIp8E93oh9hprjFPEUcFo0dqpjNRpwwI1viJDXwDvE4PDFBxT718V3M
   qf6fg+mWhO33G+yzD8eYgLOGKJNodJ+e48sIKhVv+NWAgfklOC0+aAv/N
   JjvA2bSoHCnOAahFLrVB3BG5qlGDjyOQi391D8vPtAjlIb03/5ric0LC2
   yhCqaxWF9D5rUwAoex35lMPkhVHU2JCv2ZU8xgYkt3ClWZjRoGRnQ+s3/
   RnsFMs8ik/etbN2+Cb+qcdEm4syAMQy7RFZ+yvFxTFWwna9dRoc3tOdtR
   C4l5xZuEUa2hhOT3Fh5yZxy9k1XLsVx46sVxHqhOMrKvQ9vrcM/tFMaeG
   w==;
X-CSE-ConnectionGUID: MLyYTqveRP6xRNiALHFvrA==
X-CSE-MsgGUID: SQ2Xuz9nT8yug6mqergzPw==
X-IronPort-AV: E=Sophos;i="6.21,286,1763449200"; 
   d="scan'208";a="220596017"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 03:02:38 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.87.151) by
 chn-vm-ex1.mchp-main.com (10.10.87.30) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.35; Thu, 12 Feb 2026 03:02:19 -0700
Received: from archlinux.mchp-main.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Thu, 12 Feb 2026 03:02:16 -0700
From: Mihai Sain <mihai.sain@microchip.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <varshini.rajendran@microchip.com>,
	<cristian.birsan@microchip.com>, <balamanikandan.gunasundar@microchip.com>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <linux-clk@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<ryan.wanner@microchip.com>, Mihai Sain <mihai.sain@microchip.com>
Subject: [PATCH v2 3/4] clk: at91: sam9x7: Add gmac generic clock entry with ID 24
Date: Thu, 12 Feb 2026 12:01:46 +0200
Message-ID: <20260212100147.5007-4-mihai.sain@microchip.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260212100147.5007-1-mihai.sain@microchip.com>
References: <20260212100147.5007-1-mihai.sain@microchip.com>
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
2.53.0

