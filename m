Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10B9D3016F2;
	Tue, 14 Jul 2026 06:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784011943; cv=none; b=LVxYoS+5nEydrCVOGZNN3CdsQY4pSKSzgHpxeSIZPVBsVoMptspZ/+x+BmG2lE9KREvSWBFot30A0ly49SmQ6fnuU3H7qcGo+d6QqAhUDLZkcKJWJRXElQREk3lreT/P9/NursfXMCCo9UxAn2N6z4EUQOqT6mz7eXDnQqMmBTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784011943; c=relaxed/simple;
	bh=mObESLdVhIc3p+BlzqqdOK/qV6TzCDaX0MBcX31rsYM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MknKgVpD0kfzrU02i8XK0kqRALC5JRBlOG1AMvYCCe3GEawgESib9Vs8iWZSMRr7ZcrmbM2JsrCOWOSznNRbaN+GFh4QbahQW+lmzHiS75xw8Ieb3xXg4vogMo2EOr/jnkA3qmdHvSdZbpuzR11ZDgXaOcRvAG0PP6v+v8N1LcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 8a0de56a7f5011f1aa26b74ffac11d73-20260714
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:8d0a273d-2292-4b6c-8087-02c72e2b5724,IP:0,U
	RL:0,TC:0,Content:-5,EDM:-25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:-30
X-CID-META: VersionHash:e7bac3a,CLOUDID:9b7a537dae6fb400bfa5a90b1716bdb4,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102|850|865|898,TC:nil,Content:0|15|50,E
	DM:2,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:
	0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 8a0de56a7f5011f1aa26b74ffac11d73-20260714
X-User: yanlonglong@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <yanlonglong@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 134102658; Tue, 14 Jul 2026 14:52:11 +0800
From: longlong yan <yanlonglong@kylinos.cn>
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	bmasney@redhat.com,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: longlong yan <yanlonglong@kylinos.cn>
Subject: [PATCH] clk/x86: pmc_atom: add kasprintf return value check
Date: Tue, 14 Jul 2026 14:51:32 +0800
Message-ID: <20260714065133.487-1-yanlonglong@kylinos.cn>
X-Mailer: git-send-email 2.47.1.windows.2
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The kasprintf() function returns NULL on memory allocation failure, but
the code in plt_clk_register() was not checking this return value. If
kasprintf fails, init.name would be NULL and could cause NULL pointer
dereference when clkdev_hw_create() uses it.

Add proper error checking for the kasprintf() return value and return
ERR_PTR(-ENOMEM) on failure.

Fixes: 1141d9d08184 ("clk: x86: Add Atom PMC platform clocks")
Signed-off-by: longlong yan <yanlonglong@kylinos.cn>
---
 drivers/clk/x86/clk-pmc-atom.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/clk/x86/clk-pmc-atom.c b/drivers/clk/x86/clk-pmc-atom.c
index 99291ba65da7..08c83e0abc41 100644
--- a/drivers/clk/x86/clk-pmc-atom.c
+++ b/drivers/clk/x86/clk-pmc-atom.c
@@ -160,6 +160,9 @@ static struct clk_plt *plt_clk_register(struct platform_device *pdev, int id,
 		return ERR_PTR(-ENOMEM);
 
 	init.name =  kasprintf(GFP_KERNEL, "%s_%d", PLT_CLK_NAME_BASE, id);
+	if (!init.name)
+		return ERR_PTR(-ENOMEM);
+
 	init.ops = &plt_clk_ops;
 	init.flags = 0;
 	init.parent_names = parent_names;
-- 
2.43.0

