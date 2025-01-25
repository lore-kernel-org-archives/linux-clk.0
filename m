Received: from mail-m3274.qiye.163.com (mail-m3274.qiye.163.com [220.197.32.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A715CA4E;
	Sat, 25 Jan 2025 01:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737767763; cv=none; b=nkodhdlXgGrii011QBBWYi4XXnCKbqhSZ3Munbd3eTNABdI5UdQbZIFabstzF+a83tp/8oIXjEfENv6MbI/qO0SHVwjTa8gfKWgq34EanvvGTQ0FHOM/bd6hNMyJA3jk30PfcIDvNyJfU0f9c9S3jwLlcOJbNcDiDingUNFsJvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737767763; c=relaxed/simple;
	bh=3H2NXxzNhtHz1pn8RjeWts6HoCuy7SY7y74pu7mHgss=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=X33aQVx5aMUtSyZj4ic4RA/q95wrBvGqV+2KGdv5z5r5+V8pM7UVaU8FqLsGOQS50WGmFPZKMp9pocctOAdftgA80FpHk1qZGEPSNCE/bkcB+jPD9htLQtdLr195jevgsJ3A2ecr5925J6Ir5PmsEkC2Tj0wtFE/UuloLOOMEw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=Iw6uicYd; arc=none smtp.client-ip=220.197.32.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="Iw6uicYd"
Received: from localhost.localdomain (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 9a2d132a;
	Sat, 25 Jan 2025 09:15:50 +0800 (GMT+08:00)
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
Subject: [PATCH v2 1/3] Revert "clk: rockchip: Set parent rate for DCLK_VOP clock on RK3228"
Date: Sat, 25 Jan 2025 09:15:43 +0800
Message-Id: <20250125011545.15547-2-zhangqing@rock-chips.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250125011545.15547-1-zhangqing@rock-chips.com>
References: <20250125011545.15547-1-zhangqing@rock-chips.com>
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQxpNGlZMHR9NTx9DT0keGkNWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSUJDQ0
	1VSktLVUtZBg++
X-HM-Tid: 0a949b078cc903a3kunm9a2d132a
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6ODI6ASo5FzIJPBoVDSMCPRxD
	KiNPFBdVSlVKTEhMTE1MTE5JSkpCVTMWGhIXVQETGhUcChIVHDsJFBgQVhgTEgsIVRgUFkVZV1kS
	C1lBWU5DVUlJVUxVSkpPWVdZCAFZQUpJSUM3Bg++
DKIM-Signature:a=rsa-sha256;
	b=Iw6uicYdSrfMTm+P4sIGI8p9s3WIGo8zs6TyvqIH7GzyWRaUNlqfaZ7l0ddwcbcPtA7MhxWMqX87oq3B5fLkya8y2q5IxqJ9i0x/ogFJdEOzR7V3xM95vFITAj6X9wPEbGAIM5GNd+n8oXXinhAfioFWCNaeb1uiveIgHWAX2bo=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
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

