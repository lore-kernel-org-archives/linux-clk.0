Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B62133B6C9
	for <linux-clk@vger.kernel.org>; Fri, 23 Jan 2026 01:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769131797; cv=none; b=rhgVk+bn0EpXWIMiheBiBLA9N8GH6y5TFaJxRshDIR5WlVafYTduQU0JPNjJMgGFzVWSjfKVjOiBaUUQOeXf6rms7x5KJQVyBntiQrehfZku8kD7f9Pnc6Mb5DaHRg5BPse6x5CLYk1EhSsr6ZNklBsVN9aO9Hz3IahGHlmwsHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769131797; c=relaxed/simple;
	bh=I+WhUzDGQylG86ibEZ7MfOtCPMXCZ3UIxRHyx4uxOAY=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 References; b=Wy3ezpWEkiL0++s9hsO2R7JgVxbvfHlkl9pksiHFgYfOmTGYlu/ew2qNSzTUEieRF/gvdqi7TZi/dxLCTKEiedjwKbZsZ0I7SvoSZKewG2eZ/RfCfofQTa6erN4WnDw6GN461bTVSvwtZmf7ea/bQmOMDCFieBKvY++Mc/C+8eA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=Y/Wk5GK3; arc=none smtp.client-ip=203.254.224.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="Y/Wk5GK3"
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20260123012939epoutp03561ddae37e58daff22265dbcdd168965~NN-rcehEk2919329193epoutp03G
	for <linux-clk@vger.kernel.org>; Fri, 23 Jan 2026 01:29:39 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20260123012939epoutp03561ddae37e58daff22265dbcdd168965~NN-rcehEk2919329193epoutp03G
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1769131779;
	bh=mgF5p3t5l3lWjSpoMdzeLLG3d7FIF0hvuoxInT0cfrg=;
	h=From:To:Subject:Date:References:From;
	b=Y/Wk5GK3VuZFwNyHZLYzbiFPit47KGGckE1ARpqLWhXiFFZczFdvXmDBaEqXdzokz
	 X5cI+HACZxTch3y+0t++bLzcqTIZp37oOrEMSv1A8FugcuyAjSwwFYkKnnE4/Egae7
	 aCBeuNeFt+ToUXIErLvIwAg4+RAKpiaHttukoJUA=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPS id
	20260123012938epcas5p3c926049734cf97287637550955e9650a~NN-rF1g0k0685706857epcas5p3s;
	Fri, 23 Jan 2026 01:29:38 +0000 (GMT)
