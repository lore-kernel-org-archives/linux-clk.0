Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00C8F32142B;
	Mon,  2 Mar 2026 14:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.154.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772461265; cv=none; b=qHnXx7rPlWPPA8DI53tu306Te6x6c5gycGQ86Isr4+rcbb8Hl5Zh69414xhWBTqjARWnm+VVMmbTkOfJ27nOTNFXOIGzGmqYmX3a4K2Hlm7H3Jn3uc3Q0H75ng8lvNSoccgYAr1aQ8R9crXzLQ2AEQW2WGK7txvCc1HasjHfLAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772461265; c=relaxed/simple;
	bh=PUMHJIQe9paGHdzwol89drFjlfxsC2i93u8l7eBbM/Y=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WTBkXYZp5ui28YXJvualXwVCjm3hOq6CA/s88O5n90D7Gm9wB41vDVzDqi1VzV/DoYqAQZQJlAXk6q9k2aoahj9ATTtejCDVglLQUqu285un+KxNuCnFQ4BNNwX+Vcc5IBDkbb535vs9m0yIqRaLyAwqtVXgeOvtrRXAozyeaZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=0bqyPO/L; arc=none smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="0bqyPO/L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1772461264; x=1803997264;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=PUMHJIQe9paGHdzwol89drFjlfxsC2i93u8l7eBbM/Y=;
  b=0bqyPO/LfV3++07vXNZkmgBJsXqvgqJi2wgE/VPm4Pu6NSw5h/826VVE
   9M3e83oH+unOMu30y4mHHDLJc318DaSWGVInMSO5gC1Yxsn8bpLMS7w8q
   6QmNZmaW9jkl2+t3lWCUaSqWlC/dvdoyMXXj8rwX+iMIcPjWONsfwVb0L
   0Xog/Dc35H5HC980ZabIvuQ5UviwALG1xewl9OQU9fuJYquFGbEOpXZS9
   ZsBLgBcJp/TfyNHo4OUxTl3Kh/jjr9XDF3icU8wrUUqhfIceuyQSWcR+q
   wYjzcZcY1MUWBcekxMLvvwfv9mM1SqPcgNJjXZRALZnA1SEuncxZWHMtP
   g==;
X-CSE-ConnectionGUID: QKICduWAQ5ynFNkWd4cNxQ==
X-CSE-MsgGUID: BrJgKe7ETDSZMJOlv2niyQ==
X-IronPort-AV: E=Sophos;i="6.21,320,1763449200"; 
   d="scan'208";a="221349851"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2026 07:20:56 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.87.151) by
 chn-vm-ex3.mchp-main.com (10.10.87.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.35; Mon, 2 Mar 2026 07:20:21 -0700
Received: from archlinux.mchp-main.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Mon, 2 Mar 2026 07:20:17 -0700
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
Date: Mon, 2 Mar 2026 16:20:05 +0200
Message-ID: <20260302142008.3253-2-mihai.sain@microchip.com>
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

