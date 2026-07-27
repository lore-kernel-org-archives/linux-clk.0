Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48CD623394B;
	Mon, 27 Jul 2026 02:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785119762; cv=none; b=CHg9oF0yZ6VyA9B1KX8HB54KLc3j7TVCRjff52vutqkffvgac4xfr/ys6BAXH+JKcAvk2t7J54+aDDCoqRllmzlJzToFpaZkEImqlzv0WVbWrR+cBPeCWNUT28jnhXVJXKESQmItJ0sY2LPCgb7hmWtfYaWnDzJdr55un5jaqAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785119762; c=relaxed/simple;
	bh=G3FehA32ErYM7NrF4m1rKgzFfl2K4ChTf4iHA0aunLY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=TV83xH6F9hH4NENuiGGEFdCgO+34ZWsN7LSB+4OMowkAe2DsKrzN9mtPed4OulbCjlp3qN5peFzQzpj9m7ckCdoCUXuIRj/51YtdwL3xZt0QSeZL7qXO5S44lnLA5ILlSljyLacmUdWvecfpvVjhy2Xj5dLwKXzR58pM7+Hc938=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: defb1576896311f1aa26b74ffac11d73-20260727
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:47e22d99-6cd9-4407-9870-263a0864548b,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:e7bac3a,CLOUDID:e550ef9e2d6cbeca3e996a2c2d717109,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102|865|898,TC:nil,Content:0|15|50,EDM:-
	3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,A
	V:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: defb1576896311f1aa26b74ffac11d73-20260727
X-User: liuxixin@kylinos.cn
Received: from [127.0.1.1] [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <liuxixin@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 326443258; Mon, 27 Jul 2026 10:35:46 +0800
From: Xixin Liu <liuxixin@kylinos.cn>
To: arm-scmi@vger.kernel.org
Cc: sudeep.holla@arm.com, cristian.marussi@arm.com, mturquette@baylibre.com, sboyd@kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, liuxixin@kylinos.cn
Subject: [PATCH v1 0/4] firmware/clk: arm_scpi hardening (leak, OPP bounds, cpufreq)
Date: Mon, 27 Jul 2026 10:19:15 +0800
Message-ID: <cover.1785118770.git.liuxixin@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailer: patches/scripts/send-local.py

Hi,

This series hardens the OF SCPI firmware and clock paths against a few
real defects found while reviewing linux-next:

  1) device_node leak in scpi_dev_domain_id() after
     of_parse_phandle_with_args()
  2) DVFS OPP count from SCP trusted beyond MAX_DVFS_OPPS (OOB read /
     bad OPP table size)
  3) DVFS index used as clock rate without an upper bound check
  4) scpi-cpufreq registered once only, and cleared on register failure
     so remove() does not unregister an ERR_PTR

Please review.

Thanks,
Xixin Liu

---

Xixin Liu (4):
  firmware: arm_scpi: fix device_node leak in scpi_dev_domain_id
  firmware: arm_scpi: reject DVFS OPP count above MAX_DVFS_OPPS
  clk: scpi: bound-check DVFS index in scpi_dvfs_recalc_rate
  clk: scpi: register scpi-cpufreq once and clear on failure

 drivers/clk/clk-scpi.c      | 8 ++++++--
 drivers/firmware/arm_scpi.c | 9 ++++++---
 2 files changed, 12 insertions(+), 5 deletions(-)

-- 
2.53.0

