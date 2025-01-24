Received: from mail-m49233.qiye.163.com (mail-m49233.qiye.163.com [45.254.49.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5441C5733A;
	Fri, 24 Jan 2025 06:46:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737701198; cv=none; b=r80B5BxouJ2oi9FSIsspoJXHOw/mIp2c6uMW+DWcUC/qEeim7y6D12Pv7cXXeacCrGN/HmMJFhq9mBI1ZrclAvdU7BUsNJRquGUyy77D1GsS7nnugiicCBcK0wGR547V9gfhdRAHWiKMlG0sShn2VmdH8TMCGGbbNweabGr2Kh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737701198; c=relaxed/simple;
	bh=3H2NXxzNhtHz1pn8RjeWts6HoCuy7SY7y74pu7mHgss=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=bGmitSo9LeLB3I+slztq9OJtROVW0nx5mVjak0NEoWtATGYMuIM3ciKy6VCqbhXAkwFnNA5jOgbk9emoXdrA8WteoQPkssEfB9HGcE3ip10XXC04IOLSNKvFQE7R65GM8OeXD1VntZMyrFNZwrDHJ+pnycJdYuT/3udqZpEApwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=Q3AHsp8Z; arc=none smtp.client-ip=45.254.49.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="Q3AHsp8Z"
Received: from localhost.localdomain (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 994456e9;
	Fri, 24 Jan 2025 14:46:24 +0800 (GMT+08:00)
From: Elaine Zhang <zhangqing@rock-chips.com>
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	kever.yang@rock-chips.com,
	zhangqing@rock-chips.com,
	heiko@sntech.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-clk@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	huangtao@rock-chips.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v1 1/3] Revert "clk: rockchip: Set parent rate for DCLK_VOP clock on RK3228"
Date: Fri, 24 Jan 2025 14:46:17 +0800
Message-Id: <20250124064619.13893-2-zhangqing@rock-chips.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250124064619.13893-1-zhangqing@rock-chips.com>
References: <20250124064619.13893-1-zhangqing@rock-chips.com>
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGklPSVYZQ0NCTR8YGk9KHRlWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
X-HM-Tid: 0a94970fd33703a3kunm994456e9
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6OhA6LCo6OjILNCEPLxIjDCk*
	OFEaCUlVSlVKTEhMTEtKSkNOTEhPVTMWGhIXVQETGhUcChIVHDsJFBgQVhgTEgsIVRgUFkVZV1kS
	C1lBWU5DVUlJVUxVSkpPWVdZCAFZQUpJSUM3Bg++
DKIM-Signature:a=rsa-sha256;
	b=Q3AHsp8ZPf0u4T67+2WEdLl0ZeMtCIFJmcVsIVcJS6//9sW7npkSYDvORxz0jdb79/kL8wbrY5vEGCqM6kNKBgicq8R50+ZOHjxOC5GfnY6pIMoNwN5zk82tar3rK3px/X6iG3zGKF0yB3C6dt54IIdrZ2VMHMZN5O8CFK4AErM=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=/anGkf2igP9SKOSzCFL/ChT8CaIIzLztcOi6KLOhh+8=;
	h=date:mime-version:subject:message-id:from;
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

This reverts commit 1d34b9757523c1ad547bd6d040381f62d74a3189.

RK3228 Only GPLL and CPLL, GPLL is a common clock, does not allow
dclk_vop to change its frequency, CPLL is used by GMAC,
if dclk_vop use CLK_SET_RATE_PARENT and CLK_SET_RATE_NO_REPARENT flags will
affect the GMAC function.

If the client application does not use GMAC and CPLL is free, make this
change on the local branch.

Signed-off-by: Elaine Zhang <zhangqing@rock-chips.com>
---
 drivers/clk/rockchip/clk-rk3228.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/rockchip/clk-rk3228.c b/drivers/clk/rockchip/clk-rk3228.c
index ed602c27b624..9c0284607766 100644
--- a/drivers/clk/rockchip/clk-rk3228.c
+++ b/drivers/clk/rockchip/clk-rk3228.c
@@ -409,7 +409,7 @@ static struct rockchip_clk_branch rk3228_clk_branches[] __initdata = {
 			RK2928_CLKSEL_CON(29), 0, 3, DFLAGS),
 	DIV(0, "sclk_vop_pre", "sclk_vop_src", 0,
 			RK2928_CLKSEL_CON(27), 8, 8, DFLAGS),
-	MUX(DCLK_VOP, "dclk_vop", mux_dclk_vop_p, CLK_SET_RATE_PARENT | CLK_SET_RATE_NO_REPARENT,
+	MUX(DCLK_VOP, "dclk_vop", mux_dclk_vop_p, 0,
 			RK2928_CLKSEL_CON(27), 1, 1, MFLAGS),
 
 	FACTOR(0, "xin12m", "xin24m", 0, 1, 2),
-- 
2.17.1

