Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99C6737F73D
	for <linux-clk@vger.kernel.org>; Wed,  3 Jun 2026 09:14:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780478070; cv=none; b=hLJNjWgNYXG75XLSTaSwcnrvliHxpvqZ+nS66jcSlIwCLvWTgzrud7DOXZBs73InOxadgCOMwq8wsQ/I1mAv6tKf4CzB4+5bC0sQln9NQZz9WYTRetbbCe+i5BRyRjvuH/HG/q1Ca/tZTadCz7CFWZbFj69SH/T3fOdaLM/+S94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780478070; c=relaxed/simple;
	bh=LnBZEwhoBmkIRgJfE/R+bY0lRndadHwTjPkNbZtn9qc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=hXrNeXlqTt6Qj2M39sbRD2E+Br1nvw9FaK65JFpJVLYf/pBakoZs6hBPR/ttY9cxCM7AHJtdT2M0b9xhlZjGL84k56kFLG7FPp0uuOxwvhxyWBdgUScNoo5uvle1EYMkqew6d7h6+4uFny7rAIt3oyG2DU1KYdgDWxCK+pgQU2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1wUhg5-0000qw-Ok; Wed, 03 Jun 2026 11:14:21 +0200
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1wUhg5-000tFC-18;
	Wed, 03 Jun 2026 11:14:21 +0200
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1wUhg5-000000004In-18Cd;
	Wed, 03 Jun 2026 11:14:21 +0200
Message-ID: <99743c29fe81a90d3c1f51889d42ef9d4766de3c.camel@pengutronix.de>
Subject: Re: [PATCH RFC v3 3/5] clk: zte: Introduce a driver for zx297520v3
 top clocks and resets.
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Stefan =?ISO-8859-1?Q?D=F6singer?= <stefandoesinger@gmail.com>,  Michael
 Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob
 Herring <robh@kernel.org>,  Krzysztof Kozlowski	 <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Brian Masney	 <bmasney@redhat.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Date: Wed, 03 Jun 2026 11:14:21 +0200
In-Reply-To: <20260529-zx29clk-v3-3-c7fe54ea388f@gmail.com>
References: <20260529-zx29clk-v3-0-c7fe54ea388f@gmail.com>
	 <20260529-zx29clk-v3-3-c7fe54ea388f@gmail.com>
Content-Type: text/markdown; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-clk@vger.kernel.org

On Fr, 2026-05-29 at 00:53 +0300, Stefan D=C3=B6singer wrote:

> ```
This register space controls core devices: PLLs, the AHB bus, a lot of
timers, the USB controller, the Cortex M0 processor that boots the board
and a few other devices. For some reason the LTE coprocessor is also
partially controlled by it. The main application processor and DDR
memory are not found here though.

>=20
The register to reboot the board is also found here.

>=20
Signed-off-by: Stefan D=C3=B6singer <stefandoesinger@gmail.com>

>=20
---

>=20
Patch changlog:

>=20
v2:
*) Add code to set up PLLs
*) Merge top and matrix controllers into one device
*) Bugfixes pointed out by Sashiko
---
 MAINTAINERS                      |   1 +
 drivers/clk/Kconfig              |   1 +
 drivers/clk/Makefile             |   1 +
 drivers/clk/zte/Kconfig          |  18 +
 drivers/clk/zte/Makefile         |   5 +
 drivers/clk/zte/clk-zx297520v3.c | 775 +++++++++++++++++++++++++++++++++++=
++++
 drivers/clk/zte/pll.c            | 450 +++++++++++++++++++++++
 drivers/clk/zte/pll.h            |  23 ++
 8 files changed, 1274 insertions(+)

>=20
```

[...]

