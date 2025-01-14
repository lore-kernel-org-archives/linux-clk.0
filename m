Received: from out-182.mta0.migadu.com (out-182.mta0.migadu.com [91.218.175.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24BF0234CFA
	for <linux-clk@vger.kernel.org>; Tue, 14 Jan 2025 11:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736854239; cv=none; b=bivpi6WqH0OUI+V5jhM759j2iXFKUtRCH8VcgRrhmnnVM/zrQgz6N5Z/LuBre9sjkN5BDnSYoXjLKGWSeB0FBg/LWK9zU/VCP8N1DdKn+ztWsendgJC9RXwO2B4VdaObronhHtcpNCt9dUuh2Z2P+0AqN7XIj5fd696JN5vhjMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736854239; c=relaxed/simple;
	bh=AX5Zl9IQ3U2RQBPj3tPw0ZNojcgw+upIN6foUglPjG4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hvYjTlLAmO/kl48GWBNsK9d0x8VIczpzIijGQeCUDVglYpExQpKn/EVtxRmULev8YnR9mW2QjH2AJp+821HtE9Xe3kklyMjHP0SgCYvTZdzVLY2yz8W+z+TQF4dIwuO+iO9/V1j+IYVA/zaZJuCkonOlXt104EY9NPYE0G+ZrSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=w7WYiVcu; arc=none smtp.client-ip=91.218.175.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="w7WYiVcu"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1736854232;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=2wlxqkYgrjGuOJhI33KiIh6ahY/6jcrOmURXvTeByvQ=;
	b=w7WYiVcuRrsLeR0D/7lkk9AlsgSktZQ8ePCiaf0Q/+unhi3xNiZcJ/z9i3Hjt2bOYlefuY
	ycZEvsqm2VnaWtil0+BBwfklDIxyc+uCLPftfYAv5mkT7guKUetFZQgc1TO6aHDuQ2veGG
	LoxGhzUSGRoXZtS/IN2d+y13MUnhno0=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Dinh Nguyen <dinguyen@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] clk: socfpga: stratix10: Optimize local variables
Date: Tue, 14 Jan 2025 12:29:43 +0100
Message-ID: <20250114112943.617371-2-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Since readl() returns a u32, the local variable reg can also have the
data type u32. Furthermore, mdiv and refdiv are derived from reg and can
also be a u32.

Since do_div() casts the divisor to u32 anyway, changing the data type
of refdiv to u32 removes the following Coccinelle/coccicheck warning
reported by do_div.cocci:

  WARNING: do_div() does a 64-by-32 division, please consider using div64_ul instead

Compile-tested only.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 drivers/clk/socfpga/clk-pll-s10.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/socfpga/clk-pll-s10.c b/drivers/clk/socfpga/clk-pll-s10.c
index 1d82737befd3..a88c212bda12 100644
--- a/drivers/clk/socfpga/clk-pll-s10.c
+++ b/drivers/clk/socfpga/clk-pll-s10.c
@@ -83,9 +83,9 @@ static unsigned long clk_pll_recalc_rate(struct clk_hw *hwclk,
 					 unsigned long parent_rate)
 {
 	struct socfpga_pll *socfpgaclk = to_socfpga_clk(hwclk);
-	unsigned long mdiv;
-	unsigned long refdiv;
-	unsigned long reg;
+	u32 mdiv;
+	u32 refdiv;
+	u32 reg;
 	unsigned long long vco_freq;
 
 	/* read VCO1 reg for numerator and denominator */
-- 
2.47.1

