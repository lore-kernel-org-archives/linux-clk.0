Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CE743515CD;
	Mon, 27 Jul 2026 02:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785119762; cv=none; b=BPC99GRjtU6Zr1ssMcaUfPFQERSfx/GwHP39gGoA8hp+TrCWgKIWgOA6ly1PKsEE6dqTK/AgDAemUW//zlMmO8tCIdsuVPYp7iwMLmL6a2PEyHzgvxXt49grNnCjv21eQzQQcayy3K7ekAURK03YllaRN4B8jKEw8hSml46H38A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785119762; c=relaxed/simple;
	bh=CqzIPo1ERngfp2xFmcNOqAPYNAiN5euvzKXiJcBwdOU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hJPUN6N883B2RK/WQGoUNTduy4xF0DT7szTZyKoBArHPF1p5bdqA6gD+doKw9Z4oH/V9FOZEJmq5oplHWJdumky7Dq26t9S0FUkNyIBnzw2nXzQgcqgxRUzBzfljPVVXFpYG9tD2YIPH9Q+eE3qcHxepQ3nvK+IfF8UcCxFV7v0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: e38ac776896311f1aa26b74ffac11d73-20260727
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:8f48928f-5043-4fb0-a719-b89bac12d5da,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e7bac3a,CLOUDID:2313b9f0c37859212409d467a0135e1a,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|865|898,TC:nil,Content:0|15|50
	,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,O
	SA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: e38ac776896311f1aa26b74ffac11d73-20260727
X-User: liuxixin@kylinos.cn
Received: from [127.0.1.1] [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <liuxixin@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 766663516; Mon, 27 Jul 2026 10:35:53 +0800
From: Xixin Liu <liuxixin@kylinos.cn>
To: arm-scmi@vger.kernel.org
Cc: sudeep.holla@arm.com, cristian.marussi@arm.com, mturquette@baylibre.com, sboyd@kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, liuxixin@kylinos.cn
Subject: [PATCH v1 3/4] clk: scpi: bound-check DVFS index in scpi_dvfs_recalc_rate
Date: Mon, 27 Jul 2026 10:19:15 +0800
Message-ID: <aa54a3b63064.1785118770.git.liuxixin@kylinos.cn>
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

dvfs_get_idx() may return an out-of-range index if the SCP firmware is
buggy or returns a stale value. Only negative indexes were rejected, so a
large index walked past info->opps and could treat garbage as a clock rate
(KASAN OOB / wrong frequency to consumers).

Treat indexes >= opp count as invalid and return 0, same as idx < 0.

Signed-off-by: Xixin Liu <liuxixin@kylinos.cn>
---
 drivers/clk/clk-scpi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/clk-scpi.c b/drivers/clk/clk-scpi.c
index 19d530d52e64..4e22ba12b157 100644
--- a/drivers/clk/clk-scpi.c
+++ b/drivers/clk/clk-scpi.c
@@ -85,7 +85,7 @@ static unsigned long scpi_dvfs_recalc_rate(struct clk_hw *hw,
 	int idx = clk->scpi_ops->dvfs_get_idx(clk->id);
 	const struct scpi_opp *opp;
 
-	if (idx < 0)
+	if (idx < 0 || idx >= clk->info->count)
 		return 0;
 
 	opp = clk->info->opps + idx;
-- 
2.53.0

