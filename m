Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE6FD370AE3;
	Fri, 14 Aug 2026 09:24:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.153.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786699458; cv=none; b=iE8CkBQlBHytO48bA1G0Tqg10DKV6UQ6FDQYhVgETap5gXMVBvc27IFS6M/3ZVcNCXNYQ2BCFQzYIWKhHEpHLSuNvEF1Fo98YoxG+/HWtP2h6xSbp7wavdV60cuxSn4suBox+uAbtSQDJ3gj8DPDeD1aBfIk1IvGid8dt+DIuU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786699458; c=relaxed/simple;
	bh=t4H4NDsVqvtOh1B8bIPxsZW4VdsUsKMmQ3HmPurbO7c=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=gieFfpwWK0ssJmpSKaLEQ9cLNdAfNc1NcUMSYnp/lESfYi2oY0AbhS4WyPHTum5FzuCBTbHch4Nepc6iWcLDmUV3T0O2DQ+M7DUIxrcuSRY5DDlRjGoTHLRhtisybN3B3yJhfldVLEQMoyi43AhKCW7HTKAhkUWVA8P/aGBQZRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=jn5/ni23; arc=none smtp.client-ip=68.232.153.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="jn5/ni23"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1786699460; x=1818235460;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=t4H4NDsVqvtOh1B8bIPxsZW4VdsUsKMmQ3HmPurbO7c=;
  b=jn5/ni23agiW9DJg8+3BBET5LSvS+cJuxt/L/mS4mJs44H5my/zy6Lgc
   AMa70gVN4HZD1UVQ9GrHjBZAga8SiburZva0f5104IkfQX26yFhY5mDO6
   02wTUCsqvF4yJyH6PyWtZX1Fe9eM3lQe4eBnJ5mbt11qN0b+9S5g6Tgo5
   Gy41c0dR75GyY3ZqbT1I32M0i58BjqMUeJSwuONla3VvJFG78uFSyNjOJ
   7DuRj5FzsihfYlRMDwkvyn5SHWVByIhuCK/vjrFLkr89DlDlvAN5wcbic
   8yBwPRtjFiHKoAfOdkYqvcvhaTWJTEbligByLI2skpTnsMyHHRDd+eyH2
   A==;
X-CSE-ConnectionGUID: aH9GwClsR3igNfp7TJnB4w==
X-CSE-MsgGUID: BYlb580uRUGqR0UKjiA5+A==
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; 
   d="scan'208";a="62140907"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 14 Aug 2026 02:24:14 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Fri, 14 Aug 2026 02:24:10 -0700
Received: from localhost (10.10.85.11) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Fri, 14 Aug 2026 02:24:10 -0700
From: Pedro Kopper <pedro.kopper@microchip.com>
To: <linux-kernel@vger.kernel.org>
CC: <linux-riscv@lists.infradead.org>, <linux-clk@vger.kernel.org>,
	<daire.mcnamara@microchip.com>, <mturquette@baylibre.com>,
	<sboyd@kernel.org>, <bmasney@redhat.com>,
	<valentina.fernandezalanis@microchip.com>, <conor.dooley@microchip.com>,
	<pedro.kopper@microchip.com>
Subject: [PATCH] clk: microchip: mpfs: fix regmap_update_bits() mask/val order
Date: Fri, 14 Aug 2026 10:22:13 +0100
Message-ID: <20260814092211.2158337-3-pedro.kopper@microchip.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

mpfs_cfg_clk_set_rate() passes the mask and value arguments to
regmap_update_bits() in the wrong order. The resulting write becomes
reg = orig_reg | val, causing bits to not be cleared if the clock
divider changes.

Pass the arguments in the correct order so the divider field is updated
as intended.

Fixes: c6f2dddfa7f9 ("clk: microchip: mpfs: use regmap for clocks")
Signed-off-by: Pedro Kopper <pedro.kopper@microchip.com>
---
 drivers/clk/microchip/clk-mpfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/microchip/clk-mpfs.c b/drivers/clk/microchip/clk-mpfs.c
index ee58304913ef..7f044775aea8 100644
--- a/drivers/clk/microchip/clk-mpfs.c
+++ b/drivers/clk/microchip/clk-mpfs.c
@@ -285,7 +285,7 @@ static int mpfs_cfg_clk_set_rate(struct clk_hw *hw, unsigned long rate, unsigned
 
 	mask = clk_div_mask(cfg->width) << cfg->shift;
 	val = divider_setting << cfg->shift;
-	regmap_update_bits(cfg->map, cfg->map_offset, val, mask);
+	regmap_update_bits(cfg->map, cfg->map_offset, mask, val);
 
 	return 0;
 }
-- 
2.43.0

