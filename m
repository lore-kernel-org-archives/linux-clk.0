Received: from mail-m127159.xmail.ntesmail.com (mail-m127159.xmail.ntesmail.com [115.236.127.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C304357D17
	for <linux-clk@vger.kernel.org>; Sat, 10 Oct 2026 15:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.236.127.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791646415; cv=none; b=L4xWbDVa6RRJFRjJbDRTg8O2sLMINm30k6aC06bq+P1GFt0etRUm7QYYjaX3mTIHiv+DTut36PwmIq+YppbZ1zWjRDMWrP+nWfNI9yvBlkthzju9hi0qNEKqHmwoxaeHs3aHL5EE7GiRdzgHLEzs95tIM+gZvC6BvlnZ2eNDaFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791646415; c=relaxed/simple;
	bh=vDtSt8BVBlfls3fTwP9vPuO3EMmM05i7of5iRjQZpvY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=anPrzAlcOvQ+aqdfMHyDIa3MaBHY8Mm8kk2iO/itqvxAdfHA4twY+S3N3lAldTNgCzxC1pbbFNJVuLaLiZHgy2vxHcX4c0Hik2uFjy0a8Q8NMdIXkeaML/6BWnpS8hlcEtLGkkCB2TF8PYqIGDnsfNAPlRtcB9YlN8uIakF4b24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=jSXz+bj1; arc=none smtp.client-ip=115.236.127.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="jSXz+bj1"
Received: from localhost.localdomain (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 509291fa2;
	Sat, 10 Oct 2026 22:17:45 +0800 (GMT+08:00)
From: Shawn Lin <shawn.lin@rock-chips.com>
To: Stephen Boyd <sboyd@kernel.org>,
	heiko@sntech.de,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-rockchip@lists.infradead.org,
	linux-clk@vger.kernel.org,
	Shawn Lin <shawn.lin@rock-chips.com>,
	Fabio Estevam <festevam@nabladev.com>
Subject: [PATCH 2/2] clk: rockchip: fix wrong PMU CLKSEL register on rv1103b
Date: Sat, 10 Oct 2026 22:17:19 +0800
Message-Id: <1791641839-74584-3-git-send-email-shawn.lin@rock-chips.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1791641839-74584-1-git-send-email-shawn.lin@rock-chips.com>
References: <1791641839-74584-1-git-send-email-shawn.lin@rock-chips.com>
X-HM-Tid: 0aa1262d4ebf03a4kunm7e28e606b1d68
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1kYFggdWUFKV1ktWUFJV1kPCRoVCBIfWUFZQhlMGVZKTRpLSx5KSk
	1MHklWFRQJFhoXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0
	tIVUpLSU9PT0hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=jSXz+bj1bwHG2NvbdLm8kB/3CrhmFQqx/IlVruqajaJfk2itwshFwUH3DKa8t39dEZU6MYYrkOHQ5aNZjJKah8TMUUnIJIFBYdIDc+jE9Lzki+pVAhHI2f2MZvtwXvnN0+gtot+auS+013VnWYkmwChSHL70h94sYvkjUwvwJ6A=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=cRVD+j0mEe6JG0Q8711sJijh9bJIZ8lloQUL6z3dLHY=;
	h=date:mime-version:subject:message-id:from;
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

clk_32k and dbclk_pmu_gpio0 use RK3568_PMU_CLKSEL_CON(0), which is the
wrong SoC macro and resolves to 0x100 in the PERICRU region instead of
the RV1103B PMUCRU register at 0x70300. Reading or setting these clocks
would access an unrelated register.

Use RV1103B_PMUCLKSEL_CON(0), as already done for the XIN_RC_SRC clock
in the same file.

Fixes: 3e65e426d457 ("clk: rockchip: Add clock controller for the RV1103B")
Cc: Fabio Estevam <festevam@nabladev.com>
Signed-off-by: Shawn Lin <shawn.lin@rock-chips.com>

---

 drivers/clk/rockchip/clk-rv1103b.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/rockchip/clk-rv1103b.c b/drivers/clk/rockchip/clk-rv1103b.c
index 7da1fda..aee1ba4 100644
--- a/drivers/clk/rockchip/clk-rv1103b.c
+++ b/drivers/clk/rockchip/clk-rv1103b.c
@@ -130,7 +130,7 @@ static struct rockchip_clk_branch rv1103b_clk_uart2_fracmux __initdata =
 
 static struct rockchip_clk_branch rv1103b_rcdiv_pmu_fracmux __initdata =
 	MUX(CLK_32K, "clk_32k", clk_32k_p, CLK_SET_RATE_PARENT | CLK_SET_RATE_NO_REPARENT,
-			RK3568_PMU_CLKSEL_CON(0), 0, 2, MFLAGS);
+			RV1103B_PMUCLKSEL_CON(0), 0, 2, MFLAGS);
 
 static struct rockchip_clk_branch rv1103b_clk_branches[] __initdata = {
 
@@ -373,7 +373,7 @@ static struct rockchip_clk_branch rv1103b_clk_branches[] __initdata = {
 	GATE(PCLK_PMU_GPIO0, "pclk_pmu_gpio0", "lsclk_pmu_root", 0,
 			RV1103B_PMUCLKGATE_CON(0), 4, GFLAGS),
 	COMPOSITE_NODIV(DBCLK_PMU_GPIO0, "dbclk_pmu_gpio0", dbclk_pmu_gpio0_p, 0,
-			RK3568_PMU_CLKSEL_CON(0), 3, 1, MFLAGS,
+			RV1103B_PMUCLKSEL_CON(0), 3, 1, MFLAGS,
 			RV1103B_PMUCLKGATE_CON(0), 5, GFLAGS),
 	GATE(PCLK_PWM0, "pclk_pwm0", "lsclk_pmu_root", 0,
 			RV1103B_PMUCLKGATE_CON(2), 0, GFLAGS),
-- 
2.7.4

