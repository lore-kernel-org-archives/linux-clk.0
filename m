Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F36B82D8791;
	Thu, 27 Nov 2025 08:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764232760; cv=none; b=pc7IHtdBjOsbIvYDtIsuyd+YI7ggNg/p1ME20kKrc7tPAbERpIKUWR6KUig/cPZBGu4s+kTcL8kM3x/ofkNilXz94BopkD5ALFQ4gSgKb559UR7uRzzON9BsTXfVXo5VrvcWcrEXGhm58i3ITMCST+iMlscBoOCb7+eMIMpQYTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764232760; c=relaxed/simple;
	bh=lpBI/nvpyhZYTZvkE6NgVj5qLT7UKS0krGLWvSIXXjs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=oZgx5MkkK6YcydKm5pKiTcaSrBJqP+aXHB7WHDP6gkwSnvZRcrun9f6cvJ+rac2WVwPR8/QN0UdvQWtnIIgLtVjX3X+YepXe5c57eJvXY39+uzHbNVgkAGDQ9gFwESoLjnvjohU0l+1J/eng0ifiheMOUlZHHWlYbPJEwyaplxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=l0JMVX46; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="l0JMVX46"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id ABF641A1DBB;
	Thu, 27 Nov 2025 08:39:14 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7FB9B6068C;
	Thu, 27 Nov 2025 08:39:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 57EA3102F1A6A;
	Thu, 27 Nov 2025 09:39:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1764232753; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=42l9E9oC5tnK66Gc9RSFnvRh9vnctWVSZSgLzxSJWRc=;
	b=l0JMVX46ohIVc7Fo4faJweXEoS7cz6UWkI4g72eX6svcwnWLMbtV/6YqZEivMjRF4miKOF
	lsqfHjuZmNBCw8N+QOYZFyJHM52+YYVuZrVIw4mvQeSubE6yBHBOpyY478B3OGvRQzlMpC
	6a0tAlU7417Do5pJE+hhemESJT8jt0oYLtSIgMLg/sBXgAGxDHxhM8IZ8vaOJuwTCp6PJK
	2ICfBU1NtJblQHAbEqJzE0Us/npCZdmTLFTEP0AK7APuN/5PnH+03tYssfcEprET9pZSoz
	9b4p2fDZOiS5MDCOlZvQwWmSh9MgEeWAPYeWv6ajH4WSB6rxyKNJkO4WDyxTWg==
From: "Thomas Richard (TI.com)" <thomas.richard@bootlin.com>
Subject: [PATCH RFC v2 0/4] firmware: ti_sci: Introduce BOARDCFG_MANAGED
 mode for Jacinto family
Date: Thu, 27 Nov 2025 09:38:54 +0100
Message-Id: <20251127-ti-sci-jacinto-s2r-restore-irq-v2-0-a487fa3ff221@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAB4OKGkC/4XQzW7DIAwH8FeJOM8VkA+yniZN6gP0OvVAiLu6S
 kKKabSpyruPJt1hO2w3DOj/s30TjIGQxTa7iYATMfkhFfopE+5kh3cEalMttNSlkkpCJGBHcLa
 OhuiBdYCAHH1IP8MFCl2jlPWxVdKJFDIGPNLHAryJ/e5VHNbLgJdrwuLjpUdmu2DJXqnimyIPx
 L6zMbUGkwIFlXHGYdmqpspfGu9jR8PG+f4O/pU09uBHBtehHa7jmmVkU8rG5NbV5e+sxjJCOvc
 Ut9lUbVQNwallhBPdZ/5c9japZYaHZv5bUWIl5EVb5Plzqwtjf7CHeZ6/AA57YGOWAQAA
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

This iteration introduces a key improvement: the ti_sci driver now restores
SCI clock parents during resume as the firmware is not able to do it.
On the interrupt management side, the driver has been updated to use hlist
for storing requested IRQs.
Regarding documentation, Nishanth requested references for
BOARDCFG_MANAGED mode. While the relevant documentation is not yet publicly
available, I will update the commit message with the appropriate links as
soon as it becomes accessible.

Signed-off-by: Thomas Richard (TI.com) <thomas.richard@bootlin.com>
---
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

 drivers/clk/keystone/sci-clk.c |  25 +++++--
 drivers/firmware/ti_sci.c      | 160 +++++++++++++++++++++++++++++++++++++----
 drivers/firmware/ti_sci.h      |   2 +
 3 files changed, 170 insertions(+), 17 deletions(-)
---
base-commit: cb6649f6217c0331b885cf787f1d175963e2a1d2
change-id: 20251010-ti-sci-jacinto-s2r-restore-irq-428e008fd10c
prerequisite-message-id: 20251014-ti-sci-io-isolation-v1-1-67c7ce5d1b63@bootlin.com
prerequisite-patch-id: 7bbf6ca9fb85214b5360548506ccca7fae2e5a16
prerequisite-message-id: 20251014-ti-sci-pm-ops-cleanup-v1-1-70b50b73ac85@bootlin.com
prerequisite-patch-id: 257a5848d5631504c9549ad94e4b41a93f980978

Best regards,
-- 
Thomas Richard (TI.com) <thomas.richard@bootlin.com>

