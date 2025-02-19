Received: from out-187.mta0.migadu.com (out-187.mta0.migadu.com [91.218.175.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBB081ACED2
	for <linux-clk@vger.kernel.org>; Wed, 19 Feb 2025 10:44:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739961893; cv=none; b=RnCJ3Qpmxta8fUWKIHBlGEsVU+d2GY4SJH5m1N7ZIJ4lnrv6bg2VVxHCABbdrTW/skdTfG4RHfeZf6gQ6RBPtPu320BdLjiYCHCt9vnjyhxMikUOjoPRZjPWemcagQd16pH3ukvos6e3TxZdmrtCwsymlzwHCWcMRZsT09PsS4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739961893; c=relaxed/simple;
	bh=yOasvxAPT+33s1e8WIhGVLyj9p6z+7KuZNdkuNuKPQI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NXXCJqiqRLAoFn/tDiw/IYXV3TL3xIA1CEhdMs/YDH2IeP3q5w9T2gvszE8kMLl0OxvBe+2ZcHDj5aggEsulSaAGbbnwanSnJMjyxTnLv9YCegq+4oR6HtbnhzJFzDpcJ929q0QJNJay1gn6U9DBcWFUoSnKL3IEs2oShSVXq8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=h0LKRF3P; arc=none smtp.client-ip=91.218.175.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="h0LKRF3P"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1739961889;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=+lLHrG6tRNaGKq8TsOg3rt8iC7m9nw0vu2rC3UkGSno=;
	b=h0LKRF3PkNW/x1UQSwcIU5DKC/9ASBUFtlWxCxJOgjyBSlmqTvp11D2GtOZ9H8gmwWHzxA
	c0mXEM1Mz3szoFFvq1tbZggD/wHHScVhTgxCninZYq8aYJv6UVDJJ/jHbPt6AczdLPsV4U
	oncHpCYcxO5acySrn09ZHTwgwWjusDE=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Dinh Nguyen <dinguyen@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RESEND PATCH] clk: socfpga: stratix10: Optimize local variables
Date: Wed, 19 Feb 2025 11:44:35 +0100
Message-ID: <20250219104435.1525-2-thorsten.blum@linux.dev>
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

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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
2.48.1

