Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24BC8361DD2;
	Wed, 18 Mar 2026 05:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.153.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773813210; cv=none; b=H2C+ZmJl0GEQGn2V1sttAQa+H0FP39fgmdiKnl0RFPScYVOFQf8XQSCsZtwUVGo1VT+1EJ9md0MU/4GiNakp4tsSzOWwGW/XaTQr5sBkdPC8+8Lo6hfdJSTLMk68ERsclm9+UUSpwt2U2pcYNzDLGyzE2AG/zavRv8EEcwWb2bE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773813210; c=relaxed/simple;
	bh=1pdGbtvS5ukFxIuzO7UY6eiKSwsEm0UA9a+Owr7FRpw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MN0Nwr7en9ut6YZR5YLU93op/TxmCggn9kXyxKWB7csvA6HXJ/R3Sdh1xV6fmJXZey5AtkIX+DVSl0uSKWs9qKz31bHc0BQq3V4o7VI08LiNqAjdl1jPjqddsSpl9hdFWr81yFZrrCPYOLLYxQJLKp6hJjHjqSVERTWiNRYDTnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=0kygg5m7; arc=none smtp.client-ip=68.232.153.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="0kygg5m7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1773813210; x=1805349210;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1pdGbtvS5ukFxIuzO7UY6eiKSwsEm0UA9a+Owr7FRpw=;
  b=0kygg5m7dA7fvmF8yiEzDpLq/MTFmwOVXhQBYarV8pjrocFQxS3KxMoN
   TlL0PrmphRlbWvqx70XBMMn+MzTvmBfEEg9v0Sdgu93FmB3q6gMdhgg6H
   7FLupzyZohk28D6/w2yocelPlkQVnyhxrX6weoYB/gUhtRafucHmuT9xw
   UhU/UNWKBpb9tNxUUskLz1oJmtAJHrsbDA2Tl/BuNu7SCFo95lTTNo4N3
   cGvAIFmAsQPk9LpJU7L+8ySMDXi06kBCZHtm24AhSyJoacs34LkSlJeB0
   oE9akCP1CVMxtLpkRLZS+YftAGRneddQ90GkMCqohIQUKRsfi1OEpvIbf
   Q==;
X-CSE-ConnectionGUID: TZ/u7H+YTQiHBRAlQQhOfg==
X-CSE-MsgGUID: Z9Q0x3k2RXSFUBIytiEccw==
X-IronPort-AV: E=Sophos;i="6.23,126,1770620400"; 
   d="scan'208";a="286208454"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 22:53:22 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.87.152) by
 chn-vm-ex3.mchp-main.com (10.10.87.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.35; Tue, 17 Mar 2026 22:53:09 -0700
Received: from che-lt-i67131.microchip.com (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Tue, 17 Mar 2026 22:53:00 -0700
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
Subject: [PATCH v4 2/5] clk: at91: sama7d65: add peripheral clock for I3C
Date: Wed, 18 Mar 2026 11:22:27 +0530
Message-ID: <20260318055230.307030-3-manikandan.m@microchip.com>
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

Add peripheral clock description for I3C.

Signed-off-by: Durai Manickam KR <durai.manickamkr@microchip.com>
Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
---
changes in v3:
- Fixed indentation issues
---
 drivers/clk/at91/sama7d65.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/at91/sama7d65.c b/drivers/clk/at91/sama7d65.c
index 7dee2b160ffb..ba8ff413fa2c 100644
--- a/drivers/clk/at91/sama7d65.c
+++ b/drivers/clk/at91/sama7d65.c
@@ -677,6 +677,7 @@ static struct {
 	{ .n = "uhphs_clk",	.p = PCK_PARENT_HW_MCK5, .id = 101, },
 	{ .n = "dsi_clk",	.p = PCK_PARENT_HW_MCK3, .id = 103, },
 	{ .n = "lvdsc_clk",	.p = PCK_PARENT_HW_MCK3, .id = 104, },
+	{ .n = "i3cc_clk",	.p = PCK_PARENT_HW_MCK8, .id = 105, },
 };
 
 /*
-- 
2.25.1

