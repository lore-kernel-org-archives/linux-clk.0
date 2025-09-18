Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBB51212552
	for <linux-clk@vger.kernel.org>; Thu, 18 Sep 2025 16:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758211585; cv=none; b=IzDzOmiMxQpGkP9X7EaDs2cTZ3YEb4T4X9524JakpDfaQCf2IY4N7FdB+okKN5icGz5cZdJxAgYFR+6wo4kfDgX/1oc8OZU796nEQP/8ILLmhXK2xRFRwAL8ssrWeAAPqDzerTd2SzOO3fz3goUtpjD9pfXKp/c45HkXdq0IZEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758211585; c=relaxed/simple;
	bh=lOeu2lxM2qFlnTBcISVXbb0zyO5sYwspCFPVktFrhkg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 References; b=kyz5fcRcb5DZW9XoDhxht2iseI/xQgGdw6v4q2t/gkC59L8abhtc/1BN9/rpyYvSPcCG+dWc31/ALzUm1sHei0TxyxGkSpWF/2PXcLWFAMeWRdDQOPoeZtE61l4pZShoG6+cAcZMEM5GWLD5ajRIUFvsasybQc0xV/0We8BBNiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=XbRJiMmc; arc=none smtp.client-ip=210.118.77.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="XbRJiMmc"
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20250918160615euoutp01d8778256470f91a8f1a7c66837e7adea~mbBzN4s9X1209912099euoutp01M
	for <linux-clk@vger.kernel.org>; Thu, 18 Sep 2025 16:06:15 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20250918160615euoutp01d8778256470f91a8f1a7c66837e7adea~mbBzN4s9X1209912099euoutp01M
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1758211575;
	bh=irDApffJ5TVFRyQKwcFhXwSY4n2Rzqd5l4J/n3RE/x8=;
	h=From:To:Cc:Subject:Date:References:From;
	b=XbRJiMmcTqplBU1DDiepwLmT/WVm6h08wFXh8Wp+cVq17sSUmw5Km4cjIBX+NX1j9
	 DKacCdcBSP8R7tekGbRySsudnX+55wkXpsOkaaoZhE0h/UpNlqIfHbIT4XLXnDY9V2
	 BEnx3ngawiTNWYXVMV0lQK1K/Y/oUBmV4i5JJ9Tw=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20250918160614eucas1p1657e57414f7db6a57828fc256e8111a6~mbByfB1uf1725317253eucas1p1Y;
	Thu, 18 Sep 2025 16:06:14 +0000 (GMT)
Received: from AMDC4653.digital.local (unknown [106.120.51.32]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250918160614eusmtip2af2da5163fdeb2d9681208727274bc45~mbByDyyX02246622466eusmtip2L;
	Thu, 18 Sep 2025 16:06:14 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Neil Armstrong
	<neil.armstrong@linaro.org>, Jerome Brunet <jbrunet@baylibre.com>, Michael
	Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Kevin
	Hilman <khilman@baylibre.com>, Martin Blumenstingl
	<martin.blumenstingl@googlemail.com>, Chuan Liu <chuan.liu@amlogic.com>
Subject: [PATCH] clk: amlogic: fix recent code refactoring
Date: Thu, 18 Sep 2025 18:06:01 +0200
Message-Id: <20250918160601.3286872-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250918160614eucas1p1657e57414f7db6a57828fc256e8111a6
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250918160614eucas1p1657e57414f7db6a57828fc256e8111a6
X-EPHeader: CA
X-CMS-RootMailID: 20250918160614eucas1p1657e57414f7db6a57828fc256e8111a6
References: <CGME20250918160614eucas1p1657e57414f7db6a57828fc256e8111a6@eucas1p1.samsung.com>

Commit 4c4e17f27013 ("clk: amlogic: naming consistency alignment")
refactored some internals in the g12a meson clock driver. Unfortunately
it introduced a bug in the clock init data, which results in the
following kernel panic:

Unable to handle kernel NULL pointer dereference at virtual address 0000000000000000
Mem abort info:
...
Data abort info:
...
[0000000000000000] user address but active_mm is swapper
Internal error: Oops: 0000000096000004 [#1]  SMP
Modules linked in:
CPU: 4 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.17.0-rc1+ #11158 PREEMPT
Hardware name: Hardkernel ODROID-N2 (DT)
pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
pc : __clk_register+0x60/0x92c
lr : __clk_register+0x48/0x92c
...
Call trace:
 __clk_register+0x60/0x92c (P)
 devm_clk_hw_register+0x5c/0xd8
 meson_eeclkc_probe+0x74/0x110
 g12a_clkc_probe+0x2c/0x58
 platform_probe+0x5c/0xac
 really_probe+0xbc/0x298
 __driver_probe_device+0x78/0x12c
 driver_probe_device+0xdc/0x164
 __driver_attach+0x9c/0x1ac
 bus_for_each_dev+0x74/0xd0
 driver_attach+0x24/0x30
 bus_add_driver+0xe4/0x208
 driver_register+0x60/0x128
 __platform_driver_register+0x24/0x30
 g12a_clkc_driver_init+0x1c/0x28
 do_one_initcall+0x64/0x308
 kernel_init_freeable+0x27c/0x4f8
 kernel_init+0x20/0x1d8
 ret_from_fork+0x10/0x20
Code: 52800038 aa0003fc b9010018 52819801 (f9400260)
---[ end trace 0000000000000000 ]---

Fix this by correcting the clock init data.

Fixes: 4c4e17f27013 ("clk: amlogic: naming consistency alignment")
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/clk/meson/g12a.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
index 7e2c0ce91964..1413eadd8dc6 100644
--- a/drivers/clk/meson/g12a.c
+++ b/drivers/clk/meson/g12a.c
@@ -4919,7 +4919,7 @@ static struct clk_hw *g12b_hw_clks[] = {
 	[CLKID_CPUB_CLK_DYN0_SEL]	= &g12b_cpub_clk_dyn0_sel.hw,
 	[CLKID_CPUB_CLK_DYN0_DIV]	= &g12b_cpub_clk_dyn0_div.hw,
 	[CLKID_CPUB_CLK_DYN0]		= &g12b_cpub_clk_dyn0.hw,
-	[CLKID_CPUB_CLK_DYN1_SEL]	= &g12b_cpub_clk_dyn1.hw,
+	[CLKID_CPUB_CLK_DYN1_SEL]	= &g12b_cpub_clk_dyn1_sel.hw,
 	[CLKID_CPUB_CLK_DYN1_DIV]	= &g12b_cpub_clk_dyn1_div.hw,
 	[CLKID_CPUB_CLK_DYN1]		= &g12b_cpub_clk_dyn1.hw,
 	[CLKID_CPUB_CLK_DYN]		= &g12b_cpub_clk_dyn.hw,
-- 
2.34.1

