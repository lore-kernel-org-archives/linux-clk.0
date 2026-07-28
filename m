Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EF69317161;
	Tue, 28 Jul 2026 03:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785208142; cv=none; b=UOj6CWwRZVNZ7iSXbBlcjNqo4LG4PRbw56QUd8PO1lFT+6yFc3PZA8s1aXJgwjTsfHUT6kyBYppWlvpljaUeRB+U9K3tLcezIXnLPBrRZ9lLmJFC35dGW01uSt2f4MiSHrtYujyJEbH5qD+S533FfYH95zazw2Q4YC//7IgkPKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785208142; c=relaxed/simple;
	bh=5jyP3H+A53HUkdFSmErvfR+sxMmQRmwYcgHjPRV9Fk4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=i4tFc2xv1dicEGBlTcNC/nEyOEYDuwYauGu/q2TpDNPYN4SHV9jRj5OS+JMHPYCvPEg36Y/4sK1WS2LrBR7LKTd9T+d3O7xpJAh367xAG3/toPwS5FzA7xrIX1MB8Pn5zGwZrvZnTBKP2PtX7jLkMxRtvN40q31UpqwK7z+FxVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: a9b966468a3111f1aa26b74ffac11d73-20260728
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:bd83a39b-8895-4fa4-b7e3-7cefc687fac0,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e7bac3a,CLOUDID:4788c629cc1ff9d1d4cd0b191e559469,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|865|898,TC:nil,Content:0|15|50
	,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,O
	SA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: a9b966468a3111f1aa26b74ffac11d73-20260728
X-User: liuxixin@kylinos.cn
Received: from [127.0.1.1] [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <liuxixin@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 892507905; Tue, 28 Jul 2026 11:08:53 +0800
From: Xixin Liu <liuxixin@kylinos.cn>
To: arm-scmi@vger.kernel.org
Cc: sudeep.holla@arm.com, cristian.marussi@arm.com, mturquette@baylibre.com, sboyd@kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, liuxixin@kylinos.cn
Subject: [PATCH v2 5/5] clk: scpi: use PLATFORM_DEVID_NONE for scpi-cpufreq
Date: Tue, 28 Jul 2026 09:27:31 +0800
Message-ID: <fb51cfbfbb41.v2.1785200642.git.liuxixin@kylinos.cn>
In-Reply-To: <cover.v2.1785200642.git.liuxixin@kylinos.cn>
References: <cover.1785118770.git.liuxixin@kylinos.cn> <cover.v2.1785200642.git.liuxixin@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailer: patches/scripts/send-local.py

Replace the magic -1 passed to platform_device_register_simple() with
PLATFORM_DEVID_NONE. The constant is defined as (-1) in
platform_device.h; this is a readability cleanup only and does not
change behavior.

Fixes: 9490f01e2471 ("clk: scpi: add support for cpufreq virtual device")
Signed-off-by: Xixin Liu <liuxixin@kylinos.cn>
---
 drivers/clk/clk-scpi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/clk-scpi.c b/drivers/clk/clk-scpi.c
index e1891351c221..900488dedf95 100644
--- a/drivers/clk/clk-scpi.c
+++ b/drivers/clk/clk-scpi.c
@@ -287,7 +287,7 @@ static int scpi_clocks_probe(struct platform_device *pdev)
 		if (cpufreq_dev)
 			continue;
 		cpufreq_dev = platform_device_register_simple("scpi-cpufreq",
-							      -1, NULL, 0);
+							      PLATFORM_DEVID_NONE, NULL, 0);
 		if (IS_ERR(cpufreq_dev)) {
 			pr_warn("unable to register cpufreq device");
 			cpufreq_dev = NULL;
-- 
2.53.0

