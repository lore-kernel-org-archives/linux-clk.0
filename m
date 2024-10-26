Received: from out-181.mta0.migadu.com (out-181.mta0.migadu.com [91.218.175.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E380243172
	for <linux-clk@vger.kernel.org>; Sat, 26 Oct 2024 15:53:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729958041; cv=none; b=QDdHd/Es4jzDvY10C+YQkIWssPdIvYE31c5sCz9x7BfhQaRoSJtj1ezTr12zwaffNlhN0RwHmdIebQ+J7KxatTXdi9D8JkU6qeqVsX6y5urIlsWibgbMUejiJPi79oI0enVOm4WqXQ6pqk86Mn7J28nqNHQy37iEnHjXA7rpOrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729958041; c=relaxed/simple;
	bh=X4FrbSoyY3nl2u9HVc4ER9FQGO1gtD9pEGPdPZRliTM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bDt4r5uMWHF+ZMunHzo7m5a+L7Wk0B664Df9X90S20rk1y5WKAwDVH5a4YDeXbpOpCAvlmMUVcQe2SYD2lulKn8TBjh+6KB7Mw4wOG5M2x/84AnKOfYnUzGrxbHtowW1S/wXqeb7Y/8hXLAKJs8woIPtBj9p/qiYYTfXEOUJMes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=INVacg0Z; arc=none smtp.client-ip=91.218.175.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="INVacg0Z"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1729958034;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=s1YWqkMnBtrc9mboMzUV/AKv/C9CTZRcvX8zL+thI+w=;
	b=INVacg0Z0r9fQ06HVo8JITG0U8zRvnfEjZWymSfk/5qTJ88H8Qm46NYb5bb26jnh5+7EfA
	q8IPnsG/Hw12pFQJ1Qu4vJhrlXMhHk6kjPKXOSTHP1RYZ4sOXZS2opYxJVZR9Wbn04+AMv
	leloHx83XOHYKl8R0moSC8BQ5Xf7ZVI=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Dinh Nguyen <dinguyen@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RESEND PATCH] clk: socfpga: arria10: Optimize local variables in clk_pll_recalc_rate()
Date: Sat, 26 Oct 2024 17:53:04 +0200
Message-ID: <20241026155304.159716-2-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Since readl() returns a u32, the local variable reg can also have the
data type u32. Furthermore, divf and divq are derived from reg and can
also be a u32.

Since do_div() casts the divisor to u32 anyway, changing the data type
of divq to u32 also removes the following Coccinelle/coccicheck warning
reported by do_div.cocci:

  WARNING: do_div() does a 64-by-32 division, please consider using div64_ul instead

Compile-tested only.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 drivers/clk/socfpga/clk-pll-a10.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/socfpga/clk-pll-a10.c b/drivers/clk/socfpga/clk-pll-a10.c
index b028f25c658a..62eed964c3d0 100644
--- a/drivers/clk/socfpga/clk-pll-a10.c
+++ b/drivers/clk/socfpga/clk-pll-a10.c
@@ -35,7 +35,7 @@ static unsigned long clk_pll_recalc_rate(struct clk_hw *hwclk,
 					 unsigned long parent_rate)
 {
 	struct socfpga_pll *socfpgaclk = to_socfpga_clk(hwclk);
-	unsigned long divf, divq, reg;
+	u32 divf, divq, reg;
 	unsigned long long vco_freq;
 
 	/* read VCO1 reg for numerator and denominator */
-- 
2.47.0

