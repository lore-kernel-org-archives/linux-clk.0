Received: from sender6-op-o12.zoho.com (sender6-op-o12.zoho.com [165.173.180.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AD38233956;
	Sun,  6 Sep 2026 07:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.180.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788678471; cv=pass; b=tWatfQ9MhDejhNdfH2MomoIB/M9kWNSOEPG5WtdQ1dMAiUPhrT2MGq/JxuAfqDLKHBWzWvbHhUVnQfJCUyNNvJlFpZzwQY+pMK4pWhX+0aXV6nA6YRzyzn969F+Uy97UW9BLouwxfkPOjhHEl9Jrrl5geNfRifCKi+KmtWWzp2s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788678471; c=relaxed/simple;
	bh=w/ethCL/2gAqTdxAZVO9TFIwPKiMkbxjk7GgSv1iGNo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OaqZjVgqpBdq3Dw7q2BcEG1267wXiHh/qBPV+g/Ygvf7oP/aV9DXx+xYecjg/gKTcH9szyxOknzfCT2MkLJumNDDwdA7LBbiWJa1TTb8ViKhW7CSD8bgTPDe9VetfcfY+diHrE5mLoRpvWO+H2X6vAKMGoPDImm92/blHh1Dkp8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech; spf=pass smtp.mailfrom=pigmoral.tech; dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b=MvZpfBlI; arc=pass smtp.client-ip=165.173.180.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b="MvZpfBlI"
ARC-Seal: i=1; a=rsa-sha256; t=1788678453; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=VOmY7Mx6V7nPIKxm7Qr1P54o00k5vj4MYaGOwmGLQayhxJyni/ZhJbwg/+fQWSeX5SgCZlG9EOJQQSAEaITunzKNUJIVtJ+aucT6X8+ndiyfaYxcHCjSlM32Sebqc0Yz43JHU+JWxKhvoBCjpKDS05/mxyf4Q+QHWTiQYQyZEM8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1788678453; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=IeNOG/fyhyW08X+c9FOeZI3cRdPDCI7EfAS9OrYLb8o=; 
	b=U0+zhS0Dr8hv0fNFyTOeGYrmAAu5HFD7aGEgCosRlurDIY8iW42QHYfJRp33rLCu7hkXaDJLsD+QxV+XMR1Kb31UXbp/JuYsF1jxwsDgDhIkgxY2nJ+4zAVeV2ZHeLc5f9wxVH2TeQILF5YS9MfElL0YovIkW4F1bq7q97Rvne4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1788678453;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=IeNOG/fyhyW08X+c9FOeZI3cRdPDCI7EfAS9OrYLb8o=;
	b=MvZpfBlIbI4tiaYJfwYdI6Wyz1RfXx2c9mlkcFBiTMGEwb108EG5L2erpxgfvh+X
	y3Yv8FnVWMGcyqFkS4UACgxPFJ6X1LVdT9GUSFKAKANRIdZRSF20Pw2KrmW0u04hily
	fnnagx1+pGndXBcfGThhbFtFvcp//R18Rv21X3zg=
Received: by mx.zohomail.com with SMTPS id 1788678452458799.045213868163;
	Sun, 6 Sep 2026 00:07:32 -0700 (PDT)
From: Junhui Liu <junhui.liu@pigmoral.tech>
Date: Sun, 06 Sep 2026 15:06:41 +0800
Subject: [PATCH 4/4] clk: sunxi-ng: sun55i-a523-r-ccu: Use P-only clocks
 for timers
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260906-sunxi-clk-no-p-v1-4-cbde21c9fe69@pigmoral.tech>
References: <20260906-sunxi-clk-no-p-v1-0-cbde21c9fe69@pigmoral.tech>
In-Reply-To: <20260906-sunxi-clk-no-p-v1-0-cbde21c9fe69@pigmoral.tech>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Andre Przywara <andre.przywara@arm.com>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Junhui Liu <junhui.liu@pigmoral.tech>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2310;
 i=junhui.liu@pigmoral.tech; h=from:subject:message-id;
 bh=w/ethCL/2gAqTdxAZVO9TFIwPKiMkbxjk7GgSv1iGNo=;
 b=owGbwMvMwCWWvDb1VEXc8j+Mp9WSGLLmCgodfq0cfVtu8Qldz1kHfqtEZVZeNdw5wy5N/lDLm
 72Kq8N4O0pZGMS4GGTFFFm4/MX/WevwfDsi0HofZg4rE8gQBi5OAZgIy35GhnXZRdctn7UwfO3f
 sv952nKVmq3ya52S30aL3Pq/h1fx91FGhgmPahacb/e4znI4Lqo4ZrtYdWHCJEuBM+uyXl3ouWP
 4lAkA
X-Developer-Key: i=junhui.liu@pigmoral.tech; a=openpgp;
 fpr=15B30CC69C4BF0CC3C08F85A2A90CDC122DF37BF
X-ZohoMailClient: External

The R timer clocks only have a P divider, but are currently modeled as
MP clocks with a zero-width M divider.

ccu_mp_set_rate() generates an invalid mask for the zero-width M
divider, clearing unrelated register fields. Model these clocks as
P-only clocks to avoid accessing a nonexistent M divider.

Fixes: 8cea339cfb81 ("clk: sunxi-ng: add support for the A523/T527 PRCM CCU")
Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
---
 drivers/clk/sunxi-ng/ccu-sun55i-a523-r.c | 37 +++++++++++++++-----------------
 1 file changed, 17 insertions(+), 20 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu-sun55i-a523-r.c b/drivers/clk/sunxi-ng/ccu-sun55i-a523-r.c
index db0e36d8838e..349230e28c1c 100644
--- a/drivers/clk/sunxi-ng/ccu-sun55i-a523-r.c
+++ b/drivers/clk/sunxi-ng/ccu-sun55i-a523-r.c
@@ -43,27 +43,24 @@ static SUNXI_CCU_M_DATA_WITH_MUX(r_apb1_clk, "r-apb1",
 				 24, 3,	/* mux */
 				 0);
 
-static SUNXI_CCU_MP_DATA_WITH_MUX_GATE(r_cpu_timer0, "r-timer0",
-				       r_ahb_apb_parents, 0x100,
-				       0, 0,	/* no M */
-				       1, 3,	/* P */
-				       4, 3,	/* mux */
-				       BIT(0),
+static SUNXI_CCU_P_DATA_WITH_MUX_GATE(r_cpu_timer0, "r-timer0",
+				      r_ahb_apb_parents, 0x100,
+				      1, 3,	/* P */
+				      4, 3,	/* mux */
+				      BIT(0),
+				      0);
+static SUNXI_CCU_P_DATA_WITH_MUX_GATE(r_cpu_timer1, "r-timer1",
+				      r_ahb_apb_parents, 0x104,
+				      1, 3,	/* P */
+				      4, 3,	/* mux */
+				      BIT(0),
+				      0);
+static SUNXI_CCU_P_DATA_WITH_MUX_GATE(r_cpu_timer2, "r-timer2",
+				      r_ahb_apb_parents, 0x108,
+				      1, 3,	/* P */
+				      4, 3,	/* mux */
+				      BIT(0),
 				      0);
-static SUNXI_CCU_MP_DATA_WITH_MUX_GATE(r_cpu_timer1, "r-timer1",
-				       r_ahb_apb_parents, 0x104,
-				       0, 0,	/* no M */
-				       1, 3,	/* P */
-				       4, 3,	/* mux */
-				       BIT(0),
-				       0);
-static SUNXI_CCU_MP_DATA_WITH_MUX_GATE(r_cpu_timer2, "r-timer2",
-				       r_ahb_apb_parents, 0x108,
-				       0, 0,	/* no M */
-				       1, 3,	/* P */
-				       4, 3,	/* mux */
-				       BIT(0),
-				       0);
 
 static SUNXI_CCU_GATE_HW(bus_r_timer_clk, "bus-r-timer", &r_ahb_clk.common.hw,
 			 0x11c, BIT(0), 0);

-- 
2.55.0

