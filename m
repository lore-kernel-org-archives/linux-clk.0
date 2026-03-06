Received: from mail-m3285.qiye.163.com (mail-m3285.qiye.163.com [220.197.32.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83907CA6F
	for <linux-clk@vger.kernel.org>; Fri,  6 Mar 2026 14:43:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.85
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772808195; cv=none; b=c8MxTUot7wP8sUcFvCWIbND3HGUIZULQ2XDVST2XUssHF14a4+MByJW9cdgk0cGKfGAVTTIOiWW03H4exIRC7fm/fvcFdkdSrv21ljaO4rytxnHxC7tZPcgtJYQQ2HTrRXrBPqW7t/0YuOYRrjUAmrD/Pl9Ix+5yvlVfY/QJ2UA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772808195; c=relaxed/simple;
	bh=NQveC0Ujfw+SBr6XxvqVWpU2zDQ2cO7x9t9xlZxf/10=;
	h=From:To:Cc:Subject:Date:Message-Id; b=n+eJxKuyDRsVtz7yxI/dJNdECywFxQchw78bgpM33vgPBwNW5QhkkE3FIOkfKG/J3UJt4EqBdzr1GGsQjB+K69upxr4kIYwkFosLrkHJg56RHd1KgD+LyawOfypSuNU+ekzGgZLjj4oYCNTa6C1XssdOL6uJd6t6PFTHkcjOoN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=C99TDLX+; arc=none smtp.client-ip=220.197.32.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="C99TDLX+"
Received: from localhost.localdomain (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 36064ff08;
	Fri, 6 Mar 2026 20:20:45 +0800 (GMT+08:00)
From: Shawn Lin <shawn.lin@rock-chips.com>
To: Stephen Boyd <sboyd@kernel.org>,
	heiko@sntech.de
Cc: linux-rockchip@lists.infradead.org,
	linux-clk@vger.kernel.org,
	Shawn Lin <shawn.lin@rock-chips.com>
Subject: [PATCH v2] clk: rockchip: rk3568: Add PCIe pipe clock gates
Date: Fri,  6 Mar 2026 20:20:41 +0800
Message-Id: <1772799641-32164-1-git-send-email-shawn.lin@rock-chips.com>
X-Mailer: git-send-email 2.7.4
X-HM-Tid: 0a9cc317d6bc09cckunm81c422351438dd0
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQ0JNHVYZH09NHxhJH0hNQ05WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=C99TDLX+/+QiC5aep1NF9EE/AyPCoWDVr5f+UYJPRPhfDh0+C//nnH8U7txZGdhGuiHWSi6jLuz5GTZCuQZzl+SjbkoV54slCJIm7TZ13dOoQTEI3V/+kit8ddnogdZAmYqcN+fwjGuThsULwtyOv73h0NSfIeBPKwbAfz3C8SU=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=PptrVthH1AWIgAsBETB92Dz9H9/40j7idZq2t4hAU1s=;
	h=date:mime-version:subject:message-id:from;
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

The PCIe pipe clocks are currently left as orphan clocks and remain
enabled indefinitely, which is suboptimal. Add the missing clock gates
so the PCIe driver can explicitly manage them when not in use. In order
not to break compatibility with old DTB, mark them as CLK_IGNORE_UNUSED.

Signed-off-by: Shawn Lin <shawn.lin@rock-chips.com>
---

Changes in v2:
- add CLK_IGNORE_UNUSED flags(Heiko)

 drivers/clk/rockchip/clk-rk3568.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/clk/rockchip/clk-rk3568.c b/drivers/clk/rockchip/clk-rk3568.c
index 74eabf9..d571c4b 100644
--- a/drivers/clk/rockchip/clk-rk3568.c
+++ b/drivers/clk/rockchip/clk-rk3568.c
@@ -827,6 +827,8 @@ static struct rockchip_clk_branch rk3568_clk_branches[] __initdata = {
 			RK3568_CLKGATE_CON(12), 3, GFLAGS),
 	GATE(CLK_PCIE20_AUX_NDFT, "clk_pcie20_aux_ndft", "xin24m", 0,
 			RK3568_CLKGATE_CON(12), 4, GFLAGS),
+	GATE(CLK_PCIE20_PIPE_DFT, "clk_pcie20_pipe_dft", "aclk_pipe", CLK_IGNORE_UNUSED,
+			RK3568_CLKGATE_CON(12), 5, GFLAGS),
 	GATE(ACLK_PCIE30X1_MST, "aclk_pcie30x1_mst", "aclk_pipe", 0,
 			RK3568_CLKGATE_CON(12), 8, GFLAGS),
 	GATE(ACLK_PCIE30X1_SLV, "aclk_pcie30x1_slv", "aclk_pipe", 0,
@@ -837,6 +839,8 @@ static struct rockchip_clk_branch rk3568_clk_branches[] __initdata = {
 			RK3568_CLKGATE_CON(12), 11, GFLAGS),
 	GATE(CLK_PCIE30X1_AUX_NDFT, "clk_pcie30x1_aux_ndft", "xin24m", 0,
 			RK3568_CLKGATE_CON(12), 12, GFLAGS),
+	GATE(CLK_PCIE30X1_PIPE_DFT, "clk_pcie30x1_pipe_dft", "aclk_pipe", CLK_IGNORE_UNUSED,
+			RK3568_CLKGATE_CON(12), 13, GFLAGS),
 	GATE(ACLK_PCIE30X2_MST, "aclk_pcie30x2_mst", "aclk_pipe", 0,
 			RK3568_CLKGATE_CON(13), 0, GFLAGS),
 	GATE(ACLK_PCIE30X2_SLV, "aclk_pcie30x2_slv", "aclk_pipe", 0,
@@ -847,6 +851,8 @@ static struct rockchip_clk_branch rk3568_clk_branches[] __initdata = {
 			RK3568_CLKGATE_CON(13), 3, GFLAGS),
 	GATE(CLK_PCIE30X2_AUX_NDFT, "clk_pcie30x2_aux_ndft", "xin24m", 0,
 			RK3568_CLKGATE_CON(13), 4, GFLAGS),
+	GATE(CLK_PCIE30X2_PIPE_DFT, "clk_pcie30x2_pipe_dft", "aclk_pipe", CLK_IGNORE_UNUSED,
+			RK3568_CLKGATE_CON(13), 5, GFLAGS),
 	GATE(ACLK_SATA0, "aclk_sata0", "aclk_pipe", 0,
 			RK3568_CLKGATE_CON(11), 0, GFLAGS),
 	GATE(CLK_SATA0_PMALIVE, "clk_sata0_pmalive", "gpll_20m", 0,
-- 
2.7.4

