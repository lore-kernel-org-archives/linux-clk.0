Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 954B0353A60;
	Mon, 27 Jul 2026 02:36:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785119765; cv=none; b=mvDsXIRAKhuBbxI5WRSBmbeLiIOOdHDcm+AANe2FdpOODL5UZQYv5KsEa0bhZq0d9/exT48iNJ7yxnXdIWTfsi5UtTmPPImG4lGqhqyB5Z5iaATjzviUl/3AGB1288+1rtfus51KuzWxIu91g2JynoUHBq/DNvycmaPfXqMwTIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785119765; c=relaxed/simple;
	bh=7J3HSu8oll+hHO4G+k1Eulm9oGYZbwlNxDuyBWOuWgE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fpo66R1MBKOwGEsaTa1lfvWOoOd1XA9ANuAurRtjvOMU9OidB7+Dm8h766BgZeKZAW5BEmjS4OzRNYnFu+k6z0euWXu4LH7syyuR4+M2d6T4bwbAFhysktuiIaKIU6GBdKmcZJ2ftVSKI6FvCUvNcXPKc7+H01/mPVAXoxNbfrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: e501413e896311f1aa26b74ffac11d73-20260727
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:17e1e125-2018-486a-a267-7db0f92e14bc,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e7bac3a,CLOUDID:a9fd983e214b625888e4f9f7e3e430eb,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|136|865|898,TC:nil,Content:0|1
	5|50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI
	:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: e501413e896311f1aa26b74ffac11d73-20260727
X-User: liuxixin@kylinos.cn
Received: from [127.0.1.1] [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <liuxixin@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 2056388121; Mon, 27 Jul 2026 10:35:56 +0800
From: Xixin Liu <liuxixin@kylinos.cn>
To: arm-scmi@vger.kernel.org
Cc: sudeep.holla@arm.com, cristian.marussi@arm.com, mturquette@baylibre.com, sboyd@kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, liuxixin@kylinos.cn
Subject: [PATCH v1 4/4] clk: scpi: register scpi-cpufreq once and clear on failure
Date: Mon, 27 Jul 2026 10:19:15 +0800
Message-ID: <0ef515019f96.1785118770.git.liuxixin@kylinos.cn>
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

scpi_clk_probe() walks clock children and, for each DVFS provider, calls
platform_device_register_simple("scpi-cpufreq"). Two related bugs:

1) Multiple DVFS children each spawned another virtual cpufreq device.
   If cpufreq_dev is already set, continue and skip a second register.

2) On IS_ERR, the pointer still held ERR_PTR (e.g. -ENOMEM). remove()
   treats any non-NULL cpufreq_dev as live and would call
   platform_device_unregister() on the error pointer (oops). Clear
   cpufreq_dev to NULL after the failure warn so remove() skips it.

Signed-off-by: Xixin Liu <liuxixin@kylinos.cn>
---
 drivers/clk/clk-scpi.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/clk-scpi.c b/drivers/clk/clk-scpi.c
index 4e22ba12b157..ce6baea8f82e 100644
--- a/drivers/clk/clk-scpi.c
+++ b/drivers/clk/clk-scpi.c
@@ -283,10 +283,14 @@ static int scpi_clocks_probe(struct platform_device *pdev)
 		if (match->data != &scpi_dvfs_ops)
 			continue;
 		/* Add the virtual cpufreq device if it's DVFS clock provider */
+		if (cpufreq_dev)
+			continue;
 		cpufreq_dev = platform_device_register_simple("scpi-cpufreq",
 							      -1, NULL, 0);
-		if (IS_ERR(cpufreq_dev))
+		if (IS_ERR(cpufreq_dev)) {
 			pr_warn("unable to register cpufreq device");
+			cpufreq_dev = NULL;
+		}
 	}
 	return 0;
 }
-- 
2.53.0

