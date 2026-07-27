Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C67B82ECE86;
	Mon, 27 Jul 2026 02:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785119762; cv=none; b=X6YrKg5qUryMVzqC+rgM98YENsbMQ2UxidpcDaVscN2KxIfrCjYqLjd58BdJeoaFrkd0EUps8jXSPKNjHk47kz7WR/YWwup95YxGgEgSaxTrsAQ9Xx3m/pAW2YrTBAnJ9yMpCGL3niKhSQmQ86ed6oHKRDRF7uxtv2RCviZV06w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785119762; c=relaxed/simple;
	bh=UvoN6+1PPdG4ttKEQF0smCdGuO9PxtFUjOxzKCglm9E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PQDKaZR5Sl7+QQnhDAL86bY82o+Kpcr3hAxpso5TJ/94cXtiGQM0QQNsVy8JPPg7J2GTC4EMNavtLXcAXpzYvGlZCk+25fePidUHEYzY1Rb4+ckC049k+dptkfpaK/X6Wkh8y5yA7DR9bq8ORuBHzlkp0OqtEXEqFrzhMGjrCfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: e06ed46a896311f1aa26b74ffac11d73-20260727
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:e0160ef2-0328-41d5-be7a-3910bc544b95,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:e7bac3a,CLOUDID:bd359f38c3c2bb1e9faed96943e22ee5,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|865|898,TC:nil,Content:0|15|50
	,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,O
	SA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: e06ed46a896311f1aa26b74ffac11d73-20260727
X-User: liuxixin@kylinos.cn
Received: from [127.0.1.1] [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <liuxixin@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 333338921; Mon, 27 Jul 2026 10:35:48 +0800
From: Xixin Liu <liuxixin@kylinos.cn>
To: arm-scmi@vger.kernel.org
Cc: sudeep.holla@arm.com, cristian.marussi@arm.com, mturquette@baylibre.com, sboyd@kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, liuxixin@kylinos.cn
Subject: [PATCH v1 1/4] firmware: arm_scpi: fix device_node leak in scpi_dev_domain_id
Date: Mon, 27 Jul 2026 10:19:14 +0800
Message-ID: <fe59f1badf4f.1785118770.git.liuxixin@kylinos.cn>
In-Reply-To: <cover.1785118770.git.liuxixin@kylinos.cn>
References: <cover.1785118770.git.liuxixin@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailer: patches/scripts/send-local.py

of_parse_phandle_with_args() takes a reference on clkspec.np that must be
released with of_node_put(). scpi_dev_domain_id() returned clkspec.args[0]
without dropping that reference, so every domain lookup leaked a device
node. Paths such as scpi_dvfs_info() / cpufreq init call this per CPU, so
the leak accumulates over time.

Save the domain id, of_node_put(clkspec.np), then return the saved value.

Signed-off-by: Xixin Liu <liuxixin@kylinos.cn>
---
 drivers/firmware/arm_scpi.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/arm_scpi.c b/drivers/firmware/arm_scpi.c
index 87c323de17b9..6056754ef48c 100644
--- a/drivers/firmware/arm_scpi.c
+++ b/drivers/firmware/arm_scpi.c
@@ -660,12 +660,15 @@ static struct scpi_dvfs_info *scpi_dvfs_get_info(u8 domain)
 static int scpi_dev_domain_id(struct device *dev)
 {
 	struct of_phandle_args clkspec;
+	int domain;
 
 	if (of_parse_phandle_with_args(dev->of_node, "clocks", "#clock-cells",
 				       0, &clkspec))
 		return -EINVAL;
 
-	return clkspec.args[0];
+	domain = clkspec.args[0];
+	of_node_put(clkspec.np);
+	return domain;
 }
 
 static struct scpi_dvfs_info *scpi_dvfs_info(struct device *dev)
-- 
2.53.0

