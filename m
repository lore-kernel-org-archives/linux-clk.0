Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D26734E75D;
	Mon, 27 Jul 2026 02:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785119761; cv=none; b=OeYj+29yHO8m57iCHmG7WUJMzTd/V0Ps2vMx4td6+uZq5EkOixEYIbLrKy3ui4X5v2pSvlh+dndKmcGK/ofMMSN6bP7tHm8OM7r2/RlTjxuRvj3t2SdWWmy5QInPUiEok9iq7lOmhv1otx0yFG5IIuXOW1yH+ijdjHRZVt+7n50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785119761; c=relaxed/simple;
	bh=qldIR4oXvwAcg9IMa5UnsYMpiOXlpZcna6WDb01rkf0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HR1bfa6gLUcEZXzCrT4xtO4Olg81xR4HxLPVugu6KzyAlAxB9odrW2LwuHR9mqOXfFpC1TND82HxzGMpWNGiQGOzgBfFhJrQibfzqlQraeDZ6Y2sX+I+1sekbwzWZurI6iMctgUb3uNnztySXGo/GFgB7AqH5MF93RItr2pGblE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: e1e24aac896311f1aa26b74ffac11d73-20260727
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:20338929-0ee3-417c-a897-4aae2e45606e,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:e7bac3a,CLOUDID:96d270b7e4164c3e34c9e4e3b375b235,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|865|898,TC:nil,Content:0|15|50
	,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,O
	SA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: e1e24aac896311f1aa26b74ffac11d73-20260727
X-User: liuxixin@kylinos.cn
Received: from [127.0.1.1] [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <liuxixin@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1327643492; Mon, 27 Jul 2026 10:35:50 +0800
From: Xixin Liu <liuxixin@kylinos.cn>
To: arm-scmi@vger.kernel.org
Cc: sudeep.holla@arm.com, cristian.marussi@arm.com, mturquette@baylibre.com, sboyd@kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, liuxixin@kylinos.cn
Subject: [PATCH v1 2/4] firmware: arm_scpi: reject DVFS OPP count above MAX_DVFS_OPPS
Date: Mon, 27 Jul 2026 10:19:15 +0800
Message-ID: <bfebdb68118c.1785118770.git.liuxixin@kylinos.cn>
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

scpi_dvfs_get_info() already rejected a zero opp_count, but still trusted
any larger value from the SCP firmware. The shared-memory reply only holds
MAX_DVFS_OPPS entries in buf.opps[]; a bigger count over-reads that array
and then sizes the allocated OPP table incorrectly (garbage OPPs / OOB).

Reject zero and out-of-range counts in one check and return -EINVAL.

Signed-off-by: Xixin Liu <liuxixin@kylinos.cn>
---
 drivers/firmware/arm_scpi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/arm_scpi.c b/drivers/firmware/arm_scpi.c
index 6056754ef48c..5db58bdfc947 100644
--- a/drivers/firmware/arm_scpi.c
+++ b/drivers/firmware/arm_scpi.c
@@ -630,8 +630,8 @@ static struct scpi_dvfs_info *scpi_dvfs_get_info(u8 domain)
 	if (ret)
 		return ERR_PTR(ret);
 
-	if (!buf.opp_count)
-		return ERR_PTR(-ENOENT);
+	if (!buf.opp_count || buf.opp_count > MAX_DVFS_OPPS)
+		return ERR_PTR(-EINVAL);
 
 	info = kmalloc(sizeof(*info), GFP_KERNEL);
 	if (!info)
-- 
2.53.0