> ```
diff --git a/drivers/clk/zte/clk-zx297520v3.c b/drivers/clk/zte/clk-zx29752=
0v3.c
new file mode 100644
index 000000000000..986042dd4caf
--- /dev/null
+++ b/drivers/clk/zte/clk-zx297520v3.c
@@ -0,0 +1,775 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2026 Stefan D=C3=B6singer
+ */
+#include <dt-bindings/clock/zte,zx297520v3-clk.h>
+#include <linux/reset-controller.h>
+#include <linux/platform_device.h>
+#include <linux/clk-provider.h>
+#include <linux/of_address.h>
+#include <linux/reboot.h>
+#include <linux/iopoll.h>
+#include <linux/delay.h>
+#include <linux/clk.h>
+#include <linux/io.h>
+
+#include "pll.h"
+
+/* All LSP and some Matrix registers contain both resets and clock gates, =
so access to them needs
+ * to be synchronized between the reset and clock callbacks.
+ */
+static DEFINE_SPINLOCK(reg_lock);
+
+struct zx29_reset_reg {
+	void __iomem *reg;
+	u32 mask, wait_mask;
+};
+
+struct zx29_clk_controller {
+	struct clk_hw_onecell_data *clocks;
+	struct reset_controller_dev rcdev;
+	struct zx29_reset_reg resets[];
+};
+
+static int __zx297520v3_rst_assert(struct reset_controller_dev *rcdev, uns=
igned long id)
+{
+	struct zx29_clk_controller *data =3D container_of(rcdev, struct zx29_clk_=
controller,
+							    rcdev);
+	u32 val;
+
+	val =3D readl(data->resets[id].reg);
+	val &=3D ~data->resets[id].mask;
+	writel(val, data->resets[id].reg);
+
+	return 0;
+}
+
+static int zx297520v3_rst_assert(struct reset_controller_dev *rcdev, unsig=
ned long id)
+{
+	unsigned long flags;
+	int res;
+
+	spin_lock_irqsave(&reg_lock, flags);
+	res =3D __zx297520v3_rst_assert(rcdev, id);
+	spin_unlock_irqrestore(&reg_lock, flags);
+
+	return res;
+}
+
+static int __zx297520v3_rst_deassert(struct reset_controller_dev *rcdev, u=
nsigned long id)
+{
+	struct zx29_clk_controller *data =3D container_of(rcdev, struct zx29_clk_=
controller,
+							    rcdev);
+	u32 val;
+
+	val =3D readl(data->resets[id].reg);
+	val |=3D data->resets[id].mask;
+	writel(val, data->resets[id].reg);
```


I'd move the spinlock in here ...


> ```
+	/* This is a special case used only by USB reset */
+	if (data->resets[id].wait_mask) {
+		return readl_poll_timeout(data->resets[id].reg + 4, val,
+					  val & data->resets[id].wait_mask, 1, 100);
```


... because this might sleep.


> ```
+	}
+
+	return 0;
+}
+
+static int zx297520v3_rst_deassert(struct reset_controller_dev *rcdev, uns=
igned long id)
+{
+	unsigned long flags;
+	int res;
+
+	spin_lock_irqsave(&reg_lock, flags);
+	res =3D __zx297520v3_rst_deassert(rcdev, id);
+	spin_unlock_irqrestore(&reg_lock, flags);
+
+	return res;
+}
+
+static int zx297520v3_rst_reset(struct reset_controller_dev *rcdev, unsign=
ed long id)
+{
+	unsigned long flags;
+	int res;
+
+	spin_lock_irqsave(&reg_lock, flags);
+
+	res =3D __zx297520v3_rst_assert(rcdev, id);
+	if (res)
+		goto unlock;
+	udelay(100);
```


Is this delay long enough for all potential users of reset_control_reset()?=
 Are there actually any at all?

Why delay under the global spinlock? =20
You could use fsleep() instead and only lock the read-modify-write cycles.


> ```
+	res =3D __zx297520v3_rst_deassert(rcdev, id);
+
+unlock:
+	spin_unlock_irqrestore(&reg_lock, flags);
+	return res;
+}
+
+static int zx297520v3_rst_status(struct reset_controller_dev *rcdev,
+			       unsigned long id)
+{
+	struct zx29_clk_controller *data =3D container_of(rcdev, struct zx29_clk_=
controller,
+							    rcdev);
+	u32 val;
+
+	val =3D readl(data->resets[id].reg);
+
+	return val & data->resets[id].mask;
```


This will return a negative value for bit BIT(31), I'd wrap this with a dou=
ble negation.

regards =20
Philipp

