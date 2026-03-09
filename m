Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57AF8368977;
	Mon,  9 Mar 2026 07:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.154.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773042846; cv=none; b=UGJAzxnHyQcnOWrg+VErXwUyNJvsrZEK5GkkjXcRnf9CvewOHwv6p9BX53zTE8gmU44oG0RjvSBmCJvc9qXiYJFewwhSjT2r2V3FH0Z3VdhBQ/vuZhkekr5Hk+JdLGO16q+WmxNOipZQTPcWPHW0SH3wHBhWNRatfmq0YxH3Ues=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773042846; c=relaxed/simple;
	bh=PUMHJIQe9paGHdzwol89drFjlfxsC2i93u8l7eBbM/Y=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=N3XD1DnmCgfG3UYWIvdslNi4oPfT68F4zDaC3axXlRmiNcGy1YdsbZwN6xQG8Jz6T6h507oOuHK39F+/Jf4xPUM6I39lsD6OLilMRBGe/MGo+qbknMGCNcbRrSNke8FNdOzbVP11u++k9LyMeZ35DV0mRvFHYY4/qclkAlEEFpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=HZUftcI+; arc=none smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="HZUftcI+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1773042845; x=1804578845;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=PUMHJIQe9paGHdzwol89drFjlfxsC2i93u8l7eBbM/Y=;
  b=HZUftcI+5vDVM9nkHu8KVqTf62vP8BTiGmpMrndnE3Z5JaJpGK5rUxxn
   0JWTe1XhevoZd62JAPbXBR+GlEK0SccTU4d8FDUCm8Vsey1bHDAOUm+vC
   A7YQzmCvp7X0YHpEABPOda9W5J9ZEwb9i3/z+BU+UyWTVtOyMKedRWGhW
   JeyzO/gmQBGs63Z6+Yog9JLLkOAOQ81vZXPyizP0v9vRW/Q+i6mLF0KVd
   KPt8ucNErKo4KMqCIlHP7+Z0zStR6x45vXE6T9h3+4/el8M1DGZVsFMDb
   jumMirfo+WshqaLIVe/5R0hfK/5cMqxeblhT+1R+vWGjkswnMNDnAEtWK
   g==;
X-CSE-ConnectionGUID: u8JTaPxxQWWCViC89H2kCA==
X-CSE-MsgGUID: fMAVD45cRNuJjk24eijUkg==
X-IronPort-AV: E=Sophos;i="6.23,109,1770620400"; 
   d="scan'208";a="54818268"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 09 Mar 2026 00:53:57 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Mon, 9 Mar 2026 00:53:49 -0700
Received: from archlinux.mchp-main.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Mon, 9 Mar 2026 00:53:45 -0700
From: Mihai Sain <mihai.sain@microchip.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <varshini.rajendran@microchip.com>,
	<cristian.birsan@microchip.com>, <balamanikandan.gunasundar@microchip.com>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <linux-clk@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<ryan.wanner@microchip.com>, Mihai Sain <mihai.sain@microchip.com>
Subject: [PATCH v3 1/4] clk: at91: sam9x7: Remove gmac peripheral clock with ID 67
Date: Mon, 9 Mar 2026 09:53:26 +0200
Message-ID: <20260309075329.1528-2-mihai.sain@microchip.com>
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

According with datasheet [1] table 12.1 the instance ID 67 is reserved.
This change drops the gmactsu_clk entry from
the SAM9X7 clock description table.

[1]: https://ww1.microchip.com/downloads/aemDocuments/documents/MPU32/ProductDocuments/DataSheets/SAM9X7-Series-Data-Sheet-DS60001813.pdf

Signed-off-by: Mihai Sain <mihai.sain@microchip.com>
---
 drivers/clk/at91/sam9x7.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/clk/at91/sam9x7.c b/drivers/clk/at91/sam9x7.c
index 89868a0aeaba..66aadebc51a4 100644
--- a/drivers/clk/at91/sam9x7.c
+++ b/drivers/clk/at91/sam9x7.c
@@ -420,7 +420,6 @@ static const struct {
 	{ .n = "lvdsc_clk",	.id = 56, },
 	{ .n = "pit64b1_clk",	.id = 58, },
 	{ .n = "puf_clk",	.id = 59, },
-	{ .n = "gmactsu_clk",	.id = 67, },
 };
 
 /*
-- 
2.53.0

