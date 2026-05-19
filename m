Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 713CF3AFCFA
	for <linux-clk@vger.kernel.org>; Tue, 19 May 2026 15:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779203232; cv=none; b=Uka5fea6/LjWsWWlXoXcAJ+Rnpysyp8NBet7FcBKIwXFTQxKZ4FjO79bpiH0hVXksvbQjM/BbjoMrp2+8CamkVNOugSY1td7SvBA84Jgh4xtCyiujmDty37mIiPIvuwDrWDn0H3yTlebocguZUM8C6Yw59ep74lqe+Nced+owo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779203232; c=relaxed/simple;
	bh=JW0PPZhQF5qb5ISVBwhdMJcJBW+Qy+kT65JMGjU6n70=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=lmaLv1gW6JWpJtlEOoou3itMiGWcP2kWw3rj4gGwCyejJOIRk7u4zi6PJr8IV9Uc7lRxKPfBjNyaBm3F1v7x5uEeS3UEsBvEJMkf0dqOO9/gP70KKExMxEe3gfpbyicaLz4/6+NuEMoOFSmXTmF5+DvjFW6IG66SZ2m2e18kvCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=q4eDdZuO; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="q4eDdZuO"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 02AB1C5DC78;
	Tue, 19 May 2026 15:07:59 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A4C5D5FFC8;
	Tue, 19 May 2026 15:07:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 75999107E8F9F;
	Tue, 19 May 2026 17:07:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1779203224; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=charRO1IVC84SKoy22XjvXBIVysOJ7UkRc2Rd6+f0B4=;
	b=q4eDdZuOEWN6cRdOESHgaN9XN0BJ4XlX0NaMf13gUvIdRcw5F3nSLc39DNpOKXnRYCyY82
	Nvj7/NqgyNc9Xf5Dz5qy4lrTscs0wmY70C93LjYHHKLDMPtOH4fnSF9DF1J0UM1YX8g+rM
	JuvFzKgRdRVmmsb+ZFxeBi1vKIYTbfqYoOyQT9Jtf5ODtAuQLos6gBOYBeKcSlC7BgrmVH
	vrWrb7XyqcbKnlsHhOA9pkWbFl4FxEMXZEhzrr8RbQG0LP4Gm/WO9F5jmYy5PJRX1l1jap
	HAUqRbHkI5u1qMLAzyIo1/L50lh+F9zTBTfytSTgX3EbMDJ3txX/rxyPbslpxg==
From: "Thomas Richard (TI)" <thomas.richard@bootlin.com>
Subject: [PATCH v9 0/4] firmware: ti_sci: Introduce BOARDCFG_MANAGED mode
 for Jacinto family
Date: Tue, 19 May 2026 17:06:55 +0200
Message-Id: <20260519-ti-sci-jacinto-s2r-restore-irq-v9-0-c550a8ae0f31@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAI98DGoC/43Qy07DMBAF0F+pvMZoPH6z4j8QC8cPagQJdUIEq
 vLvOEVVKrIwyzuyzvXMmYyx5DiSh8OZlDjnMQ99DfbuQPzR9S+R5lAzQUDJgAGdMh19pq/O534
 a6IiFljhOQ6kvy4kKNBHApMDAk4p8lJjy16Xg6fk3l3j6rD3TNjzmFfi+fGJm6/Tap1t9M6NAu
 QiCcxtQaPfYDcP0lvt7P7yTFZ9xAxm2QaygE0Ynx1NCZHuQbyCCbIK8ggGUVdxq4YLYg+IKKkA
 QTVBUUGmD4BK30fk9KDdQQHtlWUGrOzQJg+XJ7kF1A/7jhqqCGr0SyvgOXbcH9QZKUE1QVxC4B
 mscl8jkHjQ3IONN0FSQWdmhTpZJ9mflZVl+AHHpg5QaAwAA
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

This is the 9th iteration of this series. The only change is that now the
irq_lock mutex is used unconditionally in set_irq() and free_irq(). It
makes the code easier, and prevents coccinelle warnings.

Best Regards,
Thomas

Signed-off-by: Thomas Richard (TI) <thomas.richard@bootlin.com>
---
Changes in v9:
- ti_sci: use irq_lock mutex unconditionally (previously used only with IRQ-Context-Lost capability).
- Link to v8: https://lore.kernel.org/r/20260513-ti-sci-jacinto-s2r-restore-irq-v8-0-195b27f91519@bootlin.com

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
 drivers/firmware/ti_sci.c      | 201 ++++++++++++++++++++++++++++++++++++++---
 drivers/firmware/ti_sci.h      |   9 ++
 3 files changed, 234 insertions(+), 21 deletions(-)
---
base-commit: 5d4a179f6bf3628fd28a4d90fe26f387f8001b02
change-id: 20251010-ti-sci-jacinto-s2r-restore-irq-428e008fd10c

Best regards,
-- 
Thomas Richard (TI) <thomas.richard@bootlin.com>

