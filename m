Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 274C6285071;
	Fri,  5 Dec 2025 14:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764944926; cv=none; b=bI4LXrl484C/5A3Ls+0DK7qF5Y+OaWjwtZsYnQfpYC+isgfdA1nzlR++A/Bar82ssezl7q/26LUr6AkAfeupkQh5Xok5XKj1hrAgRJGlHrB2MMgIycWYHCx5dD7OGTLXT6FJTUremeFInWLVtHWcmyYR1tnrpvN4RuB+vEU1OvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764944926; c=relaxed/simple;
	bh=4EllQFP5HXHFJF/HD9jJbgp0J4/hGnFzH0Mbkz84MOQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=dOJ5gzpqGNcfq4770nOAb4wyyuPOvaPnyOOGcawyXjdsosUuqeqsMZweoSh8j/ekpuA+B5R2SoEkmuiyBPCu1qUmhgBCVs9H4WT9mTqCRHdi1yGFW/mTSvUURfxo6Z3LvoODfHgkkuELs+IF8rBqoIVo4g/Ge4+4i54tsgE3xMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=HVpuUSnL; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="HVpuUSnL"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 676631A1F98;
	Fri,  5 Dec 2025 14:28:40 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2C910606AC;
	Fri,  5 Dec 2025 14:28:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 395D3102F06E6;
	Fri,  5 Dec 2025 15:28:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1764944919; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=xXzmocA+TCHPS8L8CGlGDBhJ9jbUgIy1gGVkekBgKW8=;
	b=HVpuUSnLjhVQeNmPIbC3ZQjOhRzzuLzyuWW7g8AJhxsSyWlQaVQsO9wcpEp1UFgeWsQRDJ
	Foq2uExu/DuW1g/BsBt/3zfJKZGO0cVFg9tB0s7Il+kxfdFagwpKeiUOmGYka+TobVKlIY
	W6qTHgslLWaIlJXCU8whsuhipMOJkFX3fA++wE3orHB/mhmzsLvlN+uwIEVWWbPDo2aIZV
	KhxE1PzPZF+syNCGNpf+ygG32YxRHcMSf2SrDG2vJZKv3/jqptg+Izei4dc28ou0jPqLZs
	ZM05waZmrl35PvKXIof+BnJE2gGZEfODi8GOFrVxMh1XZ9FQqFegxnDZy7nDNQ==
From: "Thomas Richard (TI.com)" <thomas.richard@bootlin.com>
Subject: [PATCH v3 0/4] firmware: ti_sci: Introduce BOARDCFG_MANAGED mode
 for Jacinto family
Date: Fri, 05 Dec 2025 15:28:22 +0100
Message-Id: <20251205-ti-sci-jacinto-s2r-restore-irq-v3-0-d06963974ad4@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAbsMmkC/4WOQQ7CIBBFr2JYOwYGTKsr72FcIAU7RosFbDRN7
 y6tMY2rLt/P5L3pWbSBbGT7Vc+C7SiSbzLI9YqZWjcXC1RlZshxK7jgkAiiIbhqQ03yEDFAsDH
 5kC9DCwpLy3npKsENy5JHsI5eU+B4+nKw7TN30jzWNAre0xOdGNdfr1jqdQI4SFUpKXcVqkIfz
 t6nGzUb4+9slHc4CwUuCzELtSoLp6VziOJfOAzDByp3cN00AQAA
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
 "Thomas Richard (TI.com)" <thomas.richard@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

This is the fourth iteration. In this new version the sci-clk driver also
restores the clock rate. I rebased the series on linux-next so we should
not have conflict with next rc1.

Signed-off-by: Thomas Richard (TI.com) <thomas.richard@bootlin.com>
---
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
Thomas Richard (TI.com) (4):
      firmware: ti_sci: add BOARDCFG_MANAGED mode support
      firmware: ti_sci: handle IRQ restore in BOARDCFG_MANAGED mode during resume
      clk: keystone: sci-clk: add restore_context() operation
      firmware: ti_sci: restore clock context during resume in BOARDCFG_MANAGED mode

 drivers/clk/keystone/sci-clk.c |  42 ++++++++---
 drivers/firmware/ti_sci.c      | 160 +++++++++++++++++++++++++++++++++++++----
 drivers/firmware/ti_sci.h      |   2 +
 3 files changed, 184 insertions(+), 20 deletions(-)
---
base-commit: 6c95d7e679d5d01fa48d6a8b8bdb92b6effe34f6
change-id: 20251010-ti-sci-jacinto-s2r-restore-irq-428e008fd10c

Best regards,
-- 
Thomas Richard (TI.com) <thomas.richard@bootlin.com>

