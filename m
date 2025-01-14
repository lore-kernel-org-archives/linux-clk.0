Received: from out-174.mta0.migadu.com (out-174.mta0.migadu.com [91.218.175.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E45020F96C
	for <linux-clk@vger.kernel.org>; Tue, 14 Jan 2025 12:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736857052; cv=none; b=th9F9WhahTVVnvo6l3tDCay67zQao+8+J+OTiAUpgF/ijAXHdKTD/cdjp1Hzfc9Xz3bjTnRbTQvhup3UDU0e09sNB8o0de7rgAktV2PVEZGuwWbHNiOCKE9zv3FIp/ObEhpy+LGKe6DC5rLCw8gYlguHHaR99FsVi6vXIqZnzmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736857052; c=relaxed/simple;
	bh=a16ozpvO4mnZkpEOOWoM+JNGGPOZosE9X2L4jWrqZA4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LBfnp+x2SJRIyTSZ54dr9pRaQ3P6uRscp9z9BGQxyYQnE05PDkRT/NXLdcoZlaJXdXGSNELeDBuN4vFujHGLN/P2hMs19j+y6029xi8lCiRlppCwUAoUd9FB0SKePxXxjbok+LEbEC4zaX439DbQ/YvGJfRFWAeyCfTHDcwClyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=lZCCQTjR; arc=none smtp.client-ip=91.218.175.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="lZCCQTjR"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1736857043;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=sKwgNHcA7byEuhdNiyLBlSlFjymR3z5KIUpqSpX3U9E=;
	b=lZCCQTjRg5QknZ39Y8SrANiBn2EkZQwhZI1obiFvHLxFL6Ug5ssGd8/TvpbhU+hAPC2Kjq
	XgzLGlD19UCQywlE49Yt/YPK7vaZh9Q+zMXKI/F+3DSwERPYXb7ez5yUME7gRxSPdqNkZG
	4Cb1Ksv3RzxPqiae2taYrISvNwfZAwY=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Dinh Nguyen <dinguyen@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] clk: socfpga: clk-pll: Optimize local variables
Date: Tue, 14 Jan 2025 13:14:53 +0100
Message-ID: <20250114121453.618120-2-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Since readl() returns a u32, the local variables reg and bypass can also
have the data type u32. Furthermore, divf and divq are derived from reg
and can also be a u32.

Since do_div() casts the divisor to u32 anyway, changing the data type
of divq to u32 removes the following Coccinelle/coccicheck warning
reported by do_div.cocci:

  WARNING: do_div() does a 64-by-32 division, please consider using div64_ul instead

Compile-tested only.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 drivers/clk/socfpga/clk-pll.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/socfpga/clk-pll.c b/drivers/clk/socfpga/clk-pll.c
index 9dcc1b2d2cc0..03a96139a576 100644
--- a/drivers/clk/socfpga/clk-pll.c
+++ b/drivers/clk/socfpga/clk-pll.c
@@ -39,9 +39,9 @@ static unsigned long clk_pll_recalc_rate(struct clk_hw *hwclk,
 					 unsigned long parent_rate)
 {
 	struct socfpga_pll *socfpgaclk = to_socfpga_clk(hwclk);
-	unsigned long divf, divq, reg;
+	u32 divf, divq, reg;
 	unsigned long long vco_freq;
-	unsigned long bypass;
+	u32 bypass;
 
 	reg = readl(socfpgaclk->hw.reg);
 	bypass = readl(clk_mgr_base_addr + CLKMGR_BYPASS);
-- 
2.47.1

