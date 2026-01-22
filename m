Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D853355055
	for <linux-clk@vger.kernel.org>; Thu, 22 Jan 2026 10:07:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769076433; cv=none; b=oZJSDZs6ISLPnJ0TF8oZd2y2obSPz8Mz+/VCKbHXzXsd7tS9Cc6RmZqraK08i2HT86/GA8XbU2DzW43Ng+1EM5ETGAJ5c1RkzuMu8uksND+VQ0/WQEfqyXGEpQW7SSHakQECCOPhntUPuLZSHTzXOGO7pfd9Yx/5NguYz5N0WoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769076433; c=relaxed/simple;
	bh=ZXanyz4Ijp0qwI3UKe+tITAKLJbGp6qi8vgJa0MeBvU=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 References; b=Vqg1ztc+m9zAmaKP7EeVyFPREOk9riR3luLLOvp6B0X6SS4I5tQUr3JIT9jCIjkFd8L3Cp0EH7LN+a9OalYxpaTI+m2kpVkw9duU/639Yxm6Mx9xIOlQBKOrEMTPy+Hkf5cgYjhzwSVSQ5tIc9YzmcVvbVgOSHjCITbv4ahfikk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=uSmJVgw5; arc=none smtp.client-ip=203.254.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="uSmJVgw5"
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20260122100703epoutp04bfc6b218db5c4845d84084194f77d8e0~NBaJwHNAK1144711447epoutp04X
	for <linux-clk@vger.kernel.org>; Thu, 22 Jan 2026 10:07:03 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20260122100703epoutp04bfc6b218db5c4845d84084194f77d8e0~NBaJwHNAK1144711447epoutp04X
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1769076423;
	bh=suqOXF0Dk5RHCwhp2hHWiiAgKOyYsijL543TvrgUsWo=;
	h=From:To:Subject:Date:References:From;
	b=uSmJVgw5rvw8jiWSQgjUHdcFQ0J2vYqnCzyOYgT9tMn5GC2PyXJQse/JI9P6hKNxq
	 Y0t4/y0kN1f5zA/jpDAJbdmXj2QUXzxwYOuhTPJqTLquhRzAuw3eHHPEPgNnPqqNQC
	 7G36NbQ7jGW5H4ACYTlrUhXLvJyqLC23PkcUWJUk=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
	20260122100703epcas5p48f43c8eee5daae912f21ff9eaba98d3f~NBaJdbGyT2178321783epcas5p4r;
	Thu, 22 Jan 2026 10:07:03 +0000 (GMT)
Received: from epcas5p2.samsung.com (unknown [182.195.41.40]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4dxcDR3DPPz2SSKZ; Thu, 22 Jan
	2026 10:07:03 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20260122100703epcas5p13f4647a5e62546abc3021383134e824a~NBaJOpz_h2483824838epcas5p1b;
	Thu, 22 Jan 2026 10:07:03 +0000 (GMT)
Received: from hzsscr.. (unknown [109.120.22.104]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20260122100702epsmtip2fb1de1df76d5fbf542ee329769587b0d~NBaIyY-N81408914089epsmtip2J;
	Thu, 22 Jan 2026 10:07:02 +0000 (GMT)
From: "ping.gao" <ping.gao@samsung.com>
To: mturquette@baylibre.com, sboyd@kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, hy50.seo@samsung.com,
	kwangwon.min@samsung.com, ping.gao@samsung.com
Subject: [PATCH]     drivers: clk: keystone: Fix parameter judgment in
 clk_prepare
Date: Thu, 22 Jan 2026 18:11:24 +0800
Message-ID: <20260122101124.2396139-1-ping.gao@samsung.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20260122100703epcas5p13f4647a5e62546abc3021383134e824a
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
X-CMS-RootMailID: 20260122100703epcas5p13f4647a5e62546abc3021383134e824a
References: <CGME20260122100703epcas5p13f4647a5e62546abc3021383134e824a@epcas5p1.samsung.com>

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

