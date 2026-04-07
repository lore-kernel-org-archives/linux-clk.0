Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C942E3A545C
	for <linux-clk@vger.kernel.org>; Tue,  7 Apr 2026 14:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775571926; cv=none; b=pJTZRBzDGsVMU95ooprNAxIFbudei7vs4fd3wFuLsJ6etLx8UEhXUlsAMxfpJKyBBfxj6Cg2LKQy/UtCGilxacU15PR4YXOJgKLwc+QPipInOFBA1zMfTMu6u4Ff97DTFP7gh9IdA0zgFVSSHPvvEWfLP7NiiCCxBqUiVsvY1EM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775571926; c=relaxed/simple;
	bh=uMXG1+BtBCNz2BQdnSet9bFsycZ0Yq81r15tDCx64JU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=HQdJ2GkRNshH+3LPbs+g98f1T/qYzbjsfUPs1Ows3agwP5LgdZYiuK+qhU/RMbco+DkBXSVV+DKyJ5IqDbtAiFjyVsMsc/rgyhs/mhCxpb+gm49PMFMMrppS+6ewS9Ujn6yp6no5iBGTFPT8T6IRXFmXtT2ggDzVEXt6Ttg7sto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=0P4+02rE; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="0P4+02rE"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 076D9C5B18C;
	Tue,  7 Apr 2026 14:25:56 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 27B4B603C7;
	Tue,  7 Apr 2026 14:25:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DDD3B1045017A;
	Tue,  7 Apr 2026 16:25:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1775571921; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=jq+8qOzPJTUqKjsOERswRR9fpPCqfmg3Dkvvj9MmKts=;
	b=0P4+02rEAnNDTnKE+p/qz8mP2e2c8tW6KFIf+6DEOGiZQy12/V5zWgWBwrAvZ9jGsku/kS
	tuViNuPIpChk8j7m7GovfqUJNxCsiENd2Jx4u5k3iIrIJCjzCutDD9Iakelq05XzO3A6nB
	ESaALpqpNr2p/ZwoJeZ13KMlTwcp+mIEfzxiHZspkQfYZQ0SVqeoSidiHlQ/WfkRZhK5Ut
	qrhW7ExCVR9JMfNSc+R12/HqV+B1VPVQKLxy5/nxlZf2VRamrXPenD8PS4ZjWt6lS7U0yH
	9P7pWvFmN2+XO3YDhLPRqrE9pDJkYyzTQv7vhtM9JgS2AGH47D9Xg7eSAZ1UJQ==
From: "Thomas Richard (TI)" <thomas.richard@bootlin.com>
Subject: [PATCH v5 0/4] firmware: ti_sci: Introduce BOARDCFG_MANAGED mode
 for Jacinto family
Date: Tue, 07 Apr 2026 16:25:05 +0200
Message-Id: <20260407-ti-sci-jacinto-s2r-restore-irq-v5-0-97b28f2d93f9@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMET1WkC/4XOTU7DMBAF4KtUXmM0Hk/ihBX3QCyMf+ggiKltI
 lCVu+MUVRHqIsv3NPrenEUJmUMRD4ezyGHmwmlqobs7CHe002uQ7FsWCNgpUCAry+JYvlnHU02
 yYJY5lJpyu8wnSTgEgCF6BU405DOHyN+Xgafnv5zD6avt1K088gr8XJ6Y1dpe98ze3qwkSE2et
 B49krGPLynVd57uXfoQKz7jBircB7GBlgYTrY4RUd2CegMRul1QN9BDP/Z6NGQ93YJ0BXtAoF2
 QGtibAcFGPQbr/oPLsvwCd8L/fNYBAAA=
X-Change-ID: 20251010-ti-sci-jacinto-s2r-restore-irq-428e008fd10c
To: Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>, 
 Santosh Shilimkar <ssantosh@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: Gregory CLEMENT <gregory.clement@bootlin.com>, 
 richard.genoud@bootlin.com, Udit Kumar <u-kumar1@ti.com>, 
 Prasanth Mantena <p-mantena@ti.com>, Abhash Kumar <a-kumar2@ti.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, 
 "Thomas Richard (TI)" <thomas.richard@bootlin.com>, 
 Dhruva Gole <d-gole@ti.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

This is the 5th iteration of this series. Nothing new, I just rebased on
v7.0-rc7, added Dhruva's RB tags, and use kzalloc_obj() in Patch 2.

Best Regards,
Thomas

Signed-off-by: Thomas Richard (TI) <thomas.richard@bootlin.com>
---
Changes in v5:
- rebase on v7.0-rc7.
- add Dhruva's RB tag.
- use kzalloc_obj() in ti_sci driver.
- Link to v4: https://lore.kernel.org/r/20260204-ti-sci-jacinto-s2r-restore-irq-v4-0-67820af39eac@bootlin.com

Changes in v4:
- rebase on linux-next next-20260202.
- fix BOARDCFG_MANAGED value.
- add MSG_FLAG_CAPS_LPM_IRQ_CONTEXT_LOST firmware capability.
- add MSG_FLAG_CAPS_LPM_CLK_CONTEXT_LOST firmware capability.
- Link to v3: https://lore.kernel.org/r/20251205-ti-sci-jacinto-s2r-restore-irq-v3-0-d06963974ad4@bootlin.com

Changes in v3:
- rebased on linux-next
- sci-clk: context_restore() operation restores also rate.
- Link to v2: https://lore.kernel.org/r/20251127-ti-sci-jacinto-s2r-restore-irq-v2-0-a487fa3ff221@bootlin.com

Changes in v2:
- ti_sci: use hlist to store IRQs.
- sci-clk: add context_restore operation
- ti_sci: restore clock parents during resume
- Link to v1: https://lore.kernel.org/r/20251017-ti-sci-jacinto-s2r-restore-irq-v1-0-34d4339d247a@bootlin.com

---
Thomas Richard (TI) (4):
      firmware: ti_sci: add BOARDCFG_MANAGED mode support
      firmware: ti_sci: add support for restoring IRQs during resume
      clk: keystone: sci-clk: add restore_context() operation
      firmware: ti_sci: add support for restoring clock context during resume

 drivers/clk/keystone/sci-clk.c |  42 +++++++++--
 drivers/firmware/ti_sci.c      | 164 ++++++++++++++++++++++++++++++++++++++---
 drivers/firmware/ti_sci.h      |   6 ++
 3 files changed, 192 insertions(+), 20 deletions(-)
---
base-commit: d843b67129e266054d8fa2e41e270a9f779381bd
change-id: 20251010-ti-sci-jacinto-s2r-restore-irq-428e008fd10c

Best regards,
-- 
Thomas Richard (TI) <thomas.richard@bootlin.com>

