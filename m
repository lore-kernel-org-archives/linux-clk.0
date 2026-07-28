Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 863AF31690E;
	Tue, 28 Jul 2026 03:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785208139; cv=none; b=tVMatyRHEor+qNY0GQAKEyMDd5Ay649b6AkqB0aGsDVIYWhGUkCrQcSzd3ngzpejS5PwDYBigYYAIJr8OtL9EPM3+KHw1aVBHvrAJlAgZ+Ik4KYfe4S2R730X/gEz/JQOf0n83VF9eBmbCzIpTvrelayR1CGyrAGUzNqJPya7wg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785208139; c=relaxed/simple;
	bh=ehhBgnROpG56D74mBFa9WlV5rwZg+rsTU4XWxaQziD8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=R8BKJRRvcvy6ho241YN1qNrfVGwC0VQfr3DQfqyG6wrMawPftLn0w5UXKEXX0U6D1YE35pNdYxVHezr49SkDYUuWXraZqp0fYz9gRnJeLbpnyuz34d5HeF5CpQaAA6d0DA/HVxX4tfxMFFMDeHuvVoxrFMwXBlx1x8jq1KooIT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: a7ac8aea8a3111f1aa26b74ffac11d73-20260728
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:f468df4a-a75c-41d6-b798-d1cb0e1ce64e,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e7bac3a,CLOUDID:3a2a9a91644d069ca6074cca7ada6685,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|136|865|898,TC:nil,Content:0|1
	5|50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI
	:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: a7ac8aea8a3111f1aa26b74ffac11d73-20260728
X-User: liuxixin@kylinos.cn
Received: from [127.0.1.1] [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <liuxixin@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 888252834; Tue, 28 Jul 2026 11:08:49 +0800
From: Xixin Liu <liuxixin@kylinos.cn>
To: arm-scmi@vger.kernel.org
Cc: sudeep.holla@arm.com, cristian.marussi@arm.com, mturquette@baylibre.com, sboyd@kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, liuxixin@kylinos.cn
Subject: [PATCH v2 4/5] clk: scpi: register scpi-cpufreq once and clear on failure
Date: Tue, 28 Jul 2026 08:50:00 +0800
Message-ID: <fd1b9199a9c3.v2.1785200642.git.liuxixin@kylinos.cn>
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

scpi_clocks_probe() walks clock children and, for each DVFS provider, calls
platform_device_register_simple("scpi-cpufreq", -1, ...). Two related bugs:

1) Registration uses id = -1 and the fixed name "scpi-cpufreq". A second
   registration of the same name returns -EEXIST and overwrites the first
   good cpufreq_dev with ERR_PTR(-EEXIST). When cpufreq_dev is already
   set, continue so only the first successful registration remains.

2) On IS_ERR, cpufreq_dev still held the ERR_PTR; remove() would then
   call platform_device_unregister() on it (oops). Clear cpufreq_dev to
   NULL after the failure warn so remove() skips it.

Fixes: 9490f01e2471 ("clk: scpi: add support for cpufreq virtual device")
Fixes: 67bcc2c5f1da ("clk: scpi: don't add cpufreq device if the scpi dvfs node is disabled")
Signed-off-by: Xixin Liu <liuxixin@kylinos.cn>
---
 drivers/clk/clk-scpi.c | 6 +++++-
 
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/clk-scpi.c b/drivers/clk/clk-scpi.c
index 3c33a9e3c690..e1891351c221 100644
--- a/drivers/clk/clk-scpi.c
+++ b/drivers/clk/clk-scpi.c
@@ -284,10 +284,14 @@ static int scpi_clocks_probe(struct platform_device *pdev)
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

