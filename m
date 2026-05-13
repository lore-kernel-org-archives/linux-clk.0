Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C761421A0A
	for <linux-clk@vger.kernel.org>; Wed, 13 May 2026 12:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778676401; cv=none; b=SlERQrTHl5WIgPkkiYC4OqOvvBmY2DvYkKqjfGYtk9NpHKP/IoTxtH4sX7I4nygRa6S5M/CuvRPuz75cZCRFr9kpZtCDQvoNtlccs5+M2dKIXyhw/vw+gWcNcmaQXP6Xb8lVrmwN7Yy2D1z5VnlieDVuBI1i0f7ORd0cMRwmorQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778676401; c=relaxed/simple;
	bh=IEUkiRFNLmJp+dmPQCQP5u/bFiV1k8soPM1kaGJgYUc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=V4LaQAeQU4Ygu8sE3emLhNfaKH4eHJlJ3VHjbiyMgUrQdPa+39RQvnCHZ8BdLnomSYJtTrGki2nt+MkQHM0Pf9NWglsVyaXbQnjSoE4+zD4PcJRzwYl3hfv70gIlvnQasth0w38aqNXtPUOYXCbutDvPBUfVCqNV5mE8CdkmjAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=p2gOHqkn; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="p2gOHqkn"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 00D34C5DC59;
	Wed, 13 May 2026 12:47:25 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 527845FE21;
	Wed, 13 May 2026 12:46:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CFB2211AF8AA4;
	Wed, 13 May 2026 14:46:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1778676393; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=vc+KpXXHYUhBAcJNzu6tgHP8GVRbBYwFTgwoDMHpMyQ=;
	b=p2gOHqknWzjykwnBrknLfQm5G25XS5o9+wgFQ+ijq6K3nAtI2npnx32qC3FcxcGiQUApEl
	CCOJTfqEL4rs3b2Iv2tC/NspNSY4951dEqWJC3zcR+D5aR84l4h9TAOU7Sy79yj3YnKqjE
	8C0BGTfu5ND29+yOEXHZRA4BB8pFWyISqa94yzGR6abNTKM+CZunQomQfIScCflrnkew6Y
	/lj+MTRPP0nHcSKah/Af479w9qpx32u0XHYB+qRc0/3pYR4rQpW5i2Dbv6wTe/Paetj2Fd
	9LMBCCHavy4GoeBjj6UOyduxvT4FgHwLzqjOfQpfYL84HvWEH7idrLNKX1HF+g==
From: "Thomas Richard (TI)" <thomas.richard@bootlin.com>
Subject: [PATCH v8 0/4] firmware: ti_sci: Introduce BOARDCFG_MANAGED mode
 for Jacinto family
Date: Wed, 13 May 2026 14:46:22 +0200
Message-Id: <20260513-ti-sci-jacinto-s2r-restore-irq-v8-0-195b27f91519@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJ9yBGoC/43Qy07DMBAF0F+pvMZoPH53xX8gFo4f1Ahi6oQIV
 OXfcYqqgLIIyzuyzh3PhQyx5jiQ4+FCapzykEvfgrk7EH9y/XOkObRMEFAyYEDHTAef6YvzuR8
 LHbDSGoex1PaynqlAEwFMCgw8ach7jSl/Xgsen35yjeeP1jOuw1NegK/rEhNbprc+vdc3MQqUi
 yA4twGFdg9dKeNr7u99eSMLPuEKMtwHsYFOGJ0cTwmRbUG+gghyF+QNDKCs4lYLF8QWFDdQAYL
 YBUUDlTYILnEbnd+CcgUF7H9ZNtDqDk3CYHmyW1D9Av9xQ9VAjV4JZXyHrtuCegUlqF1QNxC4B
 mscl8jkX3Ce529X9xQjyQIAAA==
X-Change-ID: 20251010-ti-sci-jacinto-s2r-restore-irq-428e008fd10c
To: Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>, 
 Santosh Shilimkar <ssantosh@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: Gregory CLEMENT <gregory.clement@bootlin.com>, 
 richard.genoud@bootlin.com, Udit Kumar <u-kumar1@ti.com>, 
 Abhash Kumar <a-kumar2@ti.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, 
 "Thomas Richard (TI)" <thomas.richard@bootlin.com>, 
 Dhruva Gole <d-gole@ti.com>, Kendall Willis <k-willis@ti.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

This is the 8th iteration of this series. I fixed the error path in ti_sci
driver if devm_mutex_init() fails. Other changes are nitpicks.

Best Regards,
Thomas

Signed-off-by: Thomas Richard (TI) <thomas.richard@bootlin.com>
---
Changes in v8:
- ti_sci: fix error path if devm_mutex_init() fails.
- ti_sci: fix error message in ti_sci_resume_noirq().
- ti_sci: keep some lines under 100 chars in ti_sci header file.
- Link to v7: https://lore.kernel.org/r/20260506-ti-sci-jacinto-s2r-restore-irq-v7-0-037098a35215@bootlin.com

Changes in v7:
- ti_sci: add a lock around set_irq() and free_irq() to keep hash list
  consistent.
- ti_sci: in free_irq() add warning in case we are in a path that shall not
  be run.
- ti_sci: free an IRQ if we failed to add it in the hash list.
- ti_sci: during resume in case of error, try to restore remaining IRQs and
  logs all errors, then return the latest one.
- sci-clk: add Stephen's AB tag and Brian's RB tag.
- sci-clk: handle get_parent() error, in restore_context() do not call
  set_parent() with parent_id=0 if get_parent() failed.
- Link to v6: https://lore.kernel.org/r/20260427-ti-sci-jacinto-s2r-restore-irq-v6-0-72c6468cb2ab@bootlin.com

Changes in v6:
- rebase on v7.1-rc1.
- add Kendall's RB tag.
- sci-clk: call set_parent() during restore_context() only for clocks which
  have more than one parent.
- sci-clk: save also rate returned by recalc_rate().
- Link to v5: https://lore.kernel.org/r/20260407-ti-sci-jacinto-s2r-restore-irq-v5-0-97b28f2d93f9@bootlin.com

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

 drivers/clk/keystone/sci-clk.c |  45 +++++++--
 drivers/firmware/ti_sci.c      | 212 ++++++++++++++++++++++++++++++++++++++---
 drivers/firmware/ti_sci.h      |   9 ++
 3 files changed, 245 insertions(+), 21 deletions(-)
---
base-commit: 3d7e5414e6ab597dd3ea33fff6ae202d376539fa
change-id: 20251010-ti-sci-jacinto-s2r-restore-irq-428e008fd10c

Best regards,
-- 
Thomas Richard (TI) <thomas.richard@bootlin.com>