Received: from epcas5p2.samsung.com (unknown [182.195.41.40]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4dy0hy5BS7z6B9mJ; Fri, 23 Jan
	2026 01:29:38 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20260123012937epcas5p4c317addca001b564606324ea1a88e393~NN-qMLWou2003620036epcas5p4w;
	Fri, 23 Jan 2026 01:29:37 +0000 (GMT)
Received: from hzsscr.. (unknown [109.120.22.104]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20260123012937epsmtip1473ca6674ed6687dd8609b746235c832~NN-pzd5Nh0703007030epsmtip16;
	Fri, 23 Jan 2026 01:29:37 +0000 (GMT)
From: "ping.gao" <ping.gao@samsung.com>
To: mturquette@baylibre.com, sboyd@kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, hy50.seo@samsung.com,
	kwangwon.min@samsung.com, ping.gao@samsung.com
Subject: [PATCH] drivers: clk:Fix parameter judgment in clk_prepare
Date: Fri, 23 Jan 2026 09:33:58 +0800
Message-ID: <20260123013358.3801467-1-ping.gao@samsung.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20260123012937epcas5p4c317addca001b564606324ea1a88e393
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
X-CMS-RootMailID: 20260123012937epcas5p4c317addca001b564606324ea1a88e393
References: <CGME20260123012937epcas5p4c317addca001b564606324ea1a88e393@epcas5p4.samsung.com>

The clk may return NULL or an ERR_PTR. Don't
treat an ERR_PTR as valid.

for example: biu_clk in dwmmc driver request fail, but it's ERR_PTR,
not null,it will panic when call clk_prepare
log is below:
[  438.400868] [7:   binder:436_2: 4998] Unable to handle kernel paging request at virtual address fffffffffffffffe
[  438.400877] [7:   binder:436_2: 4998] Mem abort info:
[  438.400881] [7:   binder:436_2: 4998]   ESR = 0x0000000096000005
[  438.400887] [7:   binder:436_2: 4998]   EC = 0x25: DABT (current EL), IL = 32 bits
[  438.400894] [7:   binder:436_2: 4998]   SET = 0, FnV = 0
[  438.400899] [7:   binder:436_2: 4998]   EA = 0, S1PTW = 0
[  438.400904] [7:   binder:436_2: 4998]   FSC = 0x05: level 1 translation fault
...
[  438.409424] [7:   binder:436_2: 4998] Call trace:
[  438.409429] [7:   binder:436_2: 4998]  clk_prepare+0x10/0x24
[  438.409439] [7:   binder:436_2: 4998]  dw_mci_runtime_resume+0x50/0x2d8 [dw_mmc_samsung cd210e210975263404c28fc89778f369f8398f0c]
[  438.409471] [7:   binder:436_2: 4998]  dw_mci_exynos_runtime_resume+0x18/0x58 [dw_mmc_exynos_samsung 2735a594c7c9c9e8c65b0b87523fbf70dcaabfff]
[  438.409496] [7:   binder:436_2: 4998]  pm_generic_runtime_resume+0x40/0x58
[  438.409506] [7:   binder:436_2: 4998]  pm_runtime_force_resume+0x9c/0x134
[  438.409517] [7:   binder:436_2: 4998]  platform_pm_resume+0x40/0x8c
[  438.409529] [7:   binder:436_2: 4998]  dpm_run_callback+0x64/0x230
[  438.409540] [7:   binder:436_2: 4998]  __device_resume+0x1d8/0x394
[  438.409551] [7:   binder:436_2: 4998]  dpm_resume+0x110/0x2b8
[  438.409561] [7:   binder:436_2: 4998]  dpm_resume_end+0x1c/0x38
[  438.409570] [7:   binder:436_2: 4998]  suspend_devices_and_enter+0x828/0xab0
[  438.409582] [7:   binder:436_2: 4998]  pm_suspend+0x334/0x618
[  438.409592] [7:   binder:436_2: 4998]  state_store+0x104/0x144
[  438.409601] [7:   binder:436_2: 4998]  kobj_attr_store+0x30/0x48
[  438.409610] [7:   binder:436_2: 4998]  sysfs_kf_write+0x54/0x6c
[  438.409619] [7:   binder:436_2: 4998]  kernfs_fop_write_iter+0x104/0x1a8
[  438.409628] [7:   binder:436_2: 4998]  vfs_write+0x24c/0x2f4
[  438.409640] [7:   binder:436_2: 4998]  ksys_write+0x78/0xe8
[  438.409652] [7:   binder:436_2: 4998]  __arm64_sys_write+0x1c/0x2c
[  438.409664] [7:   binder:436_2: 4998]  invoke_syscall+0x58/0x114
[  438.409676] [7:   binder:436_2: 4998]  el0_svc_common+0xac/0xe0
[  438.409687] [7:   binder:436_2: 4998]  do_el0_svc+0x1c/0x28
[  438.409698] [7:   binder:436_2: 4998]  el0_svc+0x38/0x68
[  438.409705] [7:   binder:436_2: 4998]  el0t_64_sync_handler+0x68/0xbc
[  438.409712] [7:   binder:436_2: 4998]  el0t_64_sync+0x1a8/0x1ac

Signed-off-by: ping.gao <ping.gao@samsung.com>
---
 drivers/clk/clk.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 85d2f2481acf..6d62f69323b5 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -1171,7 +1171,7 @@ static int clk_core_prepare_lock(struct clk_core *core)
  */
 int clk_prepare(struct clk *clk)
 {
-	if (!clk)
+	if (IS_ERR_OR_NULL(clk))
 		return 0;
 
 	return clk_core_prepare_lock(clk->core);
-- 
2.50.1

