Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9442ADDCD;
	Wed,  4 Mar 2026 12:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772626493; cv=none; b=pSKKScMsqXequz+7EaMexLIq1dmqxRwn3PnagXJrKd/nYL6mRgmQSIQgIUw6XZ2vXf2Kiiswsj34vQSIhVV8O8wT9DbcKRhd6gvnPKatx1lxIotVl9sjM14p2AY+agJK3O67AXvUjC2ja4fNQcE5l+Vc0aGJyvgrCXUUQti9hZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772626493; c=relaxed/simple;
	bh=FQsOAaeOqbQONHCMhqiTnBI8NvFE6Rk6FCcDxqAzJt8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ArKpc10J3rI6lfWqASnmhw3dDpVA7oCWfTgRSrX+9GFaiWPTpU3Nzw/77jgGpZxA8WRaMwd2sOtL+M1kruZ3KeDwfb0lAnQglSHNRxMSZrSwq0INVrBSt2bkVrFrZceJuHmr8Jz3yaarolT3XYvjTsP44bcVWf9ZgPubBmmnpAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=OajnsuJJ; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="OajnsuJJ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type;
	bh=GJmHFljpEktxG+o1kVluo3l2vFyFucx25ZTMVp0Iv+8=; b=OajnsuJJ1NA1PqL+KDNrbZ8CDH
	ZUC26BqxVv/yf70Sj1xTLz4sy95IrnDdcliQoHTWuAYUSezlaNqWzlQGTSlrGP+1RbIiN4dlnfow5
	wsN/08VCmBPrmKbrrjfIKIh9vaIpKPG5XWZ4YELcIBzK6aHPfhzL6HH8Qq+qCQZlM7IBvQ+9vZnUO
	QlRiO6ShW0MwoiPD8wOs2ZOQsmjavnsSr8uBA3Urd7D0kTbj0IJJ3vWJeD0WixLMoaich4jwMNVsz
	V9m6eIoGdV1L8bPUkatefFiGk9L5p5xff8negxLSmtkbEMCq8Mm1L1Rp6Nj+l1C+iGvo4MjjCU+Gy
	bJJBFQKw==;
From: Heiko Stuebner <heiko@sntech.de>
To: heiko@sntech.de
Cc: mturquette@baylibre.com,
	sboyd@kernel.org,
	zhangqing@rock-chips.com,
	sebastian.reichel@collabora.com,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	quentin.schulz@cherry.de,
	andyshrk@163.com,
	macromorgan@hotmail.com,
	Heiko Stuebner <heiko.stuebner@cherry.de>
Subject: [PATCH v2 2/2] clk: rockchip: rk3588: Allow VP2 the same sourcing options as other VPs
Date: Wed,  4 Mar 2026 13:14:26 +0100
Message-ID: <20260304121426.1184680-3-heiko@sntech.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260304121426.1184680-1-heiko@sntech.de>
References: <20260304121426.1184680-1-heiko@sntech.de>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Heiko Stuebner <heiko.stuebner@cherry.de>

Right now dclk_vop2_src is not allowed to change its parent, while
the other two dclks are allowed to do this.

All three VPs can drive non-static outputs (HDMI, DP, eDP) and even the
eDP can also support full DP connections (though no DP+).

Therefore remove the CLK_SET_RATE_NO_REPARENT flag, to allow VP2 the same
flexibility in aquiring its clock rate.

Tested-by: Quentin Schulz <quentin.schulz@cherry.de> # RK3588 Tiger w/ DP
Signed-off-by: Heiko Stuebner <heiko.stuebner@cherry.de>
---
 drivers/clk/rockchip/clk-rk3588.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/rockchip/clk-rk3588.c b/drivers/clk/rockchip/clk-rk3588.c
index bea2deed0e23..cf83242d1726 100644
--- a/drivers/clk/rockchip/clk-rk3588.c
+++ b/drivers/clk/rockchip/clk-rk3588.c
@@ -2094,7 +2094,7 @@ static struct rockchip_clk_branch rk3588_early_clk_branches[] __initdata = {
 	COMPOSITE(DCLK_VOP1_SRC, "dclk_vop1_src", gpll_cpll_v0pll_aupll_p, 0,
 			RK3588_CLKSEL_CON(111), 14, 2, MFLAGS, 9, 5, DFLAGS,
 			RK3588_CLKGATE_CON(52), 11, GFLAGS),
-	COMPOSITE(DCLK_VOP2_SRC, "dclk_vop2_src", gpll_cpll_v0pll_aupll_p, CLK_SET_RATE_NO_REPARENT,
+	COMPOSITE(DCLK_VOP2_SRC, "dclk_vop2_src", gpll_cpll_v0pll_aupll_p, 0,
 			RK3588_CLKSEL_CON(112), 5, 2, MFLAGS, 0, 5, DFLAGS,
 			RK3588_CLKGATE_CON(52), 12, GFLAGS),
 	COMPOSITE_NODIV(DCLK_VOP0, "dclk_vop0", dclk_vop0_p,
-- 
2.47.3

