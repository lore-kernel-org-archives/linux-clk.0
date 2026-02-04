Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B51F94218B2
	for <linux-clk@vger.kernel.org>; Wed,  4 Feb 2026 15:03:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770217440; cv=none; b=CAaXa/VnmPqJCq1mhWWOHPGBKKWUS9XQHIu+2QS0K+TqsYxF9VHfPWRc8mZAQF7hHvwsMVCFFG7W2Pgf8gJXefQh+lNt8+Hv5bSbgUNgCvucDaqkhiQNYgFo+B/PGEIZ3MElayT90qhcvQ3Fo6VwVQz4lnA6ZHDnJD4aNNBfMls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770217440; c=relaxed/simple;
	bh=eZH+hnjWiszPZG9kr9yc7o3ptxMyDuVNvXKjOSELY/A=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=pppR7a6UHz5cgiAqx198NAL3mkLbHyNx4mhspsuGbOVxc9iu42/xbec+aJPp8EDbIiUj2kqDOwXM6n/6wk74N8fqqygqfZ4krQeNqN6etLgWP4WFy5orYPpsHbW+7Cug9I7H2zhp8+Hr47vDQnf3Rbf2u88UuqcCNz+rkIkvw0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=01PkKoQC; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="01PkKoQC"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 24FC64E423F9;
	Wed,  4 Feb 2026 15:03:58 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DD7AC60705;
	Wed,  4 Feb 2026 15:03:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8CCF6119A88F7;
	Wed,  4 Feb 2026 16:03:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1770217437; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=V+jIX2+PXJPcmc9ucwjmh1dIDrajSC6GG82tgislS3M=;
	b=01PkKoQC1tWnJDivPZCN6FUoxPPYQ5fkmldZ1ChoPh6qJ4Eak5r19qTPIXuaEsS3rctQTS
	UDqv+7SI/uDAUEpgFS4OX1ictqFq75Q5AiN3iqT+TO/Wkg0Se3vG8jZ6N7wpdHXCVahTco
	l3uPFR08DjXa8IjLKj9m1PLdZU1ksK1G+vG+rLSKF6ZrIJIYEJ9T3gkEqa0tvwI8MFtXmy
	mc3Qv1B7sRXckugiaCh/98fsUCx2hrYQ8aBDpFuSLSY5LDEvmA9+Yt2yIwarQIupHRptIB
	lGBsBCYvenL5w2l6kr/3gfoMyRMzDFD/kS8qoDpNNBpBWpWVDEghKvxllldh8A==
From: "Thomas Richard (TI)" <thomas.richard@bootlin.com>
Subject: [PATCH v4 0/4] firmware: ti_sci: Introduce BOARDCFG_MANAGED mode
 for Jacinto family
Date: Wed, 04 Feb 2026 16:03:37 +0100
Message-Id: <20260204-ti-sci-jacinto-s2r-restore-irq-v4-0-67820af39eac@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMpfg2kC/4XOTW7CMBAF4KsgrzvVeGxI0hX3QCxc/5Sp2rixT
 QRCuXsdKhShLrJ8T6PvzU1kn9hn8ba5ieRHzhz7GvTLRtiT6T88sKtZENJWokQoDNkyfBrLfYm
 QKUHyucRUL9MAmlqP2AYn0YqK/CQf+HIfOBz/cvLDue6UpTzxDFzvT4xybh97zdreKAFBaaeV6
 hzpxuzfYyxf3L/a+C1mfKQFlLQOUgWNbptgVAhE8j+oFpBwuwqqCjrcdTvVNdo4/QxO0/QLGdw
 c4IUBAAA=
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
 "Thomas Richard (TI)" <thomas.richard@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

The fourth iteration of this series adds support for two new firmware
capabilities:
- MSG_FLAG_CAPS_LPM_IRQ_CONTEXT_LOST: Indicates that DM-Firmware is not
  able to restore IRQ context during resume after suspend-to-ram.
- MSG_FLAG_CAPS_LPM_CLK_CONTEXT_LOST: Indicates that DM-Firmware is not
  able to restore clock context (rate and parent configuration) during
  resume after suspend-to-ram.

Now, ti_sci driver determines whether to restore IRQs based on the
MSG_FLAG_CAPS_LPM_IRQ_CONTEXT_LOST capability rather than the
BOARDCFG_MANAGED mode. The same logic applies to the clock context.

Both J784s4 and J7200 platforms support these new capabilities. A
corresponding pull request has been submitted on DM-Firmware side to
define and enable these capabilities.

The value for the BOARDCFG_MANAGED mode has also been fixed.

Public documentation for BOARDCFG_MANAGED mode and these new capabilities
is currently unavailable. I will update the series with relevant
documentation references as soon as they become available.

I rebased the series on linux-next next-20260202.

Best Regards,
Thomas

Signed-off-by: Thomas Richard (TI) <thomas.richard@bootlin.com>
---
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
base-commit: c6fb8985458d675f32a22788f30afcba754b6d78
change-id: 20251010-ti-sci-jacinto-s2r-restore-irq-428e008fd10c

Best regards,
-- 
Thomas Richard (TI) <thomas.richard@bootlin.com>

