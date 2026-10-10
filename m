Received: from mail-m11880.qiye.163.com (mail-m11880.qiye.163.com [115.236.118.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 247DD37C93E
	for <linux-clk@vger.kernel.org>; Sat, 10 Oct 2026 14:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.236.118.80
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791643997; cv=none; b=I3xIhJysqXY9iB3T6wOHcWVqIa8JaVWU321bLOSMFS76c2rgdC7ibUyDx82hkU6I/ypS63NsKzxgkgik3gatkCT1hFuHPAd1MTWntWzenEgEXRf2s/85c+ShXSe4vCHW0otKNZqNT2DDU+4XI1PGV6c9cika0fcNhFgrzi02EuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791643997; c=relaxed/simple;
	bh=meo7ZWMNSmPO+T9V9nNz6SKrkZ3LHN+SVKfUJ2bUr2I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=V4zfdcc4qjnJpGVbT0hc9yPQjcn+8V9qjgH2G8JUx3MeOdYjd7Oly4rYfVg25QmDHP8OL1OjhnrSCDAAPAqjl1OOoc5t4i2cnPPSagTkcb9g2vUgypJepxjO1lGV9RgzJbjoMGK77LTs1kp03+SHVFJ7Q9ZIjfRedn8yKXFgwPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=FsLQDWbx; arc=none smtp.client-ip=115.236.118.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="FsLQDWbx"
Received: from localhost.localdomain (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 509291f9e;
	Sat, 10 Oct 2026 22:17:41 +0800 (GMT+08:00)
From: Shawn Lin <shawn.lin@rock-chips.com>
To: Stephen Boyd <sboyd@kernel.org>,
	heiko@sntech.de,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-rockchip@lists.infradead.org,
	linux-clk@vger.kernel.org,
	Shawn Lin <shawn.lin@rock-chips.com>,
	Finley Xiao <finley.xiao@rock-chips.com>
Subject: [PATCH 1/2] clk: rockchip: fix wrong gate register for clk_gpll_mux_to_ddr on rk3562
Date: Sat, 10 Oct 2026 22:17:18 +0800
Message-Id: <1791641839-74584-2-git-send-email-shawn.lin@rock-chips.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1791641839-74584-1-git-send-email-shawn.lin@rock-chips.com>
References: <1791641839-74584-1-git-send-email-shawn.lin@rock-chips.com>
X-HM-Tid: 0aa1262d3cef03a4kunm7e28e606b1d48
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1kYFggdWUFKV1ktWUFJV1kPCRoVCBIfWUFZQhpPS1ZITxpOSBgeHx
	gYTk9WFRQJFhoXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0
	tIVUpLSU9PT0hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=FsLQDWbx3WkM0ZuafzU8FtRQEptNPUhrkhG4cSMdJnCIsP90yR/gXJCxknmlQhh79as/vZs9aJ6VkXKPzlBYaqmHBjJpnxbo6Qkyq4TMHx6IKkZPZr3F3+M3aC1jpmn3C8LNQ4/qmQOd6UQBBJHZZOKxNJzjOMgxQmvgDbKUDnY=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=BFp2VAMG30ajGJ8VoabQUO+EFc8CmpRSZIsH4oKDbzw=;
	h=date:mime-version:subject:message-id:from;
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

clk_gpll_mux_to_ddr uses RK3328_CLKGATE_CON(1), which is the wrong SoC
macro and points to an unrelated register (0x204) in the RK3562 CRU. As a
result enabling/disabling this clock writes the wrong register.

Use RK3562_DDR_CLKGATE_CON(0) with bit 0, matching the other DDR clocks
in the same PD_DDR section.

Fixes: f863d4cc79a7 ("clk: rockchip: Add clock controller for the RK3562")
Cc: Finley Xiao <finley.xiao@rock-chips.com>
Signed-off-by: Shawn Lin <shawn.lin@rock-chips.com>
---

 drivers/clk/rockchip/clk-rk3562.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/rockchip/clk-rk3562.c b/drivers/clk/rockchip/clk-rk3562.c
index b8858e5..07eeb82 100644
--- a/drivers/clk/rockchip/clk-rk3562.c
+++ b/drivers/clk/rockchip/clk-rk3562.c
@@ -411,7 +411,7 @@ static struct rockchip_clk_branch rk3562_clk_branches[] __initdata = {
 
 	/* PD_DDR */
 	FACTOR_GATE(0, "clk_gpll_mux_to_ddr", "gpll", 0, 1, 4,
-			RK3328_CLKGATE_CON(1), 6, GFLAGS),
+			RK3562_DDR_CLKGATE_CON(0), 0, GFLAGS),
 	COMPOSITE_NOMUX(PCLK_DDR, "pclk_ddr", "clk_gpll_mux_to_ddr", CLK_IS_CRITICAL,
 			RK3562_DDR_CLKSEL_CON(1), 8, 5, DFLAGS,
 			RK3562_DDR_CLKGATE_CON(0), 3, GFLAGS),
-- 
2.7.4

