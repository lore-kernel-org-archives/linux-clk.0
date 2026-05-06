Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 502B235DA46
	for <linux-clk@vger.kernel.org>; Wed,  6 May 2026 08:35:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778056543; cv=none; b=Nr/GWlWYmqjQ9CfTF2vxbJyR9M6BX17VliGFgHdqZfrscnMqcdkqioAfqSnWPLp4zTYpI+n8VNupMgvkN/+7eNWJVbI9rQH+XAwV1ZLRmqjfVPeF2QsoeX7aApZsi/GVy10vjBhBR8UTHlYG659Ke+IPwZpiPNX69tTZchZzUs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778056543; c=relaxed/simple;
	bh=HAiQmO+z8IeD/W593afVtN4GzhIjjZe1C6P2MGGJsYY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=qFg4IAU9zCB3Md3KLOQF6V49geNQPyDt+ZQrdinW/k2xybc698oKo8Dy4seaJDmtQJs61/jlfNq/SRdmZ8WiVI7jXrTFf1rzpyc4xvhSfGgLF/XvKlTW3Kyrqzu+mnE9tRlfcfpr5hKlkjUUIioH2ENnkmdMiTLIIRjBWuZOkkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=y9r6s6b3; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="y9r6s6b3"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id C8B1DC5DC42;
	Wed,  6 May 2026 08:36:25 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 99DC66053C;
	Wed,  6 May 2026 08:35:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AD13E102F15A2;
	Wed,  6 May 2026 10:35:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1778056537; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=lH41RhbrOBVmzAN2aH8NZzQVqD5v4xoPzx/V0+1gYWk=;
	b=y9r6s6b3+UKDswZjRBEqAmQpJmBbrY4xhxe6kcxqVl0njbd/MgX5C+KXX/MUsix0IwhG6k
	4jly7ugPfKa3e/uIgSZA168Q6RnAV7DOYl4JHZ1ZMJAxnAfAmnyZk0DsurV1su0AkStfAz
	2kDeWaaocW2xmvTlGA9mvkDgMxL/muthVv0LjcXl7VhfUyR7m01pIzSeWPbYV9j1p8UOB8
	nuIAf6uGIW1vw7D/4rcum+QlhqPB2Q+03hzFAXL0ZpsJM4h89XcTUAHL1O7l1KON35yg6E
	IW9KWQ/W/FHkyIoa5lvdZ5zzu2K50p23WQrEi5MnrVyrO9xURp2stzb5WNZbSQ==
From: "Thomas Richard (TI)" <thomas.richard@bootlin.com>
Subject: [PATCH v7 0/4] firmware: ti_sci: Introduce BOARDCFG_MANAGED mode
 for Jacinto family
Date: Wed, 06 May 2026 10:35:24 +0200
Message-Id: <20260506-ti-sci-jacinto-s2r-restore-irq-v7-0-037098a35215@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEz9+mkC/43Qy07DMBAF0F+pvMZoPHb86Ir/QCwcP6gRxNQOE
 ajKv+MUVQFlEZZ3ZJ07ngupoaRQyfFwISVMqaY8tKDuDsSd7PAcaPItEwTsGDCgY6LVJfpiXRr
 GTCsWWkIdc2kvy5kK1AFAR8/AkYa8lxDT57Xg8eknl3D+aD3jOjylBfi6LjGxZXrrU3t9E6NAu
 fCCc+NRKPvQ5zy+puHe5Tey4BOuIMN9EBtohVbR8hgR2RbkK4jQ7YK8gR6kkdwoYb3YguIGSkA
 Qu6BooFQawUZugnVbsFtBAftf7hpoVI86ojc8mi0of4H/uKFsoEInhdSuR9v/Bed5/gaaihq/e
 AIAAA==
X-Change-ID: 20251010-ti-sci-jacinto-s2r-restore-irq-428e008fd10c
To: Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>, 
 Santosh Shilimkar <ssantosh@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: Gregory CLEMENT <gregory.clement@bootlin.com>, 
 richard.genoud@bootlin.com, Udit Kumar <u-kumar1@ti.com>, 
 Abhash Kumar <a-kumar2@ti.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, 
 "Thomas Richard (TI)" <thomas.richard@bootlin.com>, 
 Dhruva Gole <d-gole@ti.com>, Kendall Willis <k-willis@ti.com>, 
 Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

This is the 7th iteration of this series. I did some changes as suggested
by Nishanth. In ti_sci driver I added a lock around set_irq() and
free_irq() to keep hash list consistent in case of concurrent accesses, and
now ti_sci driver tries to restore all IRQs even in case of error.
On the clock side, get_parent() errors are now handled. If we fail to get
parent_id for a clock, set_parent() is not called anymore in
restore_context().
Other minor changes are listed in the changelog.

Best Regards,
Thomas

Signed-off-by: Thomas Richard (TI) <thomas.richard@bootlin.com>
---
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
 drivers/firmware/ti_sci.h      |   6 ++
 3 files changed, 242 insertions(+), 21 deletions(-)
---
base-commit: a8afe52b5e5050c0c5825d7931a21b687a628d9a
change-id: 20251010-ti-sci-jacinto-s2r-restore-irq-428e008fd10c

Best regards,
-- 
Thomas Richard (TI) <thomas.richard@bootlin.com>

