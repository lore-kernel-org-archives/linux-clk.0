Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C82D307AC7;
	Tue, 28 Jul 2026 03:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785208127; cv=none; b=F/ZdmrDBApziwCaAHhn2us8RXm2rjLN2GIybvq6uufsrNb9aD8UIoH7U6xvaCyhdbpa8QUkeN0JJeKT2yMYJWcbJfwKakJ1/bjMyX73aKIcorhp15gzO5th51yvPDvO2rTC0KourHYZ79yfAx5fGVZ9d5P51Va4FnIvjaMWvS/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785208127; c=relaxed/simple;
	bh=MgrFph38SabL7k/ClFlJXF3jVj3QCwusyiN9BnWSVv8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oVNb8xRmGTnWE9S8JmSt3oEM5DrgGtSDrVXkfTbfWH2FnGi/4bdcP84b2SZ9elBkULIOnqZ0nWqE/puWl/K0KJArM3cSrDYshpFmtgeYmPQ/ZmB6Ul75K+09TowDlAZtwob3A0t5K91xBwwmCCe4xMaYZhJvXzeg1o5HeGnRpfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: a0f04d188a3111f1aa26b74ffac11d73-20260728
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:17281866-73e3-4b1a-8f12-c116d1f007df,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e7bac3a,CLOUDID:f1b7a3b3752b4c97600e637bdbf25927,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|865|898,TC:nil,Content:0|15|50
	,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,O
	SA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: a0f04d188a3111f1aa26b74ffac11d73-20260728
X-User: liuxixin@kylinos.cn
Received: from [127.0.1.1] [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <liuxixin@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 591202663; Tue, 28 Jul 2026 11:08:38 +0800
From: Xixin Liu <liuxixin@kylinos.cn>
To: arm-scmi@vger.kernel.org
Cc: sudeep.holla@arm.com, cristian.marussi@arm.com, mturquette@baylibre.com, sboyd@kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, liuxixin@kylinos.cn
Subject: [PATCH v2 0/5] firmware/clk: arm_scpi hardening (leak, OPP bounds, cpufreq)
Date: Tue, 28 Jul 2026 09:04:02 +0800
Message-ID: <cover.v2.1785200642.git.liuxixin@kylinos.cn>
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

Hi Sudeep,

Thanks for reviewing v1.

This v2 hardens the OF SCPI firmware and clock paths against a few
real defects found while reviewing linux-next:

  1) device_node leak in scpi_dev_domain_id() after
     of_parse_phandle_with_args()
  2) DVFS OPP count from SCP trusted beyond MAX_DVFS_OPPS (OOB read /
     bad OPP table size)
  3) DVFS index used as clock rate without an upper bound check
  4) scpi-cpufreq registered once only, and cleared on register failure
     so remove() does not unregister an ERR_PTR
  5) use PLATFORM_DEVID_NONE instead of bare -1 for the scpi-cpufreq
     platform device id (readability; Fixes the original registration)

Changes since v1:
- 2/5: add Fixes: 8cb7cf56c9fe ("firmware: add support for ARM System
  Control and Power Interface(SCPI) protocol")
- 3/5: add Fixes: cd52c2a4b5c4 ("clk: add support for clocks provided by
  SCP(System Control Processor)")
- 4/5: correct commit message (scpi_clocks_probe; multi-DVFS child
  overwrites the first good cpufreq_dev with ERR_PTR(-EEXIST)) and
  add Fixes: 9490f01e2471 / 67bcc2c5f1da
  All per maintainer feedback; code unchanged.
- add 5/5: clk: scpi: use PLATFORM_DEVID_NONE for scpi-cpufreq
  (readability; Fixes: 9490f01e2471)
- Rebased onto linux-next next-20260727 (0d33d21e47d9); 2/5 context
  updated for kmalloc_obj() (logic unchanged).

Please review.

Thanks,
Xixin Liu

---

Xixin Liu (5):
  firmware: arm_scpi: fix device_node leak in scpi_dev_domain_id
  firmware: arm_scpi: reject DVFS OPP count above MAX_DVFS_OPPS
  clk: scpi: bound-check DVFS index in scpi_dvfs_recalc_rate
  clk: scpi: register scpi-cpufreq once and clear on failure
  clk: scpi: use PLATFORM_DEVID_NONE for scpi-cpufreq

 drivers/clk/clk-scpi.c      | 10 ++++++++--
 drivers/firmware/arm_scpi.c |  9 ++++++---
 2 files changed, 13 insertions(+), 6 deletions(-)

-- 
2.53.0

